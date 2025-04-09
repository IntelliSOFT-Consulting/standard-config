SELECT 
    vt.name AS `Visit Type`,
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, p.birthdate, v.date_started) < 1 THEN '<1 year'
        WHEN TIMESTAMPDIFF(YEAR, p.birthdate, v.date_started) BETWEEN 1 AND 4 THEN '1-4 yrs'
        WHEN TIMESTAMPDIFF(YEAR, p.birthdate, v.date_started) BETWEEN 5 AND 14 THEN '5-14 yrs'
        WHEN TIMESTAMPDIFF(YEAR, p.birthdate, v.date_started) BETWEEN 15 AND 24 THEN '15-24 yrs'
        WHEN TIMESTAMPDIFF(YEAR, p.birthdate, v.date_started) BETWEEN 25 AND 34 THEN '25-34 yrs'
        WHEN TIMESTAMPDIFF(YEAR, p.birthdate, v.date_started) BETWEEN 35 AND 44 THEN '35-44 yrs'
        WHEN TIMESTAMPDIFF(YEAR, p.birthdate, v.date_started) BETWEEN 45 AND 54 THEN '45-54 yrs'
        WHEN TIMESTAMPDIFF(YEAR, p.birthdate, v.date_started) BETWEEN 55 AND 64 THEN '55-64 yrs'
        ELSE '65+ yrs'
    END AS `Age Group`,
    
    COUNT(DISTINCT CASE WHEN p.gender = 'M' THEN v.patient_id END) AS `Male Patients`,
    COUNT(DISTINCT CASE WHEN p.gender = 'F' THEN v.patient_id END) AS `Female Patients`,
    COUNT(DISTINCT CASE WHEN p.gender NOT IN ('M', 'F') THEN v.patient_id END) AS `Other Gender`,
    COUNT(DISTINCT v.patient_id) AS `No. of Patients`,
    COUNT(v.visit_id) AS `Total Visits`

FROM 
    visit v
    INNER JOIN visit_type vt ON v.visit_type_id = vt.visit_type_id
    INNER JOIN person p ON p.person_id = v.patient_id
WHERE 
    v.voided = 0
    AND p.voided = 0
    AND v.date_started BETWEEN CONCAT('#startDate#', ' 00:00:00') AND DATE_FORMAT('#endDate#', '%Y-%m-%d 23:59:59')
GROUP BY 
    vt.name,
    `Age Group`
ORDER BY 
    vt.name, `Age Group`;
