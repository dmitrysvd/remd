from __future__ import annotations

from pydantic import BaseModel, Field

from semd_engine.core.cda_types import ADDR, CD, II, PN
from semd_engine.registry.v290_r7.schema import ConsultationProtocolV7


class CDWithVersion(CD):
    """CD с дополнительным полем version, которое часто используется в СЭМД."""

    version: str | None = None
    translation: CD | None = None


class Period(BaseModel):
    low: str | None = None
    high: str | None = None


class HeaderModel(BaseModel):
    id: II
    type_code: CDWithVersion
    title: str
    confidentiality: CDWithVersion
    set_id: II
    version: int


class IdentityDocModel(BaseModel):
    type: CDWithVersion
    series: str | None = None
    number: str
    issue_org: str
    issue_org_code: str | None = None
    issue_date: str


class DisabilityModel(BaseModel):
    group: CDWithVersion
    low: str
    high: str | None = None
    establishment_type: CDWithVersion | None = None


class BenefitModel(BaseModel):
    code: CDWithVersion


class IncapacityModel(BaseModel):
    reason: CDWithVersion
    period: Period


class InsurancePolicyModel(BaseModel):
    type: CDWithVersion
    series: str | None = None
    number: str


class PatientModel(BaseModel):
    id: II
    snils: str
    identity_doc: IdentityDocModel
    insurance_policy: InsurancePolicyModel | None = None
    name: PN
    address: ADDRWithVersion
    gender: CD
    birth_date: str
    contacts: dict[str, str] = Field(default_factory=dict)


class OrganizationModel(BaseModel):
    id: str
    ogrn: str
    okpo: str
    okato: str
    name: str
    phone: str
    address: ADDRWithVersion
    license: II | None = None


class AuthorModel(BaseModel):
    id: II
    snils: str
    position: CDWithVersion
    name: PN
    phone: str
    address: ADDRWithVersion


class ADDRWithVersion(ADDR):
    """ADDR с поддержкой версионных полей в под-объектах."""

    type: CDWithVersion | None = None
    state_code: CDWithVersion | None = None


class EventModel(BaseModel):
    type: CDWithVersion
    period: Period
    conditions: CDWithVersion | None = None
    service_form: CDWithVersion | None = None
    service_type: CDWithVersion | None = None


class EncounterModel(BaseModel):
    period: Period


class DocumentInfoModel(BaseModel):
    case_type: CDWithVersion
    patient_condition: CDWithVersion


class ConsultationProtocolV7RenderContext(ConsultationProtocolV7):
    """
    Полный контекст рендеринга для Протокола консультации Р7.
    Включает в себя как пользовательские данные (из ConsultationProtocolV7),
    так и служебный заголовок/окружение.
    """

    header: HeaderModel
    patient: PatientModel
    organization: OrganizationModel
    author: AuthorModel
    event: EventModel
    encounter: EncounterModel
    document_info: DocumentInfoModel

    disabilities: list[DisabilityModel] = Field(default_factory=list)
    benefits: list[BenefitModel] = Field(default_factory=list)
    incapacity: IncapacityModel | None = None

    # Переопределяем поля из базовой модели, если нужно,
    # но ConsultationProtocolV7 уже содержит всё необходимое для payload.


ConsultationProtocolV7RenderContext.model_rebuild()
