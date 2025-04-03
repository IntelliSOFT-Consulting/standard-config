SELECT
    surg_type.name AS "Surgery Type",
    outcome_type.name AS "Outcome",
    COUNT(DISTINCT o.person_id) AS "Patient Count",
    GROUP_CONCAT(DISTINCT comorb.value_text SEPARATOR ', ') AS "Comorbidities"
FROM obs o
-- Join for Surgery Type
         INNER JOIN concept surg_concept
                    ON surg_concept.uuid = 'SURGERY_PROCEDURE_UUID'
                        AND o.concept_id = surg_concept.concept_id
                        AND o.voided = 0
         INNER JOIN concept_name surg_type
                    ON surg_type.concept_id = o.value_coded
                        AND surg_type.concept_name_type = 'FULLY_SPECIFIED'
                        AND surg_type.locale = 'en'
                        AND surg_type.voided = 0
-- Join for Surgical Outcome
         INNER JOIN obs outcome_obs
                    ON outcome_obs.person_id = o.person_id
                        AND outcome_obs.concept_id = (SELECT concept_id FROM concept WHERE uuid = 'SURGICAL_OUTCOME_UUID')
                        AND outcome_obs.voided = 0
         INNER JOIN concept_name outcome_type
                    ON outcome_type.concept_id = outcome_obs.value_coded
                        AND outcome_type.concept_name_type = 'FULLY_SPECIFIED'
                        AND outcome_type.locale = 'en'
                        AND outcome_type.voided = 0
         LEFT JOIN obs comorb
                   ON comorb.person_id = o.person_id
                       AND comorb.concept_id = (SELECT concept_id FROM concept WHERE uuid = 'COMORBIDITY_UUID')
                       AND comorb.voided = 0
WHERE
    DATE(o.obs_datetime) BETWEEN DATE('2025-01-01') AND DATE('2025-04-04')
GROUP BY surg_type.name, outcome_type.name
ORDER BY COUNT(DISTINCT o.person_id) DESC;
