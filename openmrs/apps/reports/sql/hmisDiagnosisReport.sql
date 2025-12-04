select 
*
from (
select 
'H10-557 Conjunctivitis' as 'National classification of Disease(NCoD)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '0 - 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Conjunctivitis unspecified (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
 'H25-572 Cataract (Cataract unspecified)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '0 - 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Cataract unspecified (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'S00-1787 Head (Injury of eye and orbit)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '0 - 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Head (Injury of eye and orbit)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
 'H40-575 Glaucoma' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Glaucoma unspecified (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H25-573 Aphakia' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Aphakia (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H49-589 Disorders Of Ocular Muscles Binocular Movement Accommodation And Refraction' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Disorders Of Ocular Muscles Binocular Movement Accommodation And Refraction" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H49-593 Presbyopia' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Presbyopia (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H00-551 Blepharitis' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Blepharitis (Diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H15-561 Corneal Ulcer' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Corneal ulcer (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H15-560 Keratitis' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Keratitis (Diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H30-574 Retinal Vascular Occlusions' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Retinal vascular occlusions (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H15-563 Keratoconjunctivitis' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Keratoconjunctivitis sicca (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H00-550 Chalazion' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Chalazion unspecified (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H15-562 Keratitis (Other superficial keratitis without conjunctivitis)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Keratitis (Other superficial keratitis without conjunctivitis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H49-590 Myopia' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Myopia (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H00-552 Entropion (Entropion and trichiasis of eyelid)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Entropion (Entropion and trichiasis of eyelid)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H15-567 Corneal scars and opacities' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Corneal scars or opacities (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H49-591 Astigmatism' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Astigmatism (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H15-558 Scleritis' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Scleritis (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H53-594 Amblyopia (Amblyopia ex anopsia)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Amblyopia (Amblyopia ex anopsia)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H55-598 Pain (Ocular pain)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Pain (Ocular pain)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H15-571 Tuberculosis (Iridocyclitis)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Tuberculosis (Iridocyclitis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H53-596 Night Blindness' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Night Blindness (Diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H40-582 Glaucoma (Other glaucoma))' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Glaucoma unspecified (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H00-556 Ectropion (Lagophthalmos)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Ectropion (Lagophthalmos)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H53-595 Double Vision (Diplopia)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Double Vision (Diplopia)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H15-565 Corneal Neovascularization' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Corneal neovascularization (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H46-585 Papilloedema unspecified' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Papilloedema (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H40-583 Glaucoma (Glaucoma unspecified)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Glaucoma unspecified (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H55-597 Nystagmus (Nystagmus and other irregular eye movements)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Nystagmus (Nystagmus and other irregular eye movements)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H15-559 Tuberculosis (Episcleritis)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Tuberculosis (Iridocyclitis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'R50-1747 Pain (Pain unspecified)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Pain (Pain unspecified)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H00-554 Ectropion (Senile of eyelid)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Senile ectropion of eyelid (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults

union all 

select 
*
from (
select 
'H40-578 Glaucoma (Primary angle-closure glaucoma)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Glaucoma (Primary angle-closure glaucoma)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H55-599 Keratopathy (Keratopathy (bullous aphakic) following cataract surgery)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Bullous aphakic keratopathy following cataract surgery (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults


union all 

select 
*
from (
select 
'H40-577 Glaucoma (Primary open-angle glaucoma)' as '',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "M" then person_id end)) as '< 1 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "M" then person_id end)) as '1 - 4 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "M" then person_id end)) as '5 - 14 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "M" then person_id end)) as '15 - 29 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "M" then person_id end)) as '30 - 64 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "M" then person_id end)) as '>= 65 (M)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 1) AND person_id is not null and gender = "F" then person_id end)) as '< 1 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 1 and 4) AND person_id is not null and gender = "F" then person_id end)) as '1 - 4 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 5 and 14) AND person_id is not null and gender = "F" then person_id end)) as '5 - 14 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 15 and 29) AND person_id is not null and gender = "F" then person_id end)) as '15 - 29 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 30 and 64) AND person_id is not null and gender = "F" then person_id end)) as '30 - 64 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 65 and 100) AND person_id is not null and gender = "F" then person_id end)) as '>= 65 (F)',
 count(DISTINCT(CASE WHEN (TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) between 0 and 100) AND person_id is not null and gender in ('F', 'M') then person_id end)) as 'Total'
 from (  
select obs.person_id, gender, birthdate, concept_id, obs_datetime  , encounter_id , value_coded as 'diagnosis', obs.voided from obs
left join person p on obs.person_id = p.person_id 
where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0))
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and 
value_coded = (select concept_id from concept_name where name = "Primary open-angle glaucoma (diagnosis)" and concept_name_type = "FULLY_SPECIFIED" and voided = 0) 
and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id in (
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Right eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0),
(select concept_id from concept_name where name = 'ICD 11 Diagnosis,Left eye' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0)
)
and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults