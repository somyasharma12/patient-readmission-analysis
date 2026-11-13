
# 🏥  Patient Readmission Analysis

## 📌 Project Overview

This project focuses on analyzing hospital patient readmission patterns using healthcare data. The objective is to identify factors associated with readmission within 30 days by analyzing patient demographics, previous hospital visits, emergency visits, and hospital stay duration.

The project uses **SQL Server, Python, and Power BI** to perform data cleaning, exploratory data analysis, SQL-based analysis, and interactive dashboard development.

## 🎯 Business Objectives

- Analyze overall hospital readmission patterns.
- Calculate the 30-day readmission rate.
- Identify readmission trends across different age groups and genders.
- Analyze the impact of previous inpatient and emergency visits on readmission.
- Understand the relationship between hospital stay duration and readmission.
- Develop an interactive dashboard to communicate meaningful insights.

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| SQL Server | Data storage, querying, and analysis |
| Python | Data cleaning and exploratory data analysis |
| Pandas | Data manipulation |
| NumPy | Numerical operations |
| Matplotlib | Data visualization |
| Seaborn | Statistical visualization |
| Power BI | Interactive dashboard development |

## 📂 Dataset

**Dataset Name:** Diabetes 130-US Hospitals for Years 1999–2008

**Source:** Kaggle

**Dataset Link:** [Diabetes Dataset – Kaggle](https://www.kaggle.com/datasets/brandao/diabetes?resource=download)

### Dataset Details

- Approximately 101,766 hospital encounter records.
- Data collected from 130 US hospitals.
- Covers the period 1999–2008.
- Contains patient demographics, admission details, diagnoses, medications, hospital stay duration, and readmission information.

**Note:** The dataset is encounter-level, meaning one patient may have multiple hospital encounters. The analysis focuses on encounter-level readmission patterns.

## 🔄 Project Workflow

### 1. Data Cleaning & Preparation

- Imported and explored the raw dataset using Python.
- Examined column names, data types, and missing values.
- Identified and handled missing and invalid values.
- Checked duplicate records.
- Prepared the cleaned dataset for further analysis.

### 2. SQL Server – Data Analysis

Imported the cleaned dataset into SQL Server and performed SQL analysis to answer business questions.

Key analysis areas:

- Total hospital encounters and unique patients.
- Readmission distribution.
- Overall 30-day readmission rate.
- Readmission by age group and gender.
- Readmission based on previous inpatient visits.
- Readmission based on previous emergency visits.
- Readmission based on previous outpatient visits.
- Relationship between hospital stay duration and readmission.
- Admission and discharge-related analysis.

### 3. Python – Exploratory Data Analysis (EDA)

Used Python libraries to explore healthcare data and identify patterns through visualizations.

**Libraries Used:**
- Pandas
- NumPy
- Matplotlib
- Seaborn

**Visualizations Created:**
- Readmission distribution.
- Readmission by age group.
- Readmission by gender.
- Readmission by previous inpatient visits.
- Readmission by previous emergency visits.
- Readmission by hospital stay duration.

### 4. Power BI – Interactive Dashboard

Developed a one-page interactive dashboard to present key performance indicators and readmission trends.

**Key Performance Indicators (KPIs)**

- Total Encounters
- Unique Patients
- Readmitted Within 30 Days
- 30-Day Readmission Rate

**Dashboard Visualizations**

- Readmission distribution.
- Readmission rate by age group.
- Readmission rate by gender.
- Readmission rate by previous inpatient visits.
- Readmission rate by previous emergency visits.
- Readmission rate by hospital stay duration.

**Interactive Filters**

- Age Group
- Gender
- Race
- Admission Type
- Hospital Stay Duration

## 📊 Key Findings & Insights

### Overall Analysis

| Metric | Result |
|---|---:|
| Total Encounters | 101,766 |
| Unique Patients | Approximately 72,000 |
| Readmitted Within 30 Days | 11,357 |
| 30-Day Readmission Rate | 11.16% |

### Important Business Insights

**1. Readmission Distribution**

Approximately 11.16% of hospital encounters resulted in a recorded readmission within 30 days.

**2. Previous Inpatient Visits**

Patients with more previous inpatient visits generally showed higher 30-day readmission rates.

**3. Previous Emergency Visits**

The readmission rate increased with previous emergency visits:

| Previous Emergency Visits | Readmission Rate |
|---|---:|
| 0 Visits | 10.47% |
| 1 Visit | 14.35% |
| 2 Visits | 18.27% |
| 3+ Visits | 24.94% |

**4. Hospital Stay Duration**

Longer hospital stays generally showed higher readmission rates, although the trend was not consistent across every duration.

**5. Previous Outpatient Visits**

Previous outpatient visits did not show a consistent increasing trend in readmission rates.

## 📁 Project Structure

```text
Hospital-Patient-Readmission-Analysis/
│
├── data/
│   └── README.md
│
├── sql/
│   └── patient_readmission_analysis.sql
│
├── python/
│   └── patient_readmission_eda.ipynb
│
├── powerbi/
│   └── patient_readmission_dashboard.pbix
│
│
└── README.md
```


## 💡 Conclusion

This project demonstrates the practical application of SQL Server, Python, and Power BI in healthcare data analytics.

Through data cleaning, SQL querying, exploratory data analysis, and dashboard development, I explored important patterns associated with hospital patient readmission.

The project strengthened my skills in data analysis, data visualization, business problem-solving, and communicating data-driven insights.




