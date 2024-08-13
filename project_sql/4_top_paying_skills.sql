/*
What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    round(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg is not null
    AND job_work_from_home = TRUE
GROUP BY skills 
ORDER BY avg_salary DESC
LIMIT 25

/*
Big Data and AI/ML Tools Dominate: Skills like PySpark and DataRobot command high salaries, reflecting the strong demand for big data processing and machine learning automation.

DevOps and Version Control: Tools like Bitbucket and GitLab are highly valued, indicating that expertise in version control and DevOps practices is crucial for securing top-paying roles.

Specialized Technical Skills: High salaries are associated with niche skills like Couchbase (NoSQL databases) and Elasticsearch (search and analytics engines), emphasizing the value of specialized knowledge in the tech industry.
*/