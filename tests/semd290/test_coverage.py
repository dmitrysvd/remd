def test_minimal_generation_and_validation(
    renderer, header_data, minimal_sample_data, xsd_path, sch_path
):
    """Test with minimal required fields."""
    data = {**header_data, **minimal_sample_data}
    xml_output = renderer.render("main.xml.j2", data)

    # XSD Validation
    success_xsd, errors_xsd = renderer.validate_xsd(xml_output, xsd_path)
    assert success_xsd, f"XSD validation failed: {errors_xsd}"

    # Schematron Validation


def test_full_dataset_values_presence(renderer, full_dataset_data):
    """Verify that values from full_dataset_data are actually present in the generated XML."""
    xml_output = renderer.render("main.xml.j2", full_dataset_data)

    # Check patient info
    assert full_dataset_data["patient"]["name"]["family"] in xml_output
    assert full_dataset_data["patient"]["snils"] in xml_output
    assert full_dataset_data["patient"]["address"]["postal_code"] in xml_output

    # Check diagnoses
    for diag in full_dataset_data["diagnoses"]:
        assert diag["code"]["code"] in xml_output
        assert diag["text"] in xml_output

    # Check medications
    assert "Аспирин" in xml_output
    assert "Какой-то кастомный препарат" in xml_output

    # Check vitals
    assert "36.6" in xml_output
    assert "75.0" in xml_output

    # Check disability/benefits
    assert "Инвалиды III группы" in xml_output
    assert 'code="1.00000.0216"' in xml_output

    # Check organization
    assert full_dataset_data["organization"]["ogrn"] in xml_output
    assert "ГОРОДСКАЯ ПОЛИКЛИНИКА № 64" in xml_output


def test_only_mandatory_diagnoses(renderer, header_data, minimal_sample_data, xsd_path, sch_path):
    """Test with only main diagnosis (no complication/concomitant)."""
    data = {**header_data, **minimal_sample_data}
    data["diagnoses"] = [minimal_sample_data["diagnoses"][0]]

    xml_output = renderer.render("main.xml.j2", data)

    success_xsd, errors_xsd = renderer.validate_xsd(xml_output, xsd_path)
    assert success_xsd, f"XSD validation failed: {errors_xsd}"

    success_sch, errors_sch = renderer.validate_schematron(xml_output, sch_path)
    assert success_sch, f"Schematron validation failed: {errors_sch}"


def test_missing_optional_header_fields(renderer, full_dataset_data, xsd_path, sch_path):
    """Test header with missing optional fields (like insurance policy)."""
    data = full_dataset_data.copy()
    data["patient"]["insurance_policy"] = None
    data["organization"]["license"] = None

    xml_output = renderer.render("main.xml.j2", data)

    success_xsd, errors_xsd = renderer.validate_xsd(xml_output, xsd_path)
    assert success_xsd, f"XSD validation failed: {errors_xsd}"

    success_sch, errors_sch = renderer.validate_schematron(xml_output, sch_path)
    assert success_sch, f"Schematron validation failed: {errors_sch}"
