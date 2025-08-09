
WITH
function AS (
    SELECT
        job_postings_fact.job_id,
        skill_id,
        salary_year_avg AS yearly_salary
    FROM 
        job_postings_fact 
    LEFT JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE salary_year_avg > 70000 AND
    job_posted_date BETWEEN '2023-01-01' AND '2023-03-31' 
    
)

SELECT 
    function.job_id,
    yearly_salary,
    skills,
    type AS skill_type
FROM
    function
LEFT JOIN skills_dim ON skills_dim.skill_id = function.skill_id
ORDER BY yearly_salary ASC