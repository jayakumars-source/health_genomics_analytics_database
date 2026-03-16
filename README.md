# Health Genomics Analytics Database

## Overview

The **Health Genomics Analytics Database** is a SQL-based healthcare analytics project that integrates **genomic data, cancer diagnosis information, patient records, and healthcare insurance data** into a unified relational database.

This project demonstrates how relational database design can support **healthcare analytics and bioinformatics workflows**, enabling insights into relationships between **genes, genetic variants, cancer types, patients, and healthcare financial records**.

This database project was developed as a **portfolio project to demonstrate SQL, data modeling, and analytical query skills relevant to bioinformatics and healthcare data analysis roles.**

---

# Project Objectives

The primary objectives of this project are:

- Design a **relational database for healthcare genomics data**
- Store **patient demographic and clinical information**
- Track **cancer diagnoses**
- Store **gene and genomic variant information**
- Associate **genes with specific cancer types**
- Manage **insurance policies and claims**
- Track **healthcare payments**
- Enable **SQL-based healthcare analytics**

---

# Database Schema

The database consists of **9 interconnected tables** representing clinical, genomic, and financial data.

## Core Tables

| Table | Description |
|------|-------------|
| patients | Stores patient demographic and health information |
| cancers | Stores cancer type information |
| cancer_diagnosis | Records patient cancer diagnosis details |
| genes | Stores gene information including chromosome and genomic position |
| variants | Stores genetic variants detected in patients |
| gene_cancer_association | Links genes with cancers (many-to-many relationship) |
| insurance_policy | Stores patient insurance policy details |
| claims | Stores insurance claim records |
| payments | Stores payment transactions related to claims |

---

# Entity Relationship Overview

The database schema models several real-world healthcare relationships.

### Patients and Diagnoses

- One patient can have **multiple cancer diagnoses**
- Each diagnosis is linked to a **specific cancer type**

### Patients and Genomic Variants

- A patient may have **multiple detected genetic variants**
- Each variant is linked to a **specific gene**

### Genes and Cancer Types

Genes can be associated with **multiple cancers**, and cancers can be associated with **multiple genes**.

This relationship is handled through the **gene_cancer_association** junction table.

### Insurance and Claims

- Patients can have **multiple insurance policies**
- Claims are submitted under insurance policies
- Payments are processed for approved claims

---

# Database Features

This project demonstrates several relational database features.

## Keys and Constraints

The database includes:

- Primary Keys
- Foreign Keys
- Composite Keys
- Check Constraints
- Data Integrity Rules

Example constraint used in the project:

```sql
CHECK (payment_status IN ('processed','pending','failed'))
```

This ensures only valid payment statuses are stored.

---

# Stored Procedures and Functions

The database includes advanced SQL components such as:

### Stored Procedures
- Financial summary analysis

### User Defined Functions
- Patient financial ranking
- Patient tagging based on medical and financial attributes

These features demonstrate **advanced SQL capabilities beyond basic queries**.

---

# Analytical SQL Queries

The project also includes analytical SQL queries to extract insights from the database.

Examples include:

- Identify **patients with high genomic risk scores**
- Find **genes linked to specific cancers**
- Calculate **total claim amounts by hospital**
- Identify **pending or failed payments**
- Determine **patients with multiple diagnoses**
- Analyze **genetic variants detected in patients**
- Calculate **insurance claim utilization**
- Identify **patients with high insurance coverage**

These queries demonstrate how SQL can support **healthcare data analysis and decision making**.

---
## Key Insights

- **Cancer Diagnosis Patterns:** Analysis of patient and diagnosis data helps identify the most common cancer types and how diagnoses are distributed across the patient population.

- **Gene–Cancer Relationships:** The database links genes with specific cancer types, enabling exploration of potential genetic associations involved in cancer development.

- **Genomic Risk Assessment:** Patients with higher genomic risk scores can be identified, helping highlight individuals who may require closer medical monitoring or preventive care.

- **Insurance and Healthcare Cost Analysis:** By analyzing policies, claims, and payments, the project reveals patterns in healthcare coverage, claim amounts, and financial burden across patients.

- **Healthcare Payment Insights:** Payment data analysis helps track processed, pending, and failed payments while identifying the most commonly used payment methods.

---
# Project Folder Structure

```
health-genomics-analytics-database

│
├── tables
│   ├── patients.sql
│   ├── cancers.sql
│   ├── cancer_diagnosis.sql
│   ├── genes.sql
│   ├── variants.sql
│   ├── gene_cancer_associations.sql
│   ├── insurance_policy.sql
│   ├── claims.sql
│   └── payments.sql
│
├── analysis_queries
│   └── analysis_queries.sql
│
├── images
│   ├── er_diagram.png
│   └── schema.png
│
└── README.md
```

---

# Technologies Used

- **MySQL**
- **SQL**
- **MySQL Workbench**
- **Relational Database Design**
- **Healthcare Data Modeling**

---

# Skills Demonstrated

This project demonstrates practical skills in:

- SQL database design
- Data modeling
- Relational schema development
- Foreign key relationships
- Data validation and constraints
- Healthcare data analytics
- Bioinformatics data representation
- SQL query optimization

---

# Example Applications

This database model can support applications such as:

- Clinical genomics research
- Healthcare data analytics
- Insurance claim analysis
- Patient genomic risk assessment
- Cancer genomics research

---

# Author

**Jayakumar S**

B.Tech Biotechnology Student  
Interested in **Bioinformatics, Data Analytics, and Healthcare Data Science**

GitHub: [jayakumars-source](https://github.com/jayakumars-source)  
LinkedIn: [Jayakumar S](https://www.linkedin.com/in/jayakumarsbio05)

---

# License

This project is intended for **educational and portfolio purposes**.
