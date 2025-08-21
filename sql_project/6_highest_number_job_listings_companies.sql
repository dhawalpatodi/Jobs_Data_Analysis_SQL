-- Return 15 company–country pairs ranked 4th to 18th by total Data Analyst job listings 
-- in Ireland or India, including both full job titles and short job titles containing 'Data Analyst'.


SELECT
    company_dim.company_id,
    name AS company_name,
    job_country AS company_location,
    COUNT(*) as total_listings
FROM
    company_dim
LEFT JOIN job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_country IN ('Ireland', 'India') AND
    (job_title LIKE '%Data%Analyst%' OR
    job_title_short LIKE '%Data%Analyst%')
GROUP BY
    company_dim.company_id, job_country
ORDER BY
    total_listings DESC
LIMIT 15 OFFSET 3

