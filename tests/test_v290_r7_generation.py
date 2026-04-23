import pytest
from pydantic import ValidationError

from semd_engine.registry.v290_r7.schema import ConsultationProtocolV7


@pytest.fixture
def sample_data():
    return {
        "event_date": "2026-04-21 14:00:00",
        "complaints": "Тестовая жалоба",
        "anamnesis_disease": "Тестовый анамнез",
        "objective_status": "Тестовый статус",
        "diagnoses": [
            {
                "id": {"root": "1.2.643.5.1.13.13.12.2.77.7831.100.1.1.52", "extension": "99312"},
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
            "id": {"root": "1.2.643.5.1.13.13.12.2.77.7831.100.1.1.51", "extension": "144632"},
            "type_code": {
                "code": "290",
                "codeSystem": "1.2.643.5.1.13.13.11.1520",
                "codeSystemName": "Электронные медицинские документы",
                "codeSystemVersion": "12.66",
                "displayName": "Протокол консультации (CDA) Редакция 7",
                "translation": {
                    "code": "13",
                    "codeSystem": "1.2.643.5.1.13.13.99.2.1079",
                    "codeSystemName": "Виды структурированных электронных медицинских документов",
                    "codeSystemVersion": "2.3",
                    "displayName": "Протокол консультации",
                },
            },
            "title": "Протокол консультации",
            "confidentiality": {
                "code": "N",
                "codeSystem": "1.2.643.5.1.13.13.99.2.285",
                "codeSystemName": "Уровень конфиденциальности медицинского документа",
                "displayName": "Обычный",
                "version": "1.2",
            },
            "set_id": {"root": "1.2.643.5.1.13.13.12.2.77.7831.100.1.1.50", "extension": "163725"},
            "version": 1,
        },
        "patient": {
            "id": {"root": "1.2.643.5.1.13.13.12.2.77.7831.100.1.1.10", "extension": "735486"},
            "snils": "25463625426",
            "identity_doc": {
                "type": {
                    "code": "1",
                    "codeSystem": "1.2.643.5.1.13.13.99.2.48",
                    "codeSystemName": "Документы, удостоверяющие личность",
                    "displayName": "Паспорт гражданина Российской Федерации",
                    "version": "7.2",
                },
                "series": "4509",
                "number": "395643",
                "issue_org": "ОВД",
                "issue_org_code": "770-095",
                "issue_date": "2005-02-18",
            },
            "insurance_policy": None,
            "name": {"family": "Сельченков", "given": "Михаил", "patronymic": "Владимирович"},
            "address": {
                "text": "г Москва, ул Твардовского, д 5 к 1, кв 42",
            },
            "gender": {
                "code": "1",
                "displayName": "Мужской",
                "codeSystem": "1.2.643.5.1.13.13.11.1040",
            },
            "birth_date": "1960-02-17",
            "contacts": {"phone": "tel:+74951953745"},
        },
        "organization": {
            "id": "1.2.643.5.1.13.13.12.2.77.7831",
            "ogrn": "1027739578404",
            "okpo": "5009247",
            "okato": "45263594000",
            "name": "ГОРОДСКАЯ ПОЛИКЛИНИКА № 64",
            "phone": "tel:+74953754826",
            "address": {
                "text": "г Москва, ул Ладожская, д 4-6 стр 1",
            },
        },
        "author": {
            "id": {"root": "1.2.643.5.1.13.13.12.2.77.7831.100.1.1.70", "extension": "542174"},
            "snils": "52415372312",
            "position": {
                "code": "34",
                "codeSystem": "1.2.643.5.1.13.13.11.1002",
                "codeSystemName": "Должности медицинских и фармацевтических работников",
                "codeSystemVersion": "9.12",
                "displayName": "Врач-кардиолог",
            },
            "name": {"family": "Смирнов", "given": "Александр", "patronymic": "Игоревич"},
            "phone": "tel:+74957443256",
            "address": {
                "text": "г Москва, ул Ладожская, д 4-6 стр 1",
            },
        },
        "event": {
            "type": {"code": "1", "displayName": "Консультация", "version": "3.50"},
            "period": {"low": "2026-04-21 14:00:00", "high": "2026-04-21 14:15:00"},
            "conditions": None,
        },
        "encounter": {
            "period": {"low": "2026-04-21 14:00:00", "high": "2026-04-21 14:00:00"},
        },
        "document_info": {
            "case_type": {"code": "2", "displayName": "Повторный", "version": "2.1"},
            "patient_condition": {
                "code": "1",
                "displayName": "Удовлетворительное",
                "version": "2.4",
            },
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
    assert 'extension="144632"' in xml_output, (
        f"Missing extension 144632 in XML. Output: {xml_output[:200]}..."
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
