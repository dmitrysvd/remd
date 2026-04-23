from pathlib import Path

import pytest

from semd_engine.core.renderer import CDARenderer
from semd_engine.registry.v290_r7.context import ConsultationProtocolV7RenderContext


@pytest.fixture
def renderer():
    r = CDARenderer(Path("semd_engine/registry/v290_r7/templates"))
    from jinja2 import FileSystemLoader

    if isinstance(r.env.loader, FileSystemLoader):
        r.env.loader.searchpath.append("semd_engine/core/templates")
    r.register_context_model("main.xml.j2", ConsultationProtocolV7RenderContext)
    return r


@pytest.fixture
def xsd_path():
    return Path(
        "docs/semd/290/1.2.643.5.1.13.13.15.13-1.2.643.5.1.13.13.15.13.7/xsd/XSD_ПРОТОКОЛ_КОНСУЛЬТАЦИИ_Р7/CDA.xsd"
    ).absolute()


@pytest.fixture
def sch_path():
    # Full path is long, but necessary for the test context
    p = "docs/semd/290/1.2.643.5.1.13.13.15.13-1.2.643.5.1.13.13.15.13.7"
    p += "/schematron/290 Schematron v.1.7.sch"
    return Path(p).absolute()


@pytest.fixture
def full_render_data():
    return {
        "event_date": "2026-04-21 14:00:00",
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
            "insurance_policy": {
                "type": {
                    "code": "1",
                    "codeSystem": "1.2.643.5.1.13.13.11.1035",
                    "codeSystemName": "Виды полиса обязательного медицинского страхования",
                    "displayName": "Полис ОМС старого образца",
                    "version": "1.3",
                },
                "number": "1344600",
            },
            "name": {"family": "Сельченков", "given": "Михаил", "patronymic": "Владимирович"},
            "address": {
                "type": {"code": "1", "displayName": "Адрес по месту жительства", "version": "1.4"},
                "text": "г Москва, ул Твардовского, д 5 к 1, кв 42",
                "state_code": {"code": "77", "displayName": "г. Москва", "version": "6.5"},
                "postal_code": "123458",
                "fias": {
                    "aoguid": "45d96a50-7870-4183-872b-451c6573a7c9",
                    "houseguid": "f8a876ac-4ea1-4a3e-b255-dd0d0f510802",
                },
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
                "type": None,
                "text": "г Москва, ул Ладожская, д 4-6 стр 1",
                "state_code": {"code": "77", "displayName": "г. Москва", "version": "6.5"},
                "postal_code": "105005",
                "fias": {
                    "aoguid": "212d3123-9c4d-4579-b31a-b5c6e9632b04",
                    "houseguid": "e59f1e55-75c8-4037-9615-ed7ce751b745",
                },
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
                "type": None,
                "text": "г Москва, ул Ладожская, д 4-6 стр 1",
                "state_code": {"code": "77", "displayName": "г. Москва", "version": "6.5"},
                "postal_code": "105005",
                "fias": {
                    "aoguid": "212d3123-9c4d-4579-b31a-b5c6e9632b04",
                    "houseguid": "e59f1e55-75c8-4037-9615-ed7ce751b745",
                },
            },
        },
        "recipient": {
            "id": "1.2.643.5.1.13.13.11.1461",
            "name": "Минздрав",
        },
        "document_info": {
            "case_type": {"code": "2", "displayName": "Повторный", "version": "2.1"},
            "patient_condition": {
                "code": "1",
                "displayName": "Удовлетворительное",
                "version": "2.4",
            },
        },
        "event": {
            "type": {"code": "1", "displayName": "Консультация", "version": "3.50"},
            "period": {"low": "2026-04-21 14:00:00", "high": "2026-04-21 14:15:00"},
            "conditions": {"code": "2", "displayName": "Амбулаторно", "version": "3.1"},
        },
        "encounter": {
            "period": {"low": "2026-04-21 14:00:00", "high": "2026-04-21 14:00:00"},
        },
        "complaints": "Тестовая жалоба",
        "anamnesis_life": "Тестовый анамнез жизни",
        "anamnesis_disease": "Тестовый анамнез",
        "objective_status": "Тестовый статус",
        "diagnoses": [
            {
                "id": {"root": "1.2.643.5.1.13.13.12.2.77.7831.100.1.1.52", "extension": "99312"},
                "code": {
                    "code": "K29.5",
                    "codeSystem": "1.2.643.5.1.13.13.11.1005",
                    "codeSystemName": "МКБ-10",
                    "codeSystemVersion": "1.1",
                    "displayName": "Хронический гастрит",
                },
                "text": "Основной диагноз",
                "kind": "main",
                "disease_character": {
                    "code": "1",
                    "codeSystem": "1.2.643.5.1.13.13.11.1049",
                    "codeSystemName": "Характер заболевания",
                    "codeSystemVersion": "3.1",
                    "displayName": "Впервые в жизни установленное хроническое",
                },
            }
        ],
        "prescriptions": [],
        "vital_params": [
            {
                "code": {
                    "code": "6",
                    "codeSystem": "1.2.643.5.1.13.13.99.2.262",
                    "codeSystemName": "Витальные параметры",
                    "displayName": "Температура тела",
                    "codeSystemVersion": "1.0",
                },
                "value": 36.6,
                "unit": "Cel",
                "unit_code": {
                    "code": "Cel",
                    "codeSystem": "1.2.643.5.1.13.13.11.1358",
                    "displayName": "градус Цельсия",
                },
            },
            {
                "code": {
                    "code": "50",
                    "codeSystem": "1.2.643.5.1.13.13.99.2.262",
                    "codeSystemName": "Витальные параметры",
                    "displayName": "Масса тела",
                    "codeSystemVersion": "1.0",
                },
                "value": 75.0,
                "unit": "kg",
                "unit_code": {
                    "code": "kg",
                    "codeSystem": "1.2.643.5.1.13.13.11.1358",
                    "displayName": "килограмм",
                },
            },
        ],
        "recommendations": "Тестовые рекомендации",
        "benefits": [
            {
                "code": {
                    "code": "1.00000.0216",
                    "codeSystem": "1.2.643.5.1.13.13.99.2.541",
                    "codeSystemName": "Льготные категории граждан",
                    "displayName": "Инвалиды III группы",
                    "codeSystemVersion": "6.24",
                }
            }
        ],
        "disabilities": [
            {
                "group": {
                    "code": "3",
                    "codeSystem": "1.2.643.5.1.13.13.11.1053",
                    "codeSystemName": "Группы инвалидности",
                    "displayName": "Третья группа",
                    "codeSystemVersion": "3.4",
                },
                "low": "2026-04-21",
            }
        ],
        "incapacity": {
            "reason": {
                "code": "1",
                "codeSystem": "1.2.643.5.1.13.13.11.1044",
                "codeSystemName": "Причины выдачи документа о временной нетрудоспособности",
                "displayName": "Заболевание",
                "codeSystemVersion": "4.2",
            },
            "period": {"low": "2026-04-21", "high": "2026-04-23"},
        },
    }


