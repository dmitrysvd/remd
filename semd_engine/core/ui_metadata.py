from __future__ import annotations
from dataclasses import dataclass, field as dc_field, asdict
from typing import Any, List, Optional, Literal, Union, Dict
from pydantic import BaseModel, Field


@dataclass
class UICondition:
    """Условие видимости или обязательности поля в UI."""

    field: str
    op: Literal["eq", "neq", "in", "not_in", "empty", "not_empty"]
    value: Optional[Any] = None


@dataclass
class UIFieldMetadata:
    """Метаданные для рендеринга поля на фронтенде."""

    component: str  # Тип компонента: 'TextInput', 'Select', 'NSIAutocomplete', etc.
    label: str
    placeholder: Optional[str] = None
    hint: Optional[str] = None
    group: Optional[str] = None  # Группировка полей (секции формы)
    visibility: Optional[UICondition] = None
    required_if: Optional[UICondition] = None
    props: Dict[str, Any] = dc_field(default_factory=dict)


class UIMetadataMixin:
    """Миксин для извлечения UI схемы из Pydantic модели."""

    @classmethod
    def get_ui_schema(cls) -> Dict[str, Any]:
        schema = cls.model_json_schema()
        ui_schema = {}

        for name, field in cls.model_fields.items():
            # Ищем UIFieldMetadata в аннотациях (через Annotated)
            for metadata in field.metadata:
                if isinstance(metadata, UIFieldMetadata):
                    # Преобразуем dataclass в словарь, удаляя None
                    data = asdict(metadata)
                    ui_schema[name] = {k: v for k, v in data.items() if v is not None}
                    break

        return {"title": schema.get("title"), "fields": ui_schema}
