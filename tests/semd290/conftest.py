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
    p = "docs/semd/290/1.2.643.5.1.13.13.15.13-1.2.643.5.1.13.13.15.13.7"
    p += "/schematron/290 Schematron v.1.7.sch"
    return Path(p).absolute()


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
                "text": "г Москва, ул Ладожская, д 4-6 стр 1",
                "state_code": {"code": "77", "displayName": "г. Москва", "version": "6.5"},
                "postal_code": "105005",
                "fias": {
                    "aoguid": "212d3123-9c4d-4579-b31a-b5c6e9632b04",
                    "houseguid": "e59f1e55-75c8-4037-9615-ed7ce751b745",
                },
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


@pytest.fixture
def minimal_sample_data():
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
                "series": "МЮ",
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
            "license": {
                "root": "1.2.643.5.1.13.13.12.2.77.7831.1.1.1",
                "extension": "ЛО-77-01-000000",
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
            "service_form": {"code": "3", "displayName": "Плановая", "version": "1.2"},
            "service_type": {
                "code": "1",
                "displayName": "Первичная медико-санитарная помощь",
                "version": "1.3",
            },
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


@pytest.fixture
def full_dataset_data(full_render_data):
    """Provides a comprehensive dataset covering as many fields as possible for SEMD 290."""
    data = full_render_data.copy()

    # Add second diagnosis (concomitant)
    data["diagnoses"].append(
        {
            "id": {"root": "1.2.643.5.1.13.13.12.2.77.7831.100.1.1.52", "extension": "99313"},
            "code": {
                "code": "K29.3",
                "codeSystem": "1.2.643.5.1.13.13.11.1005",
                "codeSystemName": "МКБ-10",
                "codeSystemVersion": "1.1",
                "displayName": "Хронический поверхностный гастрит",
            },
            "text": "Сопутствующий диагноз",
            "kind": "concomitant",
            "disease_character": {
                "code": "3",
                "codeSystem": "1.2.643.5.1.13.13.11.1049",
                "codeSystemName": "Характер заболевания",
                "codeSystemVersion": "3.1",
                "displayName": "Ранее установленное хроническое",
            },
        }
    )

    # Add third diagnosis (complication)
    data["diagnoses"].append(
        {
            "id": {"root": "1.2.643.5.1.13.13.12.2.77.7831.100.1.1.52", "extension": "99314"},
            "code": {
                "code": "K29.9",
                "codeSystem": "1.2.643.5.1.13.13.11.1005",
                "codeSystemName": "МКБ-10",
                "codeSystemVersion": "1.1",
                "displayName": "Гастродуоденит неуточненный",
            },
            "text": "Осложнение",
            "kind": "complication",
        }
    )

    # M7: payment_participant
    data["payment_participant"] = {
        "payment_source": {
            "code": "1",
            "codeSystem": "1.2.643.5.1.13.13.11.1039",
            "codeSystemName": "Источники оплаты медицинской помощи",
            "displayName": "Средства обязательного медицинского страхования",
            "version": "5.3",
        },
        "doc_info": {
            "doc_type": {
                "code": "1",
                "codeSystem": "1.2.643.5.1.13.13.99.2.724",
                "codeSystemName": "Типы документов оснований",
                "displayName": "Полис ОМС",
                "version": "1.1",
            },
            "insurance_policy_type": {
                "code": "1",
                "codeSystem": "1.2.643.5.1.13.13.11.1035",
                "codeSystemName": "Виды полиса обязательного медицинского страхования",
                "displayName": "Полис ОМС старого образца",
                "version": "1.3",
            },
            "series": "ЧБ",
            "number": "1344600",
            "inn": "213546789",
            "period": {"low": "2018-05-11", "high": "2028-05-12"},
        },
        "scoping_org": {
            "id_root": "1.2.643.5.1.13.13.99.2.183",
            "id_extension": "77013",
            "name": 'ООО "СТРАХОВАЯ КОМПАНИЯ "ИНГОССТРАХ-М"',
            "phone": "tel:+74957295571",
            "address": {
                "text": "г Москва, ул Рочдельская, д 15 стр 35",
                "state_code": {"code": "77", "displayName": "г. Москва", "version": "6.5"},
                "postal_code": "123376",
                "fias": {
                    "aoguid": "6bfbfcbb-87a7-4674-a8e5-bf5f1bbfbf92",
                    "houseguid": "0b33a0e1-3427-409a-a3b7-e57716819f38",
                },
            },
        },
    }

    # M8: referral_participant
    data["referral_participant"] = {
        "person": {
            "id": {"root": "1.2.643.5.1.13.3.25.77.50.100.1.1.70", "extension": "183640"},
            "snils": "52415372312",
            "position": {
                "code": "109",
                "codeSystem": "1.2.643.5.1.13.13.11.1002",
                "displayName": "Врач-терапевт",
                "version": "9.12",
            },
            "name": {"family": "Кузнецов", "given": "Дмитрий", "patronymic": "Олегович"},
            "phone": "tel:+79065184597",
            "address": {
                "text": "г Москва, ул Миклухо-Маклая, д 10",
                "state_code": {"code": "77", "displayName": "г. Москва", "version": "6.5"},
                "postal_code": "117198",
                "fias": {
                    "aoguid": "1dec06af-f015-425b-be4b-253fab5d7ccb",
                    "houseguid": "b1adc7d0-8160-47d0-9903-d794b72078f6",
                },
            },
        },
        "organization": {
            "id": "1.2.643.5.1.13.13.12.2.77.7893",
            "name": 'ГБУЗ города Москвы "Городская поликлиника №164"',
            "phone": "tel:+74954342582",
            "address": {
                "text": "г Москва, ул Миклухо-Маклая, д 10",
                "state_code": {"code": "77", "displayName": "г. Москва", "version": "6.5"},
                "postal_code": "117198",
                "fias": {
                    "aoguid": "1dec06af-f015-425b-be4b-253fab5d7ccb",
                    "houseguid": "b1adc7d0-8160-47d0-9903-d794b72078f6",
                },
            },
        },
    }

    # M9: in_fulfillment_of
    data["in_fulfillment_of"] = {
        "local_id": {"root": "1.2.643.5.1.13.3.25.77.50.100.1.1.51", "extension": "659481548"},
        "remd_id": {"root": "1.2.643.5.1.13.13.17.1.1", "extension": "177.77.23.05.314159200"},
        "doc_type": {
            "code": "3",
            "codeSystem": "1.2.643.5.1.13.13.11.1522",
            "displayName": "Направление",
            "version": "9.1",
        },
    }

    # Prescriptions (Medications)
    data["prescriptions"] = [
        {
            "is_nsi": True,
            "nsi_code": {
                "code": "21.20.10.144-000001-1-00021-0000000000000",
                "codeSystem": "1.2.643.5.1.13.13.99.2.611",
                "displayName": "Аспирин",
            },
            "dosage_text": "1 таблетка в день",
        },
        {
            "is_nsi": False,
            "manual_text": "Какой-то кастомный препарат",
            "dosage_text": "2 раза в день",
        },
    ]

    # Add second disability for testing list coverage
    data["disabilities"].append(
        {
            "group": {
                "code": "2",
                "codeSystem": "1.2.643.5.1.13.13.11.1053",
                "displayName": "Вторая группа",
                "version": "3.4",
            },
            "low": "2025-01-01",
            "high": "2026-01-01",
            "establishment_type": {
                "code": "1",
                "codeSystem": "1.2.643.5.1.13.13.99.2.166",
                "displayName": "Первично",
                "version": "5.69",
            },
        }
    )

    return data
