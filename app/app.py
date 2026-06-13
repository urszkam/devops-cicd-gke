from typing import Any

import joblib
import pandas as pd
import streamlit as st

FEATURES: list[str] = [
    "age",
    "experience_years",
    "daily_work_hours",
    "sleep_hours",
    "caffeine_intake",
    "bugs_per_day",
    "commits_per_day",
    "meetings_per_day",
    "screen_time",
    "exercise_hours",
    "stress_level",
]


def format_display_value(value: Any) -> str:
    if isinstance(value, bool):
        return str(value)

    if isinstance(value, (int, float)):
        if isinstance(value, float):
            if value.is_integer():
                return str(int(value))
            return f"{value:.1f}".rstrip("0").rstrip(".")
        return str(int(value))

    return str(value)


@st.cache_resource
def load_model() -> Any:
    return joblib.load("models/production_model.joblib")


st.set_page_config(
    page_title="Developer Burnout Predictor", page_icon="🧑‍💻", layout="wide"
)

st.markdown(
    """
    <style>
      .block-container {
        padding-top: 0;
        padding-left: 2rem;
        padding-right: 2rem;
        max-width: 1400px;
      }
      .stApp {
        background: linear-gradient(180deg, #ffffff 0%, #fafcff 100%);
      }
    </style>
    """,
    unsafe_allow_html=True,
)

header_col, image_col = st.columns([1.2, 0.8], vertical_alignment="center")

with header_col:
    st.title("Developer Burnout Prediction")
    st.write(
        "Estimate burnout risk for a developer using work habits, lifestyle and stress indicators."
    )
    st.caption(
        "This app uses the trained RandomForest model and the burnout-related feature set from the dataset description."
    )

with image_col:
    st.image("images/burnout.png", caption="")


try:
    model = load_model()
except FileNotFoundError as exc:
    st.error(f"Model file not found: {exc}")
    st.stop()

classes = list(getattr(model, "classes_", ["Low", "Medium", "High"]))

st.divider()

st.header("Developer Information")
col1, col2, col3 = st.columns(3)

with col1:
    age = st.slider(
        "Age",
        min_value=18,
        max_value=80,
        value=30,
        step=1,
        help="Developer age in years.",
    )
    experience_years = st.slider(
        "Experience (years)",
        min_value=0.0,
        max_value=40.0,
        value=4.0,
        step=0.5,
        help="Total years of programming experience.",
    )
    daily_work_hours = st.slider(
        "Daily work hours",
        min_value=1.0,
        max_value=16.0,
        value=8.0,
        step=0.5,
        help="Average hours worked per day.",
    )

with col2:
    sleep_hours = st.slider(
        "Sleep hours",
        min_value=2.0,
        max_value=12.0,
        value=7.0,
        step=0.5,
        help="Average sleep duration per day in hours.",
    )
    caffeine_intake = st.slider(
        "Caffeine intake (cups/day)",
        min_value=0.0,
        max_value=10.0,
        value=2.0,
        step=1.0,
        help="Caffeinated drinks consumed per day.",
    )
    bugs_per_day = st.slider(
        "Bugs per day",
        min_value=0.0,
        max_value=20.0,
        value=1.0,
        step=0.5,
        help="Average number of bugs produced per day.",
    )

with col3:
    commits_per_day = st.slider(
        "Commits per day",
        min_value=0.0,
        max_value=50.0,
        value=3.0,
        step=1.0,
        help="Number of code commits written per day.",
    )
    meetings_per_day = st.slider(
        "Meetings per day",
        min_value=0.0,
        max_value=12.0,
        value=3.0,
        step=1.0,
        help="Number of meetings attended daily.",
    )
    screen_time = st.slider(
        "Screen time (hours/day)",
        min_value=0.0,
        max_value=18.0,
        value=8.0,
        step=0.5,
        help="Total screen exposure time per day.",
    )

col4, col5 = st.columns(2)
with col4:
    exercise_hours = st.slider(
        "Exercise hours",
        min_value=0.0,
        max_value=6.0,
        value=1.0,
        step=0.1,
        help="Time spent on physical exercise per day.",
    )
with col5:
    stress_level = st.slider(
        "Stress level (0-100)",
        min_value=0,
        max_value=100,
        value=45,
        step=1,
        help="Self-reported stress score from 0 to 100.",
    )

st.divider()

if st.button("Predict Burnout Risk", type="primary", width="stretch"):
    input_df = pd.DataFrame(
        [
            [
                age,
                experience_years,
                daily_work_hours,
                sleep_hours,
                caffeine_intake,
                bugs_per_day,
                commits_per_day,
                meetings_per_day,
                screen_time,
                exercise_hours,
                stress_level,
            ]
        ],
        columns=FEATURES,
    )

    prediction = model.predict(input_df)[0]
    probabilities = model.predict_proba(input_df)[0]
    probability_map = dict(zip(classes, probabilities))
    predicted_probability = probability_map.get(prediction, 0.0)

    color = (
        "green"
        if prediction == "Low"
        else "orange"
        if prediction == "Medium"
        else "red"
    )
    icon = "✅" if prediction == "Low" else "⚠️" if prediction == "Medium" else "🔴"

    st.markdown("<div id='prediction-results'></div>", unsafe_allow_html=True)
    st.header("Prediction Result")

    col_a, col_b = st.columns(2)
    with col_a:
        st.markdown(f"{icon} **Predicted burnout level: {prediction}**")
        st.metric("Confidence", f"{predicted_probability:.1%}")
    with col_b:
        st.metric("Model type", type(model).__name__)
        st.caption(
            "The trained model reports high accuracy on the provided evaluation dataset."
        )

    st.subheader("Class probabilities")
    for label in classes:
        st.progress(
            probability_map.get(label, 0.0),
            text=f"{label}: {probability_map.get(label, 0.0):.1%}",
        )

    st.markdown(f"**Risk level:** :{color}[{prediction}]")

    st.subheader("Input summary")
    summary_items = [
        ("Age", age),
        ("Experience years", experience_years),
        ("Daily work hours", daily_work_hours),
        ("Sleep hours", sleep_hours),
        ("Caffeine intake", caffeine_intake),
        ("Bugs per day", bugs_per_day),
        ("Commits per day", commits_per_day),
        ("Meetings per day", meetings_per_day),
        ("Screen time", screen_time),
        ("Exercise hours", exercise_hours),
        ("Stress level", stress_level),
    ]

    cols = st.columns(4)
    for index, (label, value) in enumerate(summary_items):
        display_value = format_display_value(value)

        with cols[index % 4]:
            with st.container(border=True):
                st.caption(label)
                st.write(display_value)

st.caption("Model file: production_model.joblib")
