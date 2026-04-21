from __future__ import annotations
from typing import Annotated, Optional, List, Dict, Any, Literal
from pydantic import BaseModel, Field
from semd_engine.core.ui_metadata import UIFieldMetadata, UICondition, UIMetadataMixin
from semd_engine.core.cda_types import CD, II, TS, ADDR, PN


class DiagnosisModel(BaseModel):
    """Секция Диагноза (МКБ-10)."""

    code: Annotated[
        CD,
        UIFieldMetadata(
            component="NSIAutocomplete",
            label="Код по МКБ-10",
            props={"nsi_oid": "1.2.643.5.1.13.13.11.1005"},
        ),
    ]
    text: Annotated[
        str, UIFieldMetadata(component="TextArea", label="Клинический диагноз")
    ]
    kind: Annotated[
        Literal["main", "complication", "concomitant"],
        UIFieldMetadata(
            component="Select",
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


class PrescribedMedication(BaseModel):
    """Секция Назначенного препарата."""

    is_nsi: Annotated[
        bool,
        UIFieldMetadata(
            component="Switch", label="Выбрать из справочника НСИ (СМНН/ЕСКЛП)"
        ),
    ]
    # Поле видно только если is_nsi == True
    nsi_code: Annotated[
        Optional[CD],
        UIFieldMetadata(
            component="NSIAutocomplete",
            label="Препарат из справочника",
            visibility=UICondition(field="is_nsi", op="eq", value=True),
            props={"nsi_oid": "1.2.643.5.1.13.13.11.1461"},
        ),
    ] = None
    # Поле видно только если is_nsi == False
    manual_text: Annotated[
        Optional[str],
        UIFieldMetadata(
            component="TextInput",
            label="Торговое наименование вручную",
            visibility=UICondition(field="is_nsi", op="eq", value=False),
        ),
    ] = None
    dosage_text: Annotated[
        str,
        UIFieldMetadata(component="TextInput", label="Дозировка и способ применения"),
    ]


class ConsultationProtocolV7(BaseModel, UIMetadataMixin):
    """Корневая модель Протокола консультации Р7."""

    # Секция: Общая информация
    event_date: Annotated[
        str, UIFieldMetadata(component="DatePicker", label="Дата и время консультации")
    ]

    # Секция: Жалобы и Анамнез
    complaints: Annotated[
        str, UIFieldMetadata(component="TextArea", label="Жалобы", group="Анамнез")
    ]
    anamnesis_life: Annotated[
        Optional[str],
        UIFieldMetadata(component="TextArea", label="Анамнез жизни", group="Анамнез"),
    ] = None
    anamnesis_disease: Annotated[
        str,
        UIFieldMetadata(
            component="TextArea", label="Анамнез заболевания", group="Анамнез"
        ),
    ]

    # Секция: Объективный статус
    objective_status: Annotated[
        str,
        UIFieldMetadata(
            component="TextArea", label="Объективный статус", group="Объективный статус"
        ),
    ]

    # Секция: Витальные параметры (могут быть динамическими)
    temp: Annotated[
        Optional[float],
        UIFieldMetadata(
            component="NumberInput",
            label="Температура тела",
            group="Объективный статус",
        ),
    ] = None
    weight: Annotated[
        Optional[float],
        UIFieldMetadata(
            component="NumberInput", label="Вес (кг)", group="Объективный статус"
        ),
    ] = None

    # Секция: Диагнозы
    diagnoses: List[DiagnosisModel] = Field(..., min_length=1)

    # Секция: Рекомендации и назначения
    recommendations: Annotated[
        str, UIFieldMetadata(component="TextArea", label="Рекомендации")
    ]
    prescriptions: List[PrescribedMedication] = Field(default_factory=list)

    class Config:
        title = "СЭМД Протокол консультации (Редакция 7)"


DiagnosisModel.model_rebuild()
PrescribedMedication.model_rebuild()
ConsultationProtocolV7.model_rebuild()
