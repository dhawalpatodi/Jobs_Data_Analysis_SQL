/*
Question: What are the top skills based on salary for the year 2023?
- Calculate average salary for each skill in the year 2023
- Focus on the top paying Data Analyst roles
- Why? It helps identify which skills are most lucrative in the Data Analyst field, 
  guiding professionals on where to focus their learning and development efforts.
*/

SELECT
    skills_dim.skills,
    ROUND(AVG(job_postings_fact.salary_year_avg),2) AS avg_salary
FROM 
    job_postings_fact
LEFT JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    salary_year_avg IS NOT NULL AND
    (job_title LIKE '%Data%Analyst%' OR
    job_title_short LIKE '%Data%Analyst%') AND
    skills IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY 
    avg_salary DESC
LIMIT 25



