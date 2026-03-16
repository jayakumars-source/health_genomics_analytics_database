CREATE TABLE gene_cancer_association (
    gene_id INT,
    cancer_id INT,
    PRIMARY KEY (gene_id , cancer_id),
    CONSTRAINT gca_gene_id_fk FOREIGN KEY (gene_id) REFERENCES genes (gene_id),
    CONSTRAINT gca_cancer_id_fk FOREIGN KEY (cancer_id) REFERENCES cancers (cancer_id)
);


INSERT INTO gene_cancer_association (gene_id, cancer_id) VALUES
-- gene and cancer id combination for cancer 1
(1,1),
(3,1),
(15,1),
-- gene and cancer id combination forcancer 2
(4,2),
(17,2),
(20,2),
-- gene and cancer id combination for Cancer 3
(19,3),
(23,3),
(28,3),
-- gene and cancer id combination for Cancer 4
(16,4),
(21,4),
(30,4),
-- gene and cancer id combination for Cancer 5
(5,5),
(24,5),
(26,5),
-- gene and cancer id combination for Cancer 6
(6,6),
(11,6),
(29,6),
-- gene and cancer id combination for cancer 7
(10,7),
(12,7),
(27,7),
-- gene and cancer id combination for cancer 8
(2,8),
(15,8),
(20,8),
-- gene and cancer id combination for cancer 9
(3,9),
(14,9),
(25,9),
-- gene and cancer id combination for Cancer 10
(15,10),
(22,10),
(44,10),
-- gene and cancer id combination for Cancer 11
(21,11),
(38,11),
(43,11),
-- gene and cancer id combination for Cancer 12
(6,12),
(24,12),
(30,12),
-- gene and cancer id combination for Cancer 13
(13,13),
(15,13),
(25,13),
-- gene and cancer id combination for Cancer 14
(3,14),
(14,14),
(42,14),
-- gene and cancer id combination for Cancer 15
(3,15),
(11,15),
(42,15),
-- gene and cancer id combination for Cancer 16
(11,16),
(16,16),
(39,16),
-- gene and cancer id combination for Cancer 17
(20,17),
(27,17),
(41,17),
-- gene and cancer id combination for cancer 18
(1,18),
(18,18),
(30,18),
-- gene and cancer id combination for cancer 19
(21,19),
(23,19),
(37,19),
-- gene and cancer id combination for cancer 20
(30,20),
(33,20),
(45,20),
-- gene and cancer id combination for cancer 21
(5,21),
(26,21),
(29,21),
-- gene and cancer id combination for cancer 22
(4,22),
(12,22),
(17,22),
-- gene and cancer id combination for cancer 23
(26,23),
(35,23),
(42,23),
-- gene and cancer id combination for cancer 24
(20,24),
(27,24),
(41,24),
-- gene and cancer id combination for cancer 25
(9,25),
(28,25),
(37,25);

select * from gene_cancer_association