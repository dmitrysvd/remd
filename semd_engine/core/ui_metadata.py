from __future__ import annotations

from dataclasses import asdict, dataclass
from dataclasses import field as dc_field
from typing import TYPE_CHECKING, Any, Literal

if TYPE_CHECKING:
    from pydantic import BaseModel


@dataclass
class UICondition:
    """Условие видимости или обязательности поля в UI."""

    field: str
    op: Literal["eq", "neq", "in", "not_in", "empty", "not_empty"]
    value: Any | None = None


@dataclass
class UIFieldMetadata:
    """Метаданные для рендеринга поля на фронтенде."""

    component: str  # Тип компонента: 'TextInput', 'Select', 'NSIAutocomplete', etc.
    label: str
    placeholder: str | None = None
    hint: str | None = None
    group: str | None = None  # Группировка полей (секции формы)
    visibility: UICondition | None = None
    required_if: UICondition | None = None
    props: dict[str, Any] = dc_field(default_factory=dict)


class UIMetadataMixin:
    """Миксин для извлечения UI схемы из Pydantic модели."""

    @classmethod
    def get_ui_schema(cls) -> dict[str, Any]:
        # type hint for pyright
        if not hasattr(cls, "model_json_schema"):
            raise TypeError("UIMetadataMixin must be used with Pydantic BaseModel")

        model_cls: type[BaseModel] = cls  # type: ignore
        schema = model_cls.model_json_schema()
        ui_schema = {}

        for name, field in model_cls.model_fields.items():
            # Ищем UIFieldMetadata в аннотациях (через Annotated)
            for metadata in field.metadata:
                if isinstance(metadata, UIFieldMetadata):
                    # Преобразуем dataclass в словарь, удаляя None
                    data = asdict(metadata)
                    ui_schema[name] = {k: v for k, v in data.items() if v is not None}
                    break

        return {"title": schema.get("title"), "fields": ui_schema}
