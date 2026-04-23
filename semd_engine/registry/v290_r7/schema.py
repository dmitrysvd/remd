from __future__ import annotations

from typing import Annotated, Literal

from pydantic import BaseModel, ConfigDict, Field

from semd_engine.core.cda_types import CD, II
from semd_engine.core.ui_metadata import (
    UIComponentType,
    UICondition,
    UIFieldMetadata,
    UIMetadataMixin,
)


class DiagnosisModel(BaseModel, UIMetadataMixin):
    """Секция Диагноза (МКБ-10)."""

    id: II | None = None
    code: Annotated[
        CD,
        UIFieldMetadata(
            component=UIComponentType.NSI_AUTOCOMPLETE,
            label="Код по МКБ-10",
            props={"nsi_oid": "1.2.643.5.1.13.13.11.1005"},
        ),
    ]
    text: Annotated[
        str, UIFieldMetadata(component=UIComponentType.TEXT_AREA, label="Клинический диагноз")
    ]
    kind: Annotated[
        Literal["main", "complication", "concomitant"],
        UIFieldMetadata(
            component=UIComponentType.SELECT,
            label="Вид диагноза",
            props={
                "options": [
                    {"label": "Основной", "value": "main"},
                    {"label": "Осложнение", "value": "complication"},
                    {"label": "Сопутствующий", "value": "concomitant"},
                ]
            },
        ),
    ]
    disease_character: Annotated[
        CD | None,
        UIFieldMetadata(
            component=UIComponentType.NSI_AUTOCOMPLETE,
            label="Характер заболевания",
            props={"nsi_oid": "1.2.643.5.1.13.13.11.1049"},
        ),
    ] = None


class VitalParamModel(BaseModel, UIMetadataMixin):
    """Витальный параметр (температура, вес, рост и т.д.)."""

    code: Annotated[
        CD,
        UIFieldMetadata(
            component=UIComponentType.NSI_AUTOCOMPLETE,
            label="Тип параметра",
            props={"nsi_oid": "1.2.643.5.1.13.13.99.2.262"},
        ),
    ]
    value: Annotated[
        float, UIFieldMetadata(component=UIComponentType.NUMBER_INPUT, label="Значение")
    ]
    unit: Annotated[
        str, UIFieldMetadata(component=UIComponentType.TEXT_INPUT, label="Единица измерения (UCUM)")
    ]
    unit_code: Annotated[
        CD,
        UIFieldMetadata(
            component=UIComponentType.NSI_AUTOCOMPLETE,
            label="Единица измерения (НСИ)",
            props={"nsi_oid": "1.2.643.5.1.13.13.11.1358"},
        ),
    ]
    measured_at: Annotated[
        str | None,
        UIFieldMetadata(component=UIComponentType.DATE_PICKER, label="Дата измерения"),
    ] = None
    observation_id: II | None = None


class PrescribedMedication(BaseModel, UIMetadataMixin):
    """Секция Назначенного препарата."""

    is_nsi: Annotated[
        bool,
        UIFieldMetadata(
            component=UIComponentType.SWITCH, label="Выбрать из справочника НСИ (СМНН/ЕСКЛП)"
        ),
    ] = False
    # Поле видно только если is_nsi == True
    nsi_code: Annotated[
        CD | None,
        UIFieldMetadata(
            component=UIComponentType.NSI_AUTOCOMPLETE,
            label="Препарат из справочника",
            visibility=UICondition(field="is_nsi", op="eq", value=True),
            props={"nsi_oid": "1.2.643.5.1.13.13.11.1461"},
        ),
    ] = None
    # Поле видно только если is_nsi == False
    manual_text: Annotated[
        str | None,
        UIFieldMetadata(
            component=UIComponentType.TEXT_INPUT,
            label="Торговое наименование вручную",
            visibility=UICondition(field="is_nsi", op="eq", value=False),
        ),
    ] = None
    dosage_text: Annotated[
        str,
        UIFieldMetadata(
            component=UIComponentType.TEXT_INPUT, label="Дозировка и способ применения"
        ),
    ]
    period: Annotated[
        CDARange | None,
        UIFieldMetadata(component=UIComponentType.DATE_RANGE, label="Период приема"),
    ] = None
    period_value: Annotated[
        str | None,
        UIFieldMetadata(component=UIComponentType.TEXT_INPUT, label="Кратность приема (значение)"),
    ] = None


