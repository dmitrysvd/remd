import pytest
from fastapi.testclient import TestClient

from main import app


@pytest.fixture
def client():
    return TestClient(app)


def test_get_index(client):
    """Проверка, что главная страница загружается и содержит поля формы."""
    response = client.get("/")
    assert response.status_code == 200
    assert "СЭМД Протокол консультации (Редакция 7)" in response.text
    # Проверяем наличие ключевых полей из UI Schema
    assert 'name="event_date"' in response.text
    assert 'name="complaints"' in response.text
    assert 'name="diagnoses.0.code.code"' in response.text


def test_generate_xml_success(client):
    """Проверка успешной генерации XML при отправке валидных данных."""
    payload = {
        "event_date": "2026-04-21T14:00",
        "complaints": "Пациент жалуется на головную боль",
        "anamnesis_disease": "Болеет два дня",
        "objective_status": "Состояние удовлетворительное",
        "diagnoses.0.id.root": "1.2.643.5.1.13.13.12.2.77.7831.100.1.1.52",
        "diagnoses.0.id.extension": "12345",
        "diagnoses.0.code.code": "G44.2",
        "diagnoses.0.code.displayName": "Головная боль напряженного типа",
        "diagnoses.0.code.codeSystem": "1.2.643.5.1.13.13.11.1005",
        "diagnoses.0.code.codeSystemName": "МКБ-10",
        "diagnoses.0.text": "Основной диагноз",
        "diagnoses.0.kind": "main",
        "recommendations": "Покой и обильное питье",
    }

    response = client.post("/generate", data=payload)
    assert response.status_code == 200
    assert "Результат (CDA XML)" in response.text
    # Проверяем, что в XML попали наши данные
    assert "Пациент жалуется на головную боль" in response.text
    assert "G44.2" in response.text
    assert "&lt;ClinicalDocument" in response.text


def test_generate_xml_validation_error(client):
    """Проверка отображения ошибки при невалидных данных (пропущены обязательные поля)."""
    payload = {
        "event_date": "2026-04-21T14:00"
        # Пропущено поле complaints
    }

    response = client.post("/generate", data=payload)
    assert response.status_code == 200
    assert "Ошибка:" in response.text
    assert "complaints" in response.text


def test_generate_xml_with_prescriptions(client):
    """Проверка генерации XML с назначениями (включая сценарий с отсутствующим is_nsi)."""
    payload = {
        "event_date": "2026-04-21T14:00",
        "complaints": "Жалобы",
        "anamnesis_disease": "Анамнез",
        "objective_status": "Статус",
        "recommendations": "Рекомендации",
        "diagnoses.0.id.root": "1.2.3",
        "diagnoses.0.id.extension": "456",
        "diagnoses.0.code.code": "M10",
        "diagnoses.0.code.displayName": "M10",
        "diagnoses.0.code.codeSystem": "1.2.643.5.1.13.13.11.1005",
        "diagnoses.0.text": "Диагноз",
        "diagnoses.0.kind": "main",
        # Назначение 1: Ручной ввод (is_nsi отсутствует)
        "prescriptions.0.manual_text": "Аспирин",
        "prescriptions.0.dosage_text": "1 таблетка 3 раза в день",
        # Назначение 2: Из НСИ
        "prescriptions.1.is_nsi": "true",
        "prescriptions.1.nsi_code.code": "123",
        "prescriptions.1.nsi_code.displayName": "Цитрамон",
        "prescriptions.1.nsi_code.codeSystem": "1.2.643.5.1.13.13.11.1461",
        "prescriptions.1.dosage_text": "При болях",
    }

    response = client.post("/generate", data=payload)
    assert response.status_code == 200
    assert "Аспирин" in response.text
    assert "Цитрамон" in response.text
    assert "123" in response.text
    assert "DRUG" in response.text
