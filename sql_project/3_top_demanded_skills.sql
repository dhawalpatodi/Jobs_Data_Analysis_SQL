/*
Question: What are th most demanded skills for data analyst roles?
- Identify the top 10 in-demand skills for Data Analysts
- Focus on all job postings
*/

WITH 
top_paying_jobs AS (
    SELECT 
        job_id,
        salary_year_avg,
        company_dim.name AS company_name,
        job_title_short,
        job_title
    FROM 
        job_postings_fact AS jpf
    LEFT JOIN company_dim ON company_dim.company_id = jpf.company_id
    WHERE 
        (job_title_short LIKE '%Data%Analyst%' OR
        job_title LIKE '%Data%Analyst%')
)

SELECT
    sd.skills AS skill_name,
    COUNT(*) as skill_count
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim AS sjd ON sjd.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
GROUP BY sd.skills
ORDER BY skill_count DESC
LIMIT 10