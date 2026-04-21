from abc import ABC, abstractmethod
from typing import Any, Protocol

from ..core.cda_types import CD


class INsiResolver(Protocol):
    """Интерфейс для получения данных из справочников НСИ."""

    async def get_code(self, catalog_oid: str, internal_id: str) -> CD | None:
        """Преобразует внутренний ID системы в объект CDA CD (код, название, OID)."""
        ...

    async def search(self, catalog_oid: str, query: str) -> list[CD]:
        """Поиск по справочнику для UI-компонентов."""
        ...


class IDataSource(Protocol):
    """Интерфейс для доступа к доменным данным системы."""

    async def get_patient_data(self, patient_id: str) -> dict[str, Any]: ...

    async def get_doctor_data(self, doctor_id: str) -> dict[str, Any]: ...

    async def get_encounter_data(self, encounter_id: str) -> dict[str, Any]: ...


class IBaseFetcher(ABC):
    """Базовый класс для сборщиков данных конкретных СЭМД."""

    def __init__(self, nsi: INsiResolver, source: IDataSource):
        self.nsi = nsi
        self.source = source

    @abstractmethod
    async def fetch(self, context_id: str) -> Any:
        """Метод сбора и трансформации данных в Pydantic модель."""
        pass
