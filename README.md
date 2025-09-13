🩺 Diabetes Prediction Data Analysis (SQL Project)
📌 Project Overview

Diabetes is a major global health challenge, and early detection of risk factors is crucial to prevention and management. This project uses SQL to analyze a healthcare dataset containing demographic, lifestyle, and medical information of patients.

The objective is to:

Explore patterns in diabetes prevalence.

Understand how age, gender, lifestyle habits, and medical conditions correlate with diabetes.

Identify high-risk patient groups based on BMI, blood glucose, and HbA1c levels.

This project demonstrates how structured SQL analysis can provide actionable insights in healthcare analytics.

📂 Project Structure
diabetes prediction
│
├── data/
│   └── diabetes_prediction_dataset.csv   # dataset used in the project
│
├── sql/
│   ├── 01_create_table.sql               # SQL schema creation
│   ├── 02_sql_analysis.sql           # queries for analysis
│
└── README.md                             # project documentation

🗂 Dataset

Source: Kaggle – Diabetes Prediction Dataset

Size: ~100,000 patient records

Target Variable: diabetes (0 = Non-diabetic, 1 = Diabetic)

Columns:
Column	Description
gender	Male, Female, or Other
age	Patient age in years
hypertension	0 = No, 1 = Yes
heart_disease	0 = No, 1 = Yes
smoking_history	Current, Former, Never, etc.
bmi	Body Mass Index (kg/m²)
HbA1c_level	Hemoglobin A1c test result (%)
blood_glucose_level	Glucose concentration (mg/dL)
diabetes	0 = Non-diabetic, 1 = Diabetic
🗄 Database & Schema

The dataset was imported into a relational database. A single table diabetes_data was created:

CREATE TABLE diabetes_data (
    gender VARCHAR(10),
    age INT,
    hypertension TINYINT,
    heart_disease TINYINT,
    smoking_history VARCHAR(20),
    bmi DECIMAL(5,2),
    HbA1c_level DECIMAL(4,2),
    blood_glucose_level INT,
    diabetes TINYINT
);

🔎 SQL Analysis

The following analyses were performed:

1. Dataset Overview

Record count, unique genders, min/max age.

2. Diabetes Prevalence

Overall percentage of diabetic patients.

Gender-based diabetes distribution.

3. Age-wise Analysis

Patients grouped into 10-year bins (0–9, 10–19, …).

Diabetes prevalence by age group.

4. Comorbidities

Hypertension and heart disease vs diabetes rates.

5. Lifestyle Factors

Smoking history vs diabetes prevalence.

6. Medical Indicators

Average BMI, HbA1c, and glucose (diabetic vs non-diabetic).

BMI categories (Underweight, Normal, Overweight, Obese) vs diabetes.

HbA1c groups (Normal, Prediabetes, Diabetes) vs diabetes.

Blood glucose categories vs diabetes.

7. Correlations

High glucose & high BMI combined risk analysis.

8. Patient-Level Insights

Top 10 oldest diabetic patients with highest glucose levels.

📊 Key Findings

Overall prevalence: Diabetes affects a significant portion of the population.

Age impact: Risk rises sharply with age, especially after 40+.

Gender differences: Slight variations, but both genders show high prevalence in older age groups.

Comorbidities: Patients with hypertension or heart disease have much higher diabetes rates.

Lifestyle: Certain smoking histories (former/current smokers) show elevated risk.

BMI: Overweight and obese patients have significantly higher diabetes percentages than normal BMI individuals.

Medical indicators:

HbA1c ≥ 6.5% strongly indicates diabetes.

Blood glucose ≥ 126 mg/dL correlates with diabetes prevalence.

High-risk group: Patients who are both obese and have high glucose levels show the highest prevalence rates.

🚀 How to Run

Clone this repository:

git clone https://github.com/your-username/diabetes-sql-analysis.git


Create a new database in MySQL / PostgreSQL / SQL Server.

Run sql/01_create_table.sql to create the schema.

Import the dataset (data/diabetes_prediction_dataset.csv) into the table.

Run sql/02_analysis_queries.sql to generate insights.

📌 Future Enhancements

Add a visualization layer (Power BI/Tableau) for better storytelling.

Automate ingestion & reporting with Python + SQL pipeline.

Extend analysis with predictive modeling (logistic regression / ML).

Add time-series analysis if temporal data becomes available.

📝 Author

👤 Abhay Mudgal
📧 abhaymudgal04@gmail.com

