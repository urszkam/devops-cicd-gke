from math import isclose
from pathlib import Path

import joblib
import pandas as pd

MODEL_PATH = Path("app/models/production_model.joblib")
SAMPLE_INPUT = pd.DataFrame(
    [
        {
            "age": 30,
            "experience_years": 5,
            "daily_work_hours": 8,
            "sleep_hours": 7,
            "caffeine_intake": 2,
            "bugs_per_day": 1,
            "commits_per_day": 3,
            "meetings_per_day": 2,
            "screen_time": 8,
            "exercise_hours": 1,
            "stress_level": 40,
        }
    ]
)


def test_model_can_be_loaded() -> None:
    model = joblib.load(MODEL_PATH)

    assert model is not None


def test_model_returns_prediction() -> None:
    model = joblib.load(MODEL_PATH)

    prediction = model.predict(SAMPLE_INPUT)

    assert len(prediction) == 1
    assert prediction[0] in model.classes_


def test_model_returns_valid_probabilities() -> None:
    model = joblib.load(MODEL_PATH)

    probabilities = model.predict_proba(SAMPLE_INPUT)[0]

    assert len(probabilities) == len(model.classes_)
    assert isclose(probabilities.sum(), 1.0)
