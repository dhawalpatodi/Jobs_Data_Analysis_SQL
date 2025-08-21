# Data Analysis on Job Postings Dataset

## Introduction  
This project explores a job postings dataset containing millions of records. The focus is on uncovering insights about job availability, company representation, skill demand, and salary distribution. SQL queries were used to analyze the dataset and summarize key patterns in hiring.

## Background  
The dataset consists of four main tables:  
- **job_postings_fact**: Detailed information about each job posting.  
- **company_dim**: Information about companies posting jobs.  
- **skills_dim**: A list of unique skills.  
- **skills_job_dim**: Mapping between job postings and required skills.  

The goal was to write SQL queries to answer specific questions about the dataset and gain insights into hiring trends and skill demand.

## Tools I Used  
- **SQL** for querying and analysis  
- **PostgreSQL** as the database system  
- **VS Code / SQL Editor** for writing and running queries  

## The Analysis  

Here’s what each of the 7 main queries revealed:  

1. **Total Rows in Each Table**  
   - job_postings_fact: **787,686 rows**  
   - company_dim: **140,033 rows**  
   - skills_dim: **259 rows**  
   - skills_job_dim: **3,669,604 rows**  
   → This confirmed dataset size and relationships across tables.  

2. **Number of Unique Job Titles**  
   - Found **1,481 distinct job titles**.  
   → The dataset covers a wide range of roles, not just repeated postings of a few jobs.  

3. **Top 5 Job Titles by Number of Postings**  
   - Most frequent: **Data Engineer, Data Scientist, Business Analyst, Data Analyst, Machine Learning Engineer**.  
   → Shows the most in-demand roles across the dataset.  

4. **Top 10 Companies Posting the Most Jobs**  
   - Companies like **Deloitte, PwC, Accenture** appeared in the top.  
   → Highlights which organizations are most active in hiring.  

5. **Number of Unique Skills in the Dataset**  
   - Found **259 unique skills**.  
   → The skills list is broad but finite, making it easier to analyze which ones dominate demand.  

6. **Top 5 Most Frequently Required Skills**  
   - Most common: **SQL, Python, Excel, Tableau, AWS**.  
   → Confirms technical skills remain the core requirements for data-related roles.  

7. **Average Salary by Job Title (Top Paying Jobs)**  
   - Highest average salaries: **Machine Learning Engineer, Data Scientist, Data Architect**.  
   → Specialized technical roles command the highest pay.  

## What I Learned  
- How to structure queries to explore large datasets.  
- How job demand, company activity, and salary distribution connect in real data.  
- That SQL and Python are still the top skills for analytics and data science roles.  
- How to compare insights across multiple tables (facts + dimensions).  

## Conclusions  
- The dataset confirms strong demand for data-focused roles like **Data Engineer and Data Scientist**.  
- Consulting firms and tech companies are among the most frequent employers.  
- **SQL, Python, and Excel** are still essential skills, while tools like **Tableau** and **AWS** boost demand.  
- Roles involving advanced machine learning and architecture tend to pay the highest salaries.  

This analysis gives a clear picture of where the demand is, which companies hire most actively, and which skills job seekers should focus on.  
