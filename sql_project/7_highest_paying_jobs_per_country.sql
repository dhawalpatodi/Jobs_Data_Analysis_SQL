-- List the highest paying job(s) for each country along with the company name,
-- job title, and average yearly salary. If multiple jobs share the highest salary
-- in a country, show all of them, ordered by salary descending.


SELECT
    job_id,
    job_title,
    name AS company_name,
    job_country,
    FLOOR(salary_year_avg) AS yearly_salary
FROM (
    SELECT
        job_id,
        job_title,
        name,
        job_country,
        salary_year_avg,
        RANK() OVER (PARTITION BY job_country ORDER BY salary_year_avg DESC) AS rnk
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE 
        salary_year_avg IS NOT NULL
    ) AS ranked_jobs
WHERE rnk = 1
ORDER BY yearly_salary DESC;