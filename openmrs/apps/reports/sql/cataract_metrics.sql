SELECT
    proc_type.name AS "Procedure",
    patient_category.name AS "Patient Category",
    COUNT(DISTINCT main.person_id) AS "Total Cases",
    SUM(CASE WHEN complications.person_id IS NOT NULL THEN 1 ELSE 0 END) AS "Complications",
    SUM(CASE WHEN reoperation.person_id IS NOT NULL THEN 1 ELSE 0 END) AS "Reoperations"
FROM obs main
         INNER JOIN concept proc_concept
                    ON proc_concept.uuid = 'CATARACT_PROCEDURE_TYPE_UUID'
                        AND main.concept_id = proc_concept.concept_id
                        AND main.voided = 0
         INNER JOIN concept_name proc_type
                    ON proc_type.concept_id = main.value_coded
                        AND proc_type.concept_name_type = 'FULLY_SPECIFIED'
                        AND proc_type.locale = 'en'
                        AND proc_type.voided = 0
-- Ensure only cataract procedures are included
         LEFT JOIN (
    SELECT obs.person_id
    FROM obs
             INNER JOIN concept c ON c.uuid = 'SURGICAL_COMPLICATION_UUID'
    WHERE obs.concept_id = c.concept_id
      AND obs.voided = 0
) complications ON complications.person_id = main.person_id
         LEFT JOIN (
    SELECT obs.person_id
    FROM obs
             INNER JOIN concept c ON c.uuid = 'REOPERATION_REQUIRED_UUID'
    WHERE obs.concept_id = c.concept_id
      AND obs.voided = 0
) reoperation ON reoperation.person_id = main.person_id
         INNER JOIN (
    SELECT obs.person_id, obs.value_coded
    FROM obs
             INNER JOIN concept c ON c.uuid = 'PATIENT_CATEGORY_UUID'
    WHERE obs.concept_id = c.concept_id
      AND obs.voided = 0
) pat_cat ON pat_cat.person_id = main.person_id
         INNER JOIN concept_name patient_category
                    ON patient_category.concept_id = pat_cat.value_coded
                        AND patient_category.concept_name_type = 'FULLY_SPECIFIED'
                        AND patient_category.locale = 'en'
                        AND patient_category.voided = 0
         INNER JOIN encounter e
                    ON e.encounter_id = main.encounter_id
                        AND e.voided = 0
         INNER JOIN person p
                    ON p.person_id = main.person_id
                        AND p.voided = 0
WHERE
    proc_type.name IN ('Manual SICS + PCIOL (rigid lens)', 'Phaco-Surgery')
  AND DATE(main.obs_datetime) BETWEEN DATE('2025-01-01') AND DATE('2025-04-04')
GROUP BY
    proc_type.name, patient_category.name
ORDER BY
    COUNT(DISTINCT main.person_id) DESC;