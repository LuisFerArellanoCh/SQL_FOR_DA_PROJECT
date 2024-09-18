/*
Question: What are the top-paying data analyst and data scientist jobs?
- Identify the top 25 highest-paying Data Analyst roles that are available in Mexico.
- Identify the top 25 highest-paying Data Analyst roles available in the US and Canada as 
remote jobs and compare them to what is offered in Mexico.
- Focus on job postings with specified salaries (remove nulls).
- Do the same analysis but for Data Scientist roles.
Main goal: To highlight the top-paying opportunities for Data Analysts/Data Scientists in my home country and compare
them to remote job opportunities offered in the US and Canada.
*/ 

-- DATA ANALYST ROLES
-- Query for top 25 highest-paying Data Analyst roles in Mexico
SELECT
    name as company_name,
    job_location,
    job_title,
    salary_year_avg,
    job_work_from_home AS remote_job,
    job_schedule_type,
    job_id,
    job_title_short,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_country = 'Mexico'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 25

-- Query for top 25 highest-paying Data Analyst roles in Mexico (remote or not), the US and Canada (remote only).
SELECT
    name as company_name,
    job_country,
    job_title,
    salary_year_avg,
    job_work_from_home AS remote_job,
    job_schedule_type,
    job_id,
    job_title_short,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short ='Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND (
        job_country = 'Mexico'
        OR (job_country IN ('United States', 'Canada') AND job_work_from_home = TRUE)
        )
ORDER BY
    salary_year_avg DESC
LIMIT 25

-- DATA SCIENTIST ROLES
-- Query for top 25 highest-paying Data Scientist roles in Mexico
SELECT
    name as company_name,
    job_location,
    job_title,
    salary_year_avg,
    job_work_from_home AS remote_job,
    job_schedule_type,
    job_id,
    job_title_short,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist'
    AND job_country = 'Mexico'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 25

-- Query for top 25 highest-paying Data Scientist roles in Mexico (remote or not), the US and Canada (remote only).
SELECT
    name as company_name,
    job_country,
    job_title,
    salary_year_avg,
    job_work_from_home AS remote_job,
    job_schedule_type,
    job_id,
    job_title_short,
    job_posted_date 
FROM
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short ='Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND (
        job_country = 'Mexico'
        OR (job_country IN ('United States', 'Canada') AND job_work_from_home = TRUE)
        )
ORDER BY
    salary_year_avg DESC
LIMIT 25

-- Query for top 250 highest-paying Data Scientist roles in Mexico (remote or not), the US and Canada (remote only).
SELECT
    name as company_name,
    job_country,
    job_title,
    salary_year_avg,
    job_work_from_home AS remote_job,
    job_schedule_type,
    job_id,
    job_title_short,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND (
        job_country = 'Mexico'
        OR (job_country IN ('United States', 'Canada') AND job_work_from_home = TRUE)
        )
ORDER BY
    salary_year_avg DESC
LIMIT 250



