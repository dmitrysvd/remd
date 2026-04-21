from __future__ import annotations
from typing import Optional, List
from pydantic import BaseModel, Field


class II(BaseModel):
    """Instance Identifier (OID + extension)."""

    root: str
    extension: Optional[str] = None
    assigningAuthorityName: Optional[str] = None


class CD(BaseModel):
    """Concept Descriptor (Код из справочника)."""

    code: str
    codeSystem: str
    codeSystemName: Optional[str] = None
    displayName: Optional[str] = None


class TS(BaseModel):
    """Timestamp (Дата/время в формате HL7)."""

    value: str  # Формат YYYYMMDDHHMMSS+ZZZZ


class ADDR(BaseModel):
    """Address (ФИАС + текстовое представление)."""

    postalCode: Optional[str] = None
    state: Optional[str] = None
    city: Optional[str] = None
    street: Optional[str] = None
    house: Optional[str] = None
    flat: Optional[str] = None
    fias_guid: Optional[str] = Field(None, alias="a_guid")
    text: str


class PN(BaseModel):
    """Person Name."""

    family: str
    given: str
    patronymic: Optional[str] = None


class CE(CD):
    """Coded Element (упрощенный CD)."""

    pass
