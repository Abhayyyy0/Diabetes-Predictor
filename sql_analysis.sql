-- ================================================
-- 02_data_analysis.sql
-- Project: Diabetes Prediction SQL Analysis
-- Purpose: Perform analysis on diabetes_data table
-- ================================================

USE diabetes_project;
GO

-- 1. Basic overview of dataset
SELECT 
    COUNT(*) AS Total_Records,
    AVG(age) AS Avg_Age,
    AVG(bmi) AS Avg_BMI,
    AVG(HbA1c_level) AS Avg_HbA1c,
    AVG(blood_glucose_level) AS Avg_Blood_Glucose
FROM diabetes_data;
GO

-- 2. Gender distribution
SELECT 
    gender,
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM diabetes_data), 2) AS Percentage
FROM diabetes_data
GROUP BY gender;
GO

-- 3. Age Group distribution
SELECT 
    age_group,
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM diabetes_data), 2) AS Percentage
FROM diabetes_data
GROUP BY age_group
ORDER BY age_group;
GO

-- 4. BMI Category vs Diabetes incidence
SELECT
    bmi_category,
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN diabetes = 1 THEN 1 ELSE 0 END) AS Diabetes_Positive,
    ROUND(100.0 * SUM(CASE WHEN diabetes = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS Diabetes_Percentage
FROM diabetes_data
GROUP BY bmi_category
ORDER BY bmi_category;
GO

-- 5. Smoking History vs Diabetes
SELECT
    smoking_history,
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN diabetes = 1 THEN 1 ELSE 0 END) AS Diabetes_Positive,
    ROUND(100.0 * SUM(CASE WHEN diabetes = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS Diabetes_Percentage
FROM diabetes_data
GROUP BY smoking_history
ORDER BY Diabetes_Percentage DESC;
GO

-- 6. Correlation overview (average HbA1c and blood glucose for diabetes cases)
SELECT
    diabetes,
    AVG(HbA1c_level) AS Avg_HbA1c,
    AVG(blood_glucose_level) AS Avg_Blood_Glucose
FROM diabetes_data
GROUP BY diabetes;
GO

-- 7. Hypertension and Heart Disease vs Diabetes
SELECT
    hypertension,
    heart_disease,
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN diabetes = 1 THEN 1 ELSE 0 END) AS Diabetes_Positive,
    ROUND(100.0 * SUM(CASE WHEN diabetes = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS Diabetes_Percentage
FROM diabetes_data
GROUP BY hypertension, heart_disease
ORDER BY diabetes DESC;
GO

-- 8. Top 5 BMI values among Diabetes positive cases
SELECT TOP 5
    id, gender, age, bmi, HbA1c_level, blood_glucose_level
FROM diabetes_data
WHERE diabetes = 1
ORDER BY bmi DESC;
GO

-- ================================================
-- END OF DATA ANALYSIS
-- ================================================