def test_xsd_validation_detects_errors(renderer, xsd_path, full_render_data):
    # Missing required elements in XML
    xml_output = (
        '<ClinicalDocument xmlns="urn:hl7-org:v3">'
        "<title>Missing everything else</title></ClinicalDocument>"
    )
    success, errors = renderer.validate_xsd(xml_output, xsd_path)
    assert not success
    assert len(errors) > 0


def test_schematron_validation_detects_errors(renderer, sch_path, full_render_data):
    # RealmCode must be RU
    xml_output = """<ClinicalDocument xmlns="urn:hl7-org:v3">
        <realmCode code="US"/>
        <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
    </ClinicalDocument>"""
    success, errors = renderer.validate_schematron(xml_output, sch_path)
    assert not success, f"Expected validation to fail, but it succeeded. Errors: {errors}"
    assert any("realmCode" in e or "RU" in e for e in errors), (
        f"Expected 'realmCode' or 'RU' in errors, got: {errors}"
    )


def test_full_v290_r7_generation_and_validation(renderer, full_render_data, xsd_path, sch_path):
    # Render XML
    xml_output = renderer.render("main.xml.j2", full_render_data)

    # XSD Validation
    success_xsd, errors_xsd = renderer.validate_xsd(xml_output, xsd_path)
    assert success_xsd, f"XSD validation failed: {errors_xsd}"

    # Schematron Validation
    success_sch, errors_sch = renderer.validate_schematron(xml_output, sch_path)
    assert success_sch, f"Schematron validation failed: {errors_sch}"

    # Check if files exist
    assert xsd_path.exists(), f"XSD path {xsd_path} does not exist"
    assert sch_path.exists(), f"Schematron path {sch_path} does not exist"
