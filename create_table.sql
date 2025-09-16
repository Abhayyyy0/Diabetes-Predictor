-- ================================================
-- 01_create_tables.sql
-- Project: Diabetes Prediction SQL Analysis
-- Purpose: Create database, import dataset, clean data, add derived columns
-- ================================================

CREATE DATABASE diabetes_project;
GO

-- Switch to database (use appropriate command depending on SQL flavor)
-- MySQL:
USE diabetes_project;
GO

IF OBJECT_ID('diabetes_data', 'U') IS NOT NULL
    DROP TABLE diabetes_data;
GO

CREATE TABLE diabetes_data (
    id INT IDENTITY(1,1) PRIMARY KEY,
    gender VARCHAR(10),
    age INT,
    hypertension INT,
    heart_disease INT,
    smoking_history VARCHAR(50),
    bmi FLOAT,
    HbA1c_level FLOAT,
    blood_glucose_level INT,
    diabetes INT
);
GO


-- 3. Load CSV data
 BULK INSERT diabetes_data
FROM 'C:\data sql\diabetes_data.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- (gender, age, hypertension, heart_disease, smoking_history, bmi, HbA1c_level, blood_glucose_level, diabetes);

-- 4. Handle missing or invalid values
-- Replace NULL or blank gender with 'Unknown'
UPDATE diabetes_data
SET gender = 'Unknown'
WHERE gender IS NULL OR gender = '';

-- Replace NULL BMI with average BMI
UPDATE diabetes_data
SET bmi = (SELECT AVG(bmi) FROM diabetes_data)
WHERE bmi IS NULL;

-- 5. Add derived columns
-- Age groups
ALTER TABLE diabetes_data ADD age_group VARCHAR(20);
ALTER TABLE diabetes_data ADD bmi_category VARCHAR(20);
ALTER TABLE diabetes_data ADD hba1c_category VARCHAR(20);


UPDATE diabetes_data
SET age_group = CASE
    WHEN age < 30 THEN 'Under 30'
    WHEN age BETWEEN 30 AND 50 THEN '30-50'
    WHEN age BETWEEN 51 AND 65 THEN '51-65'
    ELSE '65+'
END;



UPDATE diabetes_data
SET bmi_category = CASE
    WHEN bmi < 18.5 THEN 'Underweight'
    WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal'
    WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
    ELSE 'Obese'
END;



UPDATE diabetes_data
SET hba1c_category = CASE
    WHEN HbA1c_level < 5.7 THEN 'Normal'
    WHEN HbA1c_level BETWEEN 5.7 AND 6.4 THEN 'Prediabetes'
    ELSE 'Diabetes'
END;

-- 6. Verify row count
SELECT COUNT(*) AS total_records FROM diabetes_data;
