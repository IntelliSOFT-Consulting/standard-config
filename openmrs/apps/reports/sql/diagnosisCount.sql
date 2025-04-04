SELECT @diagnosis_concept_id := concept_id
FROM concept_name
WHERE name = 'ICD 11 Diagnosis'
  AND concept_name_type = 'FULLY_SPECIFIED'
  AND locale = 'en'
  AND voided = 0
LIMIT 1;

SELECT 
    cn_diagnosis.name AS "Diagnosis",
    COUNT(*) AS "Total Diagnoses",
    COUNT(DISTINCT CASE WHEN person.gender = 'F' THEN obs.person_id END) AS "Female",
    COUNT(DISTINCT CASE WHEN person.gender = 'M' THEN obs.person_id END) AS "Male",
    COUNT(DISTINCT CASE WHEN person.gender = 'O' THEN obs.person_id END) AS "Other",
    COUNT(DISTINCT CASE WHEN person.gender IS NULL OR person.gender = 'U' THEN obs.person_id END) AS "Not disclosed"
FROM obs
JOIN person ON obs.person_id = person.person_id AND person.voided = FALSE
JOIN concept_name cn_diagnosis ON cn_diagnosis.concept_id = obs.value_coded
    AND cn_diagnosis.concept_name_type = 'FULLY_SPECIFIED'
    AND cn_diagnosis.locale = 'en'
    AND cn_diagnosis.voided = FALSE
WHERE obs.voided = 0
  AND obs.concept_id = @diagnosis_concept_id
  AND obs.obs_datetime BETWEEN CONCAT('#startDate#', ' 00:00:00') AND CONCAT('#endDate#', ' 23:59:59')
GROUP BY cn_diagnosis.name;
