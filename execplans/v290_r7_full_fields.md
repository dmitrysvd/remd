# Полное покрытие полей СЭМД 290 Р7 (Протокол консультации)

Этот ExecPlan является живым документом. Разделы «Прогресс», «Сюрпризы и открытия», «Журнал решений» и «Результаты и ретроспектива» должны обновляться по мере работы.

Ведётся в соответствии с PLANS.md.

## Цель / Общая картина

Генератор СЭМД 290 Р7 должен корректно работать для **полного набора входных данных** — включая все опциональные секции заголовка (источник оплаты, направившее лицо, направление), несколько диагнозов разных видов, витальные параметры, корректный анамнез жизни и т.д.

Критерий готовности: тест `test_full_v290_r7_generation_and_validation` проходит со всеми входными данными из эталонного XML-образца (`docs/semd/290/.../xml/Протокол консультации.xml`). Плюс новый тест `test_full_dataset_generation_and_validation`, который использует богатый датасет (все поля) и проходит XSD + Schematron валидацию.

Врач или разработчик сможет передать контекст с полным набором участников, несколькими диагнозами, витальными параметрами — и получить валидный документ.

## Контекст и ориентиры

Ключевые файлы:
- `semd_engine/registry/v290_r7/schema.py` — Pydantic-модели пользовательского ввода (врача)
- `semd_engine/registry/v290_r7/context.py` — полный контекст рендеринга (включая инфраструктурные поля)
- `semd_engine/registry/v290_r7/templates/main.xml.j2` — Jinja2-шаблон XML
- `semd_engine/core/templates/macros/cda.xml.j2` — переиспользуемые CDA-макросы
- `tests/test_validation.py` — тест полного рендеринга + XSD + Schematron (единственный acceptance-тест)
- `docs/semd/290/.../xml/Протокол консультации.xml` — эталонный XML (1547 строк), источник правды
- `docs/semd/290/.../schematron/290 Schematron v.1.7.sch` — правила бизнес-валидации

Команды запуска тестов (рабочая директория `/home/dmitry/projects/remd`):

    uv run pytest tests/test_validation.py -v
    uv run pytest -v   # все тесты

### Найденные несоответствия (gap-анализ по эталонному XML)

**Баги в существующем коде:**
1. LANAM-секция использует `anamnesis_disease` вместо `anamnesis_life` (строка 225 main.xml.j2)
2. DGN-секция рендерит только `diagnoses[0]` — нет цикла по всем диагнозам
3. DGN: поле `kind` («Основное заболевание» / «Осложнение» / «Сопутствующий») не маппится в код НСИ 1.2.643.5.1.13.13.11.1077
4. DGN: поле `diagnoses[n].text` (клинический диагноз текстом) не рендерится в `<text>` внутри entryRelationship
5. DGN: характер заболевания (код 12014/823) использует неправильный код МКБ вместо кода характера (1.2.643.5.1.13.13.11.1049); нужно поле `disease_character` в модели диагноза
6. Vitальные параметры (temp, weight) в модели есть, но рендерятся не в секцию VITALPARAM, а нигде

**Отсутствующие поля в context.py:**
7. `participant typeCode="IND"` — источник оплаты (insurance payer) — структура: `ParticipantINDModel`
8. `participant typeCode="REF"` — направившее лицо и организация — `ParticipantREFModel`
9. `inFulfillmentOf` — сведения о направлении — `InFulfillmentOfModel`
10. `EventModel` не содержит `service_form` и `service_type` (Форма и вид медицинской помощи)
11. `OrganizationModel` не содержит `license_id` (лицензия МО, второй `<id>` в providerOrganization)
12. `InsurancePolicyModel` не содержит поле `series`
13. Секция DISABILITY захардкожена — нужна параметризация через `DisabilityModel` в context
14. Секция BENEFITS захардкожена — нужна параметризация через `BenefitModel`
15. Секция SOCANAM: поле нетрудоспособности (12006) захардкожено, даты не из модели

