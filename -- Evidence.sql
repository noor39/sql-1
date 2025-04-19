-- Evidence
-- ________________________________________
-- 1.	
-- 2.	The HR department needs a query to display all unique job codes from the EMPLOYEES table.
-- 3.	The HR department wants a query to display the last name, job code, hire date, and employee number for each employee, with employee number appearing first. Name the column headings Emp #, Employee, Job, and Hire Date, respectively.
-- 4.	The HR department has requested a report of all employees and their job IDs. Display the last name concatenated with the job ID (separated by a comma and space) and name the column Employee and Title.
-- 5.	Create a report to display the last name, job ID, and start date for the employees with the last names of Matos and Taylor. Order the query in ascending order by start date.
-- 6.	To display the last name and salary of employees who earn between $5,000 and $12,000 and are in department 20 or 50. Label the columns Employee and Monthly Salary, respectively.
-- 7.	The HR department needs a report that displays the last name and hire date for all employees who were hired in 2005.
-- 8.	Create a report to display the last name, salary, and commission of all employees who earn commissions. Sort data in descending order of salary and commissions. Use the column’s numeric position in the order by clause.
-- 9.	Display the last names of all employees who have both an “a” and an “e” in their last name.
-- 10.	Display each employee’s last name, hire date, and salary review date, which is the first Monday after six months of service. Label the column REVIEW. Format the dates to appear in the format similar to “Monday, the Thirty-First of July, 2000.” 
-- 11.	Create a query that displays the employee’s last names and commission amounts. IF an employee does not earn commission, show “No Commission.” Label the column COMM. 
-- 12.	Display the last name, hire date, and day of the week on which the employee started. Label the column DAY. Order the results by the day of the week, starting with Monday. 
-- 13.	Determine the number of managers without listing them. Label the column Number of Managers.  
-- Hint: Use the MANAGER_ID column to determine the number of managers. 
-- 14.	Create a report to display the manager number and the salary of the lowest-paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6,000 or less. Sort the output in descending order of salary. 
-- 15.	The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee. Label the column New Salary. 
-- Modify your above query to add a column that subtracts the old salary from the new salary. Label the column Increase.
-- 16.	Write a query that displays the last name (with the first letter In uppercase and all the other letters in lowercase) and the length of the last name for all employees whose name starts with the letters ”J”,  ”A”, or “M”. Give each column an appropriate label. Sort the results by the employees’ last names.
-- 17.	The HR department wants to find the duration of employment for each employees. For each employee, display the last name and calculate the number of months between today and the date on which the employee was hired .label the column as months worked .order your results by the number of months employed. Round the number of months up to the closest whole number.
-- 18.	Create a query to display the last name and salary for all employees, Format the salary to be 15 characters long, left-padded with the $ symbol. Label the column SALARY.
-- 19.	Create a query that displays the first eight characters of the employees’ last names and indicates the amounts of their salaries with asterisks. Each asterisk signifies a thousand dollars. Sort the data in descending order of salary. Label the column EMPLOYEES_AND_THEIR_SALARIES.
-- 20.	Create a query to display the dates in a format that appears as “Seventeenth of June  2003 12:00:00 AM.”
-- 21.	Create a report to display the last name and job title of all employees who do not have a manager.
-- 22.	The HR department needs a query that prompts the user for an employee last name. The query then displays the last name and hire date of any employee in the same department as the employee whose name they supply (excluding that employee). For example, if the user enters Zlotkey, find all employees who work with Zlotkey (excluding Zlotkey).
-- 23.	The HR department needs a report that displays the last name, department number, and job ID of all employees whose department location ID is 1700.
-- 24.	Create a report that display a list of all employees whose salary is more than the salary of any employee from department 60
-- 25.	The HR department needs a report of employees in Toronto. Display the last name, job, department number, and department name for all employees who work in Toronto.
-- 26.	Create a report for the HR department that displays employee last names, department numbers, and all the employees who work in the same department as a given employee. Give each column an appropriate label.
-- 27.	The HR department wants to determine the names of all the employees who were hired after Davies. Create a query to display the name and hire date of any employee hired after employee Davies.


-- Evidence
-- ________________________________________
-- 1. The HR department wants a query to display the last name, job code,
--  hire date, and employee number for each employee, with employee number appearing first.
--  Provide an alias STARTDATE for the HIRE_DATE column.

SELECT employee_id,last_name,job_id,hire_id "STARTDATE"
FROM EMPLOYEES;

-- 2.	The HR department needs a query to display all unique job codes from the EMPLOYEES table.
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- 3.	The HR department wants a query to display the last name, job code, 
-- hire date, and employee number for each employee, with employee number appearing first.
--  Name the column headings Emp #, Employee, Job, and Hire Date, respectively.

SELECT employee_id "Emp#",last_name "Employee", job_id "Job", hire_date "Hire_Date"
from employees;

-- 4.	The HR department has requested a report of all employees and their job IDs.
--  Display the last name concatenated with the job ID (separated by a comma and space) 
-- and name the column Employee and Title.
SELECT last_name ||' , '|| job_id "Employee and Title"
from employee;

