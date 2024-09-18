/*
Question: What are the most in-demand skills for data analysts and data scientists?
- Identify the top 5 in-demand skills for a data analyst and a data scientist.
- First, analyze job postings in Mexico, then include remote job postings in the US and Canada too.   
Main goal: To retrieve the top 5 skills with the highest demand in the job market, in order for me to detect 
the most valuable skills as a job seeker. 
*/ 

--DATA ANALYST (MX)
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_country = 'Mexico'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5

--DATA ANALYST (MX-US-CN)
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND (
        job_country='Mexico' 
        OR (job_country IN ('United States','Canada') 
            AND job_work_from_home = TRUE)
        )
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5

--DATA SCIENTIST (MX)
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND job_country = 'Mexico'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5

--DATA SCIENTIST (MX-US-CN)
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND (
        job_country='Mexico' 
        OR (job_country IN ('United States','Canada') 
            AND job_work_from_home = TRUE)
        )
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5

