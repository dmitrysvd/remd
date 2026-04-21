import asyncio
import json
from semd_engine.registry.v290_r7.schema import (
    ConsultationProtocolV7,
    DiagnosisModel,
    PrescribedMedication,
)
from semd_engine.core.renderer import CDARenderer
from semd_engine.core.cda_types import CD


async def demo():
    # Явное восстановление моделей в контексте запуска
    DiagnosisModel.model_rebuild()
    PrescribedMedication.model_rebuild()
    ConsultationProtocolV7.model_rebuild()

    # 1. Демонстрация Backend Driven UI

    print("--- UI SCHEMA FOR FRONTEND ---")
    ui_schema = ConsultationProtocolV7.get_ui_schema()
    print(json.dumps(ui_schema, indent=2, ensure_ascii=False))

    # 2. Пример данных (как если бы они пришли с фронтенда)
    client_data = {
        "event_date": "2026-04-21 14:00:00",
        "complaints": "Боли в области живота",
        "anamnesis_disease": "Болеет в течение 2 дней",
        "objective_status": "Состояние удовлетворительное",
        "diagnoses": [
            {
                "code": {
                    "code": "K29.5",
                    "codeSystem": "1.2.643.5.1.13.13.11.1005",
                    "displayName": "Хронический гастрит",
                },
                "text": "Хронический гастрит в стадии обострения",
                "kind": "main",
            }
        ],
        "recommendations": "Диета №1, омепразол 20мг",
    }

    # 3. Валидация
    print("\n--- VALIDATING CLIENT DATA ---")
    model = ConsultationProtocolV7(**client_data)
    print("Validation successful!")

    # 4. Рендеринг XML
    # Для демо прокинем фейковые заголовки
    render_data = model.model_dump()
    render_data.update(
        {
            "header": {
                "id": {"root": "1.2.643.5.1.13.13.16.1.1", "extension": "12345"},
                "type_code": {
                    "code": "290",
                    "codeSystem": "1.2.643.5.1.13.13.11.1520",
                    "displayName": "Протокол консультации",
                },
                "title": "Протокол консультации",
            },
            "patient": {
                "id": {"root": "1.2.643.5.1.13.13.16.1.1.1", "extension": "999"},
                "name": {"family": "Иванов", "given": "Иван", "patronymic": "Иванович"},
                "address": {"text": "г. Москва, ул. Ленина, д. 1"},
                "gender": {"code": "1"},
                "birth_date": "1980-01-01",
            },
        }
    )

    print("\n--- GENERATING CDA XML ---")
    renderer = CDARenderer("semd_engine/registry/v290_r7/templates")
    # Добавляем путь к макросам в поиск шаблонов
    renderer.env.loader.searchpath.append("semd_engine/core/templates")

    xml_output = renderer.render("main.xml.j2", render_data)
    print(xml_output[:1000] + "...")  # Печатаем начало для проверки


if __name__ == "__main__":
    asyncio.run(demo())
