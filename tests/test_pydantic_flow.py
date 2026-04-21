import pytest
from jinja2 import FileSystemLoader

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
        "complaints": "Жалобы пациента",
        "anamnesis_disease": "Анамнез заболевания",
        "objective_status": "Объективный статус",
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
        "recommendations": "Рекомендации",
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


def test_pydantic_flow(renderer, sample_data, header_data):
    # 1. UI Schema Generation
    ui_schema = ConsultationProtocolV7.get_ui_schema()

    assert ui_schema["title"] == "СЭМД Протокол консультации (Редакция 7)"
    assert "event_date" in ui_schema["fields"]

    # 2. JSON Validation to Model
    model = ConsultationProtocolV7.model_validate(sample_data)
    assert model.event_date == "2026-04-21 14:00:00"

    # 3. Rendering from Model + Header
    # Now we can pass multiple objects directly to the renderer
    xml_output = renderer.render("main.xml.j2", header_data, model)

    assert "Жалобы пациента" in xml_output
    assert "K29.5" in xml_output
