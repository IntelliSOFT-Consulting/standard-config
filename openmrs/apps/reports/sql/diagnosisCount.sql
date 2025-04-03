SELECT 
    cn.name AS "Diagnosis",
    COUNT(*) AS "Total Diagnoses",
    COUNT(DISTINCT CASE WHEN person.gender = 'F' THEN obs.person_id END) AS "Female",
    COUNT(DISTINCT CASE WHEN person.gender = 'M' THEN obs.person_id END) AS "Male",
    COUNT(DISTINCT CASE WHEN person.gender = 'O' THEN obs.person_id END) AS "Other",
    COUNT(DISTINCT CASE WHEN person.gender IS NULL OR person.gender = 'U' THEN obs.person_id END) AS "Not disclosed"
FROM obs
JOIN person ON obs.person_id = person.person_id 
    AND person.voided = FALSE
JOIN concept_name cn ON cn.concept_id = obs.value_coded
    AND cn.concept_name_type = 'FULLY_SPECIFIED' 
    AND cn.locale = 'en' 
    AND cn.voided = FALSE
WHERE obs.voided = 0 
AND obs.form_namespace_and_path IN ('Bahmni^Optometrist Assessment.3/158-0', 
                                    'Bahmni^Optometrist Assessment.3/157-0')
AND CAST(obs.obs_datetime AS DATE) BETWEEN '#startDate#' AND '#endDate#'
GROUP BY cn.name;