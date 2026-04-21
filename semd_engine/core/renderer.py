from pathlib import Path
from typing import Any

from jinja2 import Environment, FileSystemLoader, StrictUndefined, select_autoescape
from lxml import etree
from pydantic import BaseModel


class CDARenderer:
    def __init__(self, templates_path: str | Path | list[str | Path]):
        if isinstance(templates_path, str | Path):
            search_paths = [str(templates_path)]
        else:
            search_paths = [str(p) for p in templates_path]

        self.env = Environment(
            loader=FileSystemLoader(search_paths),
            autoescape=select_autoescape(["xml"]),
            trim_blocks=True,
            lstrip_blocks=True,
            undefined=StrictUndefined,
        )
        # Добавляем полезные фильтры
        self.env.filters["hl7date"] = self._hl7date_filter
        self.env.filters["xml_attr"] = self._xml_attr_filter

    def render(self, template_name: str, *data_objects: dict[str, Any] | BaseModel) -> str:
        render_data = {}
        for obj in data_objects:
            if isinstance(obj, BaseModel):
                render_data.update(obj.model_dump())
            else:
                render_data.update(obj)
        template = self.env.get_template(template_name)
        return template.render(**render_data)

    def validate_xsd(self, xml_content: str, xsd_path: str | Path) -> tuple[bool, list[str]]:
        """Валидирует XML по XSD схеме. Возвращает (успех, список ошибок)."""
        try:
            xml_doc = etree.fromstring(xml_content.encode("utf-8"))
            xsd_doc = etree.parse(str(xsd_path))
            xsd = etree.XMLSchema(xsd_doc)
            is_valid = xsd.validate(xml_doc)
            errors = [str(error) for error in xsd.error_log]  # type: ignore
            return is_valid, errors
        except Exception as e:
            return False, [str(e)]

    def validate_schematron(self, xml_content: str, sch_path: str | Path) -> tuple[bool, list[str]]:
        """Валидирует XML по Schematron через schxslt-cli.jar. Возвращает (успех, список ошибок)."""
        import subprocess
        import tempfile

        jar_path = Path("schxslt-cli.jar").absolute()
        if not jar_path.exists():
            return False, [f"Schematron CLI jar not found at {jar_path}"]

        with tempfile.NamedTemporaryFile(suffix=".xml", delete=False) as tmp_xml:
            # У РФ-валидаторов есть особенность: они часто не умеют в неймспейсы CDA R2
            # (urn:hl7-org:v3) в Schematron-правилах.
            clean_xml = xml_content.replace('xmlns="urn:hl7-org:v3"', "")
            tmp_xml.write(clean_xml.encode("utf-8"))
            tmp_xml_path = tmp_xml.name

        try:
            cmd = [
                "java",
                "-jar",
                str(jar_path),
                "-s",
                str(sch_path),
                "-d",
                tmp_xml_path,
                "-e",
                "1",  # Возвращать код 1 если документ невалиден
                "-v",  # Подробный вывод
            ]
            result = subprocess.run(cmd, capture_output=True, text=True)

            is_valid = result.returncode == 0
            output = result.stdout + result.stderr
            # Собираем только значимые строки ошибок (те, что содержат текст проверок)
            errors = [
                line.strip()
                for line in output.split("\n")
                if line.strip() and not line.startswith("[")
            ]

            # Если ошибок в выводе нет, но документ невалиден, добавим общую ошибку
            if not is_valid and not errors:
                errors = [output.strip()]

            return is_valid, errors

        except Exception as e:
            return False, [str(e)]
        finally:
            if Path(tmp_xml_path).exists():
                Path(tmp_xml_path).unlink()

    @staticmethod
    def _hl7date_filter(dt_str: str) -> str:
        """Форматирует строку даты в HL7 TS (YYYYMMDDHHMMSS+ZZZZ)."""
        if not dt_str:
            return ""
        # Упрощенная реализация: убираем разделители и добавляем московское время
        clean = dt_str.replace("-", "").replace(":", "").replace(" ", "")
        if len(clean) == 8:  # Только дата
            clean += "000000"
        return clean + "+0300"

    @staticmethod
    def _xml_attr_filter(value: Any, name: str) -> str:
        """Рендерит атрибут XML только если значение не None."""
        if value is None or value == "":
            return ""
        return f' {name}="{value}"'
