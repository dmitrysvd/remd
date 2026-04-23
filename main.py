from typing import Any

import uvicorn
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

from semd_engine.core.renderer import CDARenderer
from semd_engine.registry.v290_r7.context import ConsultationProtocolV7RenderContext
from semd_engine.registry.v290_r7.schema import ConsultationProtocolV7

app = FastAPI()

# Настраиваем шаблоны
templates = Jinja2Templates(directory="semd_engine/core/templates/web")

# Инициализируем рендерер
renderer = CDARenderer(
    templates_path=[
        "semd_engine/registry/v290_r7/templates",
        "semd_engine/core/templates",
    ]
)
renderer.register_context_model("main.xml.j2", ConsultationProtocolV7RenderContext)

# Мок данных заголовка (в реальной системе придет из БД/интеграций)
HEADER_MOCK = {
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
            "displayName": "Обычный",
            "codeSystem": "1.2.643.5.1.13.13.99.2.285",
            "codeSystemName": "Уровни конфиденциальности медицинских документов",
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


def flat_to_nested(flat_data: dict[str, Any]) -> dict[str, Any]:
    """Вспомогательная функция для превращения плоского списка полей формы в nested dict."""
    result = {}
    for key, value in flat_data.items():
        if not value:
            continue
        parts = key.split(".")
        d = result
        for i, part in enumerate(parts[:-1]):
            if part.isdigit():
                continue

            next_part = parts[i + 1]
            if next_part.isdigit():
                if part not in d:
                    d[part] = []
                idx = int(next_part)
                while len(d[part]) <= idx:
                    d[part].append({})
                d = d[part][idx]
            else:
                if part not in d:
                    d[part] = {}
                d = d[part]

        last_part = parts[-1]
        if not last_part.isdigit():
            d[last_part] = value
    return result


@app.get("/", response_class=HTMLResponse)
async def index(request: Request):
    ui_schema = ConsultationProtocolV7.get_ui_schema()
    return templates.TemplateResponse(
        request=request,
        name="demo.html",
        context={"ui_schema": ui_schema, "xml_result": None},
    )


@app.post("/generate", response_class=HTMLResponse)
async def generate(request: Request):
    form_data = await request.form()
    # Преобразуем FormData в вложенный словарь
    nested_data = flat_to_nested(dict(form_data))

    # Исправляем формат даты (из datetime-local в обычную строку)
    if "event_date" in nested_data:
        nested_data["event_date"] = nested_data["event_date"].replace("T", " ") + ":00"

    try:
        # Валидация
        model = ConsultationProtocolV7.model_validate(nested_data)
        # Рендеринг
        xml_result = renderer.render("main.xml.j2", HEADER_MOCK, model)
    except Exception as e:
        xml_result = f"Ошибка: {str(e)}"

    ui_schema = ConsultationProtocolV7.get_ui_schema()
    return templates.TemplateResponse(
        request=request,
        name="demo.html",
        context={"ui_schema": ui_schema, "xml_result": xml_result},
    )


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8001)