**Отсутствующие поля в schema.py (пользовательский ввод):**
16. `DiagnosisModel.disease_character` — характер заболевания (CD, НСИ 1.2.643.5.1.13.13.11.1049)
17. Витальные параметры: `height` (рост), `heart_rate` (ЧСС), `bp_systolic` (АД сист.), `bp_diastolic` (АД диаст.) — в дополнение к `temp` и `weight`

### Приоритизация

Реализуем в следующем порядке (от критичных багов к расширениям):

**Этап 1: Исправление багов** (не ломают валидацию, но неверны логически)
- M1: Исправить баг LANAM (anamnesis_life)
- M2: Исправить DGN — цикл по всем диагнозам + text + kind → код НСИ + disease_character

**Этап 2: Витальные параметры**
- M3: Расширить модель schema.py (height, heart_rate, bp_systolic, bp_diastolic) + рендеринг секции VITALPARAM

**Этап 3: Параметризация захардкоженных секций context**
- M4: DisabilityModel (DISABILITY) + BenefitModel (BENEFITS)
- M5: SocanamModel (SOCANAM, поле нетрудоспособности + даты)

**Этап 4: Дополнения к контексту**
- M6: insurance_policy.series, organization.license_id, event.service_form/service_type
- M7: ParticipantINDModel (источник оплаты)
- M8: ParticipantREFModel (направившее лицо)
- M9: InFulfillmentOfModel (направление)

**Этап 5: Тест с полным датасетом**
- M10: Новый тест `test_full_dataset_generation_and_validation` с максимальным набором данных

После каждого этапа — запуск `uv run pytest tests/test_validation.py -v`.
После каждого этапа — git commit.

## Прогресс

- [x] M1: Исправить баг LANAM (anamnesis_life)
- [x] M2: DGN — цикл + text + kind mapping + disease_character
- [x] M3: Витальные параметры (height, heart_rate, bp, temp, weight) → секция VITALPARAM
- [x] M4: Параметризация DISABILITY + BENEFITS
- [x] M5: Параметризация SOCANAM (нетрудоспособность + даты)
- [x] M6: Мелкие дополнения context (license_id, insurance series, service_form/type)
- [ ] M7: ParticipantINDModel + рендеринг
- [ ] M8: ParticipantREFModel + рендеринг
- [ ] M9: InFulfillmentOfModel + рендеринг
- [ ] M10: Тест test_full_dataset_generation_and_validation

## Сюрпризы и открытия

- Наблюдение: DGN в эталонном XML имеет ДРУГУЮ структуру, чем в текущем шаблоне. В образце `entryRelationship` с кодом МКБ содержится в `<value xsi:type="CD" codeSystem="1.2.643.5.1.13.13.11.1005">`, а характер заболевания (12014) является отдельным entryRelationship со своим кодом `1.2.643.5.1.13.13.11.1049`. Текущий шаблон перепутал оба кода.
  Доказательство: эталонный XML строки 1241-1313 vs main.xml.j2 строки 268-288.

- Наблюдение: В эталонном XML `<code>` на секции `encompassingEncounter` — `codeSystemName="Типы медицинских карт"`, а в текущем шаблоне — `"Виды медицинской помощи"`. Это несоответствие обнаружено при анализе, но не ломает Schematron (XSD не проверяет codeSystemName).

- Наблюдение: VITALPARAM в эталонном XML содержит 6 показателей с `<id>` (обязательный по Schematron), `<code>` из НСИ 1.2.643.5.1.13.13.99.2.262, `<effectiveTime>` и `<value xsi:type="PQ">` с единицами измерения из НСИ 1.2.643.5.1.13.13.11.1358. Структура сложнее, чем простые `temp`/`weight` из схемы.

## Журнал решений

