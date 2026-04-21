from __future__ import annotations

from pydantic import BaseModel, Field


class II(BaseModel):
    """Instance Identifier (OID + extension)."""

    root: str
    extension: str | None = None
    assigningAuthorityName: str | None = None


class CD(BaseModel):
    """Concept Descriptor (Код из справочника)."""

    code: str
    codeSystem: str
    codeSystemName: str | None = None
    codeSystemVersion: str | None = None
    displayName: str | None = None
    originalText: str | None = None


class TS(BaseModel):
    """Timestamp (Дата/время в формате HL7)."""

    value: str  # Формат YYYYMMDDHHMMSS+ZZZZ


class ADDR(BaseModel):
    """Address (ФИАС + текстовое представление)."""

    postalCode: str | None = None
    state: str | None = None
    city: str | None = None
    street: str | None = None
    house: str | None = None
    flat: str | None = None
    fias_guid: str | None = Field(None, alias="a_guid")
    text: str


class PN(BaseModel):
    """Person Name."""

    family: str
    given: str
    patronymic: str | None = None


class CE(CD):
    """Coded Element (упрощенный CD)."""

    pass
