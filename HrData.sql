CREATE DATABASE hrdata;
USE hrdata;
SELECT * FROM employees;
-- Total Employees
SELECT COUNT(*) AS Total_Employees
FROM employees;

-- Total Old Employees
SELECT COUNT(*) AS Total_Old_Employees
FROM employees
WHERE DateofTermination!="";


-- Total Current Employees
SELECT COUNT(*) AS Total_Current_Employees
FROM employees
WHERE DateofTermination="";

-- Average Salary
SELECT AVG(Salary) AS Avg_Salary
FROM employees;

-- Average Age
SELECT AVG(TIMESTAMPDIFF(YEAR,STR_TO_DATE(DOB,'%d-%m-%Y'), CURDATE())) AS Avg_Age
FROM employees;

-- Average Years in Company
SELECT AVG(TIMESTAMPDIFF(YEAR,STR_TO_DATE(DateofHire,'%d-%m-%Y'), CURDATE())) AS Avg_years_in_Company
FROM employees;

-- Adding New Column for Employee Current Status
ALTER TABLE employees
ADD EmployeeCurrentStatus INT;

-- Updating values for new column
SET SQL_SAFE_UPDATES=0;
UPDATE employees
SET EmployeeCurrentStatus=CASE
    WHEN DateofTermination=''THEN 1
    ELSE 0
END;

-- Calculate attrition rate based on custom EmpStatusId values
SELECT
      (CAST(COUNT(CASE WHEN EmployeeCurrentStatus=0 THEN 1 END) AS FLOAT)/COUNT(*))*100 AS Attrition_Rate
FROM employees;

-- get column names and data types
DESCRIBE employees;
-- or
SHOW COLUMNS FROM employees;


-- Print 1st 5 rows
SELECT *
FROM employees
LIMIT 5;

-- Print last 5 rows
SELECT * 
FROM employees
ORDER BY EmpId DESC
LIMIT 5;

-- Changing Data Types of Salary
ALTER TABLE employees
MODIFY COLUMN Salary DECIMAL(10,2);

-- Convert all dates columns in proper dates
UPDATE employees
SET DOB=STR_TO_DATE(DOB,'%d-%m-%Y');
UPDATE employees
SET DateofHire=STR_TO_DATE(DateofHire,'%d-%m-%Y');
UPDATE employees
SET LastPerformanceReview_Date=STR_TO_DATE(LastPerformanceReview_Date,'%d-%m-%Y');

ALTER TABLE employees
MODIFY COLUMN DOB DATE,
MODIFY COLUMN DateofHire DATE,
MODIFY COLUMN LastPerformanceReview_Date DATE;

SELECT DOB,DateofHire,DateofTermination,LastPerformanceReview_Date
FROM employees;
DESCRIBE employees;

UPDATE employees
SET DateofTermination='CurrebtlyWorking'
WHERE DateofTermination IS NULL OR DateofTermination='';

-- count of each unique value in the maritalDesc
SELECT MaritalDesc,COUNT(*) AS Count
FROM employees
GROUP BY MaritalDesc
ORDER BY Count DESC;
-- count of each unique value in the department
select department,count(*) as count
from employees
group by department
order by count desc;
-- count of each unique value in the positions
select position,count(*) as count
from employees
group by position
order by count desc;
-- count of each unique value in the manager
select managername,count(*) as count
from employees
group by managername
order by count desc;     
-- salary range
select
case
when salary <  30000 then '< 30k'
when salary between 30000 and 49999 then '30k-49'
when salary between 50000 and 69999 then '50k-69'
when salary between 70000 and 89999 then '70k-89'
when salary >= 90000 then '90k and above'
end as salary_range,
count(*) as frequency
from employees group by salary_range order by salary_range;
-- performance score
select
performancescore,
count(*) as count
from employees
group by performancescore
order by performancescore;
-- average salary departmentb wise
select 
department,
avg(salary) as averageslary
from employees
group by department
order by department;
-- Reason 
select
termreason,
count(*) as count
from employees
where termreason is not null
group by termreason
order by count desc;
-- empolyee count by state
select
state,
count(*) as count
from employees
group by state
order by count desc;
-- m/f 
select
sex,
count(*) as count
from employees
group by sex
order by count desc; 
-- add a new column age
alter table employees
add column age int;
-- update the age column with calculated age 
set sql_safe_updates=0;
update employees
set age = timestampdiff(year,dob,curdate());
-- Age
select 
case
when age < 20 then '< 20'
when age between 20 and 29 then '20-29' 
when age between 30 and 39 then '30-39' 
when age between 40 and 49 then '40-49' 
when age between 50 and 59 then '50-59' 
when age >= 60 then '60 and above'
end as age_range,
count(*) as count
from employees
group by age_range;
-- absencs
select
department,
sum(absences) as totalabsences
from employees
group by department
order by totalabsences desc;
-- salary m/f
select
sex,
sum(salary) as totalsalary
from employees
group by sex
order by totalsalary desc;

select
sex,
avg(salary) as totalsalary
from employees
group by sex
order by totalsalary desc;
-- single or married
select maritaldesc,
count(*) as terminatedcount
from employees
where termd = 1
group by maritaldesc
order by terminatedcount desc;
-- avg access by perfomance score
select 
performancescore,
avg(absences) as averageabsences
from employees
group by performancescore
order by performancescore;
-- requirement score
select
recruitmentsource,
count(*) as employeecount
from employees
group by recruitmentsource
order by employeecount desc;