- Решение: Секцию VITALPARAM параметризовать через список `VitalParamModel` в schema.py, а не через отдельные поля temp/weight. Это более гибко (любое количество параметров) и точнее отражает структуру стандарта.
  Обоснование: Эталонный XML содержит 6 параметров с ID, кодами НСИ и единицами измерения. Разрозненные поля `temp`, `weight` нельзя расширить до произвольного набора без ломания интерфейса.
  Дата: 2026-04-23

- Решение: Оставить поля `temp` и `weight` в `ConsultationProtocolV7` как deprecated-алиасы (или удалить), добавив `vital_params: list[VitalParamModel]`. Существующие тесты использующие `temp`/`weight` в schema должны быть обновлены.
  Обоснование: Чистота модели важнее обратной совместимости на этом этапе.
  Дата: 2026-04-23

- Решение: Параметры DISABILITY, BENEFITS, SOCANAM остаются в `context.py` (не в schema.py), так как это инфраструктурные/справочные данные, которые приходят из бэкенда, а не от врача через форму.
  Обоснование: Врач не вводит группу инвалидности или льготную категорию прямо в консультационном протоколе — это берётся из истории болезни.
  Дата: 2026-04-23

- Решение: Диагнозный текст (`diagnoses[n].text`) рендерится в `<text>` тег внутри нозологического entryRelationship (уровень типа диагноза), как в эталонном XML строка 1245.
  Обоснование: Стандарт требует `<text>` на уровне вида нозологической единицы, не на уровне observation 838.
  Дата: 2026-04-23

## Результаты и ретроспектива

(Заполняется после завершения)

## План работы

### M1: Исправление бага LANAM

Файл `semd_engine/registry/v290_r7/templates/main.xml.j2`, строка 225:
изменить `{{ anamnesis_disease }}` на `{{ anamnesis_life }}`.

Проверка: `uv run pytest tests/test_validation.py -v` (все 3 должны пройти).

### M2: DGN — многодиагнозный цикл + корректная структура

Файл `semd_engine/registry/v290_r7/schema.py`:
- Добавить поле `disease_character: CD | None = None` в `DiagnosisModel` (Характер заболевания, НСИ 1.2.643.5.1.13.13.11.1049)

Файл `semd_engine/registry/v290_r7/templates/main.xml.j2`, секция DGN:
- Заменить `diagnoses[0]` на цикл `{% for diag in diagnoses %}...{% endfor %}`
- Маппинг `kind` → код НСИ 1.2.643.5.1.13.13.11.1077:
  - `main` → `1` (Основное заболевание)
  - `complication` → `2` (Осложнение основного заболевания)
  - `concomitant` → `3` (Сопутствующее заболевание)
  - Jinja2 dict-маппинг: `{% set kind_map = {'main': ('1','Основное заболевание'), 'complication': ('2','Осложнение основного заболевания'), 'concomitant': ('3','Сопутствующее заболевание')} %}`
- Добавить `<text>{{ diag.text }}</text>` в нозологический entryRelationship
- Исправить структуру характера заболевания: удалить текущий вложенный entryRelationship с кодом `823` (он использует codeSystem МКБ — ошибочно), добавить корректный:
  - если `diag.disease_character` задан: `<entryRelationship typeCode="COMP"><observation>...<code code="12014"...><value xsi:type="CD" codeSystem="1.2.643.5.1.13.13.11.1049"...></observation></entryRelationship>`
- Удалить второй вложенный `entryRelationship` с кодом `12014` (который был неправильной копией)

Обновить `full_render_data` в `test_validation.py` — добавить `disease_character` в данные диагноза.

### M3: Витальные параметры → секция VITALPARAM

