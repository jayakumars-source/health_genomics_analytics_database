CREATE TABLE claims (
    claim_id INT AUTO_INCREMENT,
    policy_id INT,
    claim_date DATE,
    claim_amount DECIMAL(12 , 2 ),
    approved_amount DECIMAL(12 , 2 ),
    claim_status VARCHAR(100),
    hospital_name VARCHAR(150),
    claim_reason VARCHAR(250),
    CONSTRAINT cl_claim_id_pk PRIMARY KEY (claim_id),
    CONSTRAINT cl_policy_id_fk FOREIGN KEY (policy_id)
        REFERENCES insurance_policy (policy_id),
    CONSTRAINT cl_approved_amount_ck CHECK (approved_amount <= claim_amount),
    CONSTRAINT cl_claim_status_ck CHECK (claim_status IN ('Pending' , 'Approved', 'Rejected'))
);


INSERT INTO claims
(policy_id, claim_date, claim_amount, approved_amount, claim_status, hospital_name, claim_reason)
VALUES
(1,'2024-02-10',15000,12000,'Approved','City Care Hospital','Chemotherapy session'),
(2,'2024-03-05',45000,45000,'Approved','Metro Oncology Center','Radiation therapy'),
(3,'2024-04-12',120000,100000,'Approved','National Cancer Institute','Surgery expenses'),
(4,'2024-02-20',18000,0,'Rejected','Sunrise Hospital','Non-covered medication'),
(5,'2024-05-10',60000,50000,'Approved','Apollo Medical Center','Targeted therapy'),
(6,'2024-06-01',250000,200000,'Approved','Global Health Hospital','Advanced surgery'),
(7,'2024-03-18',10000,8000,'Approved','City Care Hospital','Diagnostic imaging'),
(8,'2024-04-22',75000,0,'Rejected','Metro Oncology Center','Out-of-network charges'),
(9,'2024-05-30',300000,280000,'Approved','National Cancer Institute','Immunotherapy'),
(10,'2024-02-14',12000,12000,'Approved','Sunrise Hospital','Lab tests'),

(11,'2024-03-25',50000,45000,'Approved','Apollo Medical Center','Chemotherapy'),
(12,'2024-07-10',22000,0,'Rejected','City Care Hospital','Incomplete documentation'),
(13,'2024-04-18',180000,150000,'Approved','Global Health Hospital','Surgical treatment'),
(14,'2024-05-05',65000,60000,'Approved','Metro Oncology Center','Radiation sessions'),
(15,'2024-02-28',9000,0,'Pending','Sunrise Hospital','Biopsy procedure'),
(16,'2024-08-12',85000,70000,'Approved','National Cancer Institute','Follow-up therapy'),
(17,'2024-03-10',210000,200000,'Approved','Apollo Medical Center','Tumor removal'),
(18,'2024-04-01',14000,14000,'Approved','City Care Hospital','Screening tests'),
(19,'2024-06-20',40000,0,'Rejected','Metro Oncology Center','Policy exclusion'),
(20,'2024-02-25',260000,250000,'Approved','Global Health Hospital','Major surgery'),


(21,'2024-03-15',16000,15000,'Approved','Sunrise Hospital','Chemotherapy'),
(22,'2024-04-05',70000,65000,'Approved','Metro Oncology Center','Radiation therapy'),
(23,'2024-05-11',190000,0,'Rejected','National Cancer Institute','Late submission'),
(24,'2024-02-19',13000,13000,'Approved','City Care Hospital','Diagnostic scans'),
(25,'2024-03-30',95000,90000,'Approved','Apollo Medical Center','Drug therapy'),
(26,'2024-04-25',320000,300000,'Approved','Global Health Hospital','Advanced surgery'),
(27,'2024-02-10',11000,0,'Pending','Sunrise Hospital','Pathology tests'),
(28,'2024-05-18',60000,55000,'Approved','Metro Oncology Center','Radiation therapy'),
(29,'2024-06-01',280000,260000,'Approved','National Cancer Institute','Immunotherapy'),
(30,'2024-03-08',17000,17000,'Approved','City Care Hospital','Lab procedures'),

(31,'2024-04-14',80000,75000,'Approved','Apollo Medical Center','Chemotherapy'),
(32,'2024-05-09',20000,0,'Rejected','Sunrise Hospital','Policy expired'),
(33,'2024-06-21',150000,140000,'Approved','Global Health Hospital','Surgical expenses'),
(34,'2024-03-12',72000,70000,'Approved','Metro Oncology Center','Radiation'),
(35,'2024-02-27',9500,9500,'Approved','City Care Hospital','Biopsy'),
(36,'2024-04-16',210000,190000,'Approved','National Cancer Institute','Tumor surgery'),
(37,'2024-05-20',68000,0,'Pending','Apollo Medical Center','Follow-up therapy'),
(38,'2024-03-01',15000,15000,'Approved','Sunrise Hospital','Screening tests'),
(39,'2024-04-28',250000,240000,'Approved','Global Health Hospital','Immunotherapy'),
(40,'2024-06-10',90000,85000,'Approved','Metro Oncology Center','Radiation sessions'),

(41,'2024-03-22',14000,13000,'Approved','City Care Hospital','Diagnostic imaging'),
(42,'2024-04-17',60000,58000,'Approved','Apollo Medical Center','Chemotherapy'),
(43,'2024-05-25',220000,200000,'Approved','National Cancer Institute','Major surgery'),
(44,'2024-02-18',18000,0,'Rejected','Sunrise Hospital','Non-covered service'),
(45,'2024-06-05',175000,160000,'Approved','Global Health Hospital','Advanced treatment');


