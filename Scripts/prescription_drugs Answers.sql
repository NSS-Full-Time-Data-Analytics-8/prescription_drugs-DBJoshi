QUESTION 1

SELECT npi, prescription.total_claim_count
FROM prescriber
INNER JOIN  prescription
USING (npi)
ORDER BY total_claim_count DESC;
Question 1 B
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

