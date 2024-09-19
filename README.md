# SQL for Data Analytics
## Introduction
Welcome to my first approach to Data Analysis📊! 

The purpose of this project was for me to learn SQL while exploring the data job market, specifically looking for Data Analyst and Data Scientist roles in Mexico🇲🇽, the US🇺🇸 and Canada🇨🇦! I focused on 💵top-paying jobs and on 📈high in-demand skills required for these roles. Let´s get started!     

🎯SQL queries used in this project can be found here: [project_sql](/project_sql/) 

## Background
Hello! My name is Luis Fer Arellano. I am a mexican 🔬Bionanotechnology engineer. For the past year, the world of Data Analysis has become more and more interesting to me, so I finally decided to start developing a career in this field. 

Searching for online guidance, I found Luke Barousse´s and Kelly Adam´s [SQL for Data Analytics](https://www.lukebarousse.com/sql) course, which I thought was the more intriguing when I learned about the data (provided by the course) I was going to work with: a collection of job postings for data related jobs (data analyst, data scientist, software engineer and more) that included job titles, salaries, locations, and skills required.

Since I had no idea where to start my journey in Data Analysis, I realized this was a great oportunity to not only learn the basics in SQL, but to dive into the job market of a career I´ve just taken my first baby steps in.

As I currently live in my home country, I focused my queries to find useful information regarding Data Analyst roles in Mexico, as well as job postings from the US and Canada that allowed work from home. Plus, as I also have an interest in Data Science because of my academic background, I decided to search for Data Scientist postings too.

**In that sense, I wrote my SQL queries to answer the next questions:**
1. What are the top-paying data analyst and data scientist jobs?
2. What skills are required for the top-paying data analyst and data scientist jobs?
3. What are the most in-demand skills for data analysts and data scientists?
4. What are the top 25 skills based on salary? 
5. What are the most optimal skills (high demand + high-paying) to learn?

## Tools I used
In order to carry out my analysis on the data job market, I used several tools:
- **SQL**: The fundamental skill I wanted to develop in this project; a language that allowed me to query the database based on what I wanted to find.
- **PostgreSQL**: My first approach to a database management system.
- **Visual Studio Code**: A simple and organized way to manage a database and execute SQL queries.
- **Git & GitHub**: Heard these two mentioned many times by my software engineer friends, now I finally got to used them! Essential tools for version control, project tracking and sharing. 
## Analysis and Results
Each of the questions in the Background section were approached using multiple queries to satisfy two different aspects of the project. First, I wanted to analyze all Data Analyst job postings available in Mexico, and then, add the US and Canada (searching for remote jobs) to put in context what is offered in my country versus what is offered in neighboring countries. Second, I wanted to do the same but for Data Scientist roles. 

To accomplish this, each question was tackled using four different queries that always had the same characteristics:

- **First query**: Filters for all data analyst positions in Mexico.
- **Second query**: Filters for data analyst positions in Mexico (remote or not), as well as in the US and Canada (remote-only).  
- **Third and fourth queries**: Same as first and second queries but for data scientist positions.

### 1. What are the top-paying data analyst and data scientist jobs?

I filtered data analyst/scientist positions by average yearly salary (US dollar) and location, and I limited the query to the top-25 highest paying roles. I also filtered for job postings that had a salary value (aka not NULL).   

```sql
-- First query: Top 25 highest-paying Data Analyst roles in Mexico
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
```
What I found:
- **Salary Insights**: 
    - Top 3: Data Architect for DigitalOnUs ($165,000); Analytics Engineer for Nubank ($147,000); AML Data Analyst for Nubank ($111,202).
    - Top 25 salary range: from $70,500 to $165,000.

- **Types of Companies**: The top companies include tech giants like Nubank and Lyft, as well as consulting and logistics firms such as Averna and Charger Logistics. This indicates a diverse range of industries seeking data analytics expertise, with a strong presence of financial technology and logistics companies.

- **Job Titles**: Common job titles include "Data Analyst," "Analytics Engineer," and specialized roles like "AML Data Analyst" and "Data Architect." The variety of titles reflects the growing need for both general and niche analytics skills, suggesting a trend towards specialization in the field.

- **Job Location**: Most high-paying data analyst roles are concentrated in major urban areas like Mexico City, State of Mexico, and Monterrey. This trend highlights the importance of geographic location in accessing top-tier opportunities, with cities serving as key hubs for tech and finance industries.

```sql
-- Second query: Top 25 highest-paying Data Analyst roles in Mexico (remote or not), the US and Canada (remote only).
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
```
What I found:
- **Salary insights**: 
    - Top 3: Director of Analytics for Meta (US) ($336,500); Associate Director Data Insights for AT&T (US) ($255,829); Data Analyst Marketing for Pinterest (US) ($232,423).
    - Top 25 salary range: from $152,625 to $336,500.

- **Mexico's place in the top 25**: The average salary per year for the highest-paying data analyst roles in the US is significantly higher than in Mexico, with top roles exceeding $300,000, while the highest salaries in Mexico hover around $165,000, placing them at the lower half of the list.

- **Job Location**: The majority of high-paying data analyst positions are located in the United States, reflecting a stronger demand and higher budget for analytics roles compared to Canada and Mexico, where fewer top-paying opportunities exist.

- **Types of Company**: Tech giants like Meta and Uber dominate the highest salary brackets, indicating that major technology firms are willing to invest significantly in data analytics talent. The healthcare sector also presents lucrative opportunities, particularly in the US, with roles at institutions like Mayo Clinic.

```sql
-- Third query: Top 25 highest-paying Data Scientist roles in Mexico
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
```
What I found:
- **Salary insights**: 
    - Top 3: Data Scientist for Zillow ($164,500); Data Scientist for Bosch Group ($157,500); - Data Scientist for DigitalOnUs ($157,500).
    - Top 25 salary range: from $63,000 to $164,500.

- **Types of Company**: Companies span various industries, including technology (Zillow, DigitalOnUs), logistics (Arrive Logistics), and automotive (Bosch Group), showcasing a broad demand for data science talent across sectors.

- **Job Location**: High-paying positions are primarily located in major cities like Mexico City and Guadalajara, reflecting the concentration of data-driven companies and opportunities in urban areas.

```sql
-- Fourth query: Top 25 highest-paying Data Scientist roles in Mexico (remote or not), the US and Canada (remote only).
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
```
What I found:
- **Salary insights**
    - Top 3: Quant Researcher for Selby Jennings (US) ($550,000); Business Analytics for Selby Jennings (US) ($525,000); Data Scientist for Algo Capital Group (US) ($375,000).
    - Top 25 salary range: from $240,000 to $550,000.

- **US domination**: The top-25 highest-paying data scientist roles in North America are all found in the US (remember: US and Canada are remote jobs only). Mexico only appears in the list when expanding the query to top 250.

- **Types of Company**: Many of the top-paying roles are found in tech companies (like Reddit) and finance-related sectors (like Algo Capital Group), indicating that industries focusing on data-driven decision-making are willing to offer premium salaries.

### 2. What skills are required for the top-paying data analyst and data scientist jobs?

I used the top 25 highest-paying jobs from each query answering question 1 and I associated the required skills to each job posting.

```sql
-- First query: DATA ANALYST JOBS (MX)
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
```
What I found:
- Skills like **SQL**, **Python**, **R**, and **Excel** are frequently associated with roles that have similar average salaries.
- Specialized skills like **Looker** and **Scala** stand out with higher average salaries, indicating a premium for expertise in these areas.
- **AWS**, while widely required, also aligns with roles paying around the average but does not outpace SQL and Python in demand.

```sql
-- Second query: DATA ANALYST JOBS (MX-US-CN)
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
```
What I found:
- Both the first and second query results prioritize *foundational skills* like **SQL**, **Python**, and **Tableau**, essential for data analysis roles.
- The first query results (only Mexico) emphasizes *traditional analytical tools* (**SPSS**, **SAS**), while the second query results (Mexico + US and Canada)  highlights *big data technologies* (**AWS**, **Databricks**).
- **Emerging Technologies**: Jobs from US and Canada tend to require more modern tools and languages (**Pyspark**, **Go**, **GitLab**), reflecting a demand for data engineering and collaboration skills.

```sql
-- Third query: DATA SCIENTIST JOBS (MX)
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
```
What I found:
- **Types of Skills**: Programming skills (**Python**, **SQL**), data visualization tools (**Tableau**), and machine learning frameworks (**TensorFlow**, **Keras**) are highlighted as critical for data science roles.

- **Types of Companies**: Companies such as Zillow, Bosch Group, and DigitalOnUs are prominently hiring for these skills, representing industries ranging from technology and manufacturing to logistics.

```sql
-- Fourth query: DATA SCIENTIST JOBS (MX-US-CN)
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
```
What I found:
- Jobs in the US include a significant focus on emerging technologies and frameworks (**Spark**, **Hadoop**, **NoSQL**), indicating a trend towards modern data engineering practices. 
- The US job postings tend to require cutting-edge skills (machine learning frameworks and big data technologies), reflecting a more advanced market. In contrast, Mexico and Canada may focus more on foundational skills and tools, indicating a growing but still developing data science landscape. 

### 3. What are the most in-demand skills for data analysts and data scientists?
I identified the top 5 in-demand skills for a data analyst/data scientist by aggregating every job posting that had a particular skill associated to each of them. I grouped the results by skill, ordered the skills from most to least repeated, and limited the query to 5 skills only. 

```sql
-- First query: DATA ANALYST (MX)
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
```
What I found:
![4q1](assets\4q1.jpg)

```sql
--Second query: DATA ANALYST (MX-US-CN)
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

```
What I found:
![](assets\4q2.jpg)

**Comparing Mexico-only vs Mexico + US and Canada:**

Both the first and second query results show the same trend: **SQL** and **Excel** lead the list, indicating a strong emphasis on data querying and manipulation; **Python** follows in third place, showing the need for programming skills regarding data analysis and automation tasks; finally, **Tableau** and **Power BI** reflect the demand for data visualization tools, important in data storytelling and in decision making processes.     

```sql
--Third query: DATA SCIENTIST (MX)
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
```
What I found:
![](assets\4q3.jpg)

```sql
--Fourth query: DATA SCIENTIST (MX-US-CN)
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
```
What I found:
![](assets\4q4.jpg)

**Similar trends...** 

Akin to the Data Analyst queries, both the third and fourth query results share similarities: **Python**, **SQL**  and **R** (statistical analysis) lead the top 3 skills. Both queries threw **Tableau** as another top skill, however, when looking at just job postings in Mexico, it scored higher compared to looking at job postings from the 3 countries. **AWS** (cloud computing) appeared in the third query results while **SAS** (statistical analysis, risk modeling) showed up in the fourth one.

### 4. What are the top 25 skills based on salary? 
I identified the top 25 skills based on salary for a data analyst/data scientist by grouping the average of every job posting´s yearly salary by skill. I ordered the skills based on average salary from highest to lowest, and limited the query to 25 skills only.

```sql
--First query: DATA ANALYST (MX)
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
```
What I found:
![](assets\Fq1.jpg)

```sql
--Second query: DATA ANALYST (MX-US-CN)
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
```
What I found:
![](assets\Fq2.jpg)

**Comparing Mexico-only vs Mexico + US and Canada:**
- The highest-paying skill in the second query results (Mexico, US, Canada) is **PySpark** at $208,172, significantly higher than **Scala** at $147,500 from the first query result (Mexico only), highlighting the broader salary range in the region.
- Skills like **PySpark**, **Bitbucket**, **Couchbase**, **Watson** or **Gitlab** that appear in the top 25 from the second query are not listed in the top 25 from the first one, which suggests that the North American market puts more emphasis on advanced data processing, cloud technologies, and collaborative tools compared to the mexican market.    
- The next chart shows skills that appear in both first and second query results:
![](assets\ft1.png)

- **Scala** is a skill that is, in average, better paid in Mexico compared to the broader North American market. However, it is the exact opposite for the rest of skills (**Pandas**, **NumPy** and **Swift**), which show a substantial salary increase as seen in the results retrieved from the 3 countries.

```sql
--Third query: DATA ANALYST (MX-US-CN)
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
```
What I found:
![](assets\Fq3.jpg)

```sql
--Fourth query: DATA SCIENTIST (MX-US-CN)
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
```
What I found:
![](assets\Fq4.jpg)

**Different trends...**
- The top 25 skills from the third query (Mexico) suggest a focus on traditional data science tools (**SQL**, **Python**, **R**, **Pandas**) as well as a strong presence of visualization libraries (**Seaborn**, **Matplotlib**).
- In comparison, the top 25 skills from the fourth query (North American market) show an emphasis on newer programming languages and technologies (**Golang**, **Elixir**) as well as on big data tools (**Microstrategy**, **BigQuery**).
- The only skill that appears in both top 25 lists is **Jira**, which has a higher average salary in Mexico compared to the combined market of the 3 countries.

### 5. What are the most optimal skills (high demand + high-paying) to learn? 
I identified the top 25 most optimal skills to learn based on high demand and associated with high average salaries for a data analyst/data scientist. I did it by joining the queries from the third and fourth question and ordering the skills first based on average salary from highest to lowest and then based on the skill demand. I limited the query to 25 skills only.

As results, I have listed the skills retrieved from the top 25 lists generated from the queries that show a high demand count (remember, they are first filtered by average salary and are part of the top 25 highest-paid). 

```sql
--First query: DATA ANALYST (MX)
--Question 3 as a CTE
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_country = 'Mexico'
    GROUP BY
        skills_dim.skill_id),
--Question 4 as a CTE
    average_salary AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg),0) AS avg_salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_country = 'Mexico'
    GROUP BY
        skills_dim.skill_id)
--Query for optimal skills
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary
    ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT
    25
```

```sql
--Second query: DATA ANALYST (MX-US-CN)
--Question 3 as a CTE
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_country IN ('Mexico','United States', 'Canada')
    GROUP BY
        skills_dim.skill_id),
--Question 4 as a CTE
    average_salary AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg),0) AS avg_salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_country IN ('Mexico','United States', 'Canada')
    GROUP BY
        skills_dim.skill_id)
--Query for optimal skills
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary
    ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT
    25
```
What I found:

**Data Analyst roles**

**Skills for jobs in Mexico**
- AWS, Bigquery, Github, R, SQL, Python, Azure, Pandas, Looker, Excel, Power BI, Tableu 

**Skills for jobs in North American market**
- Bitbucket, gitlab, Cassandra, Notion, Perl, Kafka, Airflow, PySpark, GCP

```sql
--Third query: DATA SCIENTIST (MX)
--Question 3 as a CTE
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Scientist'
        AND job_country = 'Mexico'
    GROUP BY
        skills_dim.skill_id),
--Question 4 as a CTE
    average_salary AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg),0) AS avg_salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Scientist'
        AND salary_year_avg IS NOT NULL
        AND job_country = 'Mexico'
    GROUP BY
        skills_dim.skill_id)
--Query for optimal skills
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary
    ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT
    25
```

```sql
--Fourth query: DATA SCIENTIST (MX-US-CN)
--Question 3 as a CTE
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Scientist'
        AND job_country IN ('Mexico','United States', 'Canada')
    GROUP BY
        skills_dim.skill_id),
--Question 4 as a CTE
    average_salary AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg),0) AS avg_salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Scientist'
        AND salary_year_avg IS NOT NULL
        AND job_country IN ('Mexico','United States', 'Canada')
    GROUP BY
        skills_dim.skill_id)
--Query for optimal skills
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary
    ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT
    25
```
What I found:

**Data Scientist roles**

**Skills for jobs in Mexico**
- Flow, SQL server, Scikit-Learn, Pandas, Numpy, Python, R, Tensorflow, Keras, Azure, SQL, SAP

**Skills for jobs in North American market**
- Watson, Notion, Slack, Rshiny, Neo4j, Dplyr, Express, Hugging Face, Bigquery, Looker, Atlassian

## Conclusions
Based on the results I gathered, I think I can confidently say I accomplished my goal on learning how to use SQL to retrieve specific information from a database, as I managed to explore the data job market to get a good picture of what kind of opportunities are available for a Data Analyst or a Data Scientist. Here are the summarized insights:    

- **Work-from-home jobs💻 are substantially better paid in the US!** The overwhelming majority of the highest-paid jobs in Mexico do not allow working remotely. 
- For Data Analysts, skills💹 like **SQL, Python, Excel, Power BI and Tableu** seem to be a priority for landing a well-paid job in the Mexican market!
- Most data-related jobs in Mexico🇲🇽 are located in big urban areas like **Mexico City, State of Mexico, Monterrey and Guadalajara**!
- Finally, it appears that the Mexican market for data-related jobs is generally behind of the North American one based on the type of skills required, as the former demands more fundamental tools🔨 while the latter is looking for emerging technologies🚀.   

## Final thoughts
This was a fun first project!🎆 

Apart from everything I learned about the data job market, I am very happy about my SQL skills as I basically started from zero and now I know many things like joining tables, taking advantage of CTEs and using aggregate functions! 

I'm excited to learn more about SQL and I already want to make use of it in future projects😁    

I want to thank Luke Barousse again for being a great teacher🏫, and I want to thank everyone who reads this👋 

I'm thrilled to continue my journey into the data world!🌎