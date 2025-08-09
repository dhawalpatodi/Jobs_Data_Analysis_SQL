-- skills; skill_id type

SELECT *
FROM skills_job_dim;


SELECT *
FROM skills_dim;

-- Select top 5 skills
-- use subquery to find skill_id with highest count in skills_job_dim
-- then join this result with skills_dim to get the skills name

SELECT 
    skill_id AS top_skill_id,
    COUNT(*) as skill_count
FROM skills_dim
GROUP BY skill_id
ORDER BY skill_count ASC
LIMIT 5;    

SELECT 
  skill_id,
  COUNT(*) AS skill_count
FROM skills_dim
GROUP BY skill_id
ORDER BY skill_count DESC
LIMIT 5;

-- not solved yet
  