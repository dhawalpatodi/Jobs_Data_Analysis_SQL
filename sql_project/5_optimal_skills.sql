/*
Question: What are the most optimal skills to learn(aka in high demand and high paying) for Data Analysts?
- Identify skills in high demand and associawith high average salaries for data analyst roles
- Why? It helps job seekers focus on skills that not only are sought after but also command higher salaries, maximizing their career potential.
*/


WITH 
skills_demand  AS (
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
            job_title LIKE '%Data%Analyst%') AND
            job_country IN ('Ireland', 'India', 'UK', 'USA', 'Germany')
    )

    SELECT
        sjd.skill_id,
        sd.skills AS skill_name,
        COUNT(*) as skill_count
    FROM 
        top_paying_jobs
    INNER JOIN skills_job_dim AS sjd ON sjd.job_id = top_paying_jobs.job_id
    INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
    GROUP BY sd.skill_id
), 

average_salary AS (
    SELECT
        skills_demand.skill_id,
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
        skills_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    skill_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id



WITH 
skills_demand  AS (
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
            job_title LIKE '%Data%Analyst%') AND
            job_country IN ('Ireland', 'India', 'UK', 'USA', 'Germany')
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
        jpf.salary_year_avg IS NOT NULL AND
        (jpf.job_title LIKE '%Data%Analyst%' OR
         jpf.job_title_short LIKE '%Data%Analyst%') AND
        sd.skills IS NOT NULL
    GROUP BY sd.skill_id, sd.skills
)

SELECT 
    sd.skill_id,
    sd.skills,
    skill_count,
    avg_salary
FROM
    skills_demand sd
INNER JOIN average_salary av ON sd.skill_id = av.skill_id
ORDER BY
    skill_count DESC,
    avg_salary DESC;
