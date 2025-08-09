SELECT * FROM job_postings_fact
LIMIT 10;

SELECT '2023-04-03'::DATE;

SELECT
    job_title_short AS Title,
    job_location AS location,
    (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') AS date,
    EXTRACT(MONTH FROM job_posted_date) AS month,
    EXTRACT(YEAR FROM job_posted_date) AS year
FROM
    job_postings_fact
LIMIT 10;

SELECT 
    COUNT(job_id),
    EXTRACT(month FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    count(job_id) DESC;