Файл `semd_engine/registry/v290_r7/schema.py`:
- Удалить `temp: float | None` и `weight: float | None`
- Добавить модель `VitalParamModel(BaseModel, UIMetadataMixin)` с полями:
  - `code: CD` — тип параметра из НСИ 1.2.643.5.1.13.13.99.2.262
  - `value: float` — значение
  - `unit: str` — единица (`kg`, `cm`, `Cel`, `mm[Hg]`, `1/min` и т.д.)
  - `unit_code: CD` — единица из НСИ 1.2.643.5.1.13.13.11.1358
  - `measured_at: str | None = None` — дата измерения (ISO)
  - `observation_id: II | None = None`
- Добавить `vital_params: list[VitalParamModel] = Field(default_factory=list)` в `ConsultationProtocolV7`

Файл `semd_engine/registry/v290_r7/templates/main.xml.j2`:
- Добавить секцию VITALPARAM с циклом по `vital_params`:

      {% if vital_params %}
      <component><section>
        <code code="VITALPARAM".../>
        {% for vp in vital_params %}
        <entry><observation classCode="OBS" moodCode="EVN">
          {% if vp.observation_id %}{{ cda.id(vp.observation_id) }}{% endif %}
          {{ cda.code(vp.code) }}
          <effectiveTime value="{{ (vp.measured_at or event_date) | hl7date }}"/>
          <value xsi:type="PQ" value="{{ vp.value }}" unit="{{ vp.unit }}">
            {{ cda.code(vp.unit_code, tag='translation') }}
          </value>
        </observation></entry>
        {% endfor %}
      </section></component>
      {% endif %}

Обновить `full_render_data` — убрать `temp`/`weight`, добавить `vital_params`.

### M4: Параметризация DISABILITY и BENEFITS

Файл `semd_engine/registry/v290_r7/context.py`:
- Добавить `DisabilityModel(BaseModel)`:
  - `group: CD` — группа (НСИ 1.2.643.5.1.13.13.11.1053)
  - `low: str` — дата установления
  - `high: str | None = None` — дата до (None → nullFlavor="PINF")
  - `establishment_type: CD | None = None` — порядок установления (НСИ 1.2.643.5.1.13.13.11.1041)
- Добавить `BenefitModel(BaseModel)`:
  - `code: CD` — льготная категория (НСИ 1.2.643.5.1.13.13.99.2.541)
- В `ConsultationProtocolV7RenderContext`:
  - добавить `disabilities: list[DisabilityModel] = Field(default_factory=list)`
  - добавить `benefits: list[BenefitModel] = Field(default_factory=list)`

Файл `templates/main.xml.j2`:
- Заменить хардкод DISABILITY на цикл по `disabilities` (если список пуст — секцию не рендерить)
- Заменить хардкод BENEFITS на цикл по `benefits` (если список пуст — секцию не рендерить)

Обновить `full_render_data` — добавить `disabilities` и `benefits`.

### M5: Параметризация SOCANAM

Файл `semd_engine/registry/v290_r7/context.py`:
- Добавить `IncapacityModel(BaseModel)`:
  - `reason: CD` — причина нетрудоспособности (НСИ 1.2.643.5.1.13.13.11.1044)
  - `period: Period`
- В `ConsultationProtocolV7RenderContext` добавить `incapacity: IncapacityModel | None = None`

Файл `templates/main.xml.j2`:
- Заменить хардкод `12006` в SOCANAM на данные из `incapacity`
- Если `incapacity is None` — оставить захардкоженный дефолт (или убрать секцию SOCANAM)
- Принято решение: если `incapacity is None` — секция SOCANAM не рендерится

### M6: Мелкие дополнения context

Файл `semd_engine/registry/v290_r7/context.py`:
- `InsurancePolicyModel` — добавить `series: str | None = None`
- `OrganizationModel` — добавить `license: II | None = None`
- `EventModel` — добавить `service_form: CD | None = None` и `service_type: CD | None = None`

Файл `templates/main.xml.j2`:
- `identity:InsurancePolicy` — добавить рендеринг `<identity:Series>` если `patient.insurance_policy.series`
- `providerOrganization` — добавить второй `<id>` если `organization.license`
- `documentationOf/serviceEvent` — добавить `medService:serviceForm` и `medService:serviceType` если заданы

