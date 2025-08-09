/*
Question: What are the top paying data analyst jobs?
- Identift top 10 highest paying data analyst roles that are available remotely
- Focuses on the job postings with specified salaries (remove nulls)
- What companies are paying highest salaries and what is the job location
- Why? Highlight the top paying opportunities for Data Analysts, offering insights into 
*/


SELECT 
    job_id,
    salary_year_avg,
    company_dim.name AS company_name,
    job_title_short,
    job_title,
    job_location,
    job_schedule_type,
    job_country 
FROM 
    job_postings_fact AS jpf
LEFT JOIN company_dim ON company_dim.company_id = jpf.company_id
WHERE 
    salary_year_avg IS NOT NULL AND
    (job_title_short LIKE '%Data%Analyst%' OR
    job_title LIKE '%Data%Analyst%') AND
    job_location = 'Anywhere'
ORDER BY 
    salary_year_avg DESC
LIMIT 10;