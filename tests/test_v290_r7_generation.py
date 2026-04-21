import pytest
from jinja2 import FileSystemLoader
from pydantic import ValidationError

from semd_engine.core.renderer import CDARenderer
from semd_engine.registry.v290_r7.schema import ConsultationProtocolV7


@pytest.fixture
def renderer():
    r = CDARenderer("semd_engine/registry/v290_r7/templates")
    if isinstance(r.env.loader, FileSystemLoader):
        r.env.loader.searchpath.append("semd_engine/core/templates")
    return r


@pytest.fixture
def sample_data():
    return {
        "event_date": "2026-04-21 14:00:00",
        "complaints": "Тестовая жалоба",
        "anamnesis_disease": "Тестовый анамнез",
        "objective_status": "Тестовый статус",
        "diagnoses": [
            {
                "code": {
                    "code": "K29.5",
                    "codeSystem": "1.2.643.5.1.13.13.11.1005",
                    "displayName": "Хронический гастрит",
                },
                "text": "Основной диагноз",
                "kind": "main",
            }
        ],
        "recommendations": "Тестовые рекомендации",
    }


@pytest.fixture
def header_data():
    return {
        "header": {
            "id": {"root": "1.2.643.5.1.13.13.16.1.1", "extension": "TEST-123"},
            "type_code": {
                "code": "290",
                "codeSystem": "1.2.643.5.1.13.13.11.1520",
                "displayName": "Протокол консультации",
            },
            "title": "Протокол консультации",
        },
        "patient": {
            "id": {"root": "1.2.643.5.1.13.13.16.1.1.1", "extension": "PAT-999"},
            "name": {"family": "Тестовый", "given": "Пациент", "patronymic": "Иванович"},
            "address": {"text": "г. Тест, ул. Тестовая, д. 1"},
            "gender": {"code": "1"},
            "birth_date": "1990-01-01",
        },
    }


def test_consultation_v7_generation(renderer, sample_data, header_data):
    # 1. Validate data
    model = ConsultationProtocolV7(**sample_data)

    # 2. Prepare render data
    render_data = model.model_dump()
    render_data.update(header_data)

    # 3. Render
    try:
        xml_output = renderer.render("main.xml.j2", render_data)
    except Exception as e:
        pytest.fail(f"Rendering failed with error: {e}")

    # 4. Assertions with messages
    assert "<?xml" in xml_output, "XML header missing"
    assert "<ClinicalDocument" in xml_output, "ClinicalDocument tag missing"
    assert 'extension="TEST-123"' in xml_output, (
        f"Missing extension TEST-123 in XML. Output: {xml_output[:200]}..."
    )
    assert "Тестовая жалоба" in xml_output, "Complaints text missing in XML"
    assert "K29.5" in xml_output, "Diagnosis code K29.5 missing in XML"
    assert "Хронический гастрит" in xml_output, "Diagnosis display name missing in XML"
    assert "Тестовые рекомендации" in xml_output, "Recommendations missing in XML"


def test_invalid_data_raises_error():
    invalid_data = {
        "event_date": "2026-04-21 14:00:00",
        # missing complaints - which is required
    }
    with pytest.raises(ValidationError) as excinfo:
        ConsultationProtocolV7(**invalid_data)

    assert "complaints" in str(excinfo.value), (
        f"Expected 'complaints' in validation error, got: {excinfo.value}"
    )
