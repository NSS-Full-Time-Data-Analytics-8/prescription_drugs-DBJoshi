QUESTION 1

SELECT npi, prescription.total_claim_count
FROM prescriber
INNER JOIN  prescription
USING (npi)
ORDER BY total_claim_count DESC;

Question 1B
SELECT npi, prescription.total_claim_count,nppes_provider_first_name, nppes_provider_last_org_name, specialty_description
FROM prescriber
INNER JOIN  prescription
USING (npi)
ORDER BY total_claim_count DESC;

Question 2 A

SELECT DISTINCT specialty_description, SUM(prescription.total_claim_count)
FROM prescriber 
INNER JOIN prescription
USING (npi)
GROUP BY specialty_description
ORDER BY SUM(prescription.total_claim_count) DESC
LIMIT 1;

Question 2B
SELECT DISTINCT specialty_description, SUM(prescription.total_claim_count) AS total_cc
FROM prescriber
INNER JOIN prescription
USING (npi)
INNER JOIN drug
USING (drug_name)
WHERE opioid_drug_flag ='Y'
GROUP BY specialty_description
ORDER BY total_cc DESC
LIMIT 1;

QUESTION 2C
SELECT specialty_description,npi,prescription.npi AS cription_npi
FROM prescriber
LEFT JOIN prescription
USING (npi)
WHERE prescription.npi is null;

Question 3A
SELECT drug.generic_name, prescription.total_drug_cost 
FROM prescription
INNER JOIN drug
USING (drug_name)
ORDER BY total_drug_cost DESC
LIMIT 1;

Question 3B
SELECT drug.generic_name, ROUND(prescription.total_drug_cost/prescription.total_day_supply,2) AS day_drug_cost 
FROM prescription
INNER JOIN drug
USING (drug_name)
ORDER BY day_drug_cost DESC
LIMIT 1;

Question 4A
SELECT drug_name,       
CASE WHEN opioid_drug_flag ='Y' THEN 'opioid'
     WHEN antibiotic_drug_flag ='Y' THEN 'antibiotic'
ELSE 'neither' END as drug_type
FROM drug;

Question 4B
SELECT total_drug_cost,drug_name,opioid_drug_flag,antibiotic_drug_flag
FROM prescription
INNER JOIN drug
USING(drug_name)
WHERE opioid_drug_flag ='Y'
antibiotic_drug_flag ='Y'


Question 5A
SELECT COUNT(cbsa),state 
FROM fips_county
JOIN cbsa
USING (fipscounty)
WHERE state = 'TN'
GROUP BY state

Question 5B
SELECT cbsa, cbsaname, population
FROM cbsa
JOIN population
USING (fipscounty)
ORDER BY population DESC
LIMIT 1;

SELECT cbsa, cbsaname, population
FROM cbsa
JOIN population
USING (fipscounty)
ORDER BY population ASC
LIMIT 1;

Question 5C
SELECT county, cbsaname,population
FROM fips_county
FULL join cbsa
USING(fipscounty)
FULL JOIN population 
USING (fipscounty)
WHERE cbsaname is null and population is not null
ORDER BY population DESC
LIMIT 1;


Question 6A
SELECT drug_name, total_claim_count
FROM prescription
WHERE total_claim_count >= 3000

Question 6B
SELECT drug_name, total_claim_count, opioid_drug_flag
FROM prescription
INNER JOIN drug
USING (drug_name)
WHERE total_claim_count >= 3000

Question 6C
SELECT drug_name, total_claim_count, opioid_drug_flag,nppes_provider_last_org_name,nppes_provider_first_name 
FROM prescription
INNER JOIN drug
USING (drug_name)
INNER JOIN prescriber
USING (npi)
WHERE total_claim_count >= 3000

Question 7A


