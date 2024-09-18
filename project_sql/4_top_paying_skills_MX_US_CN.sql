/*
Question: What are the top 25 skills based on salary?
- Look at the average salary associated with each skill for Data Analyst and Data Scientist positions.
- Focus on roles with specified salaries.
Main goal: To understand how different skills impact salary levels for both Data Analyst and Data Scientists, 
and to identify the most financially rewarding skills to acquire.
*/

--DATA ANALYST (MX)
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_country = 'Mexico'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

--DATA ANALYST (MX-US-CN)
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND (
        job_country='Mexico' 
        OR (job_country IN ('United States','Canada') 
            AND job_work_from_home = TRUE))
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

--DATA SCIENTIST (MX)
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_country = 'Mexico'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

--DATA SCIENTIST (MX-US-CN)
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND (
        job_country='Mexico' 
        OR (job_country IN ('United States','Canada') 
            AND job_work_from_home = TRUE))
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25