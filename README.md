# 🧑‍💼 HR Data Analysis with SQL

This project involves analyzing an HR dataset using SQL to uncover key insights about employee distribution, attrition, departmental performance, salary trends, and more. The analysis helps HR teams make data-driven decisions related to workforce planning and employee retention.

## 📁 Project Structure


## 📌 Objectives

- Explore employee data using SQL queries
- Identify attrition patterns
- Analyze department-wise employee metrics
- Understand salary distribution and satisfaction levels
- Provide actionable HR insights

## 🧰 Tools & Technologies

- **SQL** (MySQL / PostgreSQL / SQLite)
- SQL client or IDE (e.g., MySQL Workbench, DB Browser for SQLite)
- Dataset: HR employee data

## 🔍 Key SQL Queries

- Total employees, departments, and job roles
- Employees by department and gender
- Employees with low satisfaction and high working hours
- Attrition count by department and job role
- Salary range and average by department

## 🧪 Sample Queries

```sql
-- Number of employees by department
SELECT department, COUNT(*) AS employee_count
FROM hr_data
GROUP BY department;

-- Attrition analysis
SELECT department, COUNT(*) AS attrition_count
FROM hr_data
WHERE attrition = 'Yes'
GROUP BY department;

-- Average salary by job role
SELECT job_role, AVG(salary) AS avg_salary
FROM hr_data
GROUP BY job_role;


📊 Insights Generated
Departments with highest attrition rates

Average working years vs. employee satisfaction

Gender distribution across departments

Roles with above-average salaries and low attrition

Relationship between overtime and attrition

📄 Dataset Info
Fields: EmployeeID, Age, Gender, Department, JobRole, Education, MonthlyIncome, SatisfactionLevel, Attrition, OverTime, etc.

Source: Public HR dataset (Kaggle or synthetic)

🚀 How to Use
Import hr_data.csv into your SQL database

Run queries from hr_sql_queries.sql using your SQL client

Analyze and interpret the results
