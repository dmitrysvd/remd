def test_full_dataset_generation_and_validation(renderer, full_dataset_data, xsd_path, sch_path):
    """Test XML generation and validation with the most comprehensive dataset (M7-M9)."""
    # Render XML
    xml_output = renderer.render("main.xml.j2", full_dataset_data)

    # XSD Validation
    success_xsd, errors_xsd = renderer.validate_xsd(xml_output, xsd_path)
    assert success_xsd, f"XSD validation failed: {errors_xsd}"

    # Schematron Validation
    success_sch, errors_sch = renderer.validate_schematron(xml_output, sch_path)
    assert success_sch, f"Schematron validation failed: {errors_sch}"

    # Verify presence of M7-M9 fields
    assert 'typeCode="IND"' in xml_output
    assert 'extension="77013"' in xml_output
    assert 'displayName="Средства обязательного медицинского страхования"' in xml_output
    assert 'typeCode="REF"' in xml_output
    assert "Кузнецов" in xml_output
    assert 'extension="177.77.23.05.314159200"' in xml_output
    assert 'code="K29.3"' in xml_output


def test_xsd_validation_detects_errors(renderer, xsd_path):
    """Verify that the XSD validator correctly identifies structural errors."""
    # Missing required elements in XML
    xml_output = (
        '<ClinicalDocument xmlns="urn:hl7-org:v3">'
        "<title>Missing everything else</title></ClinicalDocument>"
    )
    success, errors = renderer.validate_xsd(xml_output, xsd_path)
    assert not success
    assert len(errors) > 0


def test_schematron_validation_detects_errors(renderer, sch_path):
    """Verify that the Schematron validator correctly identifies business rule violations."""
    # RealmCode must be RU
    xml_output = """<ClinicalDocument xmlns="urn:hl7-org:v3">
        <realmCode code="US"/>
        <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
    </ClinicalDocument>"""
    success, errors = renderer.validate_schematron(xml_output, sch_path)
    assert not success, f"Expected validation to fail, but it succeeded. Errors: {errors}"
    assert any("realmCode" in e or "RU" in e for e in errors)


def test_full_v290_r7_generation_and_validation(renderer, full_render_data, xsd_path, sch_path):
    """Test full document generation and validation against official XSD and Schematron."""
    # Render XML
    xml_output = renderer.render("main.xml.j2", full_render_data)

    # XSD Validation
    success_xsd, errors_xsd = renderer.validate_xsd(xml_output, xsd_path)
    assert success_xsd, f"XSD validation failed: {errors_xsd}"

    # Schematron Validation
    success_sch, errors_sch = renderer.validate_schematron(xml_output, sch_path)
    assert success_sch, f"Schematron validation failed: {errors_sch}"

    # Verify fields presence
    assert "Тестовый анамнез жизни" in xml_output
    assert 'code="K29.5"' in xml_output
    assert "Основной диагноз" in xml_output
    assert 'code="1" codeSystem="1.2.643.5.1.13.13.11.1049"' in xml_output
    assert 'code="6" codeSystem="1.2.643.5.1.13.13.99.2.262"' in xml_output
    assert 'code="3" codeSystem="1.2.643.5.1.13.13.11.1053"' in xml_output
    assert 'code="1.00000.0216" codeSystem="1.2.643.5.1.13.13.99.2.541"' in xml_output
    assert 'code="1" codeSystem="1.2.643.5.1.13.13.11.1044"' in xml_output
    assert "<identity:Series>МЮ</identity:Series>" in xml_output