-- 5.	Create a report to display the last name, job ID, 
-- and start date for the employees with the last names of Matos and Taylor. Order the 
-- query in ascending order by start date.
SELECT last_name,job_id,hire_date
from employees
where last_name in('Matos','Taylor')
order by hire_date;
-- 6.	To display the last name and salary of employees who earn
--  between $5,000 and $12,000 and are in department 20 or 50.
--   Label the columns Employee and Monthly Salary, respectively.
SELECT last_name "Employee", salary"Monthly Salary"
from employees 
where salary between 5000 and 12000
and department_id in (20,50);
-- 7.	The HR department needs a report that displays the last name and hire date for
--  all employees who were hired in 2005.
SELECT last_name, hire_date
from employees
where hire_date LIKE '%05';
-- 8.	Create a report to display the last name, salary, and commission of all employees 
-- who earn commissions. Sort data in descending order of salary and commissions.
--  Use the column’s numeric position in the order by clause.
select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by 2 asc, 3 asc;
-- 9.	Display the last names of all employees who have both an “a” and an “e”
--  in their last name.
select last_name
from employees
where last_name like '%a%'
and last_name like '%e%';
-- 10.	Display each employee’s last name, hire date, and salary review date,
--  which is the first Monday after six months of service. Label the column REVIEW. 
--  Format the dates to appear in the format 
--  similar to “Monday, the Thirty-First of July, 2000.” 
select last_name,hire_date,salary, to_char(next_day(add_months(sysdate,6),'Monday'),'fmday, "the" ddspth "of" Month, yyyy') "Review"
from employees;

