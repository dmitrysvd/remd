from typing import Any

from jinja2 import Environment, FileSystemLoader, select_autoescape


class CDARenderer:
    def __init__(self, templates_path: str):
        self.env = Environment(
            loader=FileSystemLoader(templates_path),
            autoescape=select_autoescape(["xml"]),
            trim_blocks=True,
            lstrip_blocks=True,
        )
        # Добавляем полезные фильтры
        self.env.filters["hl7date"] = self._hl7date_filter
        self.env.filters["xml_attr"] = self._xml_attr_filter

    def render(self, template_name: str, data: dict[str, Any]) -> str:
        template = self.env.get_template(template_name)
        return template.render(**data)

    @staticmethod
    def _hl7date_filter(dt_str: str) -> str:
        """Форматирует строку даты в HL7 TS (YYYYMMDDHHMMSS)."""
        if not dt_str:
            return ""
        # Тут может быть сложная логика парсинга различных форматов
        return dt_str.replace("-", "").replace(":", "").replace(" ", "")

    @staticmethod
    def _xml_attr_filter(value: Any, name: str) -> str:
        """Рендерит атрибут XML только если значение не None."""
        if value is None or value == "":
            return ""
        return f' {name}="{value}"'
