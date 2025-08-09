/*
Question: What skills are required for the top paying data analyst roles
- Use the top 10 highest paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
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
        salary_year_avg IS NOT NULL AND
        (job_title_short LIKE '%Data%Analyst%' OR
        job_title LIKE '%Data%Analyst%') AND
        job_location = 'Anywhere'
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.job_id,
    sjd.skill_id,
    sd.skills AS skill_name,
    salary_year_avg,
    job_title_short,
    company_name
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim AS sjd ON sjd.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id




/*
SQL shows up across the board. It’s a must-have.

Python is also huge, right alongside SQL.

R pops up frequently but less than Python.

Cloud platforms like Azure and Databricks are common too.

Some roles mention big data tools and platforms.

Skills like Tableau or Power BI appear for data visualisation.

The focus is split between coding, querying databases, and working with cloud/big data tech.
*/