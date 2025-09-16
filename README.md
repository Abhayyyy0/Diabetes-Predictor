🩺 Diabetes Prediction Data Analysis (SQL Project)

📌 Project Overview

Diabetes is a major global health challenge, and early detection of risk factors is crucial for prevention and management.
This project performs structured data analysis on a healthcare dataset using SQL Server to uncover patterns and actionable insights related to diabetes risk factors.

✅ Project Goals

Analyze prevalence of diabetes in the dataset

Explore how age, gender, medical conditions, and lifestyle habits impact diabetes

Identify high-risk patient groups using BMI, blood glucose, and HbA1c levels

Demonstrate efficient use of SQL for healthcare data analytics

📂 Project Structure
diabetes-prediction-sql/
│
├── data/
│   └── diabetes_prediction_dataset.csv    # Dataset (must be downloaded separately)
│
├── sql/
│   ├── 01_create_table.sql                # Table schema creation
│   ├── 02_sql_analysis.sql               # SQL queries for analysis
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

⚡ How to Set Up & Access Dataset

1️⃣ Clone the repo:

git clone https://github.com/your-username/diabetes-sql-analysis.git


2️⃣ Create a new database in your SQL Server instance.

3️⃣ Run the table schema script:

sql/01_create_table.sql


4️⃣ Place the dataset diabetes_prediction_dataset.csv manually on your local machine, for example:

C:\data\diabetes_prediction_dataset.csv


5️⃣ Run the following command to import the dataset:

BULK INSERT diabetes_data
FROM 'C:\data\diabetes_prediction_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


👉 ⚠️ Make sure the file path matches your local setup.
👉 Ensure proper file permissions for SQL Server to access the file.

📊 Analysis Highlights

✔️ Overall dataset summary (record count, averages)
✔️ Diabetes prevalence by gender, age group, and smoking history
✔️ Impact of comorbidities (hypertension, heart disease)
✔️ Medical indicators correlation:
 - High BMI & high blood glucose strongly linked to diabetes
 - HbA1c ≥ 6.5% indicates high risk

✔️ Top 10 oldest diabetic patients with highest glucose levels identified.

🚀 Future Enhancements

Visualization layer (Power BI / Tableau)

Automated ETL pipeline (Python + SQL)

Predictive modeling (Logistic Regression, ML)

Time-series analysis if temporal data becomes available

📝 Author

👤 Abhay Mudgal
📧 abhaymudgal04@gmail.com
