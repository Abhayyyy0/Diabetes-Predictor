🩺 Diabetes Prediction Data Analysis (SQL Project)
📌 Project Overview

Diabetes is a major global health challenge, and early detection of risk factors is crucial for prevention and management.
This project uses SQL Server to analyze a healthcare dataset containing demographic, lifestyle, and medical information of patients.

The objective is to:

Explore patterns in diabetes prevalence

Understand how age, gender, lifestyle habits, and medical conditions correlate with diabetes

Identify high-risk patient groups based on BMI, blood glucose, and HbA1c levels

Generate an executive summary report with actionable insights

📂 Project Structure
diabetes-prediction-sql/
│
├── data/
│   └── diabetes_prediction_dataset.csv    # Dataset file (must be downloaded manually)
│
├── sql/
│   ├── 01_create_table.sql                # Table schema creation
│   ├── 02_sql_analysis.sql               # Exploratory data analysis queries
│   └── 03_summary_report.sql             # Executive summary report
│
├── README.md                             # Project documentation

🗄 Dataset Information

📚 Source: Kaggle – Diabetes Prediction Dataset

📊 Size: ~100,000 patient records
🎯 Target Column: diabetes (0 = Non-diabetic, 1 = Diabetic)

Column	Description
gender	Male, Female, Other
age	Patient age in years
hypertension	0 = No, 1 = Yes
heart_disease	0 = No, 1 = Yes
smoking_history	Current, Former, Never, etc.
bmi	Body Mass Index (kg/m²)
HbA1c_level	Hemoglobin A1c test result (%)
blood_glucose_level	Glucose concentration (mg/dL)
diabetes	0 = Non-diabetic, 1 = Diabetic
⚡ How to Set Up & Run the Project

1️⃣ Clone the repository:

git clone https://github.com/your-username/diabetes-sql-analysis.git


2️⃣ Create a new database in your SQL Server instance.

3️⃣ Run the schema creation script to create the table:

sql/01_create_table.sql


4️⃣ Place the dataset CSV file on your local machine, for example:

C:\data\diabetes_prediction_dataset.csv


5️⃣ Import the dataset into the database using BULK INSERT:

BULK INSERT diabetes_data
FROM 'C:\data\diabetes_prediction_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


⚠️ Ensure the file path matches your setup and SQL Server has file access permissions.

6️⃣ Run the exploratory analysis queries:

sql/02_sql_analysis.sql


7️⃣ Run the executive summary report:

sql/03_summary_report.sql

📊 Key Insights From Analysis

✔️ Overall diabetes prevalence among the dataset
✔️ Impact of age, gender, and lifestyle habits on diabetes risk
✔️ Comorbidities (hypertension, heart disease) strongly linked to diabetes
✔️ High-risk patient identification using a custom risk score
✔️ Prediabetic population characteristics
✔️ Patients requiring immediate medical attention
✔️ Top oldest diabetic patients with highest glucose levels

🚀 Future Enhancements

✅ Add visualization layer (Power BI / Tableau)
✅ Automate ETL pipeline (Python + SQL)
✅ Predictive modeling with Logistic Regression / ML
✅ Time-series analysis if temporal data becomes available

📝 Author

👤 Abhay Mudgal
📧 abhaymudgal04@gmail.com
