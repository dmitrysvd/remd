from __future__ import annotations

from dataclasses import asdict, dataclass
from dataclasses import field as dc_field
from enum import StrEnum
from typing import TYPE_CHECKING, Any, Literal

if TYPE_CHECKING:
    pass


class UIComponentType(StrEnum):
    """Типы UI компонентов."""

    TEXT_INPUT = "TextInput"
    TEXT_AREA = "TextArea"
    SELECT = "Select"
    NSI_AUTOCOMPLETE = "NSIAutocomplete"
    DATE_PICKER = "DatePicker"
    NUMBER_INPUT = "NumberInput"
    SWITCH = "Switch"


@dataclass
class UICondition:
    """Условие видимости или обязательности поля в UI."""

    field: str
    op: Literal["eq", "neq", "in", "not_in", "empty", "not_empty"]
    value: Any | None = None


@dataclass
class UIFieldMetadata:
    """Метаданные для рендеринга поля на фронтенде."""

    component: UIComponentType  # Тип компонента
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
        return get_ui_schema_for_model(cls)


def get_ui_schema_for_model(model_cls: Any) -> dict[str, Any]:
    """Рекурсивно извлекает UI схему для любой Pydantic модели."""
    from typing import get_args, get_origin

    from pydantic import BaseModel

    if not (isinstance(model_cls, type) and issubclass(model_cls, BaseModel)):
        return {}

    ui_schema = {}
    model_json_schema = model_cls.model_json_schema()

    for name, field_info in model_cls.model_fields.items():
        field_meta = {}

        # 1. Извлекаем метаданные из Annotated
        for metadata in field_info.metadata:
            if isinstance(metadata, UIFieldMetadata):
                data = asdict(metadata)
                field_meta.update({k: v for k, v in data.items() if v is not None})
                break

        # 2. Обрабатываем вложенные модели
        annotation = field_info.annotation
        origin = get_origin(annotation)
        args = get_args(annotation)

        target_cls = None
        if isinstance(annotation, type) and issubclass(annotation, BaseModel):
            target_cls = annotation
        elif (
            origin is list and args and isinstance(args[0], type) and issubclass(args[0], BaseModel)
        ):
            target_cls = args[0]
            field_meta["is_list"] = True
        elif origin is not None:
            for arg in args:
                if isinstance(arg, type) and issubclass(arg, BaseModel):
                    target_cls = arg
                    break

        if target_cls:
            field_meta["schema"] = get_ui_schema_for_model(target_cls)
            if name not in ui_schema:
                ui_schema[name] = field_meta
        else:
            # Если метаданных нет, но поле примитивное - добавляем дефолтные
            if not field_meta:
                field_meta = {
                    "component": UIComponentType.TEXT_INPUT,
                    "label": name.replace("_", " ").capitalize(),
                }
            ui_schema[name] = field_meta

    return {
        "title": model_json_schema.get("title") or model_cls.__name__,
        "fields": ui_schema,
    }
