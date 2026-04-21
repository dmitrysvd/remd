from typing import Dict, Any
from semd_engine.registry.v290_r7.schema import ConsultationProtocolV7, DiagnosisModel
from semd_engine.infrastructure.interfaces import (
    IBaseFetcher,
    INsiResolver,
    IDataSource,
)
from semd_engine.core.cda_types import CD, PN, ADDR, II


class ConsultationFetcher(IBaseFetcher):
    async def fetch(self, encounter_id: str) -> ConsultationProtocolV7:
        # 1. Получаем "сырые" данные из БД через абстрактный источник
        raw_encounter = await self.source.get_encounter_data(encounter_id)
        raw_patient = await self.source.get_patient_data(raw_encounter["patient_id"])

        # 2. Резолвим справочники НСИ (код МКБ-10)
        # В реальности тут будет поиск по internal_id
        mkb_cd = await self.nsi.get_code(
            catalog_oid="1.2.643.5.1.13.13.11.1005",
            internal_id=raw_encounter["main_diagnosis_id"],
        )

        # 3. Собираем финальную модель для валидации и UI
        return ConsultationProtocolV7(
            event_date=raw_encounter["date"],
            complaints=raw_encounter["complaints"],
            anamnesis_disease=raw_encounter["anamnesis_disease"],
            objective_status=raw_encounter["objective_status"],
            diagnoses=[
                DiagnosisModel(
                    code=mkb_cd, text=raw_encounter["diagnosis_text"], kind="main"
                )
            ],
            recommendations=raw_encounter["recommendations"],
        )
