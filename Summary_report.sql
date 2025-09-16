-- 8.1 Executive summary
SELECT 
    'DIABETES ANALYSIS SUMMARY REPORT' AS report_title,
    '=================================' AS separator,
    NULL AS value,
    NULL AS percentage

UNION ALL

SELECT 
    'Total Patients Analyzed:',
    '',
    COUNT(*),
    NULL
FROM diabetes_data

UNION ALL

SELECT 
    'Confirmed Diabetes Cases:',
    '',
    SUM(diabetes),
    ROUND(SUM(diabetes) * 100.0 / COUNT(*), 2)
FROM diabetes_data

UNION ALL

SELECT 
    'High-Risk Patients (Score ≥ 6):',
    '',
    COUNT(*),
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM diabetes_data), 2)
FROM (
    SELECT 
        CASE WHEN age >= 45 THEN 2 ELSE 0 END +
        CASE WHEN bmi >= 30 THEN 3 ELSE 0 END +
        CASE WHEN HbA1c_level >= 6.5 THEN 4 ELSE 
             CASE WHEN HbA1c_level >= 5.7 THEN 2 ELSE 0 END END +
        CASE WHEN blood_glucose_level >= 126 THEN 4 ELSE 
             CASE WHEN blood_glucose_level >= 100 THEN 2 ELSE 0 END END +
        hypertension * 2 +
        heart_disease * 3 +
        CASE 
            WHEN smoking_history IN ('current') THEN 2
            WHEN smoking_history IN ('former', 'ever') THEN 1
            ELSE 0
        END AS risk_score
    FROM diabetes_data
) risk_calc
WHERE risk_score >= 6

UNION ALL

SELECT 
    'Prediabetic Patients (HbA1c 5.7-6.4):',
    '',
    COUNT(*),
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM diabetes_data), 2)
FROM diabetes_data
WHERE HbA1c_level >= 5.7 AND HbA1c_level < 6.5

UNION ALL

SELECT 
    'Patients Requiring Immediate Attention:',
    '',
    COUNT(*),
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM diabetes_data), 2)
FROM diabetes_data
WHERE diabetes = 0 
    AND (HbA1c_level >= 6.5 OR blood_glucose_level >= 126);

-- ================================================
-- END OF ANALYSIS
-- ==========
