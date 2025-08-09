-- Find the count of number of remote job postings per skill
-- Display top 5 skills by their demand in remote jobs
-- Include skill_id, skill_name, and count of postings requiring the skills

WITH 
skill_id_count_table AS (
SELECT 
    skill_id,
    COUNT(*) AS skill_count
FROM
    job_postings_fact

INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_work_from_home = TRUE
GROUP BY skill_id
)

SELECT
    skills_dim.skill_id,
    skills AS skill_name,
    skill_count
FROM skill_id_count_table
INNER JOIN skills_dim ON skills_dim.skill_id = skill_id_count_table.skill_id
ORDER BY skill_count DESC
LIMIT 5;
