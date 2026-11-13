create database patientReadmissionDB
use patientReadmissionDB

 
CREATE TABLE DiabeticData
(
    encounter_id BIGINT PRIMARY KEY,
    patient_nbr BIGINT,
    race VARCHAR(50),
    gender VARCHAR(20),
    age VARCHAR(20),
    weight VARCHAR(20),
    admission_type_id INT,
    discharge_disposition_id INT,
    admission_source_id INT,
    time_in_hospital INT,
    payer_code VARCHAR(20),
    medical_specialty VARCHAR(100),
    num_lab_procedures INT,
    num_procedures INT,
    num_medications INT,
    number_outpatient INT,
    number_emergency INT,
    number_inpatient INT,
    diag_1 VARCHAR(20),
    diag_2 VARCHAR(20),
    diag_3 VARCHAR(20),
    number_diagnoses INT,
    max_glu_serum VARCHAR(30),
    A1Cresult VARCHAR(30),
    metformin VARCHAR(30),
    repaglinide VARCHAR(30),
    nateglinide VARCHAR(30),
    chlorpropamide VARCHAR(30),
    glimepiride VARCHAR(30),
    acetohexamide VARCHAR(30),
    glipizide VARCHAR(30),
    glyburide VARCHAR(30),
    tolbutamide VARCHAR(30),
    pioglitazone VARCHAR(30),
    rosiglitazone VARCHAR(30),
    acarbose VARCHAR(30),
    miglitol VARCHAR(30),
    troglitazone VARCHAR(30),
    tolazamide VARCHAR(30),
    examide VARCHAR(30),
    citoglipton VARCHAR(30),
    insulin VARCHAR(30),
    glyburide_metformin VARCHAR(30),
    glipizide_metformin VARCHAR(30),
    glimepiride_pioglitazone VARCHAR(30),
    metformin_rosiglitazone VARCHAR(30),
    metformin_pioglitazone VARCHAR(30),
    change VARCHAR(20),
    diabetesMed VARCHAR(20),
    readmitted VARCHAR(10)
);

select * from DiabeticData

--1.How many hospital encounters and unique patients are recorded in the dataset?
select COUNT(*) as hosp_encounter ,COUNT(distinct patient_nbr) as unique_patients
from DiabeticData

--2.How many patients were readmitted within 30 days, after 30 days, or not readmitted?
select readmitted as readmission_status,
COUNT(*) as total_encounter,
CAST( count(*) *100 / sum(count(*)) over()
as decimal (10,2) ) as percentage
from DiabeticData
group by readmitted
order by total_encounter desc;

--3.What percentage of hospital encounters resulted in readmission within 30 days?
SELECT
    COUNT(*) AS Total_Encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS Readmitted_Within_30_Days,

    CAST(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*)
        AS DECIMAL(10,2)
    ) AS Readmission_Rate
FROM DiabeticData;

--4.Which age group has the highest 30-day readmission rate?
SELECT
    age AS Age_Group,

    COUNT(*) AS Total_Encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS Readmitted_Within_30_Days,

    CAST(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*)
        AS DECIMAL(10,2)
    ) AS Readmission_Rate

FROM dbo.DiabeticData

GROUP BY age

ORDER BY
    CASE age
        WHEN '[0-10)' THEN 1
        WHEN '[10-20)' THEN 2
        WHEN '[20-30)' THEN 3
        WHEN '[30-40)' THEN 4
        WHEN '[40-50)' THEN 5
        WHEN '[50-60)' THEN 6
        WHEN '[60-70)' THEN 7
        WHEN '[70-80)' THEN 8
        WHEN '[80-90)' THEN 9
        WHEN '[90-100)' THEN 10
        ELSE 11
    END;

--5.Does the 30-day readmission rate differ between male and female patients?
SELECT
    gender,

    COUNT(*) AS Total_Encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS Readmitted_Within_30_Days,

    CAST(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*)
        AS DECIMAL(10,2)
    ) AS Readmission_Rate

FROM dbo.DiabeticData

GROUP BY gender
ORDER BY Readmission_Rate DESC;

--6.Are patients who stay longer in the hospital more likely to be readmitted within 30 days?
SELECT
    time_in_hospital AS Hospital_Stay_Days,
    COUNT(*) AS Total_Encounters,
    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS Readmitted_Within_30_Days,
    CAST(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*)
        AS DECIMAL(10,2)
    ) AS Readmission_Rate
FROM dbo.DiabeticData
GROUP BY time_in_hospital
ORDER BY time_in_hospital;