class CDARange(BaseModel):
    low: str | None = None
    high: str | None = None


class AllergyReactionModel(BaseModel, UIMetadataMixin):
    """Проявление аллергической реакции."""

    code: Annotated[
        CD,
        UIFieldMetadata(
            component=UIComponentType.NSI_AUTOCOMPLETE,
            label="Клиническое проявление",
            props={"nsi_oid": "1.2.643.5.1.13.13.11.1063"},
        ),
    ]
    text: Annotated[
        str | None,
        UIFieldMetadata(component=UIComponentType.TEXT_INPUT, label="Описание (если 'иное')"),
    ] = None


class AllergyModel(BaseModel, UIMetadataMixin):
    """Сведения об аллергической реакции."""

    type: Annotated[
        CD,
        UIFieldMetadata(
            component=UIComponentType.NSI_AUTOCOMPLETE,
            label="Тип реакции",
            props={"nsi_oid": "1.2.643.5.1.13.13.11.1064"},
        ),
    ]
    effective_time: Annotated[
        str, UIFieldMetadata(component=UIComponentType.DATE_PICKER, label="Дата выявления")
    ]
    agent_code: Annotated[
        CD | None,
        UIFieldMetadata(
            component=UIComponentType.NSI_AUTOCOMPLETE,
            label="МНН агента",
            props={"nsi_oid": "1.2.643.5.1.13.13.11.1367"},
        ),
    ] = None
    agent_text: Annotated[
        str | None,
        UIFieldMetadata(component=UIComponentType.TEXT_INPUT, label="Описание агента (текстом)"),
    ] = None
    comment: Annotated[
        str | None, UIFieldMetadata(component=UIComponentType.TEXT_INPUT, label="Комментарий")
    ] = None
    reactions: list[AllergyReactionModel] = Field(default_factory=list, min_length=1)


class ConsultationProtocolV7(BaseModel, UIMetadataMixin):
    """Корневая модель Протокола консультации Р7."""

    model_config = ConfigDict(title="СЭМД Протокол консультации (Редакция 7)")

    # Секция: Общая информация
    event_date: Annotated[
        str,
        UIFieldMetadata(component=UIComponentType.DATE_PICKER, label="Дата и время консультации"),
    ]

    # Секция: Жалобы и Анамнез
    complaints: Annotated[
        str, UIFieldMetadata(component=UIComponentType.TEXT_AREA, label="Жалобы", group="Анамнез")
    ]
    anamnesis_life: Annotated[
        str | None,
        UIFieldMetadata(
            component=UIComponentType.TEXT_AREA, label="Анамнез жизни", group="Анамнез"
        ),
    ] = None
    anamnesis_disease: Annotated[
        str,
        UIFieldMetadata(
            component=UIComponentType.TEXT_AREA, label="Анамнез заболевания", group="Анамнез"
        ),
    ]

    # Секция: Аллергии
    allergies_text: Annotated[
        str | None,
        UIFieldMetadata(
            component=UIComponentType.TEXT_AREA,
            label="Аллергологический анамнез (текст)",
            group="Анамнез",
        ),
    ] = None
    allergies: list[AllergyModel] = Field(
        default_factory=list, json_schema_extra={"group": "Анамнез"}
    )

    # Секция: Объективный статус
    objective_status: Annotated[
        str,
        UIFieldMetadata(
            component=UIComponentType.TEXT_AREA,
            label="Объективный статус",
            group="Объективный статус",
        ),
    ]

    # Секция: Витальные параметры
    vital_params: list[VitalParamModel] = Field(
        default_factory=list, json_schema_extra={"group": "Объективный статус"}
    )

    # Секция: Диагнозы
    diagnoses: list[DiagnosisModel] = Field(..., min_length=1)

    # Секция: Рекомендации и назначения
    recommendations: Annotated[
        str, UIFieldMetadata(component=UIComponentType.TEXT_AREA, label="Рекомендации")
    ]
    prescriptions: list[PrescribedMedication] = Field(default_factory=list)


DiagnosisModel.model_rebuild()
VitalParamModel.model_rebuild()
PrescribedMedication.model_rebuild()
ConsultationProtocolV7.model_rebuild()
