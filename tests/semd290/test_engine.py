import pytest
from pydantic import ValidationError

from semd_engine.registry.v290_r7.schema import ConsultationProtocolV7


def test_consultation_v7_generation(renderer, minimal_sample_data, header_data):
    """Test basic XML generation for Consultation Protocol V7 using minimal data."""
    # 1. Validate data
    model = ConsultationProtocolV7(**minimal_sample_data)

    # 2. Prepare render data
    render_data = model.model_dump()
    render_data.update(header_data)

    # 3. Render
    xml_output = renderer.render("main.xml.j2", render_data)

    # 4. Assertions
    assert "<?xml" in xml_output
    assert "<ClinicalDocument" in xml_output
    assert 'extension="144632"' in xml_output
    assert "Тестовая жалоба" in xml_output
    assert "K29.5" in xml_output


def test_pydantic_flow(renderer, minimal_sample_data, header_data):
    """Test the full cycle: UI schema -> Pydantic validation -> XML rendering."""
    # 1. UI Schema Generation
    ui_schema = ConsultationProtocolV7.get_ui_schema()
    assert ui_schema["title"] == "СЭМД Протокол консультации (Редакция 7)"
    assert "event_date" in ui_schema["fields"]

    # 2. JSON Validation to Model
    model = ConsultationProtocolV7.model_validate(minimal_sample_data)
    assert model.event_date == "2026-04-21 14:00:00"

    # 3. Rendering from Model + Header
    xml_output = renderer.render("main.xml.j2", header_data, model)
    assert "Тестовая жалоба" in xml_output
    assert "K29.5" in xml_output


def test_invalid_data_raises_error():
    """Verify that missing required fields trigger Pydantic ValidationError."""
    invalid_data = {
        "event_date": "2026-04-21 14:00:00",
    }
    with pytest.raises(ValidationError) as excinfo:
        ConsultationProtocolV7(**invalid_data)  # type: ignore
    assert "complaints" in str(excinfo.value)
