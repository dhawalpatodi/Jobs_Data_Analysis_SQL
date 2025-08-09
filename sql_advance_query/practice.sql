SELECT
    company_id,
    name AS company_name
FROM
    company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM
        job_postings_fact
    WHERE
        job_title_short = 'Data Analyst' AND
        job_country = 'Ireland' AND
        job_title_short NOT LIKE '%Senior%'
    ORDER BY
        salary_year_avg DESC
);



SELECT
    counts.hiring_count,
    c.name AS company_name,
    c.company_id
FROM
    company_dim c
JOIN
    (
        SELECT 
            company_id,
            COUNT(*) AS hiring_count
        FROM 
            job_postings_fact
        WHERE
            job_title_short = 'Data Analyst' AND
            job_country = 'Ireland' AND
            job_title_short NOT LIKE '%Senior%'
        GROUP BY 
            company_id
    ) AS counts
ON
    c.company_id = counts.company_id
ORDER BY 
    counts.hiring_count DESC;