### M7: Участник typeCode="IND" (источник оплаты)

Файл `semd_engine/registry/v290_r7/context.py`:
- Добавить `DocInfoModel(BaseModel)`:
  - `doc_type: CD` — тип документа-основания (НСИ 1.2.643.5.1.13.13.99.2.724)
  - `insurance_policy_type: CD | None = None`
  - `series: str | None = None`
  - `number: str | None = None`
  - `inn: str | None = None`
  - `period: Period | None = None`
- Добавить `InsuranceOrgModel(BaseModel)`:
  - `id_root: str` — OID реестра (1.2.643.5.1.13.13.99.2.183)
  - `id_extension: str`
  - `name: str`
  - `phone: str | None = None`
  - `address: ADDRWithVersion | None = None`
- Добавить `ParticipantINDModel(BaseModel)`:
  - `payment_source: CD` — источник оплаты (НСИ 1.2.643.5.1.13.13.11.1039)
  - `doc_info: DocInfoModel | None = None`
  - `scoping_org: InsuranceOrgModel | None = None`
- В `ConsultationProtocolV7RenderContext` добавить `payment_participant: ParticipantINDModel | None = None`

Файл `templates/main.xml.j2`:
- После `</informationRecipient>` добавить `{% if payment_participant %}...<participant typeCode="IND">...</participant>{% endif %}`

### M8: Участник typeCode="REF" (направившее лицо)

Файл `semd_engine/registry/v290_r7/context.py`:
- Добавить `ReferralPersonModel(BaseModel)`:
  - `id: II | None = None`
  - `snils: str | None = None`
  - `position: CDWithVersion`
  - `address: ADDRWithVersion | None = None`
  - `phone: str | None = None`
  - `name: PN`
- Добавить `ReferralOrgModel(BaseModel)`:
  - `id: str`
  - `name: str`
  - `phone: str | None = None`
  - `address: ADDRWithVersion | None = None`
- Добавить `ParticipantREFModel(BaseModel)`:
  - `person: ReferralPersonModel`
  - `organization: ReferralOrgModel | None = None`
- В `ConsultationProtocolV7RenderContext` добавить `referral_participant: ParticipantREFModel | None = None`

Файл `templates/main.xml.j2`:
- После `payment_participant` блока добавить `{% if referral_participant %}...<participant typeCode="REF">...</participant>{% endif %}`

### M9: inFulfillmentOf (направление)

Файл `semd_engine/registry/v290_r7/context.py`:
- Добавить `InFulfillmentOfModel(BaseModel)`:
  - `local_id: II | None = None`
  - `remd_id: II | None = None`
  - `doc_type: CD`
- В `ConsultationProtocolV7RenderContext` добавить `in_fulfillment_of: InFulfillmentOfModel | None = None`

Файл `templates/main.xml.j2`:
- После `referral_participant` блока добавить `{% if in_fulfillment_of %}...<inFulfillmentOf>...</inFulfillmentOf>{% endif %}`

### M10: Тест test_full_dataset_generation_and_validation

Файл `tests/test_validation.py`:
- Добавить новую фикстуру `full_dataset` с максимально полными данными:
  - 2 диагноза (основной + осложнение) с `disease_character`
  - `vital_params` (5-6 параметров: temp, weight, height, BP syst/diast, pulse)
  - `disabilities` (1 запись)
  - `benefits` (1 запись)
  - `incapacity` (с периодом)
  - `organization.license`
  - `patient.insurance_policy.series`
  - `event.service_form`, `event.service_type`
  - `payment_participant`
  - `referral_participant`
  - `in_fulfillment_of`
- Добавить тест `test_full_dataset_generation_and_validation(renderer, full_dataset, xsd_path, sch_path)`, аналогичный `test_full_v290_r7_generation_and_validation`

## Конкретные шаги

