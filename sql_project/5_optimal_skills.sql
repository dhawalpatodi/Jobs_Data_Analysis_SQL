/*
Question: What are the most optimal skills to learn (aka in high demand and high paying) for Data Analysts?
- Identify skills in high demand and associated with high average salaries for data analyst roles
- Why? It helps job seekers focus on skills that not only are sought after but also command higher salaries, maximizing their career potential.
*/

WITH 
skills_demand AS (
    WITH 
    top_paying_jobs AS (
        SELECT 
            job_id,
            salary_year_avg,
            company_dim.name AS company_name,
            job_title_short,
            job_title,
            job_country
        FROM 
            job_postings_fact AS jpf
        LEFT JOIN company_dim ON company_dim.company_id = jpf.company_id
        WHERE 
            (job_title_short LIKE '%Data%Analyst%' OR
             job_title LIKE '%Data%Analyst%')
            AND job_country IN ('Ireland', 'India', 'UK', 'USA', 'Germany')
    )
    SELECT
        sd.skill_id,
        sd.skills,
        COUNT(*) AS skill_count
    FROM 
        top_paying_jobs
    INNER JOIN skills_job_dim AS sjd ON sjd.job_id = top_paying_jobs.job_id
    INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
    GROUP BY sd.skill_id, sd.skills
), 

average_salary AS (
    SELECT
        sd.skill_id,
        sd.skills,
        ROUND(AVG(jpf.salary_year_avg), 2) AS avg_salary
    FROM 
        job_postings_fact AS jpf
    LEFT JOIN skills_job_dim AS sjd ON sjd.job_id = jpf.job_id
    LEFT JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
    WHERE 
        jpf.salary_year_avg IS NOT NULL
        AND (jpf.job_title LIKE '%Data%Analyst%' OR
             jpf.job_title_short LIKE '%Data%Analyst%')
        AND sd.skills IS NOT NULL
    GROUP BY sd.skill_id, sd.skills
)

SELECT 
    sd.skill_id,
    sd.skills,
    sd.skill_count,
    av.avg_salary
FROM
    skills_demand sd
INNER JOIN average_salary av ON sd.skill_id = av.skill_id
ORDER BY
    sd.skill_count DESC,
    av.avg_salary DESC;
