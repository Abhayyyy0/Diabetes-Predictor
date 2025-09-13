-- ================================================
-- 01_create_tables.sql
-- Project: Diabetes Prediction SQL Analysis
-- Purpose: Create database, import dataset, clean data, add derived columns
-- ================================================

-- 1. Create database
CREATE DATABASE diabetes_project;

-- Switch to database (use appropriate command depending on SQL flavor)
-- MySQL:
USE diabetes_project;
-- PostgreSQL: \c diabetes_project

-- 2. Create main table for diabetes dataset
CREATE TABLE diabetes_data (
    id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique identifier
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

-- 3. Load CSV data
-- MySQL example:
-- LOAD DATA INFILE '/path/to/diabetes_prediction_dataset.csv'
-- INTO TABLE diabetes_data
-- FIELDS TERMINATED BY ','
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (gender, age, hypertension, heart_disease, smoking_history, bmi, HbA1c_level, blood_glucose_level, diabetes);

-- PostgreSQL example:
-- \copy diabetes_data(gender, age, hypertension, heart_disease, smoking_history, bmi, HbA1c_level, blood_glucose_level, diabetes)
-- FROM '/path/to/diabetes_prediction_dataset.csv' DELIMITER ',' CSV HEADER;

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
ALTER TABLE diabetes_data ADD COLUMN age_group VARCHAR(20);

UPDATE diabetes_data
SET age_group = CASE
    WHEN age < 30 THEN 'Under 30'
    WHEN age BETWEEN 30 AND 50 THEN '30-50'
    WHEN age BETWEEN 51 AND 65 THEN '51-65'
    ELSE '65+'
END;

-- BMI categories
ALTER TABLE diabetes_data ADD COLUMN bmi_category VARCHAR(20);

UPDATE diabetes_data
SET bmi_category = CASE
    WHEN bmi < 18.5 THEN 'Underweight'
    WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal'
    WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
    ELSE 'Obese'
END;

-- HbA1c categories
ALTER TABLE diabetes_data ADD COLUMN hba1c_category VARCHAR(20);

UPDATE diabetes_data
SET hba1c_category = CASE
    WHEN HbA1c_level < 5.7 THEN 'Normal'
    WHEN HbA1c_level BETWEEN 5.7 AND 6.4 THEN 'Prediabetes'
    ELSE 'Diabetes'
END;

-- 6. Verify row count
SELECT COUNT(*) AS total_records FROM diabetes_data;

-- ================================================
-- END OF FILE
-- ================================================
