-- Q1 List all patients
SELECT 
    *
FROM
    patients;

-- Q2 Show all cancer types* from cancers;
SELECT 
    *
FROM
    cancers;

-- Q3 Find patients diagnosed with cancer
SELECT 
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name
FROM
    patients AS p
        INNER JOIN
    cancer_diagnosis AS cd ON p.patient_id = cd.patient_id;
    
    -- Q4 Show patient with their cancer type
 SELECT 
    p.patient_name, c.cancer_name
FROM
    patients p
        JOIN
    cancer_diagnosis cd ON p.patient_id = cd.patient_id
        JOIN
    cancers c ON cd.cancer_id = c.cancer_id;

-- Q5: Count number of patients per cancer type
SELECT 
    c.cancer_name, COUNT(*) AS total_patients
FROM
    cancer_diagnosis cd
        JOIN
    cancers c ON cd.cancer_id = c.cancer_id
GROUP BY c.cancer_name
ORDER BY total_patients DESC;

-- Q6: Show all genes
SELECT 
    *
FROM
    genes;

-- Q7: Show gene–cancer associations
SELECT 
    g.gene_name, c.cancer_name
FROM
    gene_cancer_associations gca
        JOIN
    genes g ON gca.gene_id = g.gene_id
        JOIN
    cancers c ON gca.cancer_id = c.cancer_id

-- Q8: Find variants linked to genes
SELECT 
    g.gene_name, v.variant_name
FROM
    variants v
        JOIN
    genes g ON v.gene_id = g.gene_id

-- Q9: Show insurance policies for patients
SELECT 
    p.patient_name, ip.policy_type, ip.coverage_amount
FROM
    insurance_policy ip
        JOIN
    patients p ON ip.patient_id = p.patient_id

-- Q10: List active insurance policies
SELECT 
    *
FROM
    insurance_policy
WHERE
    policy_status = 'Active'

-- Q11: Find patients with high genomic risk score (>70)
SELECT 
    patient_id, genomic_risk_score
FROM
    insurance_policy
WHERE
    genomic_risk_score > 70

-- Q12: Calculate the average genomic risk score
SELECT 
    AVG(genomic_risk_score) AS average_risk
FROM
    insurance_policy

-- Q13: Total insurance coverage amount by policy type
SELECT 
    policy_type, SUM(coverage_amount) AS total_coverage
FROM
    insurance_policy
GROUP BY policy_type

-- Q14: Show all insurance claims
SELECT 
    *
FROM
    claims

-- Q15: Calculate the total claim amount
SELECT 
    SUM(claim_amount) AS total_claims
FROM
    claims

-- Q16: Show claims along with patient names
SELECT 
    p.patient_name, c.claim_amount
FROM
    claims c
        JOIN
    patients p ON c.patient_id = p.patient_id

-- Q17: Show all processed payments
SELECT 
    *
FROM
    payments
WHERE
    payment_status = 'Processed'

-- Q18: Calculate the total payments made
SELECT 
    SUM(payment_amount) AS total_payments
FROM
    payments

-- Q19: Count number of transactions by payment method
SELECT 
    payment_method, COUNT(*) AS total_transactions
FROM
    payments
GROUP BY payment_method

-- Q20: Find the highest insurance coverage amount
SELECT 
    patient_id, MAX(coverage_amount) AS highest_coverage
FROM
    insurance_policy
    
-- Q21 Retrieve the top 5 patients with the highest genomic risk score along with their policy type and cancer diagnosis.
SELECT 
    p.first_name,
    p.last_name,
    ip.genomic_risk_score,
    ip.policy_type,
    c.cancer_name cancer_diagnosis
FROM
    patients p
        JOIN
    insurance_policy ip ON p.patient_id = ip.patient_id
        JOIN
    cancer_diagnosis cd ON p.patient_id = cd.patient_id
        JOIN
    cancers c ON cd.cancer_id = c.cancer_id
ORDER BY ip.genomic_risk_score DESC
LIMIT 5;

-- Q22 Generate financial summary per cancer type  by getting two dates and  calculate Total claims, Total payments, Average claim amount
delimiter $$
	create procedure financial_summary( in start_date date, in end_date date)
    begin
SELECT 
    c.cancer_name cancer_type,
    count(cl.claim_amount) total_claims,
    SUM(pay.payment_amount) total_payments,
    AVG(cl.claim_amount) average_claim_amount
FROM
    cancers c
        JOIN
    cancer_diagnosis cd ON c.cancer_id = cd.cancer_id
        JOIN
    insurance_policy ip ON cd.patient_id = ip.patient_id
        JOIN
    claims cl ON ip.policy_id = cl.policy_id
        JOIN
    payments pay ON cl.claim_id = pay.claim_id
WHERE
    cd.diagnosis_date between start_date and end_date
group by cancer_type;
end $$
delimiter ;

call financial_summary('2024-01-01', '2024-08-10');
-- ====================================================================================================================================================

/*  Q23 Write a function named GeneratePatientTag that takes a patient_id (INT) and a blood_group (VARCHAR) from the patients table. 
It should combine them and return a single string formatted exactly like this: 'PT-1 [O+]'. */

delimiter &&
create function patient_tag (p_id int, blood_gp varchar (5))
returns varchar (20)
deterministic
begin 
return concat('PT-',p_id,' [', blood_gp, ']');
end &&
delimiter ;

SELECT 
    patient_id,
    blood_group,
    PATIENT_TAG(patient_id, blood_group) AS patient_tag
FROM
    patients
LIMIT 5;
-- ============================================================================================================================================================
/* 
Create a stored function named GetPatientFinancialRank that takes a patient ID as input and returns the financial rank of that patient. 
The rank should be calculated based on the total approved claim amount of each patient in the system.
The function must join the patients, insurance_policy, and claims tables to collect the necessary data. 
It should calculate the total approved claim amount using the sum() aggregate function and group the data by patient ID. 
Then, it should use a window function like rank() to assign a ranking to all patients in descending order of their total approved claim amounts. 
Finally, the function should return the rank of the patient whose ID is provided as input.
*/

delimiter $$
create function get_patient_financial_rank (p_patient_id int)
returns  int
deterministic
begin
declare patient_name varchar (50);
declare patient_rank int default 0;
select ranking into patient_rank
from ( select 
			p.patient_id,
            sum(cl.approved_amount) as total_amount,
            rank() over (order by(sum(cl.approved_amount))desc) as ranking
		from patients p join insurance_policy ip on p.patient_id = ip.patient_id
		join claims cl on cl.policy_id = ip.policy_id
        where cl.claim_status = 'Approved'
        group by p.patient_id) as p_rank_table
        where patient_id = p_patient_id;
	return patient_rank;
end $$
Delimiter ;

select get_patient_financial_rank (45);

SELECT 
concat(first_name, ' ' , last_name) as fullname,
get_patient_financial_rank(patient_id) as patient_rank from patients order by patient_rank desc ;
