SELECT 
    COUNT(job_id) AS total_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location IN ('Mumbai','Bangalore','Delhi NCR', 'India', 'Bengaluru') THEN 'India'
        ELSE 'Abroad'
    END AS job_location_category
FROM job_postings_fact
GROUP BY job_location_category;

-- Above code will not work,
-- because job_location_category is not a column in the table.
-- Instead, we can use a subquery to categorize job locations.

-- Here is the corrected version:

SELECT 
    job_location_category,
    COUNT(*) AS total_jobs
FROM (
    SELECT
        job_id,
        CASE
            WHEN job_location = 'Anywhere' THEN 'Remote'
            WHEN job_location IN ('Mumbai','Bangalore','Delhi NCR', 'India', 'Bengaluru') THEN 'India'
            ELSE 'Abroad'
        END AS job_location_category
    FROM job_postings_fact
    WHERE job_title_short = 'Data Analyst'
) AS t
GROUP BY job_location_category;


SELECT 
    job_title_short,
    job_via,
    salary_year_avg
FROM job_postings_fact
WHERE job_country = 'Ireland' AND
      job_title_short like '%Data%' AND
      job_title_short not like '%Senior%'
ORDER BY salary_year_avg DESC;

SELECT 
    job_via,
    COUNT(job_via) AS job_count
FROM job_postings_fact
WHERE job_country = 'Ireland' AND
      job_title_short like '%Data%' AND
      job_title_short not like '%Senior%'
GROUP BY job_via
HAVING COUNT(job_via) > 75
ORDER BY COUNT(job_via) DESC;
    