--7.Readmission based on previous hospital visits
SELECT
    number_inpatient AS Previous_Inpatient_Visits,
    COUNT(*) AS Total_Encounters,
    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS Readmitted_Within_30_Days,
    CAST(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*)
        AS DECIMAL(10,2)
    ) AS Readmission_Rate
FROM dbo.DiabeticData
GROUP BY number_inpatient
ORDER BY number_inpatient;

--8.Readmission based on previous emergency visits
SELECT
    CASE
        WHEN number_emergency = 0 THEN '0 Visits'
        WHEN number_emergency = 1 THEN '1 Visit'
        WHEN number_emergency = 2 THEN '2 Visits'
        ELSE '3+ Visits'
    END AS Emergency_Visit_Group,

    COUNT(*) AS Total_Encounters,

    SUM(CASE WHEN readmitted = '<30'
        THEN 1 ELSE 0 END) AS Readmitted_Within_30_Days,

    CAST(
        SUM(CASE WHEN readmitted = '<30'
            THEN 1 ELSE 0 END) * 100.0 / COUNT(*)
        AS DECIMAL(10,2)
    ) AS Readmission_Rate

FROM dbo.DiabeticData
GROUP BY
    CASE
        WHEN number_emergency = 0 THEN '0 Visits'
        WHEN number_emergency = 1 THEN '1 Visit'
        WHEN number_emergency = 2 THEN '2 Visits'
        ELSE '3+ Visits'
    END;
       
--9.Readmission based on previous outpatient visits
SELECT
    CASE
        WHEN number_outpatient = 0 THEN '0 Visits'
        WHEN number_outpatient = 1 THEN '1 Visit'
        WHEN number_outpatient = 2 THEN '2 Visits'
        ELSE '3+ Visits'
    END AS Outpatient_Visit_Group,

    COUNT(*) AS Total_Encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS Readmitted_Within_30_Days,

    CAST(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*)
        AS DECIMAL(10,2)
    ) AS Readmission_Rate

FROM dbo.DiabeticData
GROUP BY
    CASE
        WHEN number_outpatient = 0 THEN '0 Visits'
        WHEN number_outpatient = 1 THEN '1 Visit'
        WHEN number_outpatient = 2 THEN '2 Visits'
        ELSE '3+ Visits'
    END;

--10.Readmission by admission type
SELECT
    discharge_disposition_id AS Discharge_Disposition,

    COUNT(*) AS Total_Encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS Readmitted_Within_30_Days,

    CAST(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*)
        AS DECIMAL(10,2)
    ) AS Readmission_Rate

FROM dbo.DiabeticData
GROUP BY discharge_disposition_id
ORDER BY Readmission_Rate DESC;

--11.Readmission by discharge disposition.
SELECT
    discharge_disposition_id AS Discharge_Disposition,
    COUNT(*) AS Total_Encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS Readmitted_Within_30_Days,

    CAST(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*)
        AS DECIMAL(10,2)
    ) AS Readmission_Rate

FROM dbo.DiabeticData
GROUP BY discharge_disposition_id
ORDER BY Readmission_Rate DESC;

--12.Readmission based on number of diagnoses.
SELECT
    number_diagnoses AS Number_Of_Diagnoses,

    COUNT(*) AS Total_Encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS Readmitted_Within_30_Days,

    CAST(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*)
        AS DECIMAL(10,2)
    ) AS Readmission_Rate

FROM dbo.DiabeticData
GROUP BY number_diagnoses
ORDER BY number_diagnoses;

--13.Readmission based on medication count.
SELECT
    CASE
        WHEN num_medications BETWEEN 1 AND 5 THEN '1-5 Medications'
        WHEN num_medications BETWEEN 6 AND 10 THEN '6-10 Medications'
        WHEN num_medications BETWEEN 11 AND 15 THEN '11-15 Medications'
        WHEN num_medications BETWEEN 16 AND 20 THEN '16-20 Medications'
        ELSE 'More than 20'
    END AS Medication_Group,

    COUNT(*) AS Total_Encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS Readmitted_Within_30_Days,

    CAST(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*)
        AS DECIMAL(10,2)
    ) AS Readmission_Rate

FROM dbo.DiabeticData
GROUP BY
    CASE
        WHEN num_medications BETWEEN 1 AND 5 THEN '1-5 Medications'
        WHEN num_medications BETWEEN 6 AND 10 THEN '6-10 Medications'
        WHEN num_medications BETWEEN 11 AND 15 THEN '11-15 Medications'
        WHEN num_medications BETWEEN 16 AND 20 THEN '16-20 Medications'
        ELSE 'More than 20'
    END
ORDER BY Medication_Group;

--14.
select* from DiabeticData