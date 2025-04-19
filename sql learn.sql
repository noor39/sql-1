--  sql statements that
/* Data Manipulation Language (DML) 

SELECT
INSERT 
UPDATE
DELETE
MERGE

**retrieves data; enter/change new rows, change existing rows removes unwanted rows in DB
## Data Definition Lnaguage DDL

CREATE
ALTER 
DROP
RENAME
TRUNCATE
COMMENT

***
##Data Control Lnguage
GRANT
REVOKE

#Transaction Language

COMMIT
ROLLBACK
SAVEPOINT


*/

-- selecting all columns
SELECT * 
FROM employees;

-- select all columns by listing them by column name after select keyword
SELECT department_id, department_name, manager_id, location_id
FROM departments;

 SELECT department_id, location_id
 FROM departments;
--  u can specify columns that you want first by listing them first
 SELECT location_id, department_id
 FROM departments;

--  column head display uppercase
SELECT last_name, hire_date, salary
FROM employees;
-- arithmatic operators here it can make add bonus to the salary

SELECT last_name,salary,salary+300
FROM employees;
-- selecting specific columns
SELECT department_id, location_id
FROM departments;
-- Operator precedence
SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)
FROM employees;
-- Defining a NULL value{unavailable, unassigned, unknown}
SELECT last_name, job_id, salary, commission_pct
FROM employees;
-- Null values in arithmatic expressions
SELECT last_name, 12*salary*commission_pct
FROM employees;
-- USING COLUMN ALIASES
SELECT last_name as name, commission_pct comm
FROM employees;
-- 
SELECT last_name "Name", salary*12 "Annual Salary"
FROM employees;
-- concatenation operator
SELECT last_name||job_id AS "Employees"
FROM employees;
--  using literal character strings
SELECT last_name ||' is a '||job_id AS "Employee Details"
FROM employees;
-- Using literal character strings
SELECT last_name||': 1 Month salary = '||salary Monthly
FROM employees;
-- Alternative Quote (q) Operator
SELECT department_name||q'[ department's manager_id: ]'
||manager_id AS "Department AND Manager"
FROM departments;

/*this is not included*/'
-- Duplicate Rows
SELECT department_id
FROM employees;

SELECT DISTINCT department_id 
FROM employees;

SELECT DISTINCT department_id , job_id
FROM employees;
-- display table structure
DESC [table]
DESCRIBE employees;

-- 
SELECT * FROM employees
WHERE department_id=110;

-- Using the Where clause
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90;
-- character strings and dates; case sensitive character values, date values =format sensitive DD-MON-RR
SELECT last_name, job_id, department_id
FROM employees
WHERE last_name='Whalen';

SELECT last_name
FROM employees
WHERE hire_date ='17-OCT-03';

-- character strings and dates in WHERE clause must enclose single quotation
-- all character searches are case sensitive
SELECT last_name, job_id, department_id
FROM employees
WHERE last_name='WHALEN';
-- output: no rows selected as character sensitive
/* COMPARISION OPERATORS

= EQUAL TO
> GREATER THAN
>=GREATER THAN OR EQUAL TO
< LESS THAN
< LESS THAN OR EQUAL TO
<> NOT EQUAL TO
BETWEEN ... AND...  between two values inclusive (USED FOR RANGEs)
IN (set) match any of a LIST of values
LIKE match a CHARACTER pattern
IS NULL = is a null value

*/
-- using comparision operator
SELECT last_name, salary
FROM employees
WHERE salary<=3000;
-- Range conditions using between operator
SELECT last_name, salary
FROM employees
Where salary BETWEEN 2500 AND 3500;
-- you can use between operator on character values

SELECT last_name 
FROM     employees
WHERE last_name BETWEEN 'King' AND 'Whalen';
-- using IN operator
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);
-- condition in IN operator known as membership condition
SELECT last_name, employee_id, manager_id, department_id
FROM employees
WHERE last_name IN ('Hartstein','Vargas');
-- pattern matching LIKE operator
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'S%';
/*
% percentage represents any sequence of zero or more characters
_ underscore represents any single character
*/
-- combining wildcard characters
 SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';
-- using NULL conditions
SELECT last_name, manager_id 
FROM employees
WHERE manager_id IS NULL;
--  for null value you cant test with = because null cant be equal or unequal  to any value

SELECT last_name, job_id, commission_pct
FROM employees
WHERE commission_pct IS NULL;
--  DEFINING CONDITIONS USING LOGICAL OPERATORS
-- AND  returned    TRUE if BOTH component conditions are TRUE
-- OR returnes TRUE if EITHER component condition is true
-- NOT returnes TRUE if the condition is FALSE



--  using AND operator
SELECT employee_id, last_name, job_id, salary
FROM employees 
WHERE salary >= 10000
AND job_id LIKE '%MAN%';
-- Using the OR operator
SELECT employee_id, last_name, job_id, salary
FROM  employees
WHERE salary>= 10000
OR job_id LIKE '%MAN%';
-- Using the not operator
SELECT last_name, job_id
FROM employees
WHERE job_id 
    NOT IN('IT_PROG','ST_CLERK','SA_REP');
-- RULES of precedence
SELECT last_name, department_id, salary
FROM employees
WHERE department_id = 60
OR department_id=80
AND salary > 10000;
-- 
SELECT last_name, department_id, salary
FROM employees
WHERE (department_id=60
OR department_id=80)
AND salary>10000;
-- Using the ORDER BY clause
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;
-- Sorting
-- Sorting in Descending order
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY department_id DESC;
-- sorting by column alias
SELECT employee_id, last_name, salary*12 annsal
FROM employees
ORDER BY annsal;
-- Sorting by Columns numeric position
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3;
-- Sorting by multiple columns
SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;
-- SQL row limiting clause
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id
FETCH FIRST 5 ROWS ONLY;
--  
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;
-- Using the single AMPERSAND substitution variable
SELECT employee_id, last_name, salary, department_id
FROM Employees
WHERE employee_id = &employee_num;
-- Character and Date values with Substitution variable
SELECT last_name, department_id, salary*12
FROM employees
WHERE job_id = '&job_title';
-- Specifying Column names, expressions and text
SELECT employee_id, last_name, job_id, &column_name
FROM employees
WHERE &condition
ORDER BY &order_column;
-- Using the Double Ampersand Substitution variable
SELECT employee_id, last_name, job_id, &&column_name
FROM employees
ORDER BY &column_name;
-- Using the DEFINE command
DEFINE employee_num = 200

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;

UNDEFINE employee_num
-- Using Verify Command (toggle display of substitution variable)
SET VERIFY ON 
SELECT employee_id, last_name, salary
FROM Employees
WHERE employee_id = &employee_num;
-- case conversion functions
SELECT 'The job id for '||UPPER(last_name)||' is '
||LOWER(job_id) AS "Employee Details"
FROM employees;

SELECT 'The salary for '||UPPER(last_name)||' is '
||LOWER(salary) AS "Salary Details"
FROM employees;
-- case convertion function for higgins
SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name='higgins';
-- output no rows selected 
-- but it works using lower operator
SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER(last_name)='higgins';

SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name=UPPER('higgins');
-- 
SELECT employee_id, last_name, department_id
FROM employees
WHERE INITCAP(last_name)='Higgins';
-- Chaaracter manupulation Functions
CONCAT('HELLO','WORLD');
CONCAT
 