select last_name, hire_date, to_char(next_day(add_months(hire_date,6),'monday'),'fmDay, 
"the" Ddspth "of" Month, yyyy')"Review"
from employees;
-- -- 11.	Create a query that displays the employee’s last names and commission amounts. 
-- IF an employee does not earn commission, show “No Commission.” Label the column COMM. 
select last_name,nvl(to_char(commission_pct),'No Commission') COMM
from employees;
-- 12.	Display the last name, hire date, and day of the week on which the employee started.
-- Label the column DAY. Order the results by the day of the week, starting with Monday. 

select last_name, hire_date, to_char(hire_date,'day') day
from employees
order by to_char(hire_date-3,'day');

select last_name, hire_date, to_char(hire_date,'day') day
from employees
order by to_char(hire_date-1,'d');

-- 13.	Determine the number of managers without listing them. 
-- Label the column Number of Managers.  
-- -- Hint: Use the MANAGER_ID column to determine the number of managers. 
select count(distinct manager_id) "Number of Manager"
from employees;

SELECT count (DISTINCT manager_id) "num of manager"
FROm employees
 -- 14.	Create a report to display the manager number and 
-- the salary of the lowest-paid employee for that manager. 
-- Exclude anyone whose manager is not known. 
-- Exclude any groups where the minimum salary is $6,000 or less. 
-- Sort the output in descending order of salary. 
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id 
having min(salary) > 6000
order by min(salary);

SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id is not null
group by manager_id
having min(SALARY)>6000
ORDER by min(SALARY);



-- 15.	The HR department needs a report to display 
-- the employee number, last name, salary, and salary increased by 15.5% 
-- (expressed as a whole number) for each employee. Label the column New Salary. 
-- Modify your above query to add a column that subtracts the old salary
-- from the new salary. Label the column Increase.
select employee_id,last_name,salary,
round(salary*1.115,0) "New Salary", 
round(salary*1.115,0)-salary "Increase"
from employees;


SElECT employee_id, last_name, salary,

SElECT employee_id, last_name, salary,
Round(salary +(salary*15.5/100),0) "New Salary",
Round(salary +(salary*15.5/100),0) - salary "Increased Salary"
FROM employees;
Round(salary +(salary*15.5/100),0) "New Salary",
Round(salary +(salary*15.5/100),0) - salary "Increased Salary"
FROM employees;



-- 16.	Write a query that displays the last name (with the first letter 
-- In uppercase and all the other letters in lowercase) and the length of the last name for 
-- all employees whose name starts with the letters ”J”,  ”A”, or “M”. 
-- Give each column an appropriate label. Sort the results by the employees’ last names.
select initcap ( last_name) name, length(last_name) lenth
from employees
where last_name like '%J%'
or last_name like '%A%'
or last_name like '%M%'
order by last_name;


-- 17.	The HR department wants to find the duration of employment for each employees. 
-- For each employee, display the last name and calculate the number of months between today
--  and the date on which the employee was hired .label the column as months worked .
--  order your results by the number of months employed. Round the number of months up to 
--  the closest whole number.
select last_name, round(months_between(sysdate,hire_date)) "months_worked"
from employees
order by "months_worked" ;

SELECT last_name, round(months_between(sysdate, hire_date)) "months_worked"
FROM employees
ORDER BY months_worked;

-- 18.	Create a query to display the last name and salary for all employees,
--  Format the salary to be 15 characters long, left-padded with the $ symbol. 
--  Label the column SALARY.
select last_name, lpad(salary,15,'$') salary
from employees;

SELECT last_name, lpad(salary,15,'+') salary
FROM employees;
-- 19.	Create a query that displays the first eight characters of the employees’ 
-- last names and indicates the amounts of their salaries with asterisks. 
-- Each asterisk signifies a thousand dollars. Sort the data in descending order of salary.
--  Label the column EMPLOYEES_AND_THEIR_SALARIES.
select substr(last_name,1,8), rpad('',salary/1000,'*') "EMPLOYEES_AND_THEIR_SALARIES"
from employees
order by salary desc;





-- 20.	Create a query to display the dates in a format that appears as
--  “Seventeenth of June  2003 12:00:00 AM.”
select to_char(hire_date,'fmddspth "of" Month yyyy fmhh:mi:ss AM')
from employees; 



SELECT TO_CHAR( hire_date, 'fmddspth "of" Month yyyy fmhh:mi:ss AM') FROM employees;
-- 21.	Create a report to display the last name and job title of all employees 
-- who do not have a manager.
select last_name,job_id
from employees
where manager_id is null;

SELECT last_name, job_id
from employees
WHERE manager_id is null;

-- -- 22.	The HR department needs a query that prompts the user for an employee last name. 
-- The query then displays the last name and hire date of any employee in the same department
--  as the employee whose name they supply (excluding that employee). For example, if the user
--   enters Zlotkey, find all employees who work with Zlotkey (excluding Zlotkey).
select last_name,hire_date
from employees
where department_id = (select department_id
			from employees
			where last_name='&&Enter_name')
and last_name<>'&Enter_name';


SELECT last_name, hire_date
FROM employees
WHERE department_id =(SELECT department_id
					FROM employees
					WHERE last_name='&&Enter_name')
AND last_name<>'&Enter_name';

-- 23.	The HR department needs a report that displays the last name, department number,
--  and job ID of all employees whose department location ID is 1700.
select last_name,department_id,job_id
from employees
where department_id in (select department_id
			from departments
			where location_id =1700);

SELECT last_name, department_id, job_id
FROM employees
WHERE department_id IN(SELECT department_id
						FROM departments
						WHERE location_id=1700);


-- 24.	Create a report that display a list of all employees whose salary
--  is more than the salary of any employee from department 60
select last_name
from employees
where salary >any (select salary
		from employees
		where department_id=60);

SELECT last_name, department_id, job_id, salary
FROM employees 
WHERE salary > any(
	SELECT salary
	FROM employees
	WHERE department_id=60);

-- 25.	The HR department needs a report of employees in Toronto. 
-- Display the last name, job, department number, and department name 
-- for all employees who work in Toronto.
select e.last_name,e.job_id,e.department_id,d.department_name
from employees e join departments d
on (e.department_id=d.department_id)
join locations l
using (location_id)
where lower (l.city)= 'toronto';

SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e JOIN departments d
ON (e.department_id=d.department_id)
JOIN locations l
USING (location_id)
WHERE lower (l.city) = 'toronto';
-- 26.	Create a report for the HR department that displays employee last names, 
-- department numbers, and all the employees who work in the same department
--  as a given employee. Give each column an appropriate label.
select e.department_id department, e.last_name employee, m.last_name colleague
from employees e join employees m
on (e.department_id=m.department_id)
where e.employee_id<>m.employee_id
order by e.department_id, e.last_name,m.last_name;

SELECT e.department_id department, e.last_name employee, m.last_name collaborators
FROM employees e JOIN employees m
ON(e.department_id =m.department_id)
WHERE e.employee_id<>m.employee_id
ORDER BY e.department_id, e.last_Name, m.last_name;
-- -- 27.	The HR department wants to determine the names of all the employees 
-- who were hired after Davies. Create a query to display the name and hire date 
-- of any employee hired after employee Davies.
select e.last_name,e.hire_date
from employees e join employees m
on (m.last_name='Davies')
where m.hire_date<e.hire_date;



SELECT e.last_name, e.hire_date
FROM employees e JOIN employees Davies
on(DAVIES.last_name='Davies')
where Davies.hire_date<e.hire_date;




5
select e.last_name "Employee", e.employee_id "EMP#",
m.last_name "Manager", m.employee_id "Mgr#"
from employees e 
LEFT OUTER JOIN  
employees m 
ON(e.manager_id=m.employee_id)
order by 2;

select e.last_name "Emp", e.department_id "Dpt", c.last_name colleague
from employees e join employees c
ON(e.department_id=c.department_id)
WHERE e.employee_id<>c.employee_id
ORDER by e.department_id, e.last_Name, c.last_name;


select e.last_name, e.hire_date 
from employees e join employees Davies
on (Davies.last_name= 'Davies')
where Davies.hire_date < e.hire_date;

select last_name, salary from employees where
manager_id= (select employee_id from employees where last_name ='King');


select last_name,salary
from employees
where manager_id in(select department_id from employees where last_name='King');