После каждого milestone:

    uv run pytest tests/test_validation.py -v
    # ожидаем: все тесты GREEN

    git add -A
    git commit -m "feat(v290-r7): <описание milestone>"

Все команды выполняются в рабочей директории `/home/dmitry/projects/remd`.

## Валидация и приемка

**Критерий готовности:**

1. `uv run pytest -v` — все тесты GREEN, включая `test_full_dataset_generation_and_validation`
2. Тест `test_full_dataset_generation_and_validation` использует датасет с:
   - несколькими диагнозами (main + complication)
   - vitальными параметрами
   - источником оплаты (ParticipantIND)
   - направившим лицом (ParticipantREF)
   - направлением (inFulfillmentOf)
3. Тест проходит XSD + Schematron без ошибок

**Ожидаемый вывод:**

    tests/test_validation.py::test_xsd_validation_detects_errors PASSED
    tests/test_validation.py::test_schematron_validation_detects_errors PASSED
    tests/test_validation.py::test_full_v290_r7_generation_and_validation PASSED
    tests/test_validation.py::test_full_dataset_generation_and_validation PASSED

## Идемпотентность и восстановление

- Каждый шаг аддитивен: добавляются новые поля с `None`-дефолтами, существующие тесты не должны ломаться
- Если новое поле нарушает существующий тест — исправить тест (обновить fixture) до коммита
- git history позволяет откатиться к любому milestone

## Артефакты и заметки

Маппинг `kind` → код НСИ 1.2.643.5.1.13.13.11.1077:

    main        → code="1"  displayName="Основное заболевание"
    complication→ code="2"  displayName="Осложнение основного заболевания"
    concomitant → code="3"  displayName="Сопутствующее заболевание"

Коды витальных параметров (НСИ 1.2.643.5.1.13.13.99.2.262):

    2  → Артериальное давление диастолическое    unit="mm[Hg]"  unit_code="50" displayName="мм.рт.ст."
    3  → Артериальное давление систолическое     unit="mm[Hg]"  unit_code="50" displayName="мм.рт.ст."
    5  → Частота пульса                          unit="1/min"   unit_code="337" displayName="1/мин"
    50 → Масса тела                              unit="kg"      unit_code="9"   displayName="кг"
    57 → Рост                                    unit="cm"      unit_code="3"   displayName="см"
    6  → Температура тела                        unit="Cel"     unit_code="???" (из эталона не присутствует, см. НСИ)

Суффиксы OID (из AGENTS.md):
- `.51` — ClinicalDocument/id
- `.50` — setId (амб.карта)
- `.52` — observation/id (диагнозы, vitalparam)
- `.15` — encompassingEncounter/id

## Интерфейсы и зависимости

После завершения модели будут выглядеть так:

**schema.py** добавляет:
- `DiagnosisModel.disease_character: CD | None = None`
- `VitalParamModel` (новая модель)
- `ConsultationProtocolV7.vital_params: list[VitalParamModel]` (вместо temp/weight)

**context.py** добавляет:
- `InsurancePolicyModel.series: str | None = None`
- `OrganizationModel.license: II | None = None`
- `EventModel.service_form: CD | None = None`
- `EventModel.service_type: CD | None = None`
- `DisabilityModel`, `BenefitModel`, `IncapacityModel`
- `DocInfoModel`, `InsuranceOrgModel`, `ParticipantINDModel`
- `ReferralPersonModel`, `ReferralOrgModel`, `ParticipantREFModel`
- `InFulfillmentOfModel`
- В `ConsultationProtocolV7RenderContext`:
  - `disabilities: list[DisabilityModel]`
  - `benefits: list[BenefitModel]`
  - `incapacity: IncapacityModel | None`
  - `payment_participant: ParticipantINDModel | None`
  - `referral_participant: ParticipantREFModel | None`
  - `in_fulfillment_of: InFulfillmentOfModel | None`
