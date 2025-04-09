SELECT 
    vt.name AS `Visit Type`,
    COUNT(DISTINCT CASE WHEN p.gender = 'M' THEN v.patient_id END) AS `Male Patients`,
    COUNT(DISTINCT CASE WHEN p.gender = 'F' THEN v.patient_id END) AS `Female Patients`,
    COUNT(DISTINCT CASE WHEN p.gender NOT IN ('M', 'F') THEN v.patient_id END) AS `Other Gender`,
    ROUND(AVG(TIMESTAMPDIFF(HOUR, v.date_started, IFNULL(v.date_stopped, NOW())))/24, 1) AS `Avg Visit Duration (Days)`,
    COUNT(DISTINCT v.patient_id) AS `No. of Patients`,
    COUNT(v.visit_id) AS `Total Visits`
FROM 
    visit v
    INNER JOIN visit_type vt ON v.visit_type_id = vt.visit_type_id
    INNER JOIN person p ON p.person_id = v.patient_id
    LEFT JOIN location l ON l.location_id = v.location_id
WHERE 
    v.voided = 0
    AND p.voided = 0
    AND v.date_started BETWEEN DATE_FORMAT('#startDate#', '%Y-%m-%d') AND DATE_FORMAT('#endDate#', '%Y-%m-%d 23:59:59')
GROUP BY 
    vt.name
ORDER BY 
    COUNT(DISTINCT v.patient_id) DESC;

SELECT 
    vt.name AS `Visit Type`,
    YEAR(v.date_started) AS `Year`, 
    MONTH(v.date_started) AS `Month`,
    COUNT(DISTINCT v.patient_id) AS `No. of Patients`
FROM 
    visit v
    INNER JOIN visit_type vt ON v.visit_type_id = vt.visit_type_id
    INNER JOIN person p ON p.person_id = v.patient_id
WHERE 
    v.voided = 0
    AND p.voided = 0
    AND v.date_started BETWEEN DATE_FORMAT('#startDate#', '%Y-%m-%d') AND DATE_FORMAT('#endDate#', '%Y-%m-%d 23:59:59')
GROUP BY 
    vt.name, 
    YEAR(v.date_started), 
    MONTH(v.date_started)
ORDER BY 
    vt.name, 
    YEAR(v.date_started), 
    MONTH(v.date_started);