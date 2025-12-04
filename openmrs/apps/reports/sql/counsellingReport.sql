select SN,MRN , ClientName as "Patient Name" , Address,Age,Sex,Phone , shortNameSurgeryType as "Surgery type" , obs_datetime as "Counselling Date" , "Date of Surgery", "Vision" , "Post Surgical Follow up" , "Remarks" from (
select @a:=@a+1 as 'SN',pat_id, ClientName , Age, sex, mobile as Phone , identifier as "MRN" , Address from (
select distinct(pa.person_id) as pat_id , concat(coalesce(given_name, ''), "  ", coalesce(middle_name, ''), ' ', coalesce(family_name , '') ) as 'ClientName', 
gender as Sex ,floor(datediff(curdate(),p.birthdate) / 365) as 'Age',(SELECT @a:= 0) AS a, pi.identifier, concat(coalesce(prsn.address1, ''), "  ", coalesce(prsn.address2, ''), ' ', coalesce(city_village , '') ) as 'Address'
from person_attribute as pa 
INNER JOIN person_attribute_type as pat on pa.person_attribute_type_id = pat.person_attribute_type_id  
INNER JOIN person as p on pa.person_id = p.person_id 
LEFT JOIN person_name as pn on p.person_id = pn.person_id 
LEFT JOIN patient as pt on p.person_id = pt.patient_id
LEFT JOIN patient_identifier pi on pt.patient_id = pi.patient_id
Left join person_address prsn on pt.patient_id = prsn.person_id
)tPatientDemographics left join
(
select pn.person_id as 'pid', pn.given_name, pn.middle_name, pa.value as 'mobile' from person_name pn
left join person_attribute pa on pn.person_id = pa.person_id where pa.person_attribute_type_id 
=(select person_attribute_type_id from person_attribute_type where name = 'phoneNumber')
)tMobile on  tPatientDemographics.pat_id = tMobile.pid
)tDemographics 
inner join (
select person_id , shortNameSurgeryType , obs_datetime from (
select person_id, surgeryType , obs_datetime from (  
select person_id, concept_id, obs_datetime  , encounter_id , value_coded as 'surgeryType', voided from obs where concept_id =
(select concept_id from concept_name where name = 'Type of Surgery' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')  and value_coded is not null and voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Type of Surgery' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) and 
obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01') and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59') group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tresults left join
(
select concept_id , name as 'shortNameSurgeryType' from concept_name where concept_name_type = 'SHORT' and voided = 0
)tConceptname on tresults.surgeryType = tConceptname.concept_id
)tSurgeryType on tDemographics.pat_id = tSurgeryType.person_id


