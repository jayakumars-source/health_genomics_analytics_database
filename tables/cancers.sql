CREATE TABLE cancers (
    cancer_id INT AUTO_INCREMENT,
    cancer_name VARCHAR(100),
    CONSTRAINT cr_cancer_id_pk PRIMARY KEY (cancer_id),
    CONSTRAINT cr_cancer_name_uk UNIQUE (cancer_name)
);


INSERT INTO cancers  (cancer_id, cancer_name)
VALUES (1,'Breast Cancer'),
(2,'Lung Cancer'),
(3,'Colorectal Cancer'),
(4,'Prostate Cancer'),
(5,'Pancreatic Cancer'),
(6,'Liver Cancer'),
(7,'Stomach Cancer'),
(8,'Ovarian Cancer'),
(9,'Cervical Cancer'),
(10,'Endometrial Cancer'),
(11,'Bladder Cancer'),
(12,'Kidney Cancer'),
(13,'Thyroid Cancer'),
(14,'Brain Cancer'),
(15,'Leukemia'),
(16,'Lymphoma'),
(17,'Melanoma'),
(18,'Esophageal Cancer'),
(19,'Multiple Myeloma'),
(20,'Testicular Cancer'),
(21,'Gallbladder Cancer'),
(22,'Head and Neck Cancer'),
(23,'Bone Cancer'),
(24,'Skin Cancer (Non-Melanoma)'),
(25,'Small Intestine Cancer');

select * from cancers;