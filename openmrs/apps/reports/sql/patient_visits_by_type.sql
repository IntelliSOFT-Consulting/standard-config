SELECT 
    vt.name AS 'Visit Type',
    COUNT(DISTINCT v.patient_id) AS 'No. of Patients',
    COUNT(v.visit_id) AS 'Total Visits'
FROM 
    visit v
    INNER JOIN visit_type vt ON v.visit_type_id = vt.visit_type_id
    INNER JOIN person p ON p.person_id = v.patient_id
WHERE 
    v.voided = 0
    AND p.voided = 0
    AND v.date_started BETWEEN DATE_FORMAT('#startDate#', '%Y-%m-%d') AND DATE_FORMAT('#endDate#', '%Y-%m-%d 23:59:59')
GROUP BY 
    vt.name
ORDER BY 
    COUNT(DISTINCT v.patient_id) DESC;