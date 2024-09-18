/*
Question: What skills are required for the top-paying data analyst and data scientist jobs?
- Use the top 25 highest-paying Data Analyst jobs from first query.
- Add specific skills required for these roles.
- Do the same analysis but for Data Scientist roles.
Main goal: To take a deeper look at which high-paying jobs demand certain skills in order for me to understand 
which skills I have to develop that align with top salaries.
*/ 

-- DATA ANALYST JOBS (MX)
-- CTE for top 25 highest-paying Data Analyst roles in Mexico
WITH top_paying_jobs AS(
    SELECT
        name as company_name,
        job_location,
        job_title,
        salary_year_avg,
        job_work_from_home AS remote_job,
        job_id,
        job_title_short
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
    LIMIT 25)
-- Query for skills required
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim
 ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
 ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

-- DATA ANALYST JOBS (MX-US-CN)
-- CTE for top 25 highest-paying Data Analyst roles in Mexico (remote or not), US and Canada (remote only)
WITH top_paying_jobs AS(
    SELECT
        name as company_name,
        job_country,
        job_title,
        salary_year_avg,
        job_work_from_home AS remote_job,
        job_id,
        job_title_short
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
    LIMIT 25)
-- Query for skills required
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim
 ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
 ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

-- DATA SCIENTIST JOBS (MX)
-- CTE for top 25 highest-paying Data Scientist roles in Mexico
WITH top_paying_jobs AS(
    SELECT
        name as company_name,
        job_location,
        job_title,
        salary_year_avg,
        job_work_from_home AS remote_job,
        job_id,
        job_title_short
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
    LIMIT 25)
-- Query for skills required
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim
 ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
 ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

-- DATA SCIENTIST JOBS (MX-US-CN)
-- CTE for top 25 highest-paying Data Scientist roles in Mexico (remote or not), US and Canada (remote only)
WITH top_paying_jobs AS(
    SELECT
        name as company_name,
        job_country,
        job_title,
        salary_year_avg,
        job_work_from_home AS remote_job,
        job_id,
        job_title_short
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
    LIMIT 25)
-- Query for skills required
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim
 ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
 ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC


