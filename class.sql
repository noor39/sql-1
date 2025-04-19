-- 23
SELECT last_name, department_id, job_id 
FROM employees
WHERE department_id IN (SELECT department_id
FROM departments
WHERE location_id =1700);

-- 24 
SELECT last_name
FROM employees WHERE salary >ANY 
			(SELECT salary
			FROM employees 
			WHERE department_id= 60);



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

SELECT last_Name, 
from employees
where 


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
 



--  SELECT employee_id, last_name, hire_date
  2  FROm employees
  3  WHERE hire_date > '20-JAN-05';


--   //sir er problem
 SELECT e.employee_id, e.last_name, e.job_id, e.salary, d.department_name, l.city,c.country_name,r.region_name
  2  FROM employees e join departments d
  3  USING (department_id)
  4  JOIN locations l
  5  USING (location_id)
  6  JOIN countries c
  7  USING (country_id)
  8  JOIN regions r
  9  USING (region_id);


--   ///
   1  SELECT last_name, hire_date
  2  FROM employees
  3  WHERE last_name> ( SELECT last_name
  4                     FROM employees
  5*                    WHERE hire_date = '23-MAY-06')

--   // 
--   SQL> 
SELECT last_name, hire_date
FROM employees
WHERE hire_date>(SELECT hire_date
                     FROM employees
                     WHERE last_name='Davies');
--   //display the employees whose job_id is the same as that of employee 141 
  
  SELECT last_name, job_id
  FROM employees
  WHERE job_id= (
                SELECT job_id
                FROM employees
                WHERE employee_id=141 );
-- // executing single row subqueries
   1  SELECT last_name, job_id, salary
  2  FROM employees
  3  WHERE job_id =
  4                     (SELECT job_id
  5                     FROM employees
  6                     WHERE last_name ='Abel')
  7  AND        salary >
  8                     (SELECT salary
  9                     FROM  employees
 10*                    WHERE last_name ='Abel')
SQL> /

-- LAST_NAME                 JOB_ID         SALARY
-- ------------------------- ---------- ----------
-- Ozer                      SA_REP          11500

-- // HAVING clause subqueries

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary ) > 
                    (SELECT MIN(salary)
                    FROM employees
                    WHERE department_id =30);

-- /// display all the departments that have a minimum salary greater than department 30 
SELECT job_id, AVG(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) =(SELECT MIN(AVG(salary))
                    FROM employees
                    GROUP BY job_id);


-- //// ORA-01427: single-row subquery returns more than one row error
                SELECT employee_id, last_name
                FROM employees
                WHERE salary=
                            (SELECT MIN(salary)
                            FROM employees
                            GROUP BY department_id);

-- ////
SELECT last_name, job_id
FROM employees
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE last_name = 'Haas');
-- ///
SQL> SELECT last_name, salary, department_id
  2  FROM employees
  3  WHERE salary IN (SELECT MIN(salary)
  4                     FROM employees
  5                     GROUP BY department_id);
--   ////
  SQL> SELECT last_name, salary, department_id
  2  FROm employees
  3  WHERE salary IN(2500, 4200,4400,6000,7000,8300,8600,17000);
--   ///
  SQL> SELECT employee_id, last_name, job_id, salary
  2  FROM employees
  3  WHERE salary < ANY
  4                     (SELECT salary
  5                     FROM employees
  6                     WHERE job_id = 'IT_PROG')
  7  AND job_id <> 'IT_PROG';
--   ///
  SQL> SELECT employee_id, last_name, job_id, salary
  2  FROM employees
  3  WHERE salary < ALL
  4                     (SELECT salary
  5                     FROM employees
  6                     WHERE job_id ='IT_PROG')
  7  AND job_id <> 'IT_PROG';







-- chapter 8 
SELECT last_Name, hire_date
FROM employees
WHERE hire_date> (SELECT hire_date
                FROM employees
                WHERE last_Name ='Davies');
-- display employees whose job_id is same as that of employee 141
SELECT last_Name, job_id
FROM employees
WHERE job_id = 
                (SELECT job_id
                FROM employees
                WHERE employee_id =141);
-- Executing Single row subqueries
SELECT last_Name,job_id, salary
FROM employees
WHERE job_id = (SELECT job_id
                FROM Employees
                WHERE last_Name = 'Abel')
AND  salary >(SELECT salary 
                FROM employees
                WHERE last_Name = 'Abel');

-- Using group functions in a subquery

SELECT last_Name, job_id, salary 
FROM employees
WHERE salary = (SELECT MIN(salary)
                FROM employees);














--   CHAPTER 7 activity problem

-- 1
SELECT location_id, street_address, city, state_province, country_name 
FROM   locations  NATURAL JOIN  countries;

-- 2
SELECT last_name, department_id, department_name 
FROM   employees  JOIN   departments  USING (department_id);

-- 3
SELECT e.last_name, e.job_id, e.department_id, d.department_name 
FROM   employees e JOIN departments d  
ON     (e.department_id = d.department_id) JOIN   locations l 
USING  (location_id) WHERE LOWER(l.city) = 'toronto';

-- 4
SELECT w.last_name "Employee", w.employee_id "EMP#",         m.last_name "Manager", m.employee_id  "Mgr#" 
FROM   employees w JOIN employees m ON     (w.manager_id = m.employee_id);

-- 5
SELECT w.last_name "Employee", w.employee_id "EMP#", m.last_name "Manager", m.employee_id  "Mgr#" 
FROM   employees w  LEFT   OUTER JOIN employees m 
ON     (w.manager_id = m.employee_id) 
ORDER BY 2;

-- 6
SELECT e.department_id department, e.last_name employee, c.last_name colleague 
FROM   employees e JOIN employees c 
ON     (e.department_id = c.department_id) 
WHERE  e.employee_id <> c.employee_id  
ORDER BY e.department_id, e.last_name, c.last_name;

-- 7
DESC JOB_GRADES / 
SELECT e.last_name, e.job_id, d.department_name, e.salary, j.grade_level 
FROM   employees e JOIN departments d 
ON (e.department_id = d.department_id) 
JOIN   job_grades j 
ON  (e.salary BETWEEN j.lowest_sal AND j.highest_sal);

-- 8
SELECT e.last_name, e.hire_date 
FROM   employees e JOIN employees davies 
ON     (davies.last_name = 'Davies') 
WHERE  davies.hire_date < e.hire_date;

-- 9
SELECT w.last_name, w.hire_date, m.last_name, m.hire_date 
FROM   employees w JOIN employees m 
ON    (w.manager_id = m.employee_id)  
WHERE    w.hire_date <  m.hire_date;    
 
--***************** CHAPTER 8  ***************
SELECT last_Name, job_id, salary
FROM employees
WHERE job_id= (SELECT job_id
                FROM employees
                WHERE last_Name='Abel');


SELECT last_Name, job_id, department_id, MIN(salary)
FROM employees
GROUP BY department_id
WHERE job_id= (SELECT job_id
                FROM employees
                WHERE last_Name='Abel');

-- 

SELECT department_id, MIN(salary)
  2  FROM employees
  3  GROUP BY department_id

--   
1  SELECT department_id, MIN(salary)
  2  FROM employees
  3  GROUP BY department_id
  4  HAVING MIN(salary) >
  5                     (SELECT MIN(salary)
  6                     FROM employees
  7*                    WHERE department_id=30)
--  pairwise checking multiple column subquery
--  eta non pairwise tai jora nai, pairwise e joray joray show kore
SELECT first_name, department_id, salary
FROM employees
WHERE (salary, department_id) IN
	    (SELECT min(salary), department_id
	    FROM employees
	    GROUP BY department_id)
ORDER BY department_id ;




/*

SQL> select last_name,
  2  TO_CHAR (hire_date, 'fmDdspth "of" Month YYYY fmHH:MI:SS AM')
  3  HIREDATE
  4  FROM employees;

LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
King
Seventeenth of June 2003 12:00:00 AM

Kochhar
Twenty-First of September 2005 12:00:00 AM

De Haan
Thirteenth of January 2001 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Hunold
Third of January 2006 12:00:00 AM

Ernst
Twenty-First of May 2007 12:00:00 AM

Austin
Twenty-Fifth of June 2005 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Pataballa
Fifth of February 2006 12:00:00 AM

Lorentz
Seventh of February 2007 12:00:00 AM

Greenberg
Seventeenth of August 2002 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Faviet
Sixteenth of August 2002 12:00:00 AM

Chen
Twenty-Eighth of September 2005 12:00:00 AM

Sciarra
Thirtieth of September 2005 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Urman
Seventh of March 2006 12:00:00 AM

Popp
Seventh of December 2007 12:00:00 AM

Raphaely
Seventh of December 2002 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Khoo
Eighteenth of May 2003 12:00:00 AM

Baida
Twenty-Fourth of December 2005 12:00:00 AM

Tobias
Twenty-Fourth of July 2005 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Himuro
Fifteenth of November 2006 12:00:00 AM

Colmenares
Tenth of August 2007 12:00:00 AM

Weiss
Eighteenth of July 2004 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Fripp
Tenth of April 2005 12:00:00 AM

Kaufling
First of May 2003 12:00:00 AM

Vollman
Tenth of October 2005 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Mourgos
Sixteenth of November 2007 12:00:00 AM

Nayer
Sixteenth of July 2005 12:00:00 AM

Mikkilineni
Twenty-Eighth of September 2006 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Landry
Fourteenth of January 2007 12:00:00 AM

Markle
Eighth of March 2008 12:00:00 AM

Bissot
Twentieth of August 2005 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Atkinson
Thirtieth of October 2005 12:00:00 AM

Marlow
Sixteenth of February 2005 12:00:00 AM

Olson
Tenth of April 2007 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Mallin
Fourteenth of June 2004 12:00:00 AM

Rogers
Twenty-Sixth of August 2006 12:00:00 AM

Gee
Twelfth of December 2007 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Philtanker
Sixth of February 2008 12:00:00 AM

Ladwig
Fourteenth of July 2003 12:00:00 AM

Stiles
Twenty-Sixth of October 2005 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Seo
Twelfth of February 2006 12:00:00 AM

Patel
Sixth of April 2006 12:00:00 AM

Rajs
Seventeenth of October 2003 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Davies
Twenty-Ninth of January 2005 12:00:00 AM

Matos
Fifteenth of March 2006 12:00:00 AM

Vargas
Ninth of July 2006 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Russell
First of October 2004 12:00:00 AM

Partners
Fifth of January 2005 12:00:00 AM

Errazuriz
Tenth of March 2005 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Cambrault
Fifteenth of October 2007 12:00:00 AM

Zlotkey
Twenty-Ninth of January 2008 12:00:00 AM

Tucker
Thirtieth of January 2005 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Bernstein
Twenty-Fourth of March 2005 12:00:00 AM

Hall
Twentieth of August 2005 12:00:00 AM

Olsen
Thirtieth of March 2006 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Cambrault
Ninth of December 2006 12:00:00 AM

Tuvault
Twenty-Third of November 2007 12:00:00 AM

King
Thirtieth of January 2004 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Sully
Fourth of March 2004 12:00:00 AM

McEwen
First of August 2004 12:00:00 AM

Smith
Tenth of March 2005 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Doran
Fifteenth of December 2005 12:00:00 AM

Sewall
Third of November 2006 12:00:00 AM

Vishney
Eleventh of November 2005 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Greene
Nineteenth of March 2007 12:00:00 AM

Marvins
Twenty-Fourth of January 2008 12:00:00 AM

Lee
Twenty-Third of February 2008 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Ande
Twenty-Fourth of March 2008 12:00:00 AM

Banda
Twenty-First of April 2008 12:00:00 AM

Ozer
Eleventh of March 2005 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Bloom
Twenty-Third of March 2006 12:00:00 AM

Fox
Twenty-Fourth of January 2006 12:00:00 AM

Smith
Twenty-Third of February 2007 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Bates
Twenty-Fourth of March 2007 12:00:00 AM

Kumar
Twenty-First of April 2008 12:00:00 AM

Abel
Eleventh of May 2004 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Hutton
Nineteenth of March 2005 12:00:00 AM

Taylor
Twenty-Fourth of March 2006 12:00:00 AM

Livingston
Twenty-Third of April 2006 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Grant
Twenty-Fourth of May 2007 12:00:00 AM

Johnson
Fourth of January 2008 12:00:00 AM

Taylor
Twenty-Fourth of January 2006 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Fleaur
Twenty-Third of February 2006 12:00:00 AM

Sullivan
Twenty-First of June 2007 12:00:00 AM

Geoni
Third of February 2008 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Sarchand
Twenty-Seventh of January 2004 12:00:00 AM

Bull
Twentieth of February 2005 12:00:00 AM

Dellinger
Twenty-Fourth of June 2006 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Cabrio
Seventh of February 2007 12:00:00 AM

Chung
Fourteenth of June 2005 12:00:00 AM

Dilly
Thirteenth of August 2005 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Gates
Eleventh of July 2006 12:00:00 AM

Perkins
Nineteenth of December 2007 12:00:00 AM

Bell
Fourth of February 2004 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Everett
Third of March 2005 12:00:00 AM

McCain
First of July 2006 12:00:00 AM

Jones
Seventeenth of March 2007 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Walsh
Twenty-Fourth of April 2006 12:00:00 AM

Feeney
Twenty-Third of May 2006 12:00:00 AM

OConnell
Twenty-First of June 2007 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Grant
Thirteenth of January 2008 12:00:00 AM

Whalen
Seventeenth of September 2003 12:00:00 AM

Hartstein
Seventeenth of February 2004 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Fay
Seventeenth of August 2005 12:00:00 AM

Mavris
Seventh of June 2002 12:00:00 AM

Baer
Seventh of June 2002 12:00:00 AM


LAST_NAME
-------------------------
HIREDATE
-----------------------------------------------------------------------
Higgins
Seventh of June 2002 12:00:00 AM

Gietz
Seventh of June 2002 12:00:00 AM


107 rows selected.

SQL> set lines 200
SQL> /

LAST_NAME                 HIREDATE
------------------------- -----------------------------------------------------------------------
King                      Seventeenth of June 2003 12:00:00 AM
Kochhar                   Twenty-First of September 2005 12:00:00 AM
De Haan                   Thirteenth of January 2001 12:00:00 AM
Hunold                    Third of January 2006 12:00:00 AM
Ernst                     Twenty-First of May 2007 12:00:00 AM
Austin                    Twenty-Fifth of June 2005 12:00:00 AM
Pataballa                 Fifth of February 2006 12:00:00 AM
Lorentz                   Seventh of February 2007 12:00:00 AM
Greenberg                 Seventeenth of August 2002 12:00:00 AM
Faviet                    Sixteenth of August 2002 12:00:00 AM
Chen                      Twenty-Eighth of September 2005 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -----------------------------------------------------------------------
Sciarra                   Thirtieth of September 2005 12:00:00 AM
Urman                     Seventh of March 2006 12:00:00 AM
Popp                      Seventh of December 2007 12:00:00 AM
Raphaely                  Seventh of December 2002 12:00:00 AM
Khoo                      Eighteenth of May 2003 12:00:00 AM
Baida                     Twenty-Fourth of December 2005 12:00:00 AM
Tobias                    Twenty-Fourth of July 2005 12:00:00 AM
Himuro                    Fifteenth of November 2006 12:00:00 AM
Colmenares                Tenth of August 2007 12:00:00 AM
Weiss                     Eighteenth of July 2004 12:00:00 AM
Fripp                     Tenth of April 2005 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -----------------------------------------------------------------------
Kaufling                  First of May 2003 12:00:00 AM
Vollman                   Tenth of October 2005 12:00:00 AM
Mourgos                   Sixteenth of November 2007 12:00:00 AM
Nayer                     Sixteenth of July 2005 12:00:00 AM
Mikkilineni               Twenty-Eighth of September 2006 12:00:00 AM
Landry                    Fourteenth of January 2007 12:00:00 AM
Markle                    Eighth of March 2008 12:00:00 AM
Bissot                    Twentieth of August 2005 12:00:00 AM
Atkinson                  Thirtieth of October 2005 12:00:00 AM
Marlow                    Sixteenth of February 2005 12:00:00 AM
Olson                     Tenth of April 2007 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -----------------------------------------------------------------------
Mallin                    Fourteenth of June 2004 12:00:00 AM
Rogers                    Twenty-Sixth of August 2006 12:00:00 AM
Gee                       Twelfth of December 2007 12:00:00 AM
Philtanker                Sixth of February 2008 12:00:00 AM
Ladwig                    Fourteenth of July 2003 12:00:00 AM
Stiles                    Twenty-Sixth of October 2005 12:00:00 AM
Seo                       Twelfth of February 2006 12:00:00 AM
Patel                     Sixth of April 2006 12:00:00 AM
Rajs                      Seventeenth of October 2003 12:00:00 AM
Davies                    Twenty-Ninth of January 2005 12:00:00 AM
Matos                     Fifteenth of March 2006 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -----------------------------------------------------------------------
Vargas                    Ninth of July 2006 12:00:00 AM
Russell                   First of October 2004 12:00:00 AM
Partners                  Fifth of January 2005 12:00:00 AM
Errazuriz                 Tenth of March 2005 12:00:00 AM
Cambrault                 Fifteenth of October 2007 12:00:00 AM
Zlotkey                   Twenty-Ninth of January 2008 12:00:00 AM
Tucker                    Thirtieth of January 2005 12:00:00 AM
Bernstein                 Twenty-Fourth of March 2005 12:00:00 AM
Hall                      Twentieth of August 2005 12:00:00 AM
Olsen                     Thirtieth of March 2006 12:00:00 AM
Cambrault                 Ninth of December 2006 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -----------------------------------------------------------------------
Tuvault                   Twenty-Third of November 2007 12:00:00 AM
King                      Thirtieth of January 2004 12:00:00 AM
Sully                     Fourth of March 2004 12:00:00 AM
McEwen                    First of August 2004 12:00:00 AM
Smith                     Tenth of March 2005 12:00:00 AM
Doran                     Fifteenth of December 2005 12:00:00 AM
Sewall                    Third of November 2006 12:00:00 AM
Vishney                   Eleventh of November 2005 12:00:00 AM
Greene                    Nineteenth of March 2007 12:00:00 AM
Marvins                   Twenty-Fourth of January 2008 12:00:00 AM
Lee                       Twenty-Third of February 2008 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -----------------------------------------------------------------------
Ande                      Twenty-Fourth of March 2008 12:00:00 AM
Banda                     Twenty-First of April 2008 12:00:00 AM
Ozer                      Eleventh of March 2005 12:00:00 AM
Bloom                     Twenty-Third of March 2006 12:00:00 AM
Fox                       Twenty-Fourth of January 2006 12:00:00 AM
Smith                     Twenty-Third of February 2007 12:00:00 AM
Bates                     Twenty-Fourth of March 2007 12:00:00 AM
Kumar                     Twenty-First of April 2008 12:00:00 AM
Abel                      Eleventh of May 2004 12:00:00 AM
Hutton                    Nineteenth of March 2005 12:00:00 AM
Taylor                    Twenty-Fourth of March 2006 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -----------------------------------------------------------------------
Livingston                Twenty-Third of April 2006 12:00:00 AM
Grant                     Twenty-Fourth of May 2007 12:00:00 AM
Johnson                   Fourth of January 2008 12:00:00 AM
Taylor                    Twenty-Fourth of January 2006 12:00:00 AM
Fleaur                    Twenty-Third of February 2006 12:00:00 AM
Sullivan                  Twenty-First of June 2007 12:00:00 AM
Geoni                     Third of February 2008 12:00:00 AM
Sarchand                  Twenty-Seventh of January 2004 12:00:00 AM
Bull                      Twentieth of February 2005 12:00:00 AM
Dellinger                 Twenty-Fourth of June 2006 12:00:00 AM
Cabrio                    Seventh of February 2007 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -----------------------------------------------------------------------
Chung                     Fourteenth of June 2005 12:00:00 AM
Dilly                     Thirteenth of August 2005 12:00:00 AM
Gates                     Eleventh of July 2006 12:00:00 AM
Perkins                   Nineteenth of December 2007 12:00:00 AM
Bell                      Fourth of February 2004 12:00:00 AM
Everett                   Third of March 2005 12:00:00 AM
McCain                    First of July 2006 12:00:00 AM
Jones                     Seventeenth of March 2007 12:00:00 AM
Walsh                     Twenty-Fourth of April 2006 12:00:00 AM
Feeney                    Twenty-Third of May 2006 12:00:00 AM
OConnell                  Twenty-First of June 2007 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -----------------------------------------------------------------------
Grant                     Thirteenth of January 2008 12:00:00 AM
Whalen                    Seventeenth of September 2003 12:00:00 AM
Hartstein                 Seventeenth of February 2004 12:00:00 AM
Fay                       Seventeenth of August 2005 12:00:00 AM
Mavris                    Seventh of June 2002 12:00:00 AM
Baer                      Seventh of June 2002 12:00:00 AM
Higgins                   Seventh of June 2002 12:00:00 AM
Gietz                     Seventh of June 2002 12:00:00 AM

107 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select last_name,
  2  TO_CHAR (hire_date, 'fmDdspth "of" Month YEAR fmHH:MI:SS AM')
  3  HIREDATE
  4* FROM employees
SQL> /

LAST_NAME                 HIREDATE
------------------------- -------------------------------------------------------------------------------------------------------------
King                      Seventeenth of June TWO THOUSAND THREE 12:00:00 AM
Kochhar                   Twenty-First of September TWO THOUSAND FIVE 12:00:00 AM
De Haan                   Thirteenth of January TWO THOUSAND ONE 12:00:00 AM
Hunold                    Third of January TWO THOUSAND SIX 12:00:00 AM
Ernst                     Twenty-First of May TWO THOUSAND SEVEN 12:00:00 AM
Austin                    Twenty-Fifth of June TWO THOUSAND FIVE 12:00:00 AM
Pataballa                 Fifth of February TWO THOUSAND SIX 12:00:00 AM
Lorentz                   Seventh of February TWO THOUSAND SEVEN 12:00:00 AM
Greenberg                 Seventeenth of August TWO THOUSAND TWO 12:00:00 AM
Faviet                    Sixteenth of August TWO THOUSAND TWO 12:00:00 AM
Chen                      Twenty-Eighth of September TWO THOUSAND FIVE 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -------------------------------------------------------------------------------------------------------------
Sciarra                   Thirtieth of September TWO THOUSAND FIVE 12:00:00 AM
Urman                     Seventh of March TWO THOUSAND SIX 12:00:00 AM
Popp                      Seventh of December TWO THOUSAND SEVEN 12:00:00 AM
Raphaely                  Seventh of December TWO THOUSAND TWO 12:00:00 AM
Khoo                      Eighteenth of May TWO THOUSAND THREE 12:00:00 AM
Baida                     Twenty-Fourth of December TWO THOUSAND FIVE 12:00:00 AM
Tobias                    Twenty-Fourth of July TWO THOUSAND FIVE 12:00:00 AM
Himuro                    Fifteenth of November TWO THOUSAND SIX 12:00:00 AM
Colmenares                Tenth of August TWO THOUSAND SEVEN 12:00:00 AM
Weiss                     Eighteenth of July TWO THOUSAND FOUR 12:00:00 AM
Fripp                     Tenth of April TWO THOUSAND FIVE 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -------------------------------------------------------------------------------------------------------------
Kaufling                  First of May TWO THOUSAND THREE 12:00:00 AM
Vollman                   Tenth of October TWO THOUSAND FIVE 12:00:00 AM
Mourgos                   Sixteenth of November TWO THOUSAND SEVEN 12:00:00 AM
Nayer                     Sixteenth of July TWO THOUSAND FIVE 12:00:00 AM
Mikkilineni               Twenty-Eighth of September TWO THOUSAND SIX 12:00:00 AM
Landry                    Fourteenth of January TWO THOUSAND SEVEN 12:00:00 AM
Markle                    Eighth of March TWO THOUSAND EIGHT 12:00:00 AM
Bissot                    Twentieth of August TWO THOUSAND FIVE 12:00:00 AM
Atkinson                  Thirtieth of October TWO THOUSAND FIVE 12:00:00 AM
Marlow                    Sixteenth of February TWO THOUSAND FIVE 12:00:00 AM
Olson                     Tenth of April TWO THOUSAND SEVEN 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -------------------------------------------------------------------------------------------------------------
Mallin                    Fourteenth of June TWO THOUSAND FOUR 12:00:00 AM
Rogers                    Twenty-Sixth of August TWO THOUSAND SIX 12:00:00 AM
Gee                       Twelfth of December TWO THOUSAND SEVEN 12:00:00 AM
Philtanker                Sixth of February TWO THOUSAND EIGHT 12:00:00 AM
Ladwig                    Fourteenth of July TWO THOUSAND THREE 12:00:00 AM
Stiles                    Twenty-Sixth of October TWO THOUSAND FIVE 12:00:00 AM
Seo                       Twelfth of February TWO THOUSAND SIX 12:00:00 AM
Patel                     Sixth of April TWO THOUSAND SIX 12:00:00 AM
Rajs                      Seventeenth of October TWO THOUSAND THREE 12:00:00 AM
Davies                    Twenty-Ninth of January TWO THOUSAND FIVE 12:00:00 AM
Matos                     Fifteenth of March TWO THOUSAND SIX 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -------------------------------------------------------------------------------------------------------------
Vargas                    Ninth of July TWO THOUSAND SIX 12:00:00 AM
Russell                   First of October TWO THOUSAND FOUR 12:00:00 AM
Partners                  Fifth of January TWO THOUSAND FIVE 12:00:00 AM
Errazuriz                 Tenth of March TWO THOUSAND FIVE 12:00:00 AM
Cambrault                 Fifteenth of October TWO THOUSAND SEVEN 12:00:00 AM
Zlotkey                   Twenty-Ninth of January TWO THOUSAND EIGHT 12:00:00 AM
Tucker                    Thirtieth of January TWO THOUSAND FIVE 12:00:00 AM
Bernstein                 Twenty-Fourth of March TWO THOUSAND FIVE 12:00:00 AM
Hall                      Twentieth of August TWO THOUSAND FIVE 12:00:00 AM
Olsen                     Thirtieth of March TWO THOUSAND SIX 12:00:00 AM
Cambrault                 Ninth of December TWO THOUSAND SIX 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -------------------------------------------------------------------------------------------------------------
Tuvault                   Twenty-Third of November TWO THOUSAND SEVEN 12:00:00 AM
King                      Thirtieth of January TWO THOUSAND FOUR 12:00:00 AM
Sully                     Fourth of March TWO THOUSAND FOUR 12:00:00 AM
McEwen                    First of August TWO THOUSAND FOUR 12:00:00 AM
Smith                     Tenth of March TWO THOUSAND FIVE 12:00:00 AM
Doran                     Fifteenth of December TWO THOUSAND FIVE 12:00:00 AM
Sewall                    Third of November TWO THOUSAND SIX 12:00:00 AM
Vishney                   Eleventh of November TWO THOUSAND FIVE 12:00:00 AM
Greene                    Nineteenth of March TWO THOUSAND SEVEN 12:00:00 AM
Marvins                   Twenty-Fourth of January TWO THOUSAND EIGHT 12:00:00 AM
Lee                       Twenty-Third of February TWO THOUSAND EIGHT 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -------------------------------------------------------------------------------------------------------------
Ande                      Twenty-Fourth of March TWO THOUSAND EIGHT 12:00:00 AM
Banda                     Twenty-First of April TWO THOUSAND EIGHT 12:00:00 AM
Ozer                      Eleventh of March TWO THOUSAND FIVE 12:00:00 AM
Bloom                     Twenty-Third of March TWO THOUSAND SIX 12:00:00 AM
Fox                       Twenty-Fourth of January TWO THOUSAND SIX 12:00:00 AM
Smith                     Twenty-Third of February TWO THOUSAND SEVEN 12:00:00 AM
Bates                     Twenty-Fourth of March TWO THOUSAND SEVEN 12:00:00 AM
Kumar                     Twenty-First of April TWO THOUSAND EIGHT 12:00:00 AM
Abel                      Eleventh of May TWO THOUSAND FOUR 12:00:00 AM
Hutton                    Nineteenth of March TWO THOUSAND FIVE 12:00:00 AM
Taylor                    Twenty-Fourth of March TWO THOUSAND SIX 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -------------------------------------------------------------------------------------------------------------
Livingston                Twenty-Third of April TWO THOUSAND SIX 12:00:00 AM
Grant                     Twenty-Fourth of May TWO THOUSAND SEVEN 12:00:00 AM
Johnson                   Fourth of January TWO THOUSAND EIGHT 12:00:00 AM
Taylor                    Twenty-Fourth of January TWO THOUSAND SIX 12:00:00 AM
Fleaur                    Twenty-Third of February TWO THOUSAND SIX 12:00:00 AM
Sullivan                  Twenty-First of June TWO THOUSAND SEVEN 12:00:00 AM
Geoni                     Third of February TWO THOUSAND EIGHT 12:00:00 AM
Sarchand                  Twenty-Seventh of January TWO THOUSAND FOUR 12:00:00 AM
Bull                      Twentieth of February TWO THOUSAND FIVE 12:00:00 AM
Dellinger                 Twenty-Fourth of June TWO THOUSAND SIX 12:00:00 AM
Cabrio                    Seventh of February TWO THOUSAND SEVEN 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -------------------------------------------------------------------------------------------------------------
Chung                     Fourteenth of June TWO THOUSAND FIVE 12:00:00 AM
Dilly                     Thirteenth of August TWO THOUSAND FIVE 12:00:00 AM
Gates                     Eleventh of July TWO THOUSAND SIX 12:00:00 AM
Perkins                   Nineteenth of December TWO THOUSAND SEVEN 12:00:00 AM
Bell                      Fourth of February TWO THOUSAND FOUR 12:00:00 AM
Everett                   Third of March TWO THOUSAND FIVE 12:00:00 AM
McCain                    First of July TWO THOUSAND SIX 12:00:00 AM
Jones                     Seventeenth of March TWO THOUSAND SEVEN 12:00:00 AM
Walsh                     Twenty-Fourth of April TWO THOUSAND SIX 12:00:00 AM
Feeney                    Twenty-Third of May TWO THOUSAND SIX 12:00:00 AM
OConnell                  Twenty-First of June TWO THOUSAND SEVEN 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- -------------------------------------------------------------------------------------------------------------
Grant                     Thirteenth of January TWO THOUSAND EIGHT 12:00:00 AM
Whalen                    Seventeenth of September TWO THOUSAND THREE 12:00:00 AM
Hartstein                 Seventeenth of February TWO THOUSAND FOUR 12:00:00 AM
Fay                       Seventeenth of August TWO THOUSAND FIVE 12:00:00 AM
Mavris                    Seventh of June TWO THOUSAND TWO 12:00:00 AM
Baer                      Seventh of June TWO THOUSAND TWO 12:00:00 AM
Higgins                   Seventh of June TWO THOUSAND TWO 12:00:00 AM
Gietz                     Seventh of June TWO THOUSAND TWO 12:00:00 AM

107 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select last_name,
  2  TO_CHAR (hire_date, 'fmDdspth "haramzada" Month YEAR fmHH:MI:SS AM')
  3  HIREDATE
  4* FROM employees
SQL> /

LAST_NAME                 HIREDATE
------------------------- --------------------------------------------------------------------------------------------------------------------
King                      Seventeenth haramzada June TWO THOUSAND THREE 12:00:00 AM
Kochhar                   Twenty-First haramzada September TWO THOUSAND FIVE 12:00:00 AM
De Haan                   Thirteenth haramzada January TWO THOUSAND ONE 12:00:00 AM
Hunold                    Third haramzada January TWO THOUSAND SIX 12:00:00 AM
Ernst                     Twenty-First haramzada May TWO THOUSAND SEVEN 12:00:00 AM
Austin                    Twenty-Fifth haramzada June TWO THOUSAND FIVE 12:00:00 AM
Pataballa                 Fifth haramzada February TWO THOUSAND SIX 12:00:00 AM
Lorentz                   Seventh haramzada February TWO THOUSAND SEVEN 12:00:00 AM
Greenberg                 Seventeenth haramzada August TWO THOUSAND TWO 12:00:00 AM
Faviet                    Sixteenth haramzada August TWO THOUSAND TWO 12:00:00 AM
Chen                      Twenty-Eighth haramzada September TWO THOUSAND FIVE 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- --------------------------------------------------------------------------------------------------------------------
Sciarra                   Thirtieth haramzada September TWO THOUSAND FIVE 12:00:00 AM
Urman                     Seventh haramzada March TWO THOUSAND SIX 12:00:00 AM
Popp                      Seventh haramzada December TWO THOUSAND SEVEN 12:00:00 AM
Raphaely                  Seventh haramzada December TWO THOUSAND TWO 12:00:00 AM
Khoo                      Eighteenth haramzada May TWO THOUSAND THREE 12:00:00 AM
Baida                     Twenty-Fourth haramzada December TWO THOUSAND FIVE 12:00:00 AM
Tobias                    Twenty-Fourth haramzada July TWO THOUSAND FIVE 12:00:00 AM
Himuro                    Fifteenth haramzada November TWO THOUSAND SIX 12:00:00 AM
Colmenares                Tenth haramzada August TWO THOUSAND SEVEN 12:00:00 AM
Weiss                     Eighteenth haramzada July TWO THOUSAND FOUR 12:00:00 AM
Fripp                     Tenth haramzada April TWO THOUSAND FIVE 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- --------------------------------------------------------------------------------------------------------------------
Kaufling                  First haramzada May TWO THOUSAND THREE 12:00:00 AM
Vollman                   Tenth haramzada October TWO THOUSAND FIVE 12:00:00 AM
Mourgos                   Sixteenth haramzada November TWO THOUSAND SEVEN 12:00:00 AM
Nayer                     Sixteenth haramzada July TWO THOUSAND FIVE 12:00:00 AM
Mikkilineni               Twenty-Eighth haramzada September TWO THOUSAND SIX 12:00:00 AM
Landry                    Fourteenth haramzada January TWO THOUSAND SEVEN 12:00:00 AM
Markle                    Eighth haramzada March TWO THOUSAND EIGHT 12:00:00 AM
Bissot                    Twentieth haramzada August TWO THOUSAND FIVE 12:00:00 AM
Atkinson                  Thirtieth haramzada October TWO THOUSAND FIVE 12:00:00 AM
Marlow                    Sixteenth haramzada February TWO THOUSAND FIVE 12:00:00 AM
Olson                     Tenth haramzada April TWO THOUSAND SEVEN 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- --------------------------------------------------------------------------------------------------------------------
Mallin                    Fourteenth haramzada June TWO THOUSAND FOUR 12:00:00 AM
Rogers                    Twenty-Sixth haramzada August TWO THOUSAND SIX 12:00:00 AM
Gee                       Twelfth haramzada December TWO THOUSAND SEVEN 12:00:00 AM
Philtanker                Sixth haramzada February TWO THOUSAND EIGHT 12:00:00 AM
Ladwig                    Fourteenth haramzada July TWO THOUSAND THREE 12:00:00 AM
Stiles                    Twenty-Sixth haramzada October TWO THOUSAND FIVE 12:00:00 AM
Seo                       Twelfth haramzada February TWO THOUSAND SIX 12:00:00 AM
Patel                     Sixth haramzada April TWO THOUSAND SIX 12:00:00 AM
Rajs                      Seventeenth haramzada October TWO THOUSAND THREE 12:00:00 AM
Davies                    Twenty-Ninth haramzada January TWO THOUSAND FIVE 12:00:00 AM
Matos                     Fifteenth haramzada March TWO THOUSAND SIX 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- --------------------------------------------------------------------------------------------------------------------
Vargas                    Ninth haramzada July TWO THOUSAND SIX 12:00:00 AM
Russell                   First haramzada October TWO THOUSAND FOUR 12:00:00 AM
Partners                  Fifth haramzada January TWO THOUSAND FIVE 12:00:00 AM
Errazuriz                 Tenth haramzada March TWO THOUSAND FIVE 12:00:00 AM
Cambrault                 Fifteenth haramzada October TWO THOUSAND SEVEN 12:00:00 AM
Zlotkey                   Twenty-Ninth haramzada January TWO THOUSAND EIGHT 12:00:00 AM
Tucker                    Thirtieth haramzada January TWO THOUSAND FIVE 12:00:00 AM
Bernstein                 Twenty-Fourth haramzada March TWO THOUSAND FIVE 12:00:00 AM
Hall                      Twentieth haramzada August TWO THOUSAND FIVE 12:00:00 AM
Olsen                     Thirtieth haramzada March TWO THOUSAND SIX 12:00:00 AM
Cambrault                 Ninth haramzada December TWO THOUSAND SIX 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- --------------------------------------------------------------------------------------------------------------------
Tuvault                   Twenty-Third haramzada November TWO THOUSAND SEVEN 12:00:00 AM
King                      Thirtieth haramzada January TWO THOUSAND FOUR 12:00:00 AM
Sully                     Fourth haramzada March TWO THOUSAND FOUR 12:00:00 AM
McEwen                    First haramzada August TWO THOUSAND FOUR 12:00:00 AM
Smith                     Tenth haramzada March TWO THOUSAND FIVE 12:00:00 AM
Doran                     Fifteenth haramzada December TWO THOUSAND FIVE 12:00:00 AM
Sewall                    Third haramzada November TWO THOUSAND SIX 12:00:00 AM
Vishney                   Eleventh haramzada November TWO THOUSAND FIVE 12:00:00 AM
Greene                    Nineteenth haramzada March TWO THOUSAND SEVEN 12:00:00 AM
Marvins                   Twenty-Fourth haramzada January TWO THOUSAND EIGHT 12:00:00 AM
Lee                       Twenty-Third haramzada February TWO THOUSAND EIGHT 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- --------------------------------------------------------------------------------------------------------------------
Ande                      Twenty-Fourth haramzada March TWO THOUSAND EIGHT 12:00:00 AM
Banda                     Twenty-First haramzada April TWO THOUSAND EIGHT 12:00:00 AM
Ozer                      Eleventh haramzada March TWO THOUSAND FIVE 12:00:00 AM
Bloom                     Twenty-Third haramzada March TWO THOUSAND SIX 12:00:00 AM
Fox                       Twenty-Fourth haramzada January TWO THOUSAND SIX 12:00:00 AM
Smith                     Twenty-Third haramzada February TWO THOUSAND SEVEN 12:00:00 AM
Bates                     Twenty-Fourth haramzada March TWO THOUSAND SEVEN 12:00:00 AM
Kumar                     Twenty-First haramzada April TWO THOUSAND EIGHT 12:00:00 AM
Abel                      Eleventh haramzada May TWO THOUSAND FOUR 12:00:00 AM
Hutton                    Nineteenth haramzada March TWO THOUSAND FIVE 12:00:00 AM
Taylor                    Twenty-Fourth haramzada March TWO THOUSAND SIX 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- --------------------------------------------------------------------------------------------------------------------
Livingston                Twenty-Third haramzada April TWO THOUSAND SIX 12:00:00 AM
Grant                     Twenty-Fourth haramzada May TWO THOUSAND SEVEN 12:00:00 AM
Johnson                   Fourth haramzada January TWO THOUSAND EIGHT 12:00:00 AM
Taylor                    Twenty-Fourth haramzada January TWO THOUSAND SIX 12:00:00 AM
Fleaur                    Twenty-Third haramzada February TWO THOUSAND SIX 12:00:00 AM
Sullivan                  Twenty-First haramzada June TWO THOUSAND SEVEN 12:00:00 AM
Geoni                     Third haramzada February TWO THOUSAND EIGHT 12:00:00 AM
Sarchand                  Twenty-Seventh haramzada January TWO THOUSAND FOUR 12:00:00 AM
Bull                      Twentieth haramzada February TWO THOUSAND FIVE 12:00:00 AM
Dellinger                 Twenty-Fourth haramzada June TWO THOUSAND SIX 12:00:00 AM
Cabrio                    Seventh haramzada February TWO THOUSAND SEVEN 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- --------------------------------------------------------------------------------------------------------------------
Chung                     Fourteenth haramzada June TWO THOUSAND FIVE 12:00:00 AM
Dilly                     Thirteenth haramzada August TWO THOUSAND FIVE 12:00:00 AM
Gates                     Eleventh haramzada July TWO THOUSAND SIX 12:00:00 AM
Perkins                   Nineteenth haramzada December TWO THOUSAND SEVEN 12:00:00 AM
Bell                      Fourth haramzada February TWO THOUSAND FOUR 12:00:00 AM
Everett                   Third haramzada March TWO THOUSAND FIVE 12:00:00 AM
McCain                    First haramzada July TWO THOUSAND SIX 12:00:00 AM
Jones                     Seventeenth haramzada March TWO THOUSAND SEVEN 12:00:00 AM
Walsh                     Twenty-Fourth haramzada April TWO THOUSAND SIX 12:00:00 AM
Feeney                    Twenty-Third haramzada May TWO THOUSAND SIX 12:00:00 AM
OConnell                  Twenty-First haramzada June TWO THOUSAND SEVEN 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- --------------------------------------------------------------------------------------------------------------------
Grant                     Thirteenth haramzada January TWO THOUSAND EIGHT 12:00:00 AM
Whalen                    Seventeenth haramzada September TWO THOUSAND THREE 12:00:00 AM
Hartstein                 Seventeenth haramzada February TWO THOUSAND FOUR 12:00:00 AM
Fay                       Seventeenth haramzada August TWO THOUSAND FIVE 12:00:00 AM
Mavris                    Seventh haramzada June TWO THOUSAND TWO 12:00:00 AM
Baer                      Seventh haramzada June TWO THOUSAND TWO 12:00:00 AM
Higgins                   Seventh haramzada June TWO THOUSAND TWO 12:00:00 AM
Gietz                     Seventh haramzada June TWO THOUSAND TWO 12:00:00 AM

107 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select last_name,
  2  TO_CHAR (hire_date, 'fmDdsp "haramzada" Month YEAR fmHH:MI:SS AM')
  3  HIREDATE
  4* FROM employees
SQL> /

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------
King                      Seventeen haramzada June TWO THOUSAND THREE 12:00:00 AM
Kochhar                   Twenty-One haramzada September TWO THOUSAND FIVE 12:00:00 AM
De Haan                   Thirteen haramzada January TWO THOUSAND ONE 12:00:00 AM
Hunold                    Three haramzada January TWO THOUSAND SIX 12:00:00 AM
Ernst                     Twenty-One haramzada May TWO THOUSAND SEVEN 12:00:00 AM
Austin                    Twenty-Five haramzada June TWO THOUSAND FIVE 12:00:00 AM
Pataballa                 Five haramzada February TWO THOUSAND SIX 12:00:00 AM
Lorentz                   Seven haramzada February TWO THOUSAND SEVEN 12:00:00 AM
Greenberg                 Seventeen haramzada August TWO THOUSAND TWO 12:00:00 AM
Faviet                    Sixteen haramzada August TWO THOUSAND TWO 12:00:00 AM
Chen                      Twenty-Eight haramzada September TWO THOUSAND FIVE 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------
Sciarra                   Thirty haramzada September TWO THOUSAND FIVE 12:00:00 AM
Urman                     Seven haramzada March TWO THOUSAND SIX 12:00:00 AM
Popp                      Seven haramzada December TWO THOUSAND SEVEN 12:00:00 AM
Raphaely                  Seven haramzada December TWO THOUSAND TWO 12:00:00 AM
Khoo                      Eighteen haramzada May TWO THOUSAND THREE 12:00:00 AM
Baida                     Twenty-Four haramzada December TWO THOUSAND FIVE 12:00:00 AM
Tobias                    Twenty-Four haramzada July TWO THOUSAND FIVE 12:00:00 AM
Himuro                    Fifteen haramzada November TWO THOUSAND SIX 12:00:00 AM
Colmenares                Ten haramzada August TWO THOUSAND SEVEN 12:00:00 AM
Weiss                     Eighteen haramzada July TWO THOUSAND FOUR 12:00:00 AM
Fripp                     Ten haramzada April TWO THOUSAND FIVE 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------
Kaufling                  One haramzada May TWO THOUSAND THREE 12:00:00 AM
Vollman                   Ten haramzada October TWO THOUSAND FIVE 12:00:00 AM
Mourgos                   Sixteen haramzada November TWO THOUSAND SEVEN 12:00:00 AM
Nayer                     Sixteen haramzada July TWO THOUSAND FIVE 12:00:00 AM
Mikkilineni               Twenty-Eight haramzada September TWO THOUSAND SIX 12:00:00 AM
Landry                    Fourteen haramzada January TWO THOUSAND SEVEN 12:00:00 AM
Markle                    Eight haramzada March TWO THOUSAND EIGHT 12:00:00 AM
Bissot                    Twenty haramzada August TWO THOUSAND FIVE 12:00:00 AM
Atkinson                  Thirty haramzada October TWO THOUSAND FIVE 12:00:00 AM
Marlow                    Sixteen haramzada February TWO THOUSAND FIVE 12:00:00 AM
Olson                     Ten haramzada April TWO THOUSAND SEVEN 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------
Mallin                    Fourteen haramzada June TWO THOUSAND FOUR 12:00:00 AM
Rogers                    Twenty-Six haramzada August TWO THOUSAND SIX 12:00:00 AM
Gee                       Twelve haramzada December TWO THOUSAND SEVEN 12:00:00 AM
Philtanker                Six haramzada February TWO THOUSAND EIGHT 12:00:00 AM
Ladwig                    Fourteen haramzada July TWO THOUSAND THREE 12:00:00 AM
Stiles                    Twenty-Six haramzada October TWO THOUSAND FIVE 12:00:00 AM
Seo                       Twelve haramzada February TWO THOUSAND SIX 12:00:00 AM
Patel                     Six haramzada April TWO THOUSAND SIX 12:00:00 AM
Rajs                      Seventeen haramzada October TWO THOUSAND THREE 12:00:00 AM
Davies                    Twenty-Nine haramzada January TWO THOUSAND FIVE 12:00:00 AM
Matos                     Fifteen haramzada March TWO THOUSAND SIX 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------
Vargas                    Nine haramzada July TWO THOUSAND SIX 12:00:00 AM
Russell                   One haramzada October TWO THOUSAND FOUR 12:00:00 AM
Partners                  Five haramzada January TWO THOUSAND FIVE 12:00:00 AM
Errazuriz                 Ten haramzada March TWO THOUSAND FIVE 12:00:00 AM
Cambrault                 Fifteen haramzada October TWO THOUSAND SEVEN 12:00:00 AM
Zlotkey                   Twenty-Nine haramzada January TWO THOUSAND EIGHT 12:00:00 AM
Tucker                    Thirty haramzada January TWO THOUSAND FIVE 12:00:00 AM
Bernstein                 Twenty-Four haramzada March TWO THOUSAND FIVE 12:00:00 AM
Hall                      Twenty haramzada August TWO THOUSAND FIVE 12:00:00 AM
Olsen                     Thirty haramzada March TWO THOUSAND SIX 12:00:00 AM
Cambrault                 Nine haramzada December TWO THOUSAND SIX 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------
Tuvault                   Twenty-Three haramzada November TWO THOUSAND SEVEN 12:00:00 AM
King                      Thirty haramzada January TWO THOUSAND FOUR 12:00:00 AM
Sully                     Four haramzada March TWO THOUSAND FOUR 12:00:00 AM
McEwen                    One haramzada August TWO THOUSAND FOUR 12:00:00 AM
Smith                     Ten haramzada March TWO THOUSAND FIVE 12:00:00 AM
Doran                     Fifteen haramzada December TWO THOUSAND FIVE 12:00:00 AM
Sewall                    Three haramzada November TWO THOUSAND SIX 12:00:00 AM
Vishney                   Eleven haramzada November TWO THOUSAND FIVE 12:00:00 AM
Greene                    Nineteen haramzada March TWO THOUSAND SEVEN 12:00:00 AM
Marvins                   Twenty-Four haramzada January TWO THOUSAND EIGHT 12:00:00 AM
Lee                       Twenty-Three haramzada February TWO THOUSAND EIGHT 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------
Ande                      Twenty-Four haramzada March TWO THOUSAND EIGHT 12:00:00 AM
Banda                     Twenty-One haramzada April TWO THOUSAND EIGHT 12:00:00 AM
Ozer                      Eleven haramzada March TWO THOUSAND FIVE 12:00:00 AM
Bloom                     Twenty-Three haramzada March TWO THOUSAND SIX 12:00:00 AM
Fox                       Twenty-Four haramzada January TWO THOUSAND SIX 12:00:00 AM
Smith                     Twenty-Three haramzada February TWO THOUSAND SEVEN 12:00:00 AM
Bates                     Twenty-Four haramzada March TWO THOUSAND SEVEN 12:00:00 AM
Kumar                     Twenty-One haramzada April TWO THOUSAND EIGHT 12:00:00 AM
Abel                      Eleven haramzada May TWO THOUSAND FOUR 12:00:00 AM
Hutton                    Nineteen haramzada March TWO THOUSAND FIVE 12:00:00 AM
Taylor                    Twenty-Four haramzada March TWO THOUSAND SIX 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------
Livingston                Twenty-Three haramzada April TWO THOUSAND SIX 12:00:00 AM
Grant                     Twenty-Four haramzada May TWO THOUSAND SEVEN 12:00:00 AM
Johnson                   Four haramzada January TWO THOUSAND EIGHT 12:00:00 AM
Taylor                    Twenty-Four haramzada January TWO THOUSAND SIX 12:00:00 AM
Fleaur                    Twenty-Three haramzada February TWO THOUSAND SIX 12:00:00 AM
Sullivan                  Twenty-One haramzada June TWO THOUSAND SEVEN 12:00:00 AM
Geoni                     Three haramzada February TWO THOUSAND EIGHT 12:00:00 AM
Sarchand                  Twenty-Seven haramzada January TWO THOUSAND FOUR 12:00:00 AM
Bull                      Twenty haramzada February TWO THOUSAND FIVE 12:00:00 AM
Dellinger                 Twenty-Four haramzada June TWO THOUSAND SIX 12:00:00 AM
Cabrio                    Seven haramzada February TWO THOUSAND SEVEN 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------
Chung                     Fourteen haramzada June TWO THOUSAND FIVE 12:00:00 AM
Dilly                     Thirteen haramzada August TWO THOUSAND FIVE 12:00:00 AM
Gates                     Eleven haramzada July TWO THOUSAND SIX 12:00:00 AM
Perkins                   Nineteen haramzada December TWO THOUSAND SEVEN 12:00:00 AM
Bell                      Four haramzada February TWO THOUSAND FOUR 12:00:00 AM
Everett                   Three haramzada March TWO THOUSAND FIVE 12:00:00 AM
McCain                    One haramzada July TWO THOUSAND SIX 12:00:00 AM
Jones                     Seventeen haramzada March TWO THOUSAND SEVEN 12:00:00 AM
Walsh                     Twenty-Four haramzada April TWO THOUSAND SIX 12:00:00 AM
Feeney                    Twenty-Three haramzada May TWO THOUSAND SIX 12:00:00 AM
OConnell                  Twenty-One haramzada June TWO THOUSAND SEVEN 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------
Grant                     Thirteen haramzada January TWO THOUSAND EIGHT 12:00:00 AM
Whalen                    Seventeen haramzada September TWO THOUSAND THREE 12:00:00 AM
Hartstein                 Seventeen haramzada February TWO THOUSAND FOUR 12:00:00 AM
Fay                       Seventeen haramzada August TWO THOUSAND FIVE 12:00:00 AM
Mavris                    Seven haramzada June TWO THOUSAND TWO 12:00:00 AM
Baer                      Seven haramzada June TWO THOUSAND TWO 12:00:00 AM
Higgins                   Seven haramzada June TWO THOUSAND TWO 12:00:00 AM
Gietz                     Seven haramzada June TWO THOUSAND TWO 12:00:00 AM

107 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select last_name,
  2  TO_CHAR (hire_date, 'fmDdsp "oracle bujhi na" Month YEAR fmHH:MI:SS AM')
  3  HIREDATE
  4* FROM employees
SQL> /

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------------
King                      Seventeen oracle bujhi na June TWO THOUSAND THREE 12:00:00 AM
Kochhar                   Twenty-One oracle bujhi na September TWO THOUSAND FIVE 12:00:00 AM
De Haan                   Thirteen oracle bujhi na January TWO THOUSAND ONE 12:00:00 AM
Hunold                    Three oracle bujhi na January TWO THOUSAND SIX 12:00:00 AM
Ernst                     Twenty-One oracle bujhi na May TWO THOUSAND SEVEN 12:00:00 AM
Austin                    Twenty-Five oracle bujhi na June TWO THOUSAND FIVE 12:00:00 AM
Pataballa                 Five oracle bujhi na February TWO THOUSAND SIX 12:00:00 AM
Lorentz                   Seven oracle bujhi na February TWO THOUSAND SEVEN 12:00:00 AM
Greenberg                 Seventeen oracle bujhi na August TWO THOUSAND TWO 12:00:00 AM
Faviet                    Sixteen oracle bujhi na August TWO THOUSAND TWO 12:00:00 AM
Chen                      Twenty-Eight oracle bujhi na September TWO THOUSAND FIVE 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------------
Sciarra                   Thirty oracle bujhi na September TWO THOUSAND FIVE 12:00:00 AM
Urman                     Seven oracle bujhi na March TWO THOUSAND SIX 12:00:00 AM
Popp                      Seven oracle bujhi na December TWO THOUSAND SEVEN 12:00:00 AM
Raphaely                  Seven oracle bujhi na December TWO THOUSAND TWO 12:00:00 AM
Khoo                      Eighteen oracle bujhi na May TWO THOUSAND THREE 12:00:00 AM
Baida                     Twenty-Four oracle bujhi na December TWO THOUSAND FIVE 12:00:00 AM
Tobias                    Twenty-Four oracle bujhi na July TWO THOUSAND FIVE 12:00:00 AM
Himuro                    Fifteen oracle bujhi na November TWO THOUSAND SIX 12:00:00 AM
Colmenares                Ten oracle bujhi na August TWO THOUSAND SEVEN 12:00:00 AM
Weiss                     Eighteen oracle bujhi na July TWO THOUSAND FOUR 12:00:00 AM
Fripp                     Ten oracle bujhi na April TWO THOUSAND FIVE 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------------
Kaufling                  One oracle bujhi na May TWO THOUSAND THREE 12:00:00 AM
Vollman                   Ten oracle bujhi na October TWO THOUSAND FIVE 12:00:00 AM
Mourgos                   Sixteen oracle bujhi na November TWO THOUSAND SEVEN 12:00:00 AM
Nayer                     Sixteen oracle bujhi na July TWO THOUSAND FIVE 12:00:00 AM
Mikkilineni               Twenty-Eight oracle bujhi na September TWO THOUSAND SIX 12:00:00 AM
Landry                    Fourteen oracle bujhi na January TWO THOUSAND SEVEN 12:00:00 AM
Markle                    Eight oracle bujhi na March TWO THOUSAND EIGHT 12:00:00 AM
Bissot                    Twenty oracle bujhi na August TWO THOUSAND FIVE 12:00:00 AM
Atkinson                  Thirty oracle bujhi na October TWO THOUSAND FIVE 12:00:00 AM
Marlow                    Sixteen oracle bujhi na February TWO THOUSAND FIVE 12:00:00 AM
Olson                     Ten oracle bujhi na April TWO THOUSAND SEVEN 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------------
Mallin                    Fourteen oracle bujhi na June TWO THOUSAND FOUR 12:00:00 AM
Rogers                    Twenty-Six oracle bujhi na August TWO THOUSAND SIX 12:00:00 AM
Gee                       Twelve oracle bujhi na December TWO THOUSAND SEVEN 12:00:00 AM
Philtanker                Six oracle bujhi na February TWO THOUSAND EIGHT 12:00:00 AM
Ladwig                    Fourteen oracle bujhi na July TWO THOUSAND THREE 12:00:00 AM
Stiles                    Twenty-Six oracle bujhi na October TWO THOUSAND FIVE 12:00:00 AM
Seo                       Twelve oracle bujhi na February TWO THOUSAND SIX 12:00:00 AM
Patel                     Six oracle bujhi na April TWO THOUSAND SIX 12:00:00 AM
Rajs                      Seventeen oracle bujhi na October TWO THOUSAND THREE 12:00:00 AM
Davies                    Twenty-Nine oracle bujhi na January TWO THOUSAND FIVE 12:00:00 AM
Matos                     Fifteen oracle bujhi na March TWO THOUSAND SIX 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------------
Vargas                    Nine oracle bujhi na July TWO THOUSAND SIX 12:00:00 AM
Russell                   One oracle bujhi na October TWO THOUSAND FOUR 12:00:00 AM
Partners                  Five oracle bujhi na January TWO THOUSAND FIVE 12:00:00 AM
Errazuriz                 Ten oracle bujhi na March TWO THOUSAND FIVE 12:00:00 AM
Cambrault                 Fifteen oracle bujhi na October TWO THOUSAND SEVEN 12:00:00 AM
Zlotkey                   Twenty-Nine oracle bujhi na January TWO THOUSAND EIGHT 12:00:00 AM
Tucker                    Thirty oracle bujhi na January TWO THOUSAND FIVE 12:00:00 AM
Bernstein                 Twenty-Four oracle bujhi na March TWO THOUSAND FIVE 12:00:00 AM
Hall                      Twenty oracle bujhi na August TWO THOUSAND FIVE 12:00:00 AM
Olsen                     Thirty oracle bujhi na March TWO THOUSAND SIX 12:00:00 AM
Cambrault                 Nine oracle bujhi na December TWO THOUSAND SIX 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------------
Tuvault                   Twenty-Three oracle bujhi na November TWO THOUSAND SEVEN 12:00:00 AM
King                      Thirty oracle bujhi na January TWO THOUSAND FOUR 12:00:00 AM
Sully                     Four oracle bujhi na March TWO THOUSAND FOUR 12:00:00 AM
McEwen                    One oracle bujhi na August TWO THOUSAND FOUR 12:00:00 AM
Smith                     Ten oracle bujhi na March TWO THOUSAND FIVE 12:00:00 AM
Doran                     Fifteen oracle bujhi na December TWO THOUSAND FIVE 12:00:00 AM
Sewall                    Three oracle bujhi na November TWO THOUSAND SIX 12:00:00 AM
Vishney                   Eleven oracle bujhi na November TWO THOUSAND FIVE 12:00:00 AM
Greene                    Nineteen oracle bujhi na March TWO THOUSAND SEVEN 12:00:00 AM
Marvins                   Twenty-Four oracle bujhi na January TWO THOUSAND EIGHT 12:00:00 AM
Lee                       Twenty-Three oracle bujhi na February TWO THOUSAND EIGHT 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------------
Ande                      Twenty-Four oracle bujhi na March TWO THOUSAND EIGHT 12:00:00 AM
Banda                     Twenty-One oracle bujhi na April TWO THOUSAND EIGHT 12:00:00 AM
Ozer                      Eleven oracle bujhi na March TWO THOUSAND FIVE 12:00:00 AM
Bloom                     Twenty-Three oracle bujhi na March TWO THOUSAND SIX 12:00:00 AM
Fox                       Twenty-Four oracle bujhi na January TWO THOUSAND SIX 12:00:00 AM
Smith                     Twenty-Three oracle bujhi na February TWO THOUSAND SEVEN 12:00:00 AM
Bates                     Twenty-Four oracle bujhi na March TWO THOUSAND SEVEN 12:00:00 AM
Kumar                     Twenty-One oracle bujhi na April TWO THOUSAND EIGHT 12:00:00 AM
Abel                      Eleven oracle bujhi na May TWO THOUSAND FOUR 12:00:00 AM
Hutton                    Nineteen oracle bujhi na March TWO THOUSAND FIVE 12:00:00 AM
Taylor                    Twenty-Four oracle bujhi na March TWO THOUSAND SIX 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------------
Livingston                Twenty-Three oracle bujhi na April TWO THOUSAND SIX 12:00:00 AM
Grant                     Twenty-Four oracle bujhi na May TWO THOUSAND SEVEN 12:00:00 AM
Johnson                   Four oracle bujhi na January TWO THOUSAND EIGHT 12:00:00 AM
Taylor                    Twenty-Four oracle bujhi na January TWO THOUSAND SIX 12:00:00 AM
Fleaur                    Twenty-Three oracle bujhi na February TWO THOUSAND SIX 12:00:00 AM
Sullivan                  Twenty-One oracle bujhi na June TWO THOUSAND SEVEN 12:00:00 AM
Geoni                     Three oracle bujhi na February TWO THOUSAND EIGHT 12:00:00 AM
Sarchand                  Twenty-Seven oracle bujhi na January TWO THOUSAND FOUR 12:00:00 AM
Bull                      Twenty oracle bujhi na February TWO THOUSAND FIVE 12:00:00 AM
Dellinger                 Twenty-Four oracle bujhi na June TWO THOUSAND SIX 12:00:00 AM
Cabrio                    Seven oracle bujhi na February TWO THOUSAND SEVEN 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------------
Chung                     Fourteen oracle bujhi na June TWO THOUSAND FIVE 12:00:00 AM
Dilly                     Thirteen oracle bujhi na August TWO THOUSAND FIVE 12:00:00 AM
Gates                     Eleven oracle bujhi na July TWO THOUSAND SIX 12:00:00 AM
Perkins                   Nineteen oracle bujhi na December TWO THOUSAND SEVEN 12:00:00 AM
Bell                      Four oracle bujhi na February TWO THOUSAND FOUR 12:00:00 AM
Everett                   Three oracle bujhi na March TWO THOUSAND FIVE 12:00:00 AM
McCain                    One oracle bujhi na July TWO THOUSAND SIX 12:00:00 AM
Jones                     Seventeen oracle bujhi na March TWO THOUSAND SEVEN 12:00:00 AM
Walsh                     Twenty-Four oracle bujhi na April TWO THOUSAND SIX 12:00:00 AM
Feeney                    Twenty-Three oracle bujhi na May TWO THOUSAND SIX 12:00:00 AM
OConnell                  Twenty-One oracle bujhi na June TWO THOUSAND SEVEN 12:00:00 AM

LAST_NAME                 HIREDATE
------------------------- ------------------------------------------------------------------------------------------------------------------------
Grant                     Thirteen oracle bujhi na January TWO THOUSAND EIGHT 12:00:00 AM
Whalen                    Seventeen oracle bujhi na September TWO THOUSAND THREE 12:00:00 AM
Hartstein                 Seventeen oracle bujhi na February TWO THOUSAND FOUR 12:00:00 AM
Fay                       Seventeen oracle bujhi na August TWO THOUSAND FIVE 12:00:00 AM
Mavris                    Seven oracle bujhi na June TWO THOUSAND TWO 12:00:00 AM
Baer                      Seven oracle bujhi na June TWO THOUSAND TWO 12:00:00 AM
Higgins                   Seven oracle bujhi na June TWO THOUSAND TWO 12:00:00 AM
Gietz                     Seven oracle bujhi na June TWO THOUSAND TWO 12:00:00 AM

107 rows selected.

SQL> select * from table;
select * from table
                  *
ERROR at line 1:
ORA-00906: missing left parenthesis


SQL> SELECT * from employees;

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER       HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        100 Steven               King                      SKING                     515.123.4567       17-JUN-03 AD_PRES         24000                                      90
        101 Neena                Kochhar                   NKOCHHAR                  515.123.4568       21-SEP-05 AD_VP           17000                       100            90
        102 Lex                  De Haan                   LDEHAAN                   515.123.4569       13-JAN-01 AD_VP           17000                       100            90
        103 Alexander            Hunold                    AHUNOLD                   590.423.4567       03-JAN-06 IT_PROG          9000                       102            60
        104 Bruce                Ernst                     BERNST                    590.423.4568       21-MAY-07 IT_PROG          6000                       103            60
        105 David                Austin                    DAUSTIN                   590.423.4569       25-JUN-05 IT_PROG          4800                       103            60
        106 Valli                Pataballa                 VPATABAL                  590.423.4560       05-FEB-06 IT_PROG          4800                       103            60
        107 Diana                Lorentz                   DLORENTZ                  590.423.5567       07-FEB-07 IT_PROG          4200                       103            60
        108 Nancy                Greenberg                 NGREENBE                  515.124.4569       17-AUG-02 FI_MGR          12008                       101           100
        109 Daniel               Faviet                    DFAVIET                   515.124.4169       16-AUG-02 FI_ACCOUNT       9000                       108           100
        110 John                 Chen                      JCHEN                     515.124.4269       28-SEP-05 FI_ACCOUNT       8200                       108           100


107 rows selected.

SQL> SELECT last_name, salary, TO_CHAR(salary, '$99,999.00') SALARY
  2  FROM employees
  3  WHERE last_name = 'Earnst';

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  SELECT last_name, salary, TO_CHAR(salary, '$9,999.00') SALARY
  2  FROM employees
  3* WHERE last_name = 'Earnst'
SQL> /

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  SELECT last_name, salary, TO_CHAR(salary, '$9,999.00') SALARY
  2  FROM employees
  3* WHERE last_name = 'Ernst'
SQL> /

LAST_NAME                     SALARY SALARY
------------------------- ---------- ----------
Ernst                           6000  $6,000.00

SQL> ed
Wrote file afiedt.buf

  1  SELECT last_name, salary, TO_CHAR(salary, '$9999,999.00') SALARY
  2  FROM employees
  3* WHERE last_name = 'Ernst'
SQL> /

LAST_NAME                     SALARY SALARY
------------------------- ---------- -------------
Ernst                           6000     $6,000.00

SQL> select last_name, salary, TO_CHAR(Salary, '$99,999.00')SALARY
  2  FROM employees
  3  WHERE last_name ='Ernst';

LAST_NAME                     SALARY SALARY
------------------------- ---------- -----------
Ernst                           6000   $6,000.00

SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, TO_CHAR(Salary, '$099,999.00')SALARY
  2  FROM employees
  3* WHERE last_name ='Ernst'
SQL> /

LAST_NAME                     SALARY SALARY
------------------------- ---------- ------------
Ernst                           6000  $006,000.00

SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, TO_CHAR(Salary, 'L$099,999.00')SALARY
  2  FROM employees
  3* WHERE last_name ='Ernst'
SQL> /
select last_name, salary, TO_CHAR(Salary, 'L$099,999.00')SALARY
                                          *
ERROR at line 1:
ORA-01481: invalid number format model


SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, TO_CHAR(Salary, 'PR$099,999.00')SALARY
  2  FROM employees
  3* WHERE last_name ='Ernst'
SQL> /
select last_name, salary, TO_CHAR(Salary, 'PR$099,999.00')SALARY
                                          *
ERROR at line 1:
ORA-01481: invalid number format model


SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, TO_CHAR(Salary, 'L00099,999.00')SALARY
  2  FROM employees
  3* WHERE last_name ='Ernst'
SQL> /

LAST_NAME                     SALARY SALARY
------------------------- ---------- -----------------------
Ernst                           6000           $00006,000.00

SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, TO_CHAR(Salary, 'D00099,999.00')SALARY
  2  FROM employees
  3* WHERE last_name ='Ernst'
SQL> /
select last_name, salary, TO_CHAR(Salary, 'D00099,999.00')SALARY
                                          *
ERROR at line 1:
ORA-01481: invalid number format model


SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, TO_CHAR(Salary, '00099,999.00PR')SALARY
  2  FROM employees
  3* WHERE last_name ='Ernst'
SQL> /

LAST_NAME                     SALARY SALARY
------------------------- ---------- --------------
Ernst                           6000  00006,000.00

SQL> to_char(hire_date, 'fmDD Month Year') AS hiredateto_char(hire_date, 'fmDD Month Year') AS hiredate
SP2-0734: unknown command beginning "to_char(hi..." - rest of line ignored.
SQL> select last_name, hire_date
  2  from employees
  3  where hire_date=to_date('May 24, 2007','Month DD, YYYY');

LAST_NAME                 HIRE_DATE
------------------------- ---------
Grant                     24-MAY-07

SQL> ed
Wrote file afiedt.buf

  1  select last_name, hire_date
  2  from employees
  3* where hire_date=to_date('May  24, 2007','fxMonth DD, YYYY')
SQL> /
where hire_date=to_date('May  24, 2007','fxMonth DD, YYYY')
                        *
ERROR at line 3:
ORA-01858: a non-numeric character was found where a numeric was expected


SQL> ed
Wrote file afiedt.buf

  1  select last_name, hire_date
  2  from employees
  3* where hire_date=to_date('May 24, 2007','fxMonth DD, YYYY')
SQL> /

LAST_NAME                 HIRE_DATE
------------------------- ---------
Grant                     24-MAY-07

SQL> select last_name, salary, commission_pct,
  2  NVL(commission_pct,0),
  3  (salary*12)+(salary*12*NVL(commission_pct,0)) AN_SAL
  4  FROM employees
  5  /

LAST_NAME                     SALARY COMMISSION_PCT NVL(COMMISSION_PCT,0)     AN_SAL
------------------------- ---------- -------------- --------------------- ----------
King                           24000                                    0     288000
Kochhar                        17000                                    0     204000
De Haan                        17000                                    0     204000
Hunold                          9000                                    0     108000
Ernst                           6000                                    0      72000
Austin                          4800                                    0      57600
Pataballa                       4800                                    0      57600
Lorentz                         4200                                    0      50400
Greenberg                      12008                                    0     144096
Faviet                          9000                                    0     108000
Chen                            8200                                    0      98400



107 rows selected.

SQL>

*/


/* SIR er evidence

ANS.1
SELECT employee_id, last_name, job_id, hire_date startdate
FROM employees;

ANS.2

SELECT DISTINCT job_id
FROM employees;

ans.3
select employee_id "Emp#", last_name "Employee", job_id "Job", hire_date "Hire Date"
FROM employees;


ans.4
SELECT last_name||',' ||job_id "Emlpoyee and Title"
FROM employees;

ans.5

SELECT last_name, job_id, hire_date
FROM employees 
WHERE last_Name in ('Matos','Taylor');


ans.6

SELECT last_name "Employee", salary "Monthly Salary"
FROM employees
WHERE salary BETWEEN 5000 and 12000
AND department_id IN (20,50);

ans.7

SELECT last_name,  hire_date
FROM employees
WHERE hire_date like ('%04');

ans.8

SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct is not null
ORDER BY 2 DESC, 3 DESC;

ans.9

SELECT last_name
FROM employees
WHERE last_name LIKE ('%a%') AND last_name LIKE ('%e%');


ans.10

SELECT last_name, salary, hire_date, TO_CHAR(next_day(Add_months(hire_date, 6), 'MONDAY'), 'fmDay, "the" DDspth "of" month, yyyy') review
FROM employees;


ans.11

SELECT last_name, NVL(To_char(commission_pct), 'No Commission') "COMM"
FROM employees;


ans.12
this runs the code but this is error!
select last_name, hire_date, next_day(hire_date, 'Monday') "DAY"
from employees
ORDER BY "DAY"

+++++++

SELECT last_name, hire_date, TO_CHAR(hire_date, 'DAY') AS "DAY"
FROM employees
ORDER BY to_char(hire_date-1,'d');

ans.13
SELECT COUNT(manager_id) "Number of Manager"
FROM employees;

ans14

SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(Salary) > 6000
ORDER BY MIN(salary) DESC;

ans.15

SELECT employee_id, last_name,salary, round(salary*1.155) "New Salary"
FROM employees;

ans.16
  SELECT last_name, INITCAP(last_name) "Name", length(last_name) length
  FROM employees
  WHERE last_name LIKE '%J%'
  OR last_name LIKE '%A%'
  OR last_name LIKE '%M%'
  ORDER BY last_name;

ANS.17

SELECT LAST_NAME, ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) months_worked
FROM employees
ORDER BY  months_worked;

ans.18

SELECT last_name, LPAD(salary,15 , '$') "SALARY"
FROM employees;


ANS.19

SELECT SUBSTR(LAST_NAME, 8), RPAD(' ', SALARY/1000, '*') EMPLOYEES_AND_THIER_SALARIES
FROM EMPLOYEES
ORDER BY SALARY DESC;

ans.20

SELECT to_char(HIRE_DATE,'fmddspth "of" month yyyy fmHH:MI:SS AM')
FROM EMPLOYEES;

*/


/*
1. select employee_id, last_name, job_id, hire_date"STARTDATE"
   from employees;
2. select distinct(job_id)
   from employees;
3. select employee_id"Emp#", last_name"Employee", job_id"Job", hire_date"HireDate"
    from employees;
4. select last_name||', '||job_id"Employee and Title"
   from employees;
5. select employee_id, last_name, job_id, hire_date
    from employees
    where last_name in ('Matos','Taylor')
   order by hire_date
6. select last_name, salary"Monthly Salary"
    from employees
    where salary between 5000 and 12000
    and department_id in (20, 50)
7. select last_name, hire_date
   from employees
   where hire_date > '01-jan-2005' and hire_date <  '01-jan-2006'
8. select last_name, salary, commission_pct
   from employees
   order by 2 desc , 3 desc
9.  select last_name
    from employees
    where last_name like '%a%'
    and last_name like '%e%'
15. select employee_id, last_name, salary, salary%

*/


/*

SQL*Plus: Release 19.0.0.0.0 - Production on Thu Feb 13 09:39:26 2025
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Enter user-name: sys as sysdba
Enter password:

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> con_name
SP2-0042: unknown command "con_name" - rest of line ignored.
SQL> pdbs
SP2-0042: unknown command "pdbs" - rest of line ignored.
SQL> show pdbs

    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         2 PDB$SEED                       READ ONLY  NO
         3 ORCLPDB                        READ WRITE NO
SQL> alter session set container=orclpdb;

Session altered.

SQL> slter pluggable database open;
SP2-0734: unknown command beginning "slter plug..." - rest of line ignored.
SQL> alter pluggable databse open;
alter pluggable databse open
                *
ERROR at line 1:
ORA-02000: missing DATABASE keyword


SQL> show user
USER is "SYS"
SQL> conn hr/hr@orclpdb
Connected.
SQL> desc departments;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPARTMENT_ID                             NOT NULL NUMBER(4)
 DEPARTMENT_NAME                           NOT NULL VARCHAR2(30)
 MANAGER_ID                                         NUMBER(6)
 LOCATION_ID                                        NUMBER(4)

SQL> SELECT first_name
  2  FROM employees
  3  WHERE first_name LIKE 'S%';

FIRST_NAME
--------------------
Sundar
Shelli
Sarah
Shelley
Steven
Sundita
Steven
Susan
Samuel
Sarath
Stephen

FIRST_NAME
--------------------
Sigal
Shanta

13 rows selected.

SQL> SELECT employe_id, last_name name, job_id jobs, salary, salary*12
  2  FROM employees
  3  /
SELECT employe_id, last_name name, job_id jobs, salary, salary*12
       *
ERROR at line 1:
ORA-00904: "EMPLOYE_ID": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  SELECT employe_id, last_name name, job_id jobs, salary, salary*12 "annual salary"
  2* FROM employees
SQL> /
SELECT employe_id, last_name name, job_id jobs, salary, salary*12 "annual salary"
       *
ERROR at line 1:
ORA-00904: "EMPLOYE_ID": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name name, job_id jobs, salary, salary*12 "annual salary"
  2* FROM employees
SQL> /

EMPLOYEE_ID NAME                      JOBS           SALARY annual salary
----------- ------------------------- ---------- ---------- -------------
        100 King                      AD_PRES         24000        288000
        101 Kochhar                   AD_VP           17000        204000
        102 De Haan                   AD_VP           17000        204000
        103 Hunold                    IT_PROG          9000        108000
        104 Ernst                     IT_PROG          6000         72000
        105 Austin                    IT_PROG          4800         57600
        106 Pataballa                 IT_PROG          4800         57600
        107 Lorentz                   IT_PROG          4200         50400
        108 Greenberg                 FI_MGR          12008        144096
        109 Faviet                    FI_ACCOUNT       9000        108000
        110 Chen                      FI_ACCOUNT       8200         98400
107 rows selected.

SQL> SELECT first_name FROM employees WHERE first_name LIKE 'S%';

FIRST_NAME
--------------------
Sundar
Shelli
Sarah
Shelley
Steven
Sundita
Steven
Susan
Samuel
Sarath
Stephen

FIRST_NAME
--------------------
Sigal
Shanta

13 rows selected.

SQL> SELECT first_name FROM employees WHERE first_name LIKE'+file:///C:/Users/Lab3-8/Desktop/books/Grokking-Algorithms.pdfS%'
  2  ^Z^Zfile:///C:/Users/Lab3-8/Desktop/books/Grokking-Algorithms.pdf

SQL> ed
Wrote file afiedt.buf

  1* SELECT first_name FROM employees WHERE first_name LIKE 'Sa%'/
SQL> /
SELECT first_name FROM employees WHERE first_name LIKE 'Sa%'/
                                                            *
ERROR at line 1:
ORA-00936: missing expression


SQL> ed
Wrote file afiedt.buf

  1* SELECT first_name FROM employees WHERE first_name LIKE 'Sa%'
SQL> /

FIRST_NAME
--------------------
Sarah
Samuel
Sarath

SQL> ed
Wrote file afiedt.buf

  1* SELECT first_name FROM employees WHERE first_name LIKE 'Sa%'
SQL> /

FIRST_NAME
--------------------
Sarah
Samuel
Sarath

SQL> ed
Wrote file afiedt.buf

  1* SELECT last_name FROM employees WHERE last_name LIKE 'Sa%'
SQL> /

LAST_NAME
-------------------------
Sarchand

SQL> ed
Wrote file afiedt.buf

  1* SELECT last_name FROM employees WHERE last_name LIKE '__a%'
SQL> /

LAST_NAME
-------------------------
Grant
Grant
Whalen

SQL> ed
Wrote file afiedt.buf

  1* SELECT last_name FROM employees WHERE last_name LIKE '_ea%'
SQL> /

no rows selected

SQL> ed
Wrote file afiedt.buf

  1* SELECT last_name FROM employees WHERE last_name LIKE 'ea%'
  2  /

no rows selected


  1* SELECT last_name FROM employees WHERE last_name LIKE '%a'
SQL> /

LAST_NAME
-------------------------
Baida
Banda
Pataballa
Sciarra

SQL> SELECT last_name FROM employees WHERE last_name LIKE '_o%';

LAST_NAME
-------------------------
Colmenares
Doran
Fox
Johnson
Jones
Kochhar
Lorentz
Mourgos
Popp
Rogers
Tobias

LAST_NAME
-------------------------
Vollman

12 rows selected.

SQL> SELECT last_name, hire_date FROM employees WHERE hire_date LIKE'%05';

LAST_NAME                 HIRE_DATE
------------------------- ---------
Kochhar                   21-SEP-05
Austin                    25-JUN-05
Chen                      28-SEP-05
Sciarra                   30-SEP-05
Baida                     24-DEC-05
Tobias                    24-JUL-05
Fripp                     10-APR-05
Vollman                   10-OCT-05
Nayer                     16-JUL-05
Bissot                    20-AUG-05
Atkinson                  30-OCT-05

LAST_NAME                 HIRE_DATE
------------------------- ---------
Marlow                    16-FEB-05
Stiles                    26-OCT-05
Davies                    29-JAN-05
Partners                  05-JAN-05
Errazuriz                 10-MAR-05
Tucker                    30-JAN-05
Bernstein                 24-MAR-05
Hall                      20-AUG-05
Smith                     10-MAR-05
Doran                     15-DEC-05
Vishney                   11-NOV-05

LAST_NAME                 HIRE_DATE
------------------------- ---------
Ozer                      11-MAR-05
Hutton                    19-MAR-05
Bull                      20-FEB-05
Chung                     14-JUN-05
Dilly                     13-AUG-05
Everett                   03-MAR-05
Fay                       17-AUG-05

29 rows selected.

SQL>  SELECT last_name FROM employees WHERE last_name LIKE '__o%'
  2  /

LAST_NAME
-------------------------
Bloom
Geoni
Khoo
OConnell
Seo
Zlotkey

6 rows selected.

SQL> SELECT last_name FROM employees WHERE last_name LIKE '_un%';

LAST_NAME
-------------------------
Hunold

SQL> SELECT first_name FROM employees WHERE first_name LIKE '_un%';

FIRST_NAME
--------------------
Sundar
Sundita

SQL> SELECT employee_id, last_name name, job_id jobs, salary, commission_pct, salary*12 "ANNUAL SALARY", department_id
  2  FROM employees
  3  WHERE commission_pct IS NULL
  4  /

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        100 King                      AD_PRES         24000
       288000            90

        101 Kochhar                   AD_VP           17000
       204000            90

        102 De Haan                   AD_VP           17000
       204000            90


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        103 Hunold                    IT_PROG          9000
       108000            60

        104 Ernst                     IT_PROG          6000
        72000            60

        105 Austin                    IT_PROG          4800
        57600            60


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        106 Pataballa                 IT_PROG          4800
        57600            60

        107 Lorentz                   IT_PROG          4200
        50400            60

        108 Greenberg                 FI_MGR          12008
       144096           100


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        109 Faviet                    FI_ACCOUNT       9000
       108000           100

        110 Chen                      FI_ACCOUNT       8200
        98400           100

        111 Sciarra                   FI_ACCOUNT       7700
        92400           100


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        112 Urman                     FI_ACCOUNT       7800
        93600           100

        113 Popp                      FI_ACCOUNT       6900
        82800           100

        114 Raphaely                  PU_MAN          11000
       132000            30


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        115 Khoo                      PU_CLERK         3100
        37200            30

        116 Baida                     PU_CLERK         2900
        34800            30

        117 Tobias                    PU_CLERK         2800
        33600            30


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        118 Himuro                    PU_CLERK         2600
        31200            30

        119 Colmenares                PU_CLERK         2500
        30000            30

        120 Weiss                     ST_MAN           8000
        96000            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        121 Fripp                     ST_MAN           8200
        98400            50

        122 Kaufling                  ST_MAN           7900
        94800            50

        123 Vollman                   ST_MAN           6500
        78000            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        124 Mourgos                   ST_MAN           5800
        69600            50

        125 Nayer                     ST_CLERK         3200
        38400            50

        126 Mikkilineni               ST_CLERK         2700
        32400            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        127 Landry                    ST_CLERK         2400
        28800            50

        128 Markle                    ST_CLERK         2200
        26400            50

        129 Bissot                    ST_CLERK         3300
        39600            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        130 Atkinson                  ST_CLERK         2800
        33600            50

        131 Marlow                    ST_CLERK         2500
        30000            50

        132 Olson                     ST_CLERK         2100
        25200            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        133 Mallin                    ST_CLERK         3300
        39600            50

        134 Rogers                    ST_CLERK         2900
        34800            50

        135 Gee                       ST_CLERK         2400
        28800            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        136 Philtanker                ST_CLERK         2200
        26400            50

        137 Ladwig                    ST_CLERK         3600
        43200            50

        138 Stiles                    ST_CLERK         3200
        38400            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        139 Seo                       ST_CLERK         2700
        32400            50

        140 Patel                     ST_CLERK         2500
        30000            50

        141 Rajs                      ST_CLERK         3500
        42000            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        142 Davies                    ST_CLERK         3100
        37200            50

        143 Matos                     ST_CLERK         2600
        31200            50

        144 Vargas                    ST_CLERK         2500
        30000            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        180 Taylor                    SH_CLERK         3200
        38400            50

        181 Fleaur                    SH_CLERK         3100
        37200            50

        182 Sullivan                  SH_CLERK         2500
        30000            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        183 Geoni                     SH_CLERK         2800
        33600            50

        184 Sarchand                  SH_CLERK         4200
        50400            50

        185 Bull                      SH_CLERK         4100
        49200            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        186 Dellinger                 SH_CLERK         3400
        40800            50

        187 Cabrio                    SH_CLERK         3000
        36000            50

        188 Chung                     SH_CLERK         3800
        45600            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        189 Dilly                     SH_CLERK         3600
        43200            50

        190 Gates                     SH_CLERK         2900
        34800            50

        191 Perkins                   SH_CLERK         2500
        30000            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        192 Bell                      SH_CLERK         4000
        48000            50

        193 Everett                   SH_CLERK         3900
        46800            50

        194 McCain                    SH_CLERK         3200
        38400            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        195 Jones                     SH_CLERK         2800
        33600            50

        196 Walsh                     SH_CLERK         3100
        37200            50

        197 Feeney                    SH_CLERK         3000
        36000            50


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        198 OConnell                  SH_CLERK         2600
        31200            50

        199 Grant                     SH_CLERK         2600
        31200            50

        200 Whalen                    AD_ASST          4400
        52800            10


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        201 Hartstein                 MK_MAN          13000
       156000            20

        202 Fay                       MK_REP           6000
        72000            20

        203 Mavris                    HR_REP           6500
        78000            40


EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT
----------- ------------------------- ---------- ---------- --------------
ANNUAL SALARY DEPARTMENT_ID
------------- -------------
        204 Baer                      PR_REP          10000
       120000            70

        205 Higgins                   AC_MGR          12008
       144096           110

        206 Gietz                     AC_ACCOUNT       8300
        99600           110


72 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name name, manager_id "MGMT #id", job_id jobs, salary, commission_pct, salary*12 "ANNUAL SALARY", department_id
  2  FROM employees
  3* WHERE manager_id IS NULL
SQL> /

EMPLOYEE_ID NAME                        MGMT #id JOBS           SALARY
----------- ------------------------- ---------- ---------- ----------
COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
-------------- ------------- -------------
        100 King                                 AD_PRES         24000
                      288000            90


SQL> set line 299
SQL> /

EMPLOYEE_ID NAME                        MGMT #id JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------- ------------- -------------
        100 King                                 AD_PRES         24000                       288000               90

SQL> set line 400
SQL> /

EMPLOYEE_ID NAME                        MGMT #id JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------- ------------- -------------
        100 King                                 AD_PRES         24000                       288000               90

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name name, job_id jobs, salary, commission_pct, salary*12 "ANNUAL SALARY", department_id
  2  FROM employees
  3* WHERE commission_pct IS NULL
SQL> /

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        100 King                      AD_PRES         24000                       288000            90
        101 Kochhar                   AD_VP           17000                       204000            90
        102 De Haan                   AD_VP           17000                       204000            90
        103 Hunold                    IT_PROG          9000                       108000            60
        104 Ernst                     IT_PROG          6000                        72000            60
        105 Austin                    IT_PROG          4800                        57600            60
        106 Pataballa                 IT_PROG          4800                        57600            60
        107 Lorentz                   IT_PROG          4200                        50400            60
        108 Greenberg                 FI_MGR          12008                       144096           100
        109 Faviet                    FI_ACCOUNT       9000                       108000           100
        110 Chen                      FI_ACCOUNT       8200                        98400           100

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        111 Sciarra                   FI_ACCOUNT       7700                        92400           100
        112 Urman                     FI_ACCOUNT       7800                        93600           100
        113 Popp                      FI_ACCOUNT       6900                        82800           100
        114 Raphaely                  PU_MAN          11000                       132000            30
        115 Khoo                      PU_CLERK         3100                        37200            30
        116 Baida                     PU_CLERK         2900                        34800            30
        117 Tobias                    PU_CLERK         2800                        33600            30
        118 Himuro                    PU_CLERK         2600                        31200            30
        119 Colmenares                PU_CLERK         2500                        30000            30
        120 Weiss                     ST_MAN           8000                        96000            50
        121 Fripp                     ST_MAN           8200                        98400            50

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        122 Kaufling                  ST_MAN           7900                        94800            50
        123 Vollman                   ST_MAN           6500                        78000            50
        124 Mourgos                   ST_MAN           5800                        69600            50
        125 Nayer                     ST_CLERK         3200                        38400            50
        126 Mikkilineni               ST_CLERK         2700                        32400            50
        127 Landry                    ST_CLERK         2400                        28800            50
        128 Markle                    ST_CLERK         2200                        26400            50
        129 Bissot                    ST_CLERK         3300                        39600            50
        130 Atkinson                  ST_CLERK         2800                        33600            50
        131 Marlow                    ST_CLERK         2500                        30000            50
        132 Olson                     ST_CLERK         2100                        25200            50

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        133 Mallin                    ST_CLERK         3300                        39600            50
        134 Rogers                    ST_CLERK         2900                        34800            50
        135 Gee                       ST_CLERK         2400                        28800            50
        136 Philtanker                ST_CLERK         2200                        26400            50
        137 Ladwig                    ST_CLERK         3600                        43200            50
        138 Stiles                    ST_CLERK         3200                        38400            50
        139 Seo                       ST_CLERK         2700                        32400            50
        140 Patel                     ST_CLERK         2500                        30000            50
        141 Rajs                      ST_CLERK         3500                        42000            50
        142 Davies                    ST_CLERK         3100                        37200            50
        143 Matos                     ST_CLERK         2600                        31200            50

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        144 Vargas                    ST_CLERK         2500                        30000            50
        180 Taylor                    SH_CLERK         3200                        38400            50
        181 Fleaur                    SH_CLERK         3100                        37200            50
        182 Sullivan                  SH_CLERK         2500                        30000            50
        183 Geoni                     SH_CLERK         2800                        33600            50
        184 Sarchand                  SH_CLERK         4200                        50400            50
        185 Bull                      SH_CLERK         4100                        49200            50
        186 Dellinger                 SH_CLERK         3400                        40800            50
        187 Cabrio                    SH_CLERK         3000                        36000            50
        188 Chung                     SH_CLERK         3800                        45600            50
        189 Dilly                     SH_CLERK         3600                        43200            50

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        190 Gates                     SH_CLERK         2900                        34800            50
        191 Perkins                   SH_CLERK         2500                        30000            50
        192 Bell                      SH_CLERK         4000                        48000            50
        193 Everett                   SH_CLERK         3900                        46800            50
        194 McCain                    SH_CLERK         3200                        38400            50
        195 Jones                     SH_CLERK         2800                        33600            50
        196 Walsh                     SH_CLERK         3100                        37200            50
        197 Feeney                    SH_CLERK         3000                        36000            50
        198 OConnell                  SH_CLERK         2600                        31200            50
        199 Grant                     SH_CLERK         2600                        31200            50
        200 Whalen                    AD_ASST          4400                        52800            10

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        201 Hartstein                 MK_MAN          13000                       156000            20
        202 Fay                       MK_REP           6000                        72000            20
        203 Mavris                    HR_REP           6500                        78000            40
        204 Baer                      PR_REP          10000                       120000            70
        205 Higgins                   AC_MGR          12008                       144096           110
        206 Gietz                     AC_ACCOUNT       8300                        99600           110

72 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name name, job_id jobs, salary, commission_pct, salary*12 "ANNUAL SALARY", department_id
  2  FROM employees
  3* WHERE SALARY > 10000 AND JOB_ID LIKE '%MAN%'
  4  /

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        114 Raphaely                  PU_MAN          11000                       132000            30
        145 Russell                   SA_MAN          14000             .4        168000            80
        146 Partners                  SA_MAN          13500             .3        162000            80
        147 Errazuriz                 SA_MAN          12000             .3        144000            80
        148 Cambrault                 SA_MAN          11000             .3        132000            80
        149 Zlotkey                   SA_MAN          10500             .2        126000            80
        201 Hartstein                 MK_MAN          13000                       156000            20

7 rows selected.

SQL> edc
SP2-0042: unknown command "edc" - rest of line ignored.
SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name name, job_id jobs, salary, commission_pct, salary*12 "ANNUAL SALARY", department_id
  2  FROM employees
  3* WHERE SALARY > 100000 AND JOB_ID LIKE '%MAN%'
SQL>
SQL> /

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name name, job_id jobs, salary, commission_pct, salary*12 "ANNUAL SALARY", department_id
  2  FROM employees
  3* WHERE SALARY > 20000 AND JOB_ID LIKE '%MAN%'
SQL> /

no rows selected

SQL> /

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name name, job_id jobs, salary, commission_pct, salary*12 "ANNUAL SALARY", department_id
  2  FROM employees
  3* WHERE SALARY > 10000 AND JOB_ID LIKE '%MAN%'
SQL> /

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        114 Raphaely                  PU_MAN          11000                       132000            30
        145 Russell                   SA_MAN          14000             .4        168000            80
        146 Partners                  SA_MAN          13500             .3        162000            80
        147 Errazuriz                 SA_MAN          12000             .3        144000            80
        148 Cambrault                 SA_MAN          11000             .3        132000            80
        149 Zlotkey                   SA_MAN          10500             .2        126000            80
        201 Hartstein                 MK_MAN          13000                       156000            20

7 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name name, job_id jobs, salary, commission_pct, salary*12 "ANNUAL SALARY", department_id
  2  FROM employees
  3* WHERE SALARY > 1000 AND JOB_ID LIKE '%MAN%'
SQL> /

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        114 Raphaely                  PU_MAN          11000                       132000            30
        120 Weiss                     ST_MAN           8000                        96000            50
        121 Fripp                     ST_MAN           8200                        98400            50
        122 Kaufling                  ST_MAN           7900                        94800            50
        123 Vollman                   ST_MAN           6500                        78000            50
        124 Mourgos                   ST_MAN           5800                        69600            50
        145 Russell                   SA_MAN          14000             .4        168000            80
        146 Partners                  SA_MAN          13500             .3        162000            80
        147 Errazuriz                 SA_MAN          12000             .3        144000            80
        148 Cambrault                 SA_MAN          11000             .3        132000            80
        149 Zlotkey                   SA_MAN          10500             .2        126000            80

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        201 Hartstein                 MK_MAN          13000                       156000            20

12 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name name, job_id jobs, salary, commission_pct, salary*12 "ANNUAL SALARY", department_id
  2  FROM employees
  3* WHERE job_id> 1000 AND JOB_ID LIKE '%MAN%'
SQL> /
WHERE job_id> 1000 AND JOB_ID LIKE '%MAN%'
      *
ERROR at line 3:
ORA-01722: invalid number


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name name, job_id jobs, salary, commission_pct, salary*12 "ANNUAL SALARY", department_id
  2  FROM employees
  3* WHERE job_id= 23 AND JOB_ID LIKE '%MAN%'
SQL> /
WHERE job_id= 23 AND JOB_ID LIKE '%MAN%'
      *
ERROR at line 3:
ORA-01722: invalid number


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name name, job_id jobs, salary, commission_pct, salary*12 "ANNUAL SALARY", department_id
  2  FROM employees
  3* WHERE salary>1000 AND JOB_ID LIKE '%MAN%'
SQL> /

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        114 Raphaely                  PU_MAN          11000                       132000            30
        120 Weiss                     ST_MAN           8000                        96000            50
        121 Fripp                     ST_MAN           8200                        98400            50
        122 Kaufling                  ST_MAN           7900                        94800            50
        123 Vollman                   ST_MAN           6500                        78000            50
        124 Mourgos                   ST_MAN           5800                        69600            50
        145 Russell                   SA_MAN          14000             .4        168000            80
        146 Partners                  SA_MAN          13500             .3        162000            80
        147 Errazuriz                 SA_MAN          12000             .3        144000            80
        148 Cambrault                 SA_MAN          11000             .3        132000            80
        149 Zlotkey                   SA_MAN          10500             .2        126000            80

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        201 Hartstein                 MK_MAN          13000                       156000            20

12 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name name, job_id jobs, salary, commission_pct, salary*12 "ANNUAL SALARY", department_id
  2  FROM employees
  3* WHERE salary>=1000 AND JOB_ID LIKE '%MAN%'
SQL> /

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        114 Raphaely                  PU_MAN          11000                       132000            30
        120 Weiss                     ST_MAN           8000                        96000            50
        121 Fripp                     ST_MAN           8200                        98400            50
        122 Kaufling                  ST_MAN           7900                        94800            50
        123 Vollman                   ST_MAN           6500                        78000            50
        124 Mourgos                   ST_MAN           5800                        69600            50
        145 Russell                   SA_MAN          14000             .4        168000            80
        146 Partners                  SA_MAN          13500             .3        162000            80
        147 Errazuriz                 SA_MAN          12000             .3        144000            80
        148 Cambrault                 SA_MAN          11000             .3        132000            80
        149 Zlotkey                   SA_MAN          10500             .2        126000            80

EMPLOYEE_ID NAME                      JOBS           SALARY COMMISSION_PCT ANNUAL SALARY DEPARTMENT_ID
----------- ------------------------- ---------- ---------- -------------- ------------- -------------
        201 Hartstein                 MK_MAN          13000                       156000            20

12 rows selected.

SQL> SELECT employee_id, last_name, job_id, salary
  2  FROM employees
  3  WHERE salary>=10000
  4  AND job_id LIKE '%MAN%';

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        114 Raphaely                  PU_MAN          11000
        145 Russell                   SA_MAN          14000
        146 Partners                  SA_MAN          13500
        147 Errazuriz                 SA_MAN          12000
        148 Cambrault                 SA_MAN          11000
        149 Zlotkey                   SA_MAN          10500
        201 Hartstein                 MK_MAN          13000

7 rows selected.

SQL> SELECT employee_id, last_name, job_id, salary
  2  FROM employees
  3  WHERE salary>=10000
  4  OR job_id LIKE '%MAN%';

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        100 King                      AD_PRES         24000
        101 Kochhar                   AD_VP           17000
        102 De Haan                   AD_VP           17000
        108 Greenberg                 FI_MGR          12008
        114 Raphaely                  PU_MAN          11000
        120 Weiss                     ST_MAN           8000
        121 Fripp                     ST_MAN           8200
        122 Kaufling                  ST_MAN           7900
        123 Vollman                   ST_MAN           6500
        124 Mourgos                   ST_MAN           5800
        145 Russell                   SA_MAN          14000

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        146 Partners                  SA_MAN          13500
        147 Errazuriz                 SA_MAN          12000
        148 Cambrault                 SA_MAN          11000
        149 Zlotkey                   SA_MAN          10500
        150 Tucker                    SA_REP          10000
        156 King                      SA_REP          10000
        162 Vishney                   SA_REP          10500
        168 Ozer                      SA_REP          11500
        169 Bloom                     SA_REP          10000
        174 Abel                      SA_REP          11000
        201 Hartstein                 MK_MAN          13000

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        204 Baer                      PR_REP          10000
        205 Higgins                   AC_MGR          12008

24 rows selected.

SQL> SELECT last_name, job_id
  2  FROM employees
  3  WHERE job_i
  4  ;

*
ERROR at line 4:
ORA-00920: invalid relational operator


SQL> ed
Wrote file afiedt.buf

  1  SELECT last_name, job_id
  2  FROM employees
  3  WHERE job_id
  4* NOR IN ('IT_PROG', 'ST_CLERK', 'SA_REP')
  5  /
NOR IN ('IT_PROG', 'ST_CLERK', 'SA_REP')
*
ERROR at line 4:
ORA-00920: invalid relational operator


SQL> ed
Wrote file afiedt.buf

  1  SELECT last_name, job_id
  2  FROM employees
  3  WHERE job_id
  4* NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP')
SQL> /

LAST_NAME                 JOB_ID
------------------------- ----------
Baer                      PR_REP
Baida                     PU_CLERK
Bell                      SH_CLERK
Bull                      SH_CLERK
Cabrio                    SH_CLERK
Cambrault                 SA_MAN
Chen                      FI_ACCOUNT
Chung                     SH_CLERK
Colmenares                PU_CLERK
De Haan                   AD_VP
Dellinger                 SH_CLERK

LAST_NAME                 JOB_ID
------------------------- ----------
Dilly                     SH_CLERK
Errazuriz                 SA_MAN
Everett                   SH_CLERK
Faviet                    FI_ACCOUNT
Fay                       MK_REP
Feeney                    SH_CLERK
Fleaur                    SH_CLERK
Fripp                     ST_MAN
Gates                     SH_CLERK
Geoni                     SH_CLERK
Gietz                     AC_ACCOUNT

LAST_NAME                 JOB_ID
------------------------- ----------
Grant                     SH_CLERK
Greenberg                 FI_MGR
Hartstein                 MK_MAN
Higgins                   AC_MGR
Himuro                    PU_CLERK
Jones                     SH_CLERK
Kaufling                  ST_MAN
Khoo                      PU_CLERK
King                      AD_PRES
Kochhar                   AD_VP
Mavris                    HR_REP

LAST_NAME                 JOB_ID
------------------------- ----------
McCain                    SH_CLERK
Mourgos                   ST_MAN
OConnell                  SH_CLERK
Partners                  SA_MAN
Perkins                   SH_CLERK
Popp                      FI_ACCOUNT
Raphaely                  PU_MAN
Russell                   SA_MAN
Sarchand                  SH_CLERK
Sciarra                   FI_ACCOUNT
Sullivan                  SH_CLERK

LAST_NAME                 JOB_ID
------------------------- ----------
Taylor                    SH_CLERK
Tobias                    PU_CLERK
Urman                     FI_ACCOUNT
Vollman                   ST_MAN
Walsh                     SH_CLERK
Weiss                     ST_MAN
Whalen                    AD_ASST
Zlotkey                   SA_MAN

52 rows selected.

SQL> SELECT last_name, department_id, salary
  2  FROM employees
  3  WHERE department_id =60
  4  OR department_id=80
  5  AND salary>10000;

LAST_NAME                 DEPARTMENT_ID     SALARY
------------------------- ------------- ----------
Hunold                               60       9000
Ernst                                60       6000
Austin                               60       4800
Pataballa                            60       4800
Lorentz                              60       4200
Russell                              80      14000
Partners                             80      13500
Errazuriz                            80      12000
Cambrault                            80      11000
Zlotkey                              80      10500
Vishney                              80      10500

LAST_NAME                 DEPARTMENT_ID     SALARY
------------------------- ------------- ----------
Ozer                                 80      11500
Abel                                 80      11000

13 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT last_name, department_id, salary
  2  FROM employees
  3  WHERE (department_id =60
  4  OR department_id=80)
  5* AND salary>10000
SQL> /

LAST_NAME                 DEPARTMENT_ID     SALARY
------------------------- ------------- ----------
Russell                              80      14000
Partners                             80      13500
Errazuriz                            80      12000
Cambrault                            80      11000
Zlotkey                              80      10500
Vishney                              80      10500
Ozer                                 80      11500
Abel                                 80      11000

8 rows selected.

SQL> SELECT first_name, salary, salary*12+salary*12*.05 "ANNUAL SALARY + BONUS"
  2  /
SELECT first_name, salary, salary*12+salary*12*.05 "ANNUAL SALARY + BONUS"
                                                                         *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> SELECT employee_id, last_name, job_id, hire_date STARTDATE
  2  FROM employees
  3  /

EMPLOYEE_ID LAST_NAME                 JOB_ID     STARTDATE
----------- ------------------------- ---------- ---------
        100 King                      AD_PRES    17-JUN-03
        101 Kochhar                   AD_VP      21-SEP-05
        102 De Haan                   AD_VP      13-JAN-01
        103 Hunold                    IT_PROG    03-JAN-06
        104 Ernst                     IT_PROG    21-MAY-07
        105 Austin                    IT_PROG    25-JUN-05
        106 Pataballa                 IT_PROG    05-FEB-06
        107 Lorentz                   IT_PROG    07-FEB-07
        108 Greenberg                 FI_MGR     17-AUG-02
        109 Faviet                    FI_ACCOUNT 16-AUG-02
        110 Chen                      FI_ACCOUNT 28-SEP-05

EMPLOYEE_ID LAST_NAME                 JOB_ID     STARTDATE
----------- ------------------------- ---------- ---------
        111 Sciarra                   FI_ACCOUNT 30-SEP-05
        112 Urman                     FI_ACCOUNT 07-MAR-06
        113 Popp                      FI_ACCOUNT 07-DEC-07
        114 Raphaely                  PU_MAN     07-DEC-02
        115 Khoo                      PU_CLERK   18-MAY-03
        116 Baida                     PU_CLERK   24-DEC-05
        117 Tobias                    PU_CLERK   24-JUL-05
        118 Himuro                    PU_CLERK   15-NOV-06
        119 Colmenares                PU_CLERK   10-AUG-07
        120 Weiss                     ST_MAN     18-JUL-04
        121 Fripp                     ST_MAN     10-APR-05

EMPLOYEE_ID LAST_NAME                 JOB_ID     STARTDATE
----------- ------------------------- ---------- ---------
        122 Kaufling                  ST_MAN     01-MAY-03
        123 Vollman                   ST_MAN     10-OCT-05
        124 Mourgos                   ST_MAN     16-NOV-07
        125 Nayer                     ST_CLERK   16-JUL-05
        126 Mikkilineni               ST_CLERK   28-SEP-06
        127 Landry                    ST_CLERK   14-JAN-07
        128 Markle                    ST_CLERK   08-MAR-08
        129 Bissot                    ST_CLERK   20-AUG-05
        130 Atkinson                  ST_CLERK   30-OCT-05
        131 Marlow                    ST_CLERK   16-FEB-05
        132 Olson                     ST_CLERK   10-APR-07

EMPLOYEE_ID LAST_NAME                 JOB_ID     STARTDATE
----------- ------------------------- ---------- ---------
        133 Mallin                    ST_CLERK   14-JUN-04
        134 Rogers                    ST_CLERK   26-AUG-06
        135 Gee                       ST_CLERK   12-DEC-07
        136 Philtanker                ST_CLERK   06-FEB-08
        137 Ladwig                    ST_CLERK   14-JUL-03
        138 Stiles                    ST_CLERK   26-OCT-05
        139 Seo                       ST_CLERK   12-FEB-06
        140 Patel                     ST_CLERK   06-APR-06
        141 Rajs                      ST_CLERK   17-OCT-03
        142 Davies                    ST_CLERK   29-JAN-05
        143 Matos                     ST_CLERK   15-MAR-06

EMPLOYEE_ID LAST_NAME                 JOB_ID     STARTDATE
----------- ------------------------- ---------- ---------
        144 Vargas                    ST_CLERK   09-JUL-06
        145 Russell                   SA_MAN     01-OCT-04
        146 Partners                  SA_MAN     05-JAN-05
        147 Errazuriz                 SA_MAN     10-MAR-05
        148 Cambrault                 SA_MAN     15-OCT-07
        149 Zlotkey                   SA_MAN     29-JAN-08
        150 Tucker                    SA_REP     30-JAN-05
        151 Bernstein                 SA_REP     24-MAR-05
        152 Hall                      SA_REP     20-AUG-05
        153 Olsen                     SA_REP     30-MAR-06
        154 Cambrault                 SA_REP     09-DEC-06

EMPLOYEE_ID LAST_NAME                 JOB_ID     STARTDATE
----------- ------------------------- ---------- ---------
        155 Tuvault                   SA_REP     23-NOV-07
        156 King                      SA_REP     30-JAN-04
        157 Sully                     SA_REP     04-MAR-04
        158 McEwen                    SA_REP     01-AUG-04
        159 Smith                     SA_REP     10-MAR-05
        160 Doran                     SA_REP     15-DEC-05
        161 Sewall                    SA_REP     03-NOV-06
        162 Vishney                   SA_REP     11-NOV-05
        163 Greene                    SA_REP     19-MAR-07
        164 Marvins                   SA_REP     24-JAN-08
        165 Lee                       SA_REP     23-FEB-08

EMPLOYEE_ID LAST_NAME                 JOB_ID     STARTDATE
----------- ------------------------- ---------- ---------
        166 Ande                      SA_REP     24-MAR-08
        167 Banda                     SA_REP     21-APR-08
        168 Ozer                      SA_REP     11-MAR-05
        169 Bloom                     SA_REP     23-MAR-06
        170 Fox                       SA_REP     24-JAN-06
        171 Smith                     SA_REP     23-FEB-07
        172 Bates                     SA_REP     24-MAR-07
        173 Kumar                     SA_REP     21-APR-08
        174 Abel                      SA_REP     11-MAY-04
        175 Hutton                    SA_REP     19-MAR-05
        176 Taylor                    SA_REP     24-MAR-06

EMPLOYEE_ID LAST_NAME                 JOB_ID     STARTDATE
----------- ------------------------- ---------- ---------
        177 Livingston                SA_REP     23-APR-06
        178 Grant                     SA_REP     24-MAY-07
        179 Johnson                   SA_REP     04-JAN-08
        180 Taylor                    SH_CLERK   24-JAN-06
        181 Fleaur                    SH_CLERK   23-FEB-06
        182 Sullivan                  SH_CLERK   21-JUN-07
        183 Geoni                     SH_CLERK   03-FEB-08
        184 Sarchand                  SH_CLERK   27-JAN-04
        185 Bull                      SH_CLERK   20-FEB-05
        186 Dellinger                 SH_CLERK   24-JUN-06
        187 Cabrio                    SH_CLERK   07-FEB-07

EMPLOYEE_ID LAST_NAME                 JOB_ID     STARTDATE
----------- ------------------------- ---------- ---------
        188 Chung                     SH_CLERK   14-JUN-05
        189 Dilly                     SH_CLERK   13-AUG-05
        190 Gates                     SH_CLERK   11-JUL-06
        191 Perkins                   SH_CLERK   19-DEC-07
        192 Bell                      SH_CLERK   04-FEB-04
        193 Everett                   SH_CLERK   03-MAR-05
        194 McCain                    SH_CLERK   01-JUL-06
        195 Jones                     SH_CLERK   17-MAR-07
        196 Walsh                     SH_CLERK   24-APR-06
        197 Feeney                    SH_CLERK   23-MAY-06
        198 OConnell                  SH_CLERK   21-JUN-07

EMPLOYEE_ID LAST_NAME                 JOB_ID     STARTDATE
----------- ------------------------- ---------- ---------
        199 Grant                     SH_CLERK   13-JAN-08
        200 Whalen                    AD_ASST    17-SEP-03
        201 Hartstein                 MK_MAN     17-FEB-04
        202 Fay                       MK_REP     17-AUG-05
        203 Mavris                    HR_REP     07-JUN-02
        204 Baer                      PR_REP     07-JUN-02
        205 Higgins                   AC_MGR     07-JUN-02
        206 Gietz                     AC_ACCOUNT 07-JUN-02

107 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, hire_date STARTDATE
  2* FROM employees
SQL>
*/


/*

SQL*Plus: Release 19.0.0.0.0 - Production on Tue Feb 11 11:20:24 2025
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Enter user-name: sys as sysdba
Enter password:

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> alter session set container=orclpdb;

Session altered.

SQL> alter pluggable database open;
alter pluggable database open
*
ERROR at line 1:
ORA-65019: pluggable database ORCLPDB already open


SQL> conn hr/hr@orclpdb
Connected.
SQL> ed
Wrote file afiedt.buf

  1  select employee_id "Id#", last_name "Name", salary, salary*23 "Annual Salary",
  2  department_id
  3  FROM employees
  4* WHERE department_id = 90
SQL> /

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       100 King                           24000        552000             90
       101 Kochhar                        17000        391000             90
       102 De Haan                        17000        391000             90

SQL> set line 200
SQL> /

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       100 King                           24000        552000             90
       101 Kochhar                        17000        391000             90
       102 De Haan                        17000        391000             90

SQL> ed
Wrote file afiedt.buf

  1  select employee_id "Id#", last_name "Name", salary, salary*23 "Annual Salary",
  2  department_id
  3  FROM employees
  4* WHERE department_id = 10
SQL> /

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       200 Whalen                          4400        101200            10

SQL> ed
Wrote file afiedt.buf

  1  select employee_id "Id#", last_name "Name", salary, salary*23 "Annual Salary",
  2  department_id
  3  FROM employees
  4* WHERE department_id = 100
SQL> /

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       108 Greenberg                      12008        276184           100
       109 Faviet                          9000        207000           100
       110 Chen                            8200        188600           100
       111 Sciarra                         7700        177100           100
       112 Urman                           7800        179400           100
       113 Popp                            6900        158700           100

6 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select employee_id "Id#", last_name "Name", salary, salary*23 "Annual Salary",
  2  department_id
  3  FROM employees
  4* WHERE salary= 10000
SQL> /

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       150 Tucker                         10000        230000            80
       156 King                           10000        230000            80
       169 Bloom                          10000        230000            80
       204 Baer                           10000        230000            70

SQL> ed
Wrote file afiedt.buf

  1  select employee_id "Id#", last_name "Name", salary, salary*23 "Annual Salary",
  2  department_id
  3  FROM employees
  4* WHERE salary>10000
SQL> /

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       100 King                           24000        552000            90
       101 Kochhar                        17000        391000            90
       102 De Haan                        17000        391000            90
       108 Greenberg                      12008        276184           100
       114 Raphaely                       11000        253000            30
       145 Russell                        14000        322000            80
       146 Partners                       13500        310500            80
       147 Errazuriz                      12000        276000            80
       148 Cambrault                      11000        253000            80
       149 Zlotkey                        10500        241500            80
       162 Vishney                        10500        241500            80

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       168 Ozer                           11500        264500            80
       174 Abel                           11000        253000            80
       201 Hartstein                      13000        299000            20
       205 Higgins                        12008        276184           110

15 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select employee_id "Id#", last_name "Name", salary, salary*23 "Annual Salary",
  2  department_id
  3  FROM employees
  4* WHERE salary<10000
SQL> /

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       103 Hunold                          9000        207000            60
       104 Ernst                           6000        138000            60
       105 Austin                          4800        110400            60
       106 Pataballa                       4800        110400            60
       107 Lorentz                         4200         96600            60
       109 Faviet                          9000        207000           100
       110 Chen                            8200        188600           100
       111 Sciarra                         7700        177100           100
       112 Urman                           7800        179400           100
       113 Popp                            6900        158700           100
       115 Khoo                            3100         71300            30

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       116 Baida                           2900         66700            30
       117 Tobias                          2800         64400            30
       118 Himuro                          2600         59800            30
       119 Colmenares                      2500         57500            30
       120 Weiss                           8000        184000            50
       121 Fripp                           8200        188600            50
       122 Kaufling                        7900        181700            50
       123 Vollman                         6500        149500            50
       124 Mourgos                         5800        133400            50
       125 Nayer                           3200         73600            50
       126 Mikkilineni                     2700         62100            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       127 Landry                          2400         55200            50
       128 Markle                          2200         50600            50
       129 Bissot                          3300         75900            50
       130 Atkinson                        2800         64400            50
       131 Marlow                          2500         57500            50
       132 Olson                           2100         48300            50
       133 Mallin                          3300         75900            50
       134 Rogers                          2900         66700            50
       135 Gee                             2400         55200            50
       136 Philtanker                      2200         50600            50
       137 Ladwig                          3600         82800            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       138 Stiles                          3200         73600            50
       139 Seo                             2700         62100            50
       140 Patel                           2500         57500            50
       141 Rajs                            3500         80500            50
       142 Davies                          3100         71300            50
       143 Matos                           2600         59800            50
       144 Vargas                          2500         57500            50
       151 Bernstein                       9500        218500            80
       152 Hall                            9000        207000            80
       153 Olsen                           8000        184000            80
       154 Cambrault                       7500        172500            80

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       155 Tuvault                         7000        161000            80
       157 Sully                           9500        218500            80
       158 McEwen                          9000        207000            80
       159 Smith                           8000        184000            80
       160 Doran                           7500        172500            80
       161 Sewall                          7000        161000            80
       163 Greene                          9500        218500            80
       164 Marvins                         7200        165600            80
       165 Lee                             6800        156400            80
       166 Ande                            6400        147200            80
       167 Banda                           6200        142600            80

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       170 Fox                             9600        220800            80
       171 Smith                           7400        170200            80
       172 Bates                           7300        167900            80
       173 Kumar                           6100        140300            80
       175 Hutton                          8800        202400            80
       176 Taylor                          8600        197800            80
       177 Livingston                      8400        193200            80
       178 Grant                           7000        161000
       179 Johnson                         6200        142600            80
       180 Taylor                          3200         73600            50
       181 Fleaur                          3100         71300            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       182 Sullivan                        2500         57500            50
       183 Geoni                           2800         64400            50
       184 Sarchand                        4200         96600            50
       185 Bull                            4100         94300            50
       186 Dellinger                       3400         78200            50
       187 Cabrio                          3000         69000            50
       188 Chung                           3800         87400            50
       189 Dilly                           3600         82800            50
       190 Gates                           2900         66700            50
       191 Perkins                         2500         57500            50
       192 Bell                            4000         92000            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       193 Everett                         3900         89700            50
       194 McCain                          3200         73600            50
       195 Jones                           2800         64400            50
       196 Walsh                           3100         71300            50
       197 Feeney                          3000         69000            50
       198 OConnell                        2600         59800            50
       199 Grant                           2600         59800            50
       200 Whalen                          4400        101200            10
       202 Fay                             6000        138000            20
       203 Mavris                          6500        149500            40
       206 Gietz                           8300        190900           110

88 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select employee_id "Id#", last_name "Name", salary, salary*23 "Annual Salary",
  2  department_id
  3  FROM employees
  4* WHERE salary =<10000
SQL> /
WHERE salary =<10000
              *
ERROR at line 4:
ORA-00936: missing expression


SQL> ed
Wrote file afiedt.buf

  1  select employee_id "Id#", last_name "Name", salary, salary*23 "Annual Salary",
  2  department_id
  3  FROM employees
  4* WHERE salary <=10000
SQL> /

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       103 Hunold                          9000        207000            60
       104 Ernst                           6000        138000            60
       105 Austin                          4800        110400            60
       106 Pataballa                       4800        110400            60
       107 Lorentz                         4200         96600            60
       109 Faviet                          9000        207000           100
       110 Chen                            8200        188600           100
       111 Sciarra                         7700        177100           100
       112 Urman                           7800        179400           100
       113 Popp                            6900        158700           100
       115 Khoo                            3100         71300            30

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       116 Baida                           2900         66700            30
       117 Tobias                          2800         64400            30
       118 Himuro                          2600         59800            30
       119 Colmenares                      2500         57500            30
       120 Weiss                           8000        184000            50
       121 Fripp                           8200        188600            50
       122 Kaufling                        7900        181700            50
       123 Vollman                         6500        149500            50
       124 Mourgos                         5800        133400            50
       125 Nayer                           3200         73600            50
       126 Mikkilineni                     2700         62100            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       127 Landry                          2400         55200            50
       128 Markle                          2200         50600            50
       129 Bissot                          3300         75900            50
       130 Atkinson                        2800         64400            50
       131 Marlow                          2500         57500            50
       132 Olson                           2100         48300            50
       133 Mallin                          3300         75900            50
       134 Rogers                          2900         66700            50
       135 Gee                             2400         55200            50
       136 Philtanker                      2200         50600            50
       137 Ladwig                          3600         82800            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       138 Stiles                          3200         73600            50
       139 Seo                             2700         62100            50
       140 Patel                           2500         57500            50
       141 Rajs                            3500         80500            50
       142 Davies                          3100         71300            50
       143 Matos                           2600         59800            50
       144 Vargas                          2500         57500            50
       150 Tucker                         10000        230000            80
       151 Bernstein                       9500        218500            80
       152 Hall                            9000        207000            80
       153 Olsen                           8000        184000            80

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       154 Cambrault                       7500        172500            80
       155 Tuvault                         7000        161000            80
       156 King                           10000        230000            80
       157 Sully                           9500        218500            80
       158 McEwen                          9000        207000            80
       159 Smith                           8000        184000            80
       160 Doran                           7500        172500            80
       161 Sewall                          7000        161000            80
       163 Greene                          9500        218500            80
       164 Marvins                         7200        165600            80
       165 Lee                             6800        156400            80

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       166 Ande                            6400        147200            80
       167 Banda                           6200        142600            80
       169 Bloom                          10000        230000            80
       170 Fox                             9600        220800            80
       171 Smith                           7400        170200            80
       172 Bates                           7300        167900            80
       173 Kumar                           6100        140300            80
       175 Hutton                          8800        202400            80
       176 Taylor                          8600        197800            80
       177 Livingston                      8400        193200            80
       178 Grant                           7000        161000

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       179 Johnson                         6200        142600            80
       180 Taylor                          3200         73600            50
       181 Fleaur                          3100         71300            50
       182 Sullivan                        2500         57500            50
       183 Geoni                           2800         64400            50
       184 Sarchand                        4200         96600            50
       185 Bull                            4100         94300            50
       186 Dellinger                       3400         78200            50
       187 Cabrio                          3000         69000            50
       188 Chung                           3800         87400            50
       189 Dilly                           3600         82800            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       190 Gates                           2900         66700            50
       191 Perkins                         2500         57500            50
       192 Bell                            4000         92000            50
       193 Everett                         3900         89700            50
       194 McCain                          3200         73600            50
       195 Jones                           2800         64400            50
       196 Walsh                           3100         71300            50
       197 Feeney                          3000         69000            50
       198 OConnell                        2600         59800            50
       199 Grant                           2600         59800            50
       200 Whalen                          4400        101200            10

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       202 Fay                             6000        138000            20
       203 Mavris                          6500        149500            40
       204 Baer                           10000        230000            70
       206 Gietz                           8300        190900           110

92 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select employee_id "Id#", last_name "Name", salary, salary*23 "Annual Salary",
  2  department_id
  3  FROM employees
  4* WHERE salary =< 10000
SQL> /
WHERE salary =< 10000
              *
ERROR at line 4:
ORA-00936: missing expression


SQL> ed
Wrote file afiedt.buf

  1  select employee_id "Id#", last_name "Name", salary, salary*23 "Annual Salary",
  2  department_id
  3  FROM employees
  4* WHERE department_id <=90
SQL> /

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       100 King                           24000        552000            90
       101 Kochhar                        17000        391000            90
       102 De Haan                        17000        391000            90
       103 Hunold                          9000        207000            60
       104 Ernst                           6000        138000            60
       105 Austin                          4800        110400            60
       106 Pataballa                       4800        110400            60
       107 Lorentz                         4200         96600            60
       114 Raphaely                       11000        253000            30
       115 Khoo                            3100         71300            30
       116 Baida                           2900         66700            30

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       117 Tobias                          2800         64400            30
       118 Himuro                          2600         59800            30
       119 Colmenares                      2500         57500            30
       120 Weiss                           8000        184000            50
       121 Fripp                           8200        188600            50
       122 Kaufling                        7900        181700            50
       123 Vollman                         6500        149500            50
       124 Mourgos                         5800        133400            50
       125 Nayer                           3200         73600            50
       126 Mikkilineni                     2700         62100            50
       127 Landry                          2400         55200            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       128 Markle                          2200         50600            50
       129 Bissot                          3300         75900            50
       130 Atkinson                        2800         64400            50
       131 Marlow                          2500         57500            50
       132 Olson                           2100         48300            50
       133 Mallin                          3300         75900            50
       134 Rogers                          2900         66700            50
       135 Gee                             2400         55200            50
       136 Philtanker                      2200         50600            50
       137 Ladwig                          3600         82800            50
       138 Stiles                          3200         73600            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       139 Seo                             2700         62100            50
       140 Patel                           2500         57500            50
       141 Rajs                            3500         80500            50
       142 Davies                          3100         71300            50
       143 Matos                           2600         59800            50
       144 Vargas                          2500         57500            50
       145 Russell                        14000        322000            80
       146 Partners                       13500        310500            80
       147 Errazuriz                      12000        276000            80
       148 Cambrault                      11000        253000            80
       149 Zlotkey                        10500        241500            80

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       150 Tucker                         10000        230000            80
       151 Bernstein                       9500        218500            80
       152 Hall                            9000        207000            80
       153 Olsen                           8000        184000            80
       154 Cambrault                       7500        172500            80
       155 Tuvault                         7000        161000            80
       156 King                           10000        230000            80
       157 Sully                           9500        218500            80
       158 McEwen                          9000        207000            80
       159 Smith                           8000        184000            80
       160 Doran                           7500        172500            80

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       161 Sewall                          7000        161000            80
       162 Vishney                        10500        241500            80
       163 Greene                          9500        218500            80
       164 Marvins                         7200        165600            80
       165 Lee                             6800        156400            80
       166 Ande                            6400        147200            80
       167 Banda                           6200        142600            80
       168 Ozer                           11500        264500            80
       169 Bloom                          10000        230000            80
       170 Fox                             9600        220800            80
       171 Smith                           7400        170200            80

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       172 Bates                           7300        167900            80
       173 Kumar                           6100        140300            80
       174 Abel                           11000        253000            80
       175 Hutton                          8800        202400            80
       176 Taylor                          8600        197800            80
       177 Livingston                      8400        193200            80
       179 Johnson                         6200        142600            80
       180 Taylor                          3200         73600            50
       181 Fleaur                          3100         71300            50
       182 Sullivan                        2500         57500            50
       183 Geoni                           2800         64400            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       184 Sarchand                        4200         96600            50
       185 Bull                            4100         94300            50
       186 Dellinger                       3400         78200            50
       187 Cabrio                          3000         69000            50
       188 Chung                           3800         87400            50
       189 Dilly                           3600         82800            50
       190 Gates                           2900         66700            50
       191 Perkins                         2500         57500            50
       192 Bell                            4000         92000            50
       193 Everett                         3900         89700            50
       194 McCain                          3200         73600            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       195 Jones                           2800         64400            50
       196 Walsh                           3100         71300            50
       197 Feeney                          3000         69000            50
       198 OConnell                        2600         59800            50
       199 Grant                           2600         59800            50
       200 Whalen                          4400        101200            10
       201 Hartstein                      13000        299000            20
       202 Fay                             6000        138000            20
       203 Mavris                          6500        149500            40
       204 Baer                           10000        230000            70

98 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select employee_id "Id#", last_name "Name", salary, salary*23 "Annual Salary",
  2  department_id
  3  FROM employees
  4* WHERE department_id <=90
SQL> /

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       100 King                           24000        552000            90
       101 Kochhar                        17000        391000            90
       102 De Haan                        17000        391000            90
       103 Hunold                          9000        207000            60
       104 Ernst                           6000        138000            60
       105 Austin                          4800        110400            60
       106 Pataballa                       4800        110400            60
       107 Lorentz                         4200         96600            60
       114 Raphaely                       11000        253000            30
       115 Khoo                            3100         71300            30
       116 Baida                           2900         66700            30

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       117 Tobias                          2800         64400            30
       118 Himuro                          2600         59800            30
       119 Colmenares                      2500         57500            30
       120 Weiss                           8000        184000            50
       121 Fripp                           8200        188600            50
       122 Kaufling                        7900        181700            50
       123 Vollman                         6500        149500            50
       124 Mourgos                         5800        133400            50
       125 Nayer                           3200         73600            50
       126 Mikkilineni                     2700         62100            50
       127 Landry                          2400         55200            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       128 Markle                          2200         50600            50
       129 Bissot                          3300         75900            50
       130 Atkinson                        2800         64400            50
       131 Marlow                          2500         57500            50
       132 Olson                           2100         48300            50
       133 Mallin                          3300         75900            50
       134 Rogers                          2900         66700            50
       135 Gee                             2400         55200            50
       136 Philtanker                      2200         50600            50
       137 Ladwig                          3600         82800            50
       138 Stiles                          3200         73600            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       139 Seo                             2700         62100            50
       140 Patel                           2500         57500            50
       141 Rajs                            3500         80500            50
       142 Davies                          3100         71300            50
       143 Matos                           2600         59800            50
       144 Vargas                          2500         57500            50
       145 Russell                        14000        322000            80
       146 Partners                       13500        310500            80
       147 Errazuriz                      12000        276000            80
       148 Cambrault                      11000        253000            80
       149 Zlotkey                        10500        241500            80

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       150 Tucker                         10000        230000            80
       151 Bernstein                       9500        218500            80
       152 Hall                            9000        207000            80
       153 Olsen                           8000        184000            80
       154 Cambrault                       7500        172500            80
       155 Tuvault                         7000        161000            80
       156 King                           10000        230000            80
       157 Sully                           9500        218500            80
       158 McEwen                          9000        207000            80
       159 Smith                           8000        184000            80
       160 Doran                           7500        172500            80

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       161 Sewall                          7000        161000            80
       162 Vishney                        10500        241500            80
       163 Greene                          9500        218500            80
       164 Marvins                         7200        165600            80
       165 Lee                             6800        156400            80
       166 Ande                            6400        147200            80
       167 Banda                           6200        142600            80
       168 Ozer                           11500        264500            80
       169 Bloom                          10000        230000            80
       170 Fox                             9600        220800            80
       171 Smith                           7400        170200            80

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       172 Bates                           7300        167900            80
       173 Kumar                           6100        140300            80
       174 Abel                           11000        253000            80
       175 Hutton                          8800        202400            80
       176 Taylor                          8600        197800            80
       177 Livingston                      8400        193200            80
       179 Johnson                         6200        142600            80
       180 Taylor                          3200         73600            50
       181 Fleaur                          3100         71300            50
       182 Sullivan                        2500         57500            50
       183 Geoni                           2800         64400            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       184 Sarchand                        4200         96600            50
       185 Bull                            4100         94300            50
       186 Dellinger                       3400         78200            50
       187 Cabrio                          3000         69000            50
       188 Chung                           3800         87400            50
       189 Dilly                           3600         82800            50
       190 Gates                           2900         66700            50
       191 Perkins                         2500         57500            50
       192 Bell                            4000         92000            50
       193 Everett                         3900         89700            50
       194 McCain                          3200         73600            50

       Id# Name                          SALARY Annual Salary DEPARTMENT_ID
---------- ------------------------- ---------- ------------- -------------
       195 Jones                           2800         64400            50
       196 Walsh                           3100         71300            50
       197 Feeney                          3000         69000            50
       198 OConnell                        2600         59800            50
       199 Grant                           2600         59800            50
       200 Whalen                          4400        101200            10
       201 Hartstein                      13000        299000            20
       202 Fay                             6000        138000            20
       203 Mavris                          6500        149500            40
       204 Baer                           10000        230000            70

98 rows selected.

SQL> select last_name, job_id, department_id from employees where last_name='Whalen';

LAST_NAME                 JOB_ID     DEPARTMENT_ID
------------------------- ---------- -------------
Whalen                    AD_ASST               10

SQL> select last_name, job_id, department_id from emplpyees where last_name ='WHALEN';
select last_name, job_id, department_id from emplpyees where last_name ='WHALEN'
                                             *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> select last_name from employees where hire_date ='17-oct-03';

LAST_NAME
-------------------------
Rajs

SQL> ed
Wrote file afiedt.buf

  1* select last_name from employees where hire_date ='17-oct-03'
SQL> /

LAST_NAME
-------------------------
Rajs

SQL> ed
Wrote file afiedt.buf

  1* select last_name, salary, department_id from employees where hire_date ='17-10-03'
  2  /
select last_name, salary, department_id from employees where hire_date ='17-10-03'
                                                                        *
ERROR at line 1:
ORA-01843: not a valid month


SQL> ed
Wrote file afiedt.buf

  1* select last_name, salary, department_id from employees where salary=1000
SQL> /

no rows selected

SQL> /

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, department_id
  2  from employees
  3* where salary = 1000
SQL> /

no rows selected

SQL> /

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, department_id
  2  from employees
  3* where salary = 1000
SQL> /

no rows selected

SQL> /

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, department_id
  2  from employees
  3* where Job_id = 'IT_PROG'
SQL> /

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Hunold                          9000            60
Ernst                           6000            60
Austin                          4800            60
Pataballa                       4800            60
Lorentz                         4200            60

SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, department_id
  2  from employees
  3* where Job_id <> 'IT_PROG'
SQL> /

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
King                           24000            90
Kochhar                        17000            90
De Haan                        17000            90
Greenberg                      12008           100
Faviet                          9000           100
Chen                            8200           100
Sciarra                         7700           100
Urman                           7800           100
Popp                            6900           100
Raphaely                       11000            30
Khoo                            3100            30

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Baida                           2900            30
Tobias                          2800            30
Himuro                          2600            30
Colmenares                      2500            30
Weiss                           8000            50
Fripp                           8200            50
Kaufling                        7900            50
Vollman                         6500            50
Mourgos                         5800            50
Nayer                           3200            50
Mikkilineni                     2700            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Landry                          2400            50
Markle                          2200            50
Bissot                          3300            50
Atkinson                        2800            50
Marlow                          2500            50
Olson                           2100            50
Mallin                          3300            50
Rogers                          2900            50
Gee                             2400            50
Philtanker                      2200            50
Ladwig                          3600            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Stiles                          3200            50
Seo                             2700            50
Patel                           2500            50
Rajs                            3500            50
Davies                          3100            50
Matos                           2600            50
Vargas                          2500            50
Russell                        14000            80
Partners                       13500            80
Errazuriz                      12000            80
Cambrault                      11000            80

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Zlotkey                        10500            80
Tucker                         10000            80
Bernstein                       9500            80
Hall                            9000            80
Olsen                           8000            80
Cambrault                       7500            80
Tuvault                         7000            80
King                           10000            80
Sully                           9500            80
McEwen                          9000            80
Smith                           8000            80

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Doran                           7500            80
Sewall                          7000            80
Vishney                        10500            80
Greene                          9500            80
Marvins                         7200            80
Lee                             6800            80
Ande                            6400            80
Banda                           6200            80
Ozer                           11500            80
Bloom                          10000            80
Fox                             9600            80

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Smith                           7400            80
Bates                           7300            80
Kumar                           6100            80
Abel                           11000            80
Hutton                          8800            80
Taylor                          8600            80
Livingston                      8400            80
Grant                           7000
Johnson                         6200            80
Taylor                          3200            50
Fleaur                          3100            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Sullivan                        2500            50
Geoni                           2800            50
Sarchand                        4200            50
Bull                            4100            50
Dellinger                       3400            50
Cabrio                          3000            50
Chung                           3800            50
Dilly                           3600            50
Gates                           2900            50
Perkins                         2500            50
Bell                            4000            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Everett                         3900            50
McCain                          3200            50
Jones                           2800            50
Walsh                           3100            50
Feeney                          3000            50
OConnell                        2600            50
Grant                           2600            50
Whalen                          4400            10
Hartstein                      13000            20
Fay                             6000            20
Mavris                          6500            40

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Baer                           10000            70
Higgins                        12008           110
Gietz                           8300           110

102 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, department_id
  2  from employees
  3* where hire_date = '17-OCT-03'
SQL> /

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Rajs                            3500            50

SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, hire_date, department_id
  2  from employees
  3* where hire_date = '17-OCT-03'
SQL> /

LAST_NAME                     SALARY HIRE_DATE DEPARTMENT_ID
------------------------- ---------- --------- -------------
Rajs                            3500 17-OCT-03            50

SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, hire_date, department_id
  2  from employees
  3* where hire_date <= '17-OCT-03'
SQL> /

LAST_NAME                     SALARY HIRE_DATE DEPARTMENT_ID
------------------------- ---------- --------- -------------
King                           24000 17-JUN-03            90
De Haan                        17000 13-JAN-01            90
Greenberg                      12008 17-AUG-02           100
Faviet                          9000 16-AUG-02           100
Raphaely                       11000 07-DEC-02            30
Khoo                            3100 18-MAY-03            30
Kaufling                        7900 01-MAY-03            50
Ladwig                          3600 14-JUL-03            50
Rajs                            3500 17-OCT-03            50
Whalen                          4400 17-SEP-03            10
Mavris                          6500 07-JUN-02            40

LAST_NAME                     SALARY HIRE_DATE DEPARTMENT_ID
------------------------- ---------- --------- -------------
Baer                           10000 07-JUN-02            70
Higgins                        12008 07-JUN-02           110
Gietz                           8300 07-JUN-02           110

14 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, hire_date, department_id
  2  from employees
  3* where hire_date =< '17-OCT-03'
SQL> /
where hire_date =< '17-OCT-03'
                 *
ERROR at line 3:
ORA-00936: missing expression


SQL> /
where hire_date =< '17-OCT-03'
                 *
ERROR at line 3:
ORA-00936: missing expression


SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, hire_date, department_id,country_id,region_id
  2  from employees
  3* where hire_date = '17-OCT-03'
SQL> /
select last_name, salary, hire_date, department_id,country_id,region_id
                                                              *
ERROR at line 1:
ORA-00904: "REGION_ID": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, hire_date, department_id, Job_id,
  2  from employees
  3* where hire_date = '17-OCT-03'
SQL> /
from employees
*
ERROR at line 2:
ORA-00936: missing expression


SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, hire_date, department_id, Job_id
  2  from employees
  3* where hire_date = '17-OCT-03'
SQL> /

LAST_NAME                     SALARY HIRE_DATE DEPARTMENT_ID JOB_ID
------------------------- ---------- --------- ------------- ----------
Rajs                            3500 17-OCT-03            50 ST_CLERK

SQL> /

LAST_NAME                     SALARY HIRE_DATE DEPARTMENT_ID JOB_ID
------------------------- ---------- --------- ------------- ----------
Rajs                            3500 17-OCT-03            50 ST_CLERK

SQL> ?

 HELP
 ----

 Accesses this command line help system. Enter HELP INDEX or ? INDEX
 for a list of topics.

 You can view SQL*Plus resources at
     http://www.oracle.com/technology/documentation/

 ******************************************************************************
 **  Top 12.2 features:                                                      **
 **    - Fast retrieval of data as CSV for use in applications like          **
 **      SQL*Loader. Use SQLPLUS -M "CSV ON" or SET MARKUP CSV ON            **
 **    - Improved defaults and optimizations for reports. Use SQLPLUS -F     **
 **    - Command recall. Use SET HISTORY ON and HISTORY to list previous     **
 **      commands.                                                           **
 ******************************************************************************

 HELP|? [topic]


SQL> /

LAST_NAME                     SALARY HIRE_DATE DEPARTMENT_ID JOB_ID
------------------------- ---------- --------- ------------- ----------
Rajs                            3500 17-OCT-03            50 ST_CLERK

SQL> /

LAST_NAME                     SALARY HIRE_DATE DEPARTMENT_ID JOB_ID
------------------------- ---------- --------- ------------- ----------
Rajs                            3500 17-OCT-03            50 ST_CLERK

SQL> ?

 HELP
 ----

 Accesses this command line help system. Enter HELP INDEX or ? INDEX
 for a list of topics.

 You can view SQL*Plus resources at
     http://www.oracle.com/technology/documentation/

 ******************************************************************************
 **  Top 12.2 features:                                                      **
 **    - Fast retrieval of data as CSV for use in applications like          **
 **      SQL*Loader. Use SQLPLUS -M "CSV ON" or SET MARKUP CSV ON            **
 **    - Improved defaults and optimizations for reports. Use SQLPLUS -F     **
 **    - Command recall. Use SET HISTORY ON and HISTORY to list previous     **
 **      commands.                                                           **
 ******************************************************************************

 HELP|? [topic]


SQL> ?

 HELP
 ----

 Accesses this command line help system. Enter HELP INDEX or ? INDEX
 for a list of topics.

 You can view SQL*Plus resources at
     http://www.oracle.com/technology/documentation/

 ******************************************************************************
 **  Top 12.2 features:                                                      **
 **    - Fast retrieval of data as CSV for use in applications like          **
 **      SQL*Loader. Use SQLPLUS -M "CSV ON" or SET MARKUP CSV ON            **
 **    - Improved defaults and optimizations for reports. Use SQLPLUS -F     **
 **    - Command recall. Use SET HISTORY ON and HISTORY to list previous     **
 **      commands.                                                           **
 ******************************************************************************

 HELP|? [topic]


SQL> ?

 HELP
 ----

 Accesses this command line help system. Enter HELP INDEX or ? INDEX
 for a list of topics.

 You can view SQL*Plus resources at
     http://www.oracle.com/technology/documentation/

 ******************************************************************************
 **  Top 12.2 features:                                                      **
 **    - Fast retrieval of data as CSV for use in applications like          **
 **      SQL*Loader. Use SQLPLUS -M "CSV ON" or SET MARKUP CSV ON            **
 **    - Improved defaults and optimizations for reports. Use SQLPLUS -F     **
 **    - Command recall. Use SET HISTORY ON and HISTORY to list previous     **
 **      commands.                                                           **
 ******************************************************************************

 HELP|? [topic]


SQL> ?

 HELP
 ----

 Accesses this command line help system. Enter HELP INDEX or ? INDEX
 for a list of topics.

 You can view SQL*Plus resources at
     http://www.oracle.com/technology/documentation/

 ******************************************************************************
 **  Top 12.2 features:                                                      **
 **    - Fast retrieval of data as CSV for use in applications like          **
 **      SQL*Loader. Use SQLPLUS -M "CSV ON" or SET MARKUP CSV ON            **
 **    - Improved defaults and optimizations for reports. Use SQLPLUS -F     **
 **    - Command recall. Use SET HISTORY ON and HISTORY to list previous     **
 **      commands.                                                           **
 ******************************************************************************

 HELP|? [topic]


SQL> HELP\?select
SP2-0172: No HELP matching this topic was found.
SQL> select last_name, job_id, department_id
  2  from employees
  3  where last_name='Whalen';

LAST_NAME                 JOB_ID     DEPARTMENT_ID
------------------------- ---------- -------------
Whalen                    AD_ASST               10

SQL> select last_name
  2  from employees
  3  where hire_date ='17-oct-03';

LAST_NAME
-------------------------
Rajs

SQL>

*/
/* SQL 16 FEB


SQL*Plus: Release 19.0.0.0.0 - Production on Sun Feb 16 09:03:42 2025
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Enter user-name: sys as sysdba
Enter password:

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> alter session set container=orclpdb;

Session altered.

SQL> alter pluggable database open;
alter pluggable database open
*
ERROR at line 1:
ORA-65019: pluggable database ORCLPDB already open


SQL> conn hr/hr@orclpdb;
Connected.
SQL> SELECT employee_id, hire_date, MONTHS_BETWEEN (SYSDATE, hire_date) TENURE, ADD_MONTHS (hire_date,6) REVIEW, NEXT_DAY (hire_date, 'FRIDAY'), LAST_DAY(hire_date)
  2  FROM employees
  3  WHERE MONTHS_BETWEEN (SYSDATE, hire_date) < 150;

no rows selected

SQL> SELECT employee_id, hire_date,
  2  ROUND(hire_date, 'MONTH'), TRUNC(hire_date, 'MONTH')
  3  FROM employees
  4  WHERE hire_date LIKE '%04'
  5  /

EMPLOYEE_ID HIRE_DATE ROUND(HIR TRUNC(HIR
----------- --------- --------- ---------
        120 18-JUL-04 01-AUG-04 01-JUL-04
        133 14-JUN-04 01-JUN-04 01-JUN-04
        145 01-OCT-04 01-OCT-04 01-OCT-04
        156 30-JAN-04 01-FEB-04 01-JAN-04
        157 04-MAR-04 01-MAR-04 01-MAR-04
        158 01-AUG-04 01-AUG-04 01-AUG-04
        174 11-MAY-04 01-MAY-04 01-MAY-04
        184 27-JAN-04 01-FEB-04 01-JAN-04
        192 04-FEB-04 01-FEB-04 01-FEB-04
        201 17-FEB-04 01-MAR-04 01-FEB-04

10 rows selected.

SQL> SELECT last_name, job_id, department_id, hire_date
  2  FROM employees
  3  ORDER BY hire_date;

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
De Haan                   AD_VP                 90 13-JAN-01
Gietz                     AC_ACCOUNT           110 07-JUN-02
Baer                      PR_REP                70 07-JUN-02
Mavris                    HR_REP                40 07-JUN-02
Higgins                   AC_MGR               110 07-JUN-02
Faviet                    FI_ACCOUNT           100 16-AUG-02
Greenberg                 FI_MGR               100 17-AUG-02
Raphaely                  PU_MAN                30 07-DEC-02
Kaufling                  ST_MAN                50 01-MAY-03
Khoo                      PU_CLERK              30 18-MAY-03
King                      AD_PRES               90 17-JUN-03

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Ladwig                    ST_CLERK              50 14-JUL-03
Whalen                    AD_ASST               10 17-SEP-03
Rajs                      ST_CLERK              50 17-OCT-03
Sarchand                  SH_CLERK              50 27-JAN-04
King                      SA_REP                80 30-JAN-04
Bell                      SH_CLERK              50 04-FEB-04
Hartstein                 MK_MAN                20 17-FEB-04
Sully                     SA_REP                80 04-MAR-04
Abel                      SA_REP                80 11-MAY-04
Mallin                    ST_CLERK              50 14-JUN-04
Weiss                     ST_MAN                50 18-JUL-04

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
McEwen                    SA_REP                80 01-AUG-04
Russell                   SA_MAN                80 01-OCT-04
Partners                  SA_MAN                80 05-JAN-05
Davies                    ST_CLERK              50 29-JAN-05
Tucker                    SA_REP                80 30-JAN-05
Marlow                    ST_CLERK              50 16-FEB-05
Bull                      SH_CLERK              50 20-FEB-05
Everett                   SH_CLERK              50 03-MAR-05
Errazuriz                 SA_MAN                80 10-MAR-05
Smith                     SA_REP                80 10-MAR-05
Ozer                      SA_REP                80 11-MAR-05

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Hutton                    SA_REP                80 19-MAR-05
Bernstein                 SA_REP                80 24-MAR-05
Fripp                     ST_MAN                50 10-APR-05
Chung                     SH_CLERK              50 14-JUN-05
Austin                    IT_PROG               60 25-JUN-05
Nayer                     ST_CLERK              50 16-JUL-05
Tobias                    PU_CLERK              30 24-JUL-05
Dilly                     SH_CLERK              50 13-AUG-05
Fay                       MK_REP                20 17-AUG-05
Hall                      SA_REP                80 20-AUG-05
Bissot                    ST_CLERK              50 20-AUG-05

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Kochhar                   AD_VP                 90 21-SEP-05
Chen                      FI_ACCOUNT           100 28-SEP-05
Sciarra                   FI_ACCOUNT           100 30-SEP-05
Vollman                   ST_MAN                50 10-OCT-05
Stiles                    ST_CLERK              50 26-OCT-05
Atkinson                  ST_CLERK              50 30-OCT-05
Vishney                   SA_REP                80 11-NOV-05
Doran                     SA_REP                80 15-DEC-05
Baida                     PU_CLERK              30 24-DEC-05
Hunold                    IT_PROG               60 03-JAN-06
Fox                       SA_REP                80 24-JAN-06

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Taylor                    SH_CLERK              50 24-JAN-06
Pataballa                 IT_PROG               60 05-FEB-06
Seo                       ST_CLERK              50 12-FEB-06
Fleaur                    SH_CLERK              50 23-FEB-06
Urman                     FI_ACCOUNT           100 07-MAR-06
Matos                     ST_CLERK              50 15-MAR-06
Bloom                     SA_REP                80 23-MAR-06
Taylor                    SA_REP                80 24-MAR-06
Olsen                     SA_REP                80 30-MAR-06
Patel                     ST_CLERK              50 06-APR-06
Livingston                SA_REP                80 23-APR-06

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Walsh                     SH_CLERK              50 24-APR-06
Feeney                    SH_CLERK              50 23-MAY-06
Dellinger                 SH_CLERK              50 24-JUN-06
McCain                    SH_CLERK              50 01-JUL-06
Vargas                    ST_CLERK              50 09-JUL-06
Gates                     SH_CLERK              50 11-JUL-06
Rogers                    ST_CLERK              50 26-AUG-06
Mikkilineni               ST_CLERK              50 28-SEP-06
Sewall                    SA_REP                80 03-NOV-06
Himuro                    PU_CLERK              30 15-NOV-06
Cambrault                 SA_REP                80 09-DEC-06

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Landry                    ST_CLERK              50 14-JAN-07
Cabrio                    SH_CLERK              50 07-FEB-07
Lorentz                   IT_PROG               60 07-FEB-07
Smith                     SA_REP                80 23-FEB-07
Jones                     SH_CLERK              50 17-MAR-07
Greene                    SA_REP                80 19-MAR-07
Bates                     SA_REP                80 24-MAR-07
Olson                     ST_CLERK              50 10-APR-07
Ernst                     IT_PROG               60 21-MAY-07
Grant                     SA_REP                   24-MAY-07
OConnell                  SH_CLERK              50 21-JUN-07

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Sullivan                  SH_CLERK              50 21-JUN-07
Colmenares                PU_CLERK              30 10-AUG-07
Cambrault                 SA_MAN                80 15-OCT-07
Mourgos                   ST_MAN                50 16-NOV-07
Tuvault                   SA_REP                80 23-NOV-07
Popp                      FI_ACCOUNT           100 07-DEC-07
Gee                       ST_CLERK              50 12-DEC-07
Perkins                   SH_CLERK              50 19-DEC-07
Johnson                   SA_REP                80 04-JAN-08
Grant                     SH_CLERK              50 13-JAN-08
Marvins                   SA_REP                80 24-JAN-08

LAST_NAME                 JOB_ID     DEPARTMENT_ID HIRE_DATE
------------------------- ---------- ------------- ---------
Zlotkey                   SA_MAN                80 29-JAN-08
Geoni                     SH_CLERK              50 03-FEB-08
Philtanker                ST_CLERK              50 06-FEB-08
Lee                       SA_REP                80 23-FEB-08
Markle                    ST_CLERK              50 08-MAR-08
Ande                      SA_REP                80 24-MAR-08
Banda                     SA_REP                80 21-APR-08
Kumar                     SA_REP                80 21-APR-08

107 rows selected.

SQL> SELECT last_name, salary as sal, department_id deptid, hire_date
  2  from employees
  3  order by salary;

LAST_NAME                        SAL     DEPTID HIRE_DATE
------------------------- ---------- ---------- ---------
Olson                           2100         50 10-APR-07
Markle                          2200         50 08-MAR-08
Philtanker                      2200         50 06-FEB-08
Landry                          2400         50 14-JAN-07
Gee                             2400         50 12-DEC-07
Colmenares                      2500         30 10-AUG-07
Marlow                          2500         50 16-FEB-05
Patel                           2500         50 06-APR-06
Vargas                          2500         50 09-JUL-06
Sullivan                        2500         50 21-JUN-07
Perkins                         2500         50 19-DEC-07

LAST_NAME                        SAL     DEPTID HIRE_DATE
------------------------- ---------- ---------- ---------
Himuro                          2600         30 15-NOV-06
Matos                           2600         50 15-MAR-06
OConnell                        2600         50 21-JUN-07
Grant                           2600         50 13-JAN-08
Mikkilineni                     2700         50 28-SEP-06
Seo                             2700         50 12-FEB-06
Tobias                          2800         30 24-JUL-05
Atkinson                        2800         50 30-OCT-05
Geoni                           2800         50 03-FEB-08
Jones                           2800         50 17-MAR-07
Baida                           2900         30 24-DEC-05

LAST_NAME                        SAL     DEPTID HIRE_DATE
------------------------- ---------- ---------- ---------
Rogers                          2900         50 26-AUG-06
Gates                           2900         50 11-JUL-06
Cabrio                          3000         50 07-FEB-07
Feeney                          3000         50 23-MAY-06
Khoo                            3100         30 18-MAY-03
Davies                          3100         50 29-JAN-05
Fleaur                          3100         50 23-FEB-06
Walsh                           3100         50 24-APR-06
Nayer                           3200         50 16-JUL-05
Stiles                          3200         50 26-OCT-05
Taylor                          3200         50 24-JAN-06

LAST_NAME                        SAL     DEPTID HIRE_DATE
------------------------- ---------- ---------- ---------
McCain                          3200         50 01-JUL-06
Bissot                          3300         50 20-AUG-05
Mallin                          3300         50 14-JUN-04
Dellinger                       3400         50 24-JUN-06
Rajs                            3500         50 17-OCT-03
Ladwig                          3600         50 14-JUL-03
Dilly                           3600         50 13-AUG-05
Chung                           3800         50 14-JUN-05
Everett                         3900         50 03-MAR-05
Bell                            4000         50 04-FEB-04
Bull                            4100         50 20-FEB-05

LAST_NAME                        SAL     DEPTID HIRE_DATE
------------------------- ---------- ---------- ---------
Lorentz                         4200         60 07-FEB-07
Sarchand                        4200         50 27-JAN-04
Whalen                          4400         10 17-SEP-03
Austin                          4800         60 25-JUN-05
Pataballa                       4800         60 05-FEB-06
Mourgos                         5800         50 16-NOV-07
Ernst                           6000         60 21-MAY-07
Fay                             6000         20 17-AUG-05
Kumar                           6100         80 21-APR-08
Banda                           6200         80 21-APR-08
Johnson                         6200         80 04-JAN-08

LAST_NAME                        SAL     DEPTID HIRE_DATE
------------------------- ---------- ---------- ---------
Ande                            6400         80 24-MAR-08
Vollman                         6500         50 10-OCT-05
Mavris                          6500         40 07-JUN-02
Lee                             6800         80 23-FEB-08
Popp                            6900        100 07-DEC-07
Tuvault                         7000         80 23-NOV-07
Sewall                          7000         80 03-NOV-06
Grant                           7000            24-MAY-07
Marvins                         7200         80 24-JAN-08
Bates                           7300         80 24-MAR-07
Smith                           7400         80 23-FEB-07

LAST_NAME                        SAL     DEPTID HIRE_DATE
------------------------- ---------- ---------- ---------
Cambrault                       7500         80 09-DEC-06
Doran                           7500         80 15-DEC-05
Sciarra                         7700        100 30-SEP-05
Urman                           7800        100 07-MAR-06
Kaufling                        7900         50 01-MAY-03
Weiss                           8000         50 18-JUL-04
Olsen                           8000         80 30-MAR-06
Smith                           8000         80 10-MAR-05
Chen                            8200        100 28-SEP-05
Fripp                           8200         50 10-APR-05
Gietz                           8300        110 07-JUN-02

LAST_NAME                        SAL     DEPTID HIRE_DATE
------------------------- ---------- ---------- ---------
Livingston                      8400         80 23-APR-06
Taylor                          8600         80 24-MAR-06
Hutton                          8800         80 19-MAR-05
Hunold                          9000         60 03-JAN-06
Faviet                          9000        100 16-AUG-02
Hall                            9000         80 20-AUG-05
McEwen                          9000         80 01-AUG-04
Sully                           9500         80 04-MAR-04
Greene                          9500         80 19-MAR-07
Bernstein                       9500         80 24-MAR-05
Fox                             9600         80 24-JAN-06

LAST_NAME                        SAL     DEPTID HIRE_DATE
------------------------- ---------- ---------- ---------
Baer                           10000         70 07-JUN-02
Bloom                          10000         80 23-MAR-06
King                           10000         80 30-JAN-04
Tucker                         10000         80 30-JAN-05
Vishney                        10500         80 11-NOV-05
Zlotkey                        10500         80 29-JAN-08
Cambrault                      11000         80 15-OCT-07
Raphaely                       11000         30 07-DEC-02
Abel                           11000         80 11-MAY-04
Ozer                           11500         80 11-MAR-05
Errazuriz                      12000         80 10-MAR-05

LAST_NAME                        SAL     DEPTID HIRE_DATE
------------------------- ---------- ---------- ---------
Higgins                        12008        110 07-JUN-02
Greenberg                      12008        100 17-AUG-02
Hartstein                      13000         20 17-FEB-04
Partners                       13500         80 05-JAN-05
Russell                        14000         80 01-OCT-04
De Haan                        17000         90 13-JAN-01
Kochhar                        17000         90 21-SEP-05
King                           24000         90 17-JUN-03

107 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT last_name name, salary as sal, department_id deptid, hire_date hiring
  2  from employees
  3* order by salary
SQL> /

NAME                             SAL     DEPTID HIRING
------------------------- ---------- ---------- ---------
Olson                           2100         50 10-APR-07
Markle                          2200         50 08-MAR-08
Philtanker                      2200         50 06-FEB-08
Landry                          2400         50 14-JAN-07
Gee                             2400         50 12-DEC-07
Colmenares                      2500         30 10-AUG-07
Marlow                          2500         50 16-FEB-05
Patel                           2500         50 06-APR-06
Vargas                          2500         50 09-JUL-06
Sullivan                        2500         50 21-JUN-07
Perkins                         2500         50 19-DEC-07

NAME                             SAL     DEPTID HIRING
------------------------- ---------- ---------- ---------
Himuro                          2600         30 15-NOV-06
Matos                           2600         50 15-MAR-06
OConnell                        2600         50 21-JUN-07
Grant                           2600         50 13-JAN-08
Mikkilineni                     2700         50 28-SEP-06
Seo                             2700         50 12-FEB-06
Tobias                          2800         30 24-JUL-05
Atkinson                        2800         50 30-OCT-05
Geoni                           2800         50 03-FEB-08
Jones                           2800         50 17-MAR-07
Baida                           2900         30 24-DEC-05

NAME                             SAL     DEPTID HIRING
------------------------- ---------- ---------- ---------
Rogers                          2900         50 26-AUG-06
Gates                           2900         50 11-JUL-06
Cabrio                          3000         50 07-FEB-07
Feeney                          3000         50 23-MAY-06
Khoo                            3100         30 18-MAY-03
Davies                          3100         50 29-JAN-05
Fleaur                          3100         50 23-FEB-06
Walsh                           3100         50 24-APR-06
Nayer                           3200         50 16-JUL-05
Stiles                          3200         50 26-OCT-05
Taylor                          3200         50 24-JAN-06

NAME                             SAL     DEPTID HIRING
------------------------- ---------- ---------- ---------
McCain                          3200         50 01-JUL-06
Bissot                          3300         50 20-AUG-05
Mallin                          3300         50 14-JUN-04
Dellinger                       3400         50 24-JUN-06
Rajs                            3500         50 17-OCT-03
Ladwig                          3600         50 14-JUL-03
Dilly                           3600         50 13-AUG-05
Chung                           3800         50 14-JUN-05
Everett                         3900         50 03-MAR-05
Bell                            4000         50 04-FEB-04
Bull                            4100         50 20-FEB-05

NAME                             SAL     DEPTID HIRING
------------------------- ---------- ---------- ---------
Lorentz                         4200         60 07-FEB-07
Sarchand                        4200         50 27-JAN-04
Whalen                          4400         10 17-SEP-03
Austin                          4800         60 25-JUN-05
Pataballa                       4800         60 05-FEB-06
Mourgos                         5800         50 16-NOV-07
Ernst                           6000         60 21-MAY-07
Fay                             6000         20 17-AUG-05
Kumar                           6100         80 21-APR-08
Banda                           6200         80 21-APR-08
Johnson                         6200         80 04-JAN-08

NAME                             SAL     DEPTID HIRING
------------------------- ---------- ---------- ---------
Ande                            6400         80 24-MAR-08
Vollman                         6500         50 10-OCT-05
Mavris                          6500         40 07-JUN-02
Lee                             6800         80 23-FEB-08
Popp                            6900        100 07-DEC-07
Tuvault                         7000         80 23-NOV-07
Sewall                          7000         80 03-NOV-06
Grant                           7000            24-MAY-07
Marvins                         7200         80 24-JAN-08
Bates                           7300         80 24-MAR-07
Smith                           7400         80 23-FEB-07

NAME                             SAL     DEPTID HIRING
------------------------- ---------- ---------- ---------
Cambrault                       7500         80 09-DEC-06
Doran                           7500         80 15-DEC-05
Sciarra                         7700        100 30-SEP-05
Urman                           7800        100 07-MAR-06
Kaufling                        7900         50 01-MAY-03
Weiss                           8000         50 18-JUL-04
Olsen                           8000         80 30-MAR-06
Smith                           8000         80 10-MAR-05
Chen                            8200        100 28-SEP-05
Fripp                           8200         50 10-APR-05
Gietz                           8300        110 07-JUN-02

NAME                             SAL     DEPTID HIRING
------------------------- ---------- ---------- ---------
Livingston                      8400         80 23-APR-06
Taylor                          8600         80 24-MAR-06
Hutton                          8800         80 19-MAR-05
Hunold                          9000         60 03-JAN-06
Faviet                          9000        100 16-AUG-02
Hall                            9000         80 20-AUG-05
McEwen                          9000         80 01-AUG-04
Sully                           9500         80 04-MAR-04
Greene                          9500         80 19-MAR-07
Bernstein                       9500         80 24-MAR-05
Fox                             9600         80 24-JAN-06

NAME                             SAL     DEPTID HIRING
------------------------- ---------- ---------- ---------
Baer                           10000         70 07-JUN-02
Bloom                          10000         80 23-MAR-06
King                           10000         80 30-JAN-04
Tucker                         10000         80 30-JAN-05
Vishney                        10500         80 11-NOV-05
Zlotkey                        10500         80 29-JAN-08
Cambrault                      11000         80 15-OCT-07
Raphaely                       11000         30 07-DEC-02
Abel                           11000         80 11-MAY-04
Ozer                           11500         80 11-MAR-05
Errazuriz                      12000         80 10-MAR-05

NAME                             SAL     DEPTID HIRING
------------------------- ---------- ---------- ---------
Higgins                        12008        110 07-JUN-02
Greenberg                      12008        100 17-AUG-02
Hartstein                      13000         20 17-FEB-04
Partners                       13500         80 05-JAN-05
Russell                        14000         80 01-OCT-04
De Haan                        17000         90 13-JAN-01
Kochhar                        17000         90 21-SEP-05
King                           24000         90 17-JUN-03

107 rows selected.

SQL> SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL",
  2  FROM employees
  3  WHERE last_name LIKE 'M%'
  4  /
FROM employees
*
ERROR at line 2:
ORA-00936: missing expression


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3* WHERE last_name LIKE 'M%'
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        133 Mallin                    ST_CLERK         3300      39600
        128 Markle                    ST_CLERK         2200      26400
        131 Marlow                    ST_CLERK         2500      30000
        164 Marvins                   SA_REP           7200      86400
        143 Matos                     ST_CLERK         2600      31200
        203 Mavris                    HR_REP           6500      78000
        194 McCain                    SH_CLERK         3200      38400
        158 McEwen                    SA_REP           9000     108000
        126 Mikkilineni               ST_CLERK         2700      32400
        124 Mourgos                   ST_MAN           5800      69600

10 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3* WHERE last_name LIKE 'M%' AND 'S%'
SQL> /
WHERE last_name LIKE 'M%' AND 'S%'
                                 *
ERROR at line 3:
ORA-00920: invalid relational operator


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3* WHERE last_name LIKE 'M%','S%'
SQL> /
WHERE last_name LIKE 'M%','S%'
                         *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3* WHERE last_name LIKE '%n'
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        102 De Haan                   AD_VP           17000     204000
        105 Austin                    IT_PROG          4800      57600
        110 Chen                      FI_ACCOUNT       8200      98400
        112 Urman                     FI_ACCOUNT       7800      93600
        123 Vollman                   ST_MAN           6500      78000
        130 Atkinson                  ST_CLERK         2800      33600
        132 Olson                     ST_CLERK         2100      25200
        133 Mallin                    ST_CLERK         3300      39600
        151 Bernstein                 SA_REP           9500     114000
        153 Olsen                     SA_REP           8000      96000
        158 McEwen                    SA_REP           9000     108000

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        160 Doran                     SA_REP           7500      90000
        175 Hutton                    SA_REP           8800     105600
        177 Livingston                SA_REP           8400     100800
        179 Johnson                   SA_REP           6200      74400
        182 Sullivan                  SH_CLERK         2500      30000
        194 McCain                    SH_CLERK         3200      38400
        200 Whalen                    AD_ASST          4400      52800
        201 Hartstein                 MK_MAN          13000     156000

19 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3* WHERE last_name LIKE 'n%'
SQL> /

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3* WHERE last_name LIKE 'N%'
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        125 Nayer                     ST_CLERK         3200      38400

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3* WHERE last_name LIKE 'N%' 'm%'
SQL> /
WHERE last_name LIKE 'N%' 'm%'
                          *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3* WHERE last_name LIKE 'N%', 'm%'
SQL> /
WHERE last_name LIKE 'N%', 'm%'
                         *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3* WHERE last_name LIKE 'N%', 'M%'
SQL> /
WHERE last_name LIKE 'N%', 'M%'
                         *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3  WHERE job_id like '%MAN%'
  4* AND salary>10000
  5  /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        114 Raphaely                  PU_MAN          11000     132000
        145 Russell                   SA_MAN          14000     168000
        146 Partners                  SA_MAN          13500     162000
        147 Errazuriz                 SA_MAN          12000     144000
        148 Cambrault                 SA_MAN          11000     132000
        149 Zlotkey                   SA_MAN          10500     126000
        201 Hartstein                 MK_MAN          13000     156000

7 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3  WHERE job_id like '%MAN%'
  4* OR salary>10000
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        100 King                      AD_PRES         24000     288000
        101 Kochhar                   AD_VP           17000     204000
        102 De Haan                   AD_VP           17000     204000
        108 Greenberg                 FI_MGR          12008     144096
        114 Raphaely                  PU_MAN          11000     132000
        120 Weiss                     ST_MAN           8000      96000
        121 Fripp                     ST_MAN           8200      98400
        122 Kaufling                  ST_MAN           7900      94800
        123 Vollman                   ST_MAN           6500      78000
        124 Mourgos                   ST_MAN           5800      69600
        145 Russell                   SA_MAN          14000     168000

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        146 Partners                  SA_MAN          13500     162000
        147 Errazuriz                 SA_MAN          12000     144000
        148 Cambrault                 SA_MAN          11000     132000
        149 Zlotkey                   SA_MAN          10500     126000
        162 Vishney                   SA_REP          10500     126000
        168 Ozer                      SA_REP          11500     138000
        174 Abel                      SA_REP          11000     132000
        201 Hartstein                 MK_MAN          13000     156000
        205 Higgins                   AC_MGR          12008     144096

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3  WHERE job_id like '%MAN%'
  4  OR salary>10000
  5* ORDER BY employee_id
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        100 King                      AD_PRES         24000     288000
        101 Kochhar                   AD_VP           17000     204000
        102 De Haan                   AD_VP           17000     204000
        108 Greenberg                 FI_MGR          12008     144096
        114 Raphaely                  PU_MAN          11000     132000
        120 Weiss                     ST_MAN           8000      96000
        121 Fripp                     ST_MAN           8200      98400
        122 Kaufling                  ST_MAN           7900      94800
        123 Vollman                   ST_MAN           6500      78000
        124 Mourgos                   ST_MAN           5800      69600
        145 Russell                   SA_MAN          14000     168000

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        146 Partners                  SA_MAN          13500     162000
        147 Errazuriz                 SA_MAN          12000     144000
        148 Cambrault                 SA_MAN          11000     132000
        149 Zlotkey                   SA_MAN          10500     126000
        162 Vishney                   SA_REP          10500     126000
        168 Ozer                      SA_REP          11500     138000
        174 Abel                      SA_REP          11000     132000
        201 Hartstein                 MK_MAN          13000     156000
        205 Higgins                   AC_MGR          12008     144096

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3  WHERE job_id like '%MAN%'
  4  OR salary>10000
  5* ORDER BY last_name
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        174 Abel                      SA_REP          11000     132000
        148 Cambrault                 SA_MAN          11000     132000
        102 De Haan                   AD_VP           17000     204000
        147 Errazuriz                 SA_MAN          12000     144000
        121 Fripp                     ST_MAN           8200      98400
        108 Greenberg                 FI_MGR          12008     144096
        201 Hartstein                 MK_MAN          13000     156000
        205 Higgins                   AC_MGR          12008     144096
        122 Kaufling                  ST_MAN           7900      94800
        100 King                      AD_PRES         24000     288000
        101 Kochhar                   AD_VP           17000     204000

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        124 Mourgos                   ST_MAN           5800      69600
        168 Ozer                      SA_REP          11500     138000
        146 Partners                  SA_MAN          13500     162000
        114 Raphaely                  PU_MAN          11000     132000
        145 Russell                   SA_MAN          14000     168000
        162 Vishney                   SA_REP          10500     126000
        123 Vollman                   ST_MAN           6500      78000
        120 Weiss                     ST_MAN           8000      96000
        149 Zlotkey                   SA_MAN          10500     126000

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3  WHERE job_id like '%MAN%'
  4  OR salary>10000
  5* ORDER BY job_id
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        205 Higgins                   AC_MGR          12008     144096
        100 King                      AD_PRES         24000     288000
        101 Kochhar                   AD_VP           17000     204000
        102 De Haan                   AD_VP           17000     204000
        108 Greenberg                 FI_MGR          12008     144096
        201 Hartstein                 MK_MAN          13000     156000
        114 Raphaely                  PU_MAN          11000     132000
        147 Errazuriz                 SA_MAN          12000     144000
        149 Zlotkey                   SA_MAN          10500     126000
        148 Cambrault                 SA_MAN          11000     132000
        146 Partners                  SA_MAN          13500     162000

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        145 Russell                   SA_MAN          14000     168000
        174 Abel                      SA_REP          11000     132000
        168 Ozer                      SA_REP          11500     138000
        162 Vishney                   SA_REP          10500     126000
        120 Weiss                     ST_MAN           8000      96000
        121 Fripp                     ST_MAN           8200      98400
        124 Mourgos                   ST_MAN           5800      69600
        123 Vollman                   ST_MAN           6500      78000
        122 Kaufling                  ST_MAN           7900      94800

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3  WHERE job_id like '%MAN%'
  4  OR salary>10000
  5* ORDER BY salary
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        124 Mourgos                   ST_MAN           5800      69600
        123 Vollman                   ST_MAN           6500      78000
        122 Kaufling                  ST_MAN           7900      94800
        120 Weiss                     ST_MAN           8000      96000
        121 Fripp                     ST_MAN           8200      98400
        162 Vishney                   SA_REP          10500     126000
        149 Zlotkey                   SA_MAN          10500     126000
        148 Cambrault                 SA_MAN          11000     132000
        174 Abel                      SA_REP          11000     132000
        114 Raphaely                  PU_MAN          11000     132000
        168 Ozer                      SA_REP          11500     138000

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        147 Errazuriz                 SA_MAN          12000     144000
        108 Greenberg                 FI_MGR          12008     144096
        205 Higgins                   AC_MGR          12008     144096
        201 Hartstein                 MK_MAN          13000     156000
        146 Partners                  SA_MAN          13500     162000
        145 Russell                   SA_MAN          14000     168000
        102 De Haan                   AD_VP           17000     204000
        101 Kochhar                   AD_VP           17000     204000
        100 King                      AD_PRES         24000     288000

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3  WHERE job_id like '%MAN%'
  4  OR salary>10000
  5* ORDER BY salary DESC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        100 King                      AD_PRES         24000     288000
        101 Kochhar                   AD_VP           17000     204000
        102 De Haan                   AD_VP           17000     204000
        145 Russell                   SA_MAN          14000     168000
        146 Partners                  SA_MAN          13500     162000
        201 Hartstein                 MK_MAN          13000     156000
        205 Higgins                   AC_MGR          12008     144096
        108 Greenberg                 FI_MGR          12008     144096
        147 Errazuriz                 SA_MAN          12000     144000
        168 Ozer                      SA_REP          11500     138000
        174 Abel                      SA_REP          11000     132000

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        114 Raphaely                  PU_MAN          11000     132000
        148 Cambrault                 SA_MAN          11000     132000
        149 Zlotkey                   SA_MAN          10500     126000
        162 Vishney                   SA_REP          10500     126000
        121 Fripp                     ST_MAN           8200      98400
        120 Weiss                     ST_MAN           8000      96000
        122 Kaufling                  ST_MAN           7900      94800
        123 Vollman                   ST_MAN           6500      78000
        124 Mourgos                   ST_MAN           5800      69600

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3  WHERE job_id like '%MAN%'
  4  OR salary>10000
  5* ORDER BY salary ASC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        124 Mourgos                   ST_MAN           5800      69600
        123 Vollman                   ST_MAN           6500      78000
        122 Kaufling                  ST_MAN           7900      94800
        120 Weiss                     ST_MAN           8000      96000
        121 Fripp                     ST_MAN           8200      98400
        162 Vishney                   SA_REP          10500     126000
        149 Zlotkey                   SA_MAN          10500     126000
        148 Cambrault                 SA_MAN          11000     132000
        174 Abel                      SA_REP          11000     132000
        114 Raphaely                  PU_MAN          11000     132000
        168 Ozer                      SA_REP          11500     138000

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        147 Errazuriz                 SA_MAN          12000     144000
        108 Greenberg                 FI_MGR          12008     144096
        205 Higgins                   AC_MGR          12008     144096
        201 Hartstein                 MK_MAN          13000     156000
        146 Partners                  SA_MAN          13500     162000
        145 Russell                   SA_MAN          14000     168000
        102 De Haan                   AD_VP           17000     204000
        101 Kochhar                   AD_VP           17000     204000
        100 King                      AD_PRES         24000     288000

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL"
  2  FROM employees
  3  WHERE job_id like '%MAN%'
  4  OR salary>10000
  5* ORDER BY "ANN SAL" ASC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        124 Mourgos                   ST_MAN           5800      69600
        123 Vollman                   ST_MAN           6500      78000
        122 Kaufling                  ST_MAN           7900      94800
        120 Weiss                     ST_MAN           8000      96000
        121 Fripp                     ST_MAN           8200      98400
        162 Vishney                   SA_REP          10500     126000
        149 Zlotkey                   SA_MAN          10500     126000
        148 Cambrault                 SA_MAN          11000     132000
        174 Abel                      SA_REP          11000     132000
        114 Raphaely                  PU_MAN          11000     132000
        168 Ozer                      SA_REP          11500     138000

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
        147 Errazuriz                 SA_MAN          12000     144000
        108 Greenberg                 FI_MGR          12008     144096
        205 Higgins                   AC_MGR          12008     144096
        201 Hartstein                 MK_MAN          13000     156000
        146 Partners                  SA_MAN          13500     162000
        145 Russell                   SA_MAN          14000     168000
        102 De Haan                   AD_VP           17000     204000
        101 Kochhar                   AD_VP           17000     204000
        100 King                      AD_PRES         24000     288000

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL" department_id
  2  FROM employees
  3  WHERE job_id like '%MAN%'
  4  OR salary>10000
  5* ORDER BY "ANN SAL" ASC
SQL> /
SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL" department_id
                                                                   *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL>
SQL> /
SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL" department_id
                                                                   *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id like '%MAN%'
  4  OR salary>10000
  5* ORDER BY "ANN SAL" ASC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
DEPARTMENT_ID
-------------
        124 Mourgos                   ST_MAN           5800      69600
           50

        123 Vollman                   ST_MAN           6500      78000
           50

        122 Kaufling                  ST_MAN           7900      94800
           50


EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
DEPARTMENT_ID
-------------
        120 Weiss                     ST_MAN           8000      96000
           50

        121 Fripp                     ST_MAN           8200      98400
           50

        162 Vishney                   SA_REP          10500     126000
           80


EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
DEPARTMENT_ID
-------------
        149 Zlotkey                   SA_MAN          10500     126000
           80

        148 Cambrault                 SA_MAN          11000     132000
           80

        174 Abel                      SA_REP          11000     132000
           80


EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
DEPARTMENT_ID
-------------
        114 Raphaely                  PU_MAN          11000     132000
           30

        168 Ozer                      SA_REP          11500     138000
           80

        147 Errazuriz                 SA_MAN          12000     144000
           80


EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
DEPARTMENT_ID
-------------
        108 Greenberg                 FI_MGR          12008     144096
          100

        205 Higgins                   AC_MGR          12008     144096
          110

        201 Hartstein                 MK_MAN          13000     156000
           20


EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
DEPARTMENT_ID
-------------
        146 Partners                  SA_MAN          13500     162000
           80

        145 Russell                   SA_MAN          14000     168000
           80

        102 De Haan                   AD_VP           17000     204000
           90


EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL
----------- ------------------------- ---------- ---------- ----------
DEPARTMENT_ID
-------------
        101 Kochhar                   AD_VP           17000     204000
           90

        100 King                      AD_PRES         24000     288000
           90


20 rows selected.

SQL> set lines 400
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        124 Mourgos                   ST_MAN           5800      69600            50
        123 Vollman                   ST_MAN           6500      78000            50
        122 Kaufling                  ST_MAN           7900      94800            50
        120 Weiss                     ST_MAN           8000      96000            50
        121 Fripp                     ST_MAN           8200      98400            50
        162 Vishney                   SA_REP          10500     126000            80
        149 Zlotkey                   SA_MAN          10500     126000            80
        148 Cambrault                 SA_MAN          11000     132000            80
        174 Abel                      SA_REP          11000     132000            80
        114 Raphaely                  PU_MAN          11000     132000            30
        168 Ozer                      SA_REP          11500     138000            80

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        147 Errazuriz                 SA_MAN          12000     144000            80
        108 Greenberg                 FI_MGR          12008     144096           100
        205 Higgins                   AC_MGR          12008     144096           110
        201 Hartstein                 MK_MAN          13000     156000            20
        146 Partners                  SA_MAN          13500     162000            80
        145 Russell                   SA_MAN          14000     168000            80
        102 De Haan                   AD_VP           17000     204000            90
        101 Kochhar                   AD_VP           17000     204000            90
        100 King                      AD_PRES         24000     288000            90

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id like '%MAN%'
  4  OR salary>10000
  5* ORDER BY "ANN SAL" ASC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        124 Mourgos                   ST_MAN           5800      69600            50
        123 Vollman                   ST_MAN           6500      78000            50
        122 Kaufling                  ST_MAN           7900      94800            50
        120 Weiss                     ST_MAN           8000      96000            50
        121 Fripp                     ST_MAN           8200      98400            50
        162 Vishney                   SA_REP          10500     126000            80
        149 Zlotkey                   SA_MAN          10500     126000            80
        148 Cambrault                 SA_MAN          11000     132000            80
        174 Abel                      SA_REP          11000     132000            80
        114 Raphaely                  PU_MAN          11000     132000            30
        168 Ozer                      SA_REP          11500     138000            80

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        147 Errazuriz                 SA_MAN          12000     144000            80
        108 Greenberg                 FI_MGR          12008     144096           100
        205 Higgins                   AC_MGR          12008     144096           110
        201 Hartstein                 MK_MAN          13000     156000            20
        146 Partners                  SA_MAN          13500     162000            80
        145 Russell                   SA_MAN          14000     168000            80
        102 De Haan                   AD_VP           17000     204000            90
        101 Kochhar                   AD_VP           17000     204000            90
        100 King                      AD_PRES         24000     288000            90

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY "ANN SAL" DESC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        100 King                      AD_PRES         24000     288000            90
        101 Kochhar                   AD_VP           17000     204000            90
        102 De Haan                   AD_VP           17000     204000            90
        145 Russell                   SA_MAN          14000     168000            80
        146 Partners                  SA_MAN          13500     162000            80
        201 Hartstein                 MK_MAN          13000     156000            20
        205 Higgins                   AC_MGR          12008     144096           110
        108 Greenberg                 FI_MGR          12008     144096           100
        147 Errazuriz                 SA_MAN          12000     144000            80
        168 Ozer                      SA_REP          11500     138000            80
        174 Abel                      SA_REP          11000     132000            80

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        114 Raphaely                  PU_MAN          11000     132000            30
        148 Cambrault                 SA_MAN          11000     132000            80
        149 Zlotkey                   SA_MAN          10500     126000            80
        162 Vishney                   SA_REP          10500     126000            80
        121 Fripp                     ST_MAN           8200      98400            50
        120 Weiss                     ST_MAN           8000      96000            50
        122 Kaufling                  ST_MAN           7900      94800            50
        123 Vollman                   ST_MAN           6500      78000            50
        124 Mourgos                   ST_MAN           5800      69600            50

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY 5 DESC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        100 King                      AD_PRES         24000     288000            90
        101 Kochhar                   AD_VP           17000     204000            90
        102 De Haan                   AD_VP           17000     204000            90
        145 Russell                   SA_MAN          14000     168000            80
        146 Partners                  SA_MAN          13500     162000            80
        201 Hartstein                 MK_MAN          13000     156000            20
        205 Higgins                   AC_MGR          12008     144096           110
        108 Greenberg                 FI_MGR          12008     144096           100
        147 Errazuriz                 SA_MAN          12000     144000            80
        168 Ozer                      SA_REP          11500     138000            80
        174 Abel                      SA_REP          11000     132000            80

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        114 Raphaely                  PU_MAN          11000     132000            30
        148 Cambrault                 SA_MAN          11000     132000            80
        149 Zlotkey                   SA_MAN          10500     126000            80
        162 Vishney                   SA_REP          10500     126000            80
        121 Fripp                     ST_MAN           8200      98400            50
        120 Weiss                     ST_MAN           8000      96000            50
        122 Kaufling                  ST_MAN           7900      94800            50
        123 Vollman                   ST_MAN           6500      78000            50
        124 Mourgos                   ST_MAN           5800      69600            50

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY 1 DESC
SQL>
SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY 1 DESC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        205 Higgins                   AC_MGR          12008     144096           110
        201 Hartstein                 MK_MAN          13000     156000            20
        174 Abel                      SA_REP          11000     132000            80
        168 Ozer                      SA_REP          11500     138000            80
        162 Vishney                   SA_REP          10500     126000            80
        149 Zlotkey                   SA_MAN          10500     126000            80
        148 Cambrault                 SA_MAN          11000     132000            80
        147 Errazuriz                 SA_MAN          12000     144000            80
        146 Partners                  SA_MAN          13500     162000            80
        145 Russell                   SA_MAN          14000     168000            80
        124 Mourgos                   ST_MAN           5800      69600            50

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        123 Vollman                   ST_MAN           6500      78000            50
        122 Kaufling                  ST_MAN           7900      94800            50
        121 Fripp                     ST_MAN           8200      98400            50
        120 Weiss                     ST_MAN           8000      96000            50
        114 Raphaely                  PU_MAN          11000     132000            30
        108 Greenberg                 FI_MGR          12008     144096           100
        102 De Haan                   AD_VP           17000     204000            90
        101 Kochhar                   AD_VP           17000     204000            90
        100 King                      AD_PRES         24000     288000            90

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY 2 DESC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        149 Zlotkey                   SA_MAN          10500     126000            80
        120 Weiss                     ST_MAN           8000      96000            50
        123 Vollman                   ST_MAN           6500      78000            50
        162 Vishney                   SA_REP          10500     126000            80
        145 Russell                   SA_MAN          14000     168000            80
        114 Raphaely                  PU_MAN          11000     132000            30
        146 Partners                  SA_MAN          13500     162000            80
        168 Ozer                      SA_REP          11500     138000            80
        124 Mourgos                   ST_MAN           5800      69600            50
        101 Kochhar                   AD_VP           17000     204000            90
        100 King                      AD_PRES         24000     288000            90

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        122 Kaufling                  ST_MAN           7900      94800            50
        205 Higgins                   AC_MGR          12008     144096           110
        201 Hartstein                 MK_MAN          13000     156000            20
        108 Greenberg                 FI_MGR          12008     144096           100
        121 Fripp                     ST_MAN           8200      98400            50
        147 Errazuriz                 SA_MAN          12000     144000            80
        102 De Haan                   AD_VP           17000     204000            90
        148 Cambrault                 SA_MAN          11000     132000            80
        174 Abel                      SA_REP          11000     132000            80

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY 2
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        174 Abel                      SA_REP          11000     132000            80
        148 Cambrault                 SA_MAN          11000     132000            80
        102 De Haan                   AD_VP           17000     204000            90
        147 Errazuriz                 SA_MAN          12000     144000            80
        121 Fripp                     ST_MAN           8200      98400            50
        108 Greenberg                 FI_MGR          12008     144096           100
        201 Hartstein                 MK_MAN          13000     156000            20
        205 Higgins                   AC_MGR          12008     144096           110
        122 Kaufling                  ST_MAN           7900      94800            50
        100 King                      AD_PRES         24000     288000            90
        101 Kochhar                   AD_VP           17000     204000            90

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        124 Mourgos                   ST_MAN           5800      69600            50
        168 Ozer                      SA_REP          11500     138000            80
        146 Partners                  SA_MAN          13500     162000            80
        114 Raphaely                  PU_MAN          11000     132000            30
        145 Russell                   SA_MAN          14000     168000            80
        162 Vishney                   SA_REP          10500     126000            80
        123 Vollman                   ST_MAN           6500      78000            50
        120 Weiss                     ST_MAN           8000      96000            50
        149 Zlotkey                   SA_MAN          10500     126000            80

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY 3
  6  /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        205 Higgins                   AC_MGR          12008     144096           110
        100 King                      AD_PRES         24000     288000            90
        101 Kochhar                   AD_VP           17000     204000            90
        102 De Haan                   AD_VP           17000     204000            90
        108 Greenberg                 FI_MGR          12008     144096           100
        201 Hartstein                 MK_MAN          13000     156000            20
        114 Raphaely                  PU_MAN          11000     132000            30
        147 Errazuriz                 SA_MAN          12000     144000            80
        149 Zlotkey                   SA_MAN          10500     126000            80
        148 Cambrault                 SA_MAN          11000     132000            80
        146 Partners                  SA_MAN          13500     162000            80

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        145 Russell                   SA_MAN          14000     168000            80
        174 Abel                      SA_REP          11000     132000            80
        168 Ozer                      SA_REP          11500     138000            80
        162 Vishney                   SA_REP          10500     126000            80
        120 Weiss                     ST_MAN           8000      96000            50
        121 Fripp                     ST_MAN           8200      98400            50
        124 Mourgos                   ST_MAN           5800      69600            50
        123 Vollman                   ST_MAN           6500      78000            50
        122 Kaufling                  ST_MAN           7900      94800            50

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY 3 DESC
  6  /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        121 Fripp                     ST_MAN           8200      98400            50
        124 Mourgos                   ST_MAN           5800      69600            50
        123 Vollman                   ST_MAN           6500      78000            50
        122 Kaufling                  ST_MAN           7900      94800            50
        120 Weiss                     ST_MAN           8000      96000            50
        174 Abel                      SA_REP          11000     132000            80
        162 Vishney                   SA_REP          10500     126000            80
        168 Ozer                      SA_REP          11500     138000            80
        147 Errazuriz                 SA_MAN          12000     144000            80
        148 Cambrault                 SA_MAN          11000     132000            80
        145 Russell                   SA_MAN          14000     168000            80

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        146 Partners                  SA_MAN          13500     162000            80
        149 Zlotkey                   SA_MAN          10500     126000            80
        114 Raphaely                  PU_MAN          11000     132000            30
        201 Hartstein                 MK_MAN          13000     156000            20
        108 Greenberg                 FI_MGR          12008     144096           100
        102 De Haan                   AD_VP           17000     204000            90
        101 Kochhar                   AD_VP           17000     204000            90
        100 King                      AD_PRES         24000     288000            90
        205 Higgins                   AC_MGR          12008     144096           110

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY 4 DESC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        100 King                      AD_PRES         24000     288000            90
        101 Kochhar                   AD_VP           17000     204000            90
        102 De Haan                   AD_VP           17000     204000            90
        145 Russell                   SA_MAN          14000     168000            80
        146 Partners                  SA_MAN          13500     162000            80
        201 Hartstein                 MK_MAN          13000     156000            20
        205 Higgins                   AC_MGR          12008     144096           110
        108 Greenberg                 FI_MGR          12008     144096           100
        147 Errazuriz                 SA_MAN          12000     144000            80
        168 Ozer                      SA_REP          11500     138000            80
        174 Abel                      SA_REP          11000     132000            80

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        114 Raphaely                  PU_MAN          11000     132000            30
        148 Cambrault                 SA_MAN          11000     132000            80
        149 Zlotkey                   SA_MAN          10500     126000            80
        162 Vishney                   SA_REP          10500     126000            80
        121 Fripp                     ST_MAN           8200      98400            50
        120 Weiss                     ST_MAN           8000      96000            50
        122 Kaufling                  ST_MAN           7900      94800            50
        123 Vollman                   ST_MAN           6500      78000            50
        124 Mourgos                   ST_MAN           5800      69600            50

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY 6 DESC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        205 Higgins                   AC_MGR          12008     144096           110
        108 Greenberg                 FI_MGR          12008     144096           100
        101 Kochhar                   AD_VP           17000     204000            90
        102 De Haan                   AD_VP           17000     204000            90
        100 King                      AD_PRES         24000     288000            90
        145 Russell                   SA_MAN          14000     168000            80
        147 Errazuriz                 SA_MAN          12000     144000            80
        146 Partners                  SA_MAN          13500     162000            80
        162 Vishney                   SA_REP          10500     126000            80
        168 Ozer                      SA_REP          11500     138000            80
        174 Abel                      SA_REP          11000     132000            80

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        148 Cambrault                 SA_MAN          11000     132000            80
        149 Zlotkey                   SA_MAN          10500     126000            80
        123 Vollman                   ST_MAN           6500      78000            50
        122 Kaufling                  ST_MAN           7900      94800            50
        121 Fripp                     ST_MAN           8200      98400            50
        120 Weiss                     ST_MAN           8000      96000            50
        124 Mourgos                   ST_MAN           5800      69600            50
        114 Raphaely                  PU_MAN          11000     132000            30
        201 Hartstein                 MK_MAN          13000     156000            20

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY 2, 6 DESC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        174 Abel                      SA_REP          11000     132000            80
        148 Cambrault                 SA_MAN          11000     132000            80
        102 De Haan                   AD_VP           17000     204000            90
        147 Errazuriz                 SA_MAN          12000     144000            80
        121 Fripp                     ST_MAN           8200      98400            50
        108 Greenberg                 FI_MGR          12008     144096           100
        201 Hartstein                 MK_MAN          13000     156000            20
        205 Higgins                   AC_MGR          12008     144096           110
        122 Kaufling                  ST_MAN           7900      94800            50
        100 King                      AD_PRES         24000     288000            90
        101 Kochhar                   AD_VP           17000     204000            90

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        124 Mourgos                   ST_MAN           5800      69600            50
        168 Ozer                      SA_REP          11500     138000            80
        146 Partners                  SA_MAN          13500     162000            80
        114 Raphaely                  PU_MAN          11000     132000            30
        145 Russell                   SA_MAN          14000     168000            80
        162 Vishney                   SA_REP          10500     126000            80
        123 Vollman                   ST_MAN           6500      78000            50
        120 Weiss                     ST_MAN           8000      96000            50
        149 Zlotkey                   SA_MAN          10500     126000            80

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY 2 DESC, 6 DESC, salary DESC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        149 Zlotkey                   SA_MAN          10500     126000            80
        120 Weiss                     ST_MAN           8000      96000            50
        123 Vollman                   ST_MAN           6500      78000            50
        162 Vishney                   SA_REP          10500     126000            80
        145 Russell                   SA_MAN          14000     168000            80
        114 Raphaely                  PU_MAN          11000     132000            30
        146 Partners                  SA_MAN          13500     162000            80
        168 Ozer                      SA_REP          11500     138000            80
        124 Mourgos                   ST_MAN           5800      69600            50
        101 Kochhar                   AD_VP           17000     204000            90
        100 King                      AD_PRES         24000     288000            90

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        122 Kaufling                  ST_MAN           7900      94800            50
        205 Higgins                   AC_MGR          12008     144096           110
        201 Hartstein                 MK_MAN          13000     156000            20
        108 Greenberg                 FI_MGR          12008     144096           100
        121 Fripp                     ST_MAN           8200      98400            50
        147 Errazuriz                 SA_MAN          12000     144000            80
        102 De Haan                   AD_VP           17000     204000            90
        148 Cambrault                 SA_MAN          11000     132000            80
        174 Abel                      SA_REP          11000     132000            80

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* ORDER BY 2 DESC, 6 DESC, salary ASC
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        149 Zlotkey                   SA_MAN          10500     126000            80
        120 Weiss                     ST_MAN           8000      96000            50
        123 Vollman                   ST_MAN           6500      78000            50
        162 Vishney                   SA_REP          10500     126000            80
        145 Russell                   SA_MAN          14000     168000            80
        114 Raphaely                  PU_MAN          11000     132000            30
        146 Partners                  SA_MAN          13500     162000            80
        168 Ozer                      SA_REP          11500     138000            80
        124 Mourgos                   ST_MAN           5800      69600            50
        101 Kochhar                   AD_VP           17000     204000            90
        100 King                      AD_PRES         24000     288000            90

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        122 Kaufling                  ST_MAN           7900      94800            50
        205 Higgins                   AC_MGR          12008     144096           110
        201 Hartstein                 MK_MAN          13000     156000            20
        108 Greenberg                 FI_MGR          12008     144096           100
        121 Fripp                     ST_MAN           8200      98400            50
        147 Errazuriz                 SA_MAN          12000     144000            80
        102 De Haan                   AD_VP           17000     204000            90
        148 Cambrault                 SA_MAN          11000     132000            80
        174 Abel                      SA_REP          11000     132000            80

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5  ORDER BY 2 DESC, 6 DESC, salary ASC
  6* FETCH FIRST 5 ROWS
SQL> /
FETCH FIRST 5 ROWS
                 *
ERROR at line 6:
ORA-00905: missing keyword


SQL> ED
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5  ORDER BY 2 DESC, 6 DESC, salary ASC
  6* FETCH FIRST 5 ROWS ONLY
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        149 Zlotkey                   SA_MAN          10500     126000            80
        120 Weiss                     ST_MAN           8000      96000            50
        123 Vollman                   ST_MAN           6500      78000            50
        162 Vishney                   SA_REP          10500     126000            80
        145 Russell                   SA_MAN          14000     168000            80

SQL> ED
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5  ORDER BY 2 DESC, 6 DESC, salary ASC
  6* OFFSET FIRST 5 ROWS FETCH NEXT 5 ROWS ONLY
SQL> /
OFFSET FIRST 5 ROWS FETCH NEXT 5 ROWS ONLY
             *
ERROR at line 6:
ORA-00905: missing keyword


SQL> ED
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5  ORDER BY 2 DESC, 6 DESC, salary ASC
  6* OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY    ANN SAL DEPARTMENT_ID
----------- ------------------------- ---------- ---------- ---------- -------------
        114 Raphaely                  PU_MAN          11000     132000            30
        146 Partners                  SA_MAN          13500     162000            80
        168 Ozer                      SA_REP          11500     138000            80
        124 Mourgos                   ST_MAN           5800      69600            50
        101 Kochhar                   AD_VP           17000     204000            90

SQL> ED
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, salary, salary*12 "ANN SAL", department_id
  2  FROM employees
  3  WHERE job_id LIKE'%MAN%'
  4  OR salary>10000
  5* WHERE EMPLOYEE_ID -&EMPLOYEE_NUM
SQL> /
Enter value for employee_num: 100
old   5: WHERE EMPLOYEE_ID -&EMPLOYEE_NUM
new   5: WHERE EMPLOYEE_ID -100
WHERE EMPLOYEE_ID -100
*
ERROR at line 5:
ORA-00933: SQL command not properly ended


SQL> /
Enter value for employee_num: 122
old   5: WHERE EMPLOYEE_ID -&EMPLOYEE_NUM
new   5: WHERE EMPLOYEE_ID -122
WHERE EMPLOYEE_ID -122
*
ERROR at line 5:
ORA-00933: SQL command not properly ended


SQL> SELECT employee_id, last_name, salary, department_id
  2  FROM employees
  3  WHERE job_i='&job';
Enter value for job: IT_PROG
old   3: WHERE job_i='&job'
new   3: WHERE job_i='IT_PROG'
WHERE job_i='IT_PROG'
      *
ERROR at line 3:
ORA-00904: "JOB_I": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, salary, department_id
  2  FROM employees
  3* WHERE job_i='&JOB'
SQL> /
Enter value for job:
old   3: WHERE job_i='&JOB'
new   3: WHERE job_i=''
WHERE job_i=''
      *
ERROR at line 3:
ORA-00904: "JOB_I": invalid identifier


SQL> /
Enter value for job: IT_PROG
old   3: WHERE job_i='&JOB'
new   3: WHERE job_i='IT_PROG'
WHERE job_i='IT_PROG'
      *
ERROR at line 3:
ORA-00904: "JOB_I": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, salary, department_id
  2  FROM employees
  3* WHERE job_id='&JOB'
SQL> /
Enter value for job: IT_PROG
old   3: WHERE job_id='&JOB'
new   3: WHERE job_id='IT_PROG'

EMPLOYEE_ID LAST_NAME                     SALARY DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        103 Hunold                          9000            60
        104 Ernst                           6000            60
        105 Austin                          4800            60
        106 Pataballa                       4800            60
        107 Lorentz                         4200            60

SQL> /
Enter value for job:
old   3: WHERE job_id='&JOB'
new   3: WHERE job_id=''

no rows selected

SQL>
SQL> /
Enter value for job: sa_rep
old   3: WHERE job_id='&JOB'
new   3: WHERE job_id='sa_rep'

no rows selected

SQL> /
Enter value for job: SA_REP
old   3: WHERE job_id='&JOB'
new   3: WHERE job_id='SA_REP'

EMPLOYEE_ID LAST_NAME                     SALARY DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        150 Tucker                         10000            80
        151 Bernstein                       9500            80
        152 Hall                            9000            80
        153 Olsen                           8000            80
        154 Cambrault                       7500            80
        155 Tuvault                         7000            80
        156 King                           10000            80
        157 Sully                           9500            80
        158 McEwen                          9000            80
        159 Smith                           8000            80
        160 Doran                           7500            80

EMPLOYEE_ID LAST_NAME                     SALARY DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        161 Sewall                          7000            80
        162 Vishney                        10500            80
        163 Greene                          9500            80
        164 Marvins                         7200            80
        165 Lee                             6800            80
        166 Ande                            6400            80
        167 Banda                           6200            80
        168 Ozer                           11500            80
        169 Bloom                          10000            80
        170 Fox                             9600            80
        171 Smith                           7400            80

EMPLOYEE_ID LAST_NAME                     SALARY DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        172 Bates                           7300            80
        173 Kumar                           6100            80
        174 Abel                           11000            80
        175 Hutton                          8800            80
        176 Taylor                          8600            80
        177 Livingston                      8400            80
        178 Grant                           7000
        179 Johnson                         6200            80

30 rows selected.

SQL> SELECT employee_id, last_name, job_id, &column_name
  2  FROM employees
  3  WHERE &condition
  4  ORDER BY &order_column
  5  /
Enter value for column_name: salary
old   1: SELECT employee_id, last_name, job_id, &column_name
new   1: SELECT employee_id, last_name, job_id, salary
Enter value for condition: salary >1999
old   3: WHERE &condition
new   3: WHERE salary >1999
Enter value for order_column: 2
old   4: ORDER BY &order_column
new   4: ORDER BY 2

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        174 Abel                      SA_REP          11000
        166 Ande                      SA_REP           6400
        130 Atkinson                  ST_CLERK         2800
        105 Austin                    IT_PROG          4800
        204 Baer                      PR_REP          10000
        116 Baida                     PU_CLERK         2900
        167 Banda                     SA_REP           6200
        172 Bates                     SA_REP           7300
        192 Bell                      SH_CLERK         4000
        151 Bernstein                 SA_REP           9500
        129 Bissot                    ST_CLERK         3300

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        169 Bloom                     SA_REP          10000
        185 Bull                      SH_CLERK         4100
        187 Cabrio                    SH_CLERK         3000
        154 Cambrault                 SA_REP           7500
        148 Cambrault                 SA_MAN          11000
        110 Chen                      FI_ACCOUNT       8200
        188 Chung                     SH_CLERK         3800
        119 Colmenares                PU_CLERK         2500
        142 Davies                    ST_CLERK         3100
        102 De Haan                   AD_VP           17000
        186 Dellinger                 SH_CLERK         3400

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        189 Dilly                     SH_CLERK         3600
        160 Doran                     SA_REP           7500
        104 Ernst                     IT_PROG          6000
        147 Errazuriz                 SA_MAN          12000
        193 Everett                   SH_CLERK         3900
        109 Faviet                    FI_ACCOUNT       9000
        202 Fay                       MK_REP           6000
        197 Feeney                    SH_CLERK         3000
        181 Fleaur                    SH_CLERK         3100
        170 Fox                       SA_REP           9600
        121 Fripp                     ST_MAN           8200

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        190 Gates                     SH_CLERK         2900
        135 Gee                       ST_CLERK         2400
        183 Geoni                     SH_CLERK         2800
        206 Gietz                     AC_ACCOUNT       8300
        178 Grant                     SA_REP           7000
        199 Grant                     SH_CLERK         2600
        108 Greenberg                 FI_MGR          12008
        163 Greene                    SA_REP           9500
        152 Hall                      SA_REP           9000
        201 Hartstein                 MK_MAN          13000
        205 Higgins                   AC_MGR          12008

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        118 Himuro                    PU_CLERK         2600
        103 Hunold                    IT_PROG          9000
        175 Hutton                    SA_REP           8800
        179 Johnson                   SA_REP           6200
        195 Jones                     SH_CLERK         2800
        122 Kaufling                  ST_MAN           7900
        115 Khoo                      PU_CLERK         3100
        100 King                      AD_PRES         24000
        156 King                      SA_REP          10000
        101 Kochhar                   AD_VP           17000
        173 Kumar                     SA_REP           6100

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        137 Ladwig                    ST_CLERK         3600
        127 Landry                    ST_CLERK         2400
        165 Lee                       SA_REP           6800
        177 Livingston                SA_REP           8400
        107 Lorentz                   IT_PROG          4200
        133 Mallin                    ST_CLERK         3300
        128 Markle                    ST_CLERK         2200
        131 Marlow                    ST_CLERK         2500
        164 Marvins                   SA_REP           7200
        143 Matos                     ST_CLERK         2600
        203 Mavris                    HR_REP           6500

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        194 McCain                    SH_CLERK         3200
        158 McEwen                    SA_REP           9000
        126 Mikkilineni               ST_CLERK         2700
        124 Mourgos                   ST_MAN           5800
        125 Nayer                     ST_CLERK         3200
        198 OConnell                  SH_CLERK         2600
        153 Olsen                     SA_REP           8000
        132 Olson                     ST_CLERK         2100
        168 Ozer                      SA_REP          11500
        146 Partners                  SA_MAN          13500
        106 Pataballa                 IT_PROG          4800

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        140 Patel                     ST_CLERK         2500
        191 Perkins                   SH_CLERK         2500
        136 Philtanker                ST_CLERK         2200
        113 Popp                      FI_ACCOUNT       6900
        141 Rajs                      ST_CLERK         3500
        114 Raphaely                  PU_MAN          11000
        134 Rogers                    ST_CLERK         2900
        145 Russell                   SA_MAN          14000
        184 Sarchand                  SH_CLERK         4200
        111 Sciarra                   FI_ACCOUNT       7700
        139 Seo                       ST_CLERK         2700

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        161 Sewall                    SA_REP           7000
        159 Smith                     SA_REP           8000
        171 Smith                     SA_REP           7400
        138 Stiles                    ST_CLERK         3200
        182 Sullivan                  SH_CLERK         2500
        157 Sully                     SA_REP           9500
        180 Taylor                    SH_CLERK         3200
        176 Taylor                    SA_REP           8600
        117 Tobias                    PU_CLERK         2800
        150 Tucker                    SA_REP          10000
        155 Tuvault                   SA_REP           7000

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        112 Urman                     FI_ACCOUNT       7800
        144 Vargas                    ST_CLERK         2500
        162 Vishney                   SA_REP          10500
        123 Vollman                   ST_MAN           6500
        196 Walsh                     SH_CLERK         3100
        120 Weiss                     ST_MAN           8000
        200 Whalen                    AD_ASST          4400
        149 Zlotkey                   SA_MAN          10500

107 rows selected.

SQL> SELECT employee_id, last_name, job_id, &column_name
  2  FROM employees
  3  WHERE &condition
  4  ORDER BY &order_column;
Enter value for column_name: SALARY
old   1: SELECT employee_id, last_name, job_id, &column_name
new   1: SELECT employee_id, last_name, job_id, SALARY
Enter value for condition: SALARY> 10000
old   3: WHERE &condition
new   3: WHERE SALARY> 10000
Enter value for order_column: SALARY
old   4: ORDER BY &order_column
new   4: ORDER BY SALARY

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        162 Vishney                   SA_REP          10500
        149 Zlotkey                   SA_MAN          10500
        174 Abel                      SA_REP          11000
        114 Raphaely                  PU_MAN          11000
        148 Cambrault                 SA_MAN          11000
        168 Ozer                      SA_REP          11500
        147 Errazuriz                 SA_MAN          12000
        205 Higgins                   AC_MGR          12008
        108 Greenberg                 FI_MGR          12008
        201 Hartstein                 MK_MAN          13000
        146 Partners                  SA_MAN          13500

EMPLOYEE_ID LAST_NAME                 JOB_ID         SALARY
----------- ------------------------- ---------- ----------
        145 Russell                   SA_MAN          14000
        102 De Haan                   AD_VP           17000
        101 Kochhar                   AD_VP           17000
        100 King                      AD_PRES         24000

15 rows selected.

SQL>

*/
/*

SQL> SELECT employee_id, last_name, hire_date, job_id, salary, department_id
  2  FROM employees;

EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        100 King                      17-JUN-03 AD_PRES         24000
           90

        101 Kochhar                   21-SEP-05 AD_VP           17000
           90

        102 De Haan                   13-JAN-01 AD_VP           17000
           90


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        103 Hunold                    03-JAN-06 IT_PROG          9000
           60

        104 Ernst                     21-MAY-07 IT_PROG          6000
           60

        105 Austin                    25-JUN-05 IT_PROG          4800
           60


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        106 Pataballa                 05-FEB-06 IT_PROG          4800
           60

        107 Lorentz                   07-FEB-07 IT_PROG          4200
           60

        108 Greenberg                 17-AUG-02 FI_MGR          12008
          100


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        109 Faviet                    16-AUG-02 FI_ACCOUNT       9000
          100

        110 Chen                      28-SEP-05 FI_ACCOUNT       8200
          100

        111 Sciarra                   30-SEP-05 FI_ACCOUNT       7700
          100


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        112 Urman                     07-MAR-06 FI_ACCOUNT       7800
          100

        113 Popp                      07-DEC-07 FI_ACCOUNT       6900
          100

        114 Raphaely                  07-DEC-02 PU_MAN          11000
           30


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        115 Khoo                      18-MAY-03 PU_CLERK         3100
           30

        116 Baida                     24-DEC-05 PU_CLERK         2900
           30

        117 Tobias                    24-JUL-05 PU_CLERK         2800
           30


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        118 Himuro                    15-NOV-06 PU_CLERK         2600
           30

        119 Colmenares                10-AUG-07 PU_CLERK         2500
           30

        120 Weiss                     18-JUL-04 ST_MAN           8000
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        121 Fripp                     10-APR-05 ST_MAN           8200
           50

        122 Kaufling                  01-MAY-03 ST_MAN           7900
           50

        123 Vollman                   10-OCT-05 ST_MAN           6500
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        124 Mourgos                   16-NOV-07 ST_MAN           5800
           50

        125 Nayer                     16-JUL-05 ST_CLERK         3200
           50

        126 Mikkilineni               28-SEP-06 ST_CLERK         2700
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        127 Landry                    14-JAN-07 ST_CLERK         2400
           50

        128 Markle                    08-MAR-08 ST_CLERK         2200
           50

        129 Bissot                    20-AUG-05 ST_CLERK         3300
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        130 Atkinson                  30-OCT-05 ST_CLERK         2800
           50

        131 Marlow                    16-FEB-05 ST_CLERK         2500
           50

        132 Olson                     10-APR-07 ST_CLERK         2100
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        133 Mallin                    14-JUN-04 ST_CLERK         3300
           50

        134 Rogers                    26-AUG-06 ST_CLERK         2900
           50

        135 Gee                       12-DEC-07 ST_CLERK         2400
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        136 Philtanker                06-FEB-08 ST_CLERK         2200
           50

        137 Ladwig                    14-JUL-03 ST_CLERK         3600
           50

        138 Stiles                    26-OCT-05 ST_CLERK         3200
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        139 Seo                       12-FEB-06 ST_CLERK         2700
           50

        140 Patel                     06-APR-06 ST_CLERK         2500
           50

        141 Rajs                      17-OCT-03 ST_CLERK         3500
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        142 Davies                    29-JAN-05 ST_CLERK         3100
           50

        143 Matos                     15-MAR-06 ST_CLERK         2600
           50

        144 Vargas                    09-JUL-06 ST_CLERK         2500
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        145 Russell                   01-OCT-04 SA_MAN          14000
           80

        146 Partners                  05-JAN-05 SA_MAN          13500
           80

        147 Errazuriz                 10-MAR-05 SA_MAN          12000
           80


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        148 Cambrault                 15-OCT-07 SA_MAN          11000
           80

        149 Zlotkey                   29-JAN-08 SA_MAN          10500
           80

        150 Tucker                    30-JAN-05 SA_REP          10000
           80


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        151 Bernstein                 24-MAR-05 SA_REP           9500
           80

        152 Hall                      20-AUG-05 SA_REP           9000
           80

        153 Olsen                     30-MAR-06 SA_REP           8000
           80


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        154 Cambrault                 09-DEC-06 SA_REP           7500
           80

        155 Tuvault                   23-NOV-07 SA_REP           7000
           80

        156 King                      30-JAN-04 SA_REP          10000
           80


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        157 Sully                     04-MAR-04 SA_REP           9500
           80

        158 McEwen                    01-AUG-04 SA_REP           9000
           80

        159 Smith                     10-MAR-05 SA_REP           8000
           80


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        160 Doran                     15-DEC-05 SA_REP           7500
           80

        161 Sewall                    03-NOV-06 SA_REP           7000
           80

        162 Vishney                   11-NOV-05 SA_REP          10500
           80


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        163 Greene                    19-MAR-07 SA_REP           9500
           80

        164 Marvins                   24-JAN-08 SA_REP           7200
           80

        165 Lee                       23-FEB-08 SA_REP           6800
           80


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        166 Ande                      24-MAR-08 SA_REP           6400
           80

        167 Banda                     21-APR-08 SA_REP           6200
           80

        168 Ozer                      11-MAR-05 SA_REP          11500
           80


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        169 Bloom                     23-MAR-06 SA_REP          10000
           80

        170 Fox                       24-JAN-06 SA_REP           9600
           80

        171 Smith                     23-FEB-07 SA_REP           7400
           80


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        172 Bates                     24-MAR-07 SA_REP           7300
           80

        173 Kumar                     21-APR-08 SA_REP           6100
           80

        174 Abel                      11-MAY-04 SA_REP          11000
           80


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        175 Hutton                    19-MAR-05 SA_REP           8800
           80

        176 Taylor                    24-MAR-06 SA_REP           8600
           80

        177 Livingston                23-APR-06 SA_REP           8400
           80


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        178 Grant                     24-MAY-07 SA_REP           7000


        179 Johnson                   04-JAN-08 SA_REP           6200
           80

        180 Taylor                    24-JAN-06 SH_CLERK         3200
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        181 Fleaur                    23-FEB-06 SH_CLERK         3100
           50

        182 Sullivan                  21-JUN-07 SH_CLERK         2500
           50

        183 Geoni                     03-FEB-08 SH_CLERK         2800
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        184 Sarchand                  27-JAN-04 SH_CLERK         4200
           50

        185 Bull                      20-FEB-05 SH_CLERK         4100
           50

        186 Dellinger                 24-JUN-06 SH_CLERK         3400
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        187 Cabrio                    07-FEB-07 SH_CLERK         3000
           50

        188 Chung                     14-JUN-05 SH_CLERK         3800
           50

        189 Dilly                     13-AUG-05 SH_CLERK         3600
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        190 Gates                     11-JUL-06 SH_CLERK         2900
           50

        191 Perkins                   19-DEC-07 SH_CLERK         2500
           50

        192 Bell                      04-FEB-04 SH_CLERK         4000
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        193 Everett                   03-MAR-05 SH_CLERK         3900
           50

        194 McCain                    01-JUL-06 SH_CLERK         3200
           50

        195 Jones                     17-MAR-07 SH_CLERK         2800
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        196 Walsh                     24-APR-06 SH_CLERK         3100
           50

        197 Feeney                    23-MAY-06 SH_CLERK         3000
           50

        198 OConnell                  21-JUN-07 SH_CLERK         2600
           50


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        199 Grant                     13-JAN-08 SH_CLERK         2600
           50

        200 Whalen                    17-SEP-03 AD_ASST          4400
           10

        201 Hartstein                 17-FEB-04 MK_MAN          13000
           20


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        202 Fay                       17-AUG-05 MK_REP           6000
           20

        203 Mavris                    07-JUN-02 HR_REP           6500
           40

        204 Baer                      07-JUN-02 PR_REP          10000
           70


EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY
----------- ------------------------- --------- ---------- ----------
DEPARTMENT_ID
-------------
        205 Higgins                   07-JUN-02 AC_MGR          12008
          110

        206 Gietz                     07-JUN-02 AC_ACCOUNT       8300
          110


107 rows selected.

SQL> set lines 200
SQL> /

EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY DEPARTMENT_ID
----------- ------------------------- --------- ---------- ---------- -------------
        100 King                      17-JUN-03 AD_PRES         24000            90
        101 Kochhar                   21-SEP-05 AD_VP           17000            90
        102 De Haan                   13-JAN-01 AD_VP           17000            90
        103 Hunold                    03-JAN-06 IT_PROG          9000            60
        104 Ernst                     21-MAY-07 IT_PROG          6000            60
        105 Austin                    25-JUN-05 IT_PROG          4800            60
        106 Pataballa                 05-FEB-06 IT_PROG          4800            60
        107 Lorentz                   07-FEB-07 IT_PROG          4200            60
        108 Greenberg                 17-AUG-02 FI_MGR          12008           100
        109 Faviet                    16-AUG-02 FI_ACCOUNT       9000           100
        110 Chen                      28-SEP-05 FI_ACCOUNT       8200           100

EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY DEPARTMENT_ID
----------- ------------------------- --------- ---------- ---------- -------------
        111 Sciarra                   30-SEP-05 FI_ACCOUNT       7700           100
        112 Urman                     07-MAR-06 FI_ACCOUNT       7800           100
        113 Popp                      07-DEC-07 FI_ACCOUNT       6900           100
        114 Raphaely                  07-DEC-02 PU_MAN          11000            30
        115 Khoo                      18-MAY-03 PU_CLERK         3100            30
        116 Baida                     24-DEC-05 PU_CLERK         2900            30
        117 Tobias                    24-JUL-05 PU_CLERK         2800            30
        118 Himuro                    15-NOV-06 PU_CLERK         2600            30
        119 Colmenares                10-AUG-07 PU_CLERK         2500            30
        120 Weiss                     18-JUL-04 ST_MAN           8000            50
        121 Fripp                     10-APR-05 ST_MAN           8200            50

EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY DEPARTMENT_ID
----------- ------------------------- --------- ---------- ---------- -------------
        122 Kaufling                  01-MAY-03 ST_MAN           7900            50
        123 Vollman                   10-OCT-05 ST_MAN           6500            50
        124 Mourgos                   16-NOV-07 ST_MAN           5800            50
        125 Nayer                     16-JUL-05 ST_CLERK         3200            50
        126 Mikkilineni               28-SEP-06 ST_CLERK         2700            50
        127 Landry                    14-JAN-07 ST_CLERK         2400            50
        128 Markle                    08-MAR-08 ST_CLERK         2200            50
        129 Bissot                    20-AUG-05 ST_CLERK         3300            50
        130 Atkinson                  30-OCT-05 ST_CLERK         2800            50
        131 Marlow                    16-FEB-05 ST_CLERK         2500            50
        132 Olson                     10-APR-07 ST_CLERK         2100            50

EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY DEPARTMENT_ID
----------- ------------------------- --------- ---------- ---------- -------------
        133 Mallin                    14-JUN-04 ST_CLERK         3300            50
        134 Rogers                    26-AUG-06 ST_CLERK         2900            50
        135 Gee                       12-DEC-07 ST_CLERK         2400            50
        136 Philtanker                06-FEB-08 ST_CLERK         2200            50
        137 Ladwig                    14-JUL-03 ST_CLERK         3600            50
        138 Stiles                    26-OCT-05 ST_CLERK         3200            50
        139 Seo                       12-FEB-06 ST_CLERK         2700            50
        140 Patel                     06-APR-06 ST_CLERK         2500            50
        141 Rajs                      17-OCT-03 ST_CLERK         3500            50
        142 Davies                    29-JAN-05 ST_CLERK         3100            50
        143 Matos                     15-MAR-06 ST_CLERK         2600            50

EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY DEPARTMENT_ID
----------- ------------------------- --------- ---------- ---------- -------------
        144 Vargas                    09-JUL-06 ST_CLERK         2500            50
        145 Russell                   01-OCT-04 SA_MAN          14000            80
        146 Partners                  05-JAN-05 SA_MAN          13500            80
        147 Errazuriz                 10-MAR-05 SA_MAN          12000            80
        148 Cambrault                 15-OCT-07 SA_MAN          11000            80
        149 Zlotkey                   29-JAN-08 SA_MAN          10500            80
        150 Tucker                    30-JAN-05 SA_REP          10000            80
        151 Bernstein                 24-MAR-05 SA_REP           9500            80
        152 Hall                      20-AUG-05 SA_REP           9000            80
        153 Olsen                     30-MAR-06 SA_REP           8000            80
        154 Cambrault                 09-DEC-06 SA_REP           7500            80

EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY DEPARTMENT_ID
----------- ------------------------- --------- ---------- ---------- -------------
        155 Tuvault                   23-NOV-07 SA_REP           7000            80
        156 King                      30-JAN-04 SA_REP          10000            80
        157 Sully                     04-MAR-04 SA_REP           9500            80
        158 McEwen                    01-AUG-04 SA_REP           9000            80
        159 Smith                     10-MAR-05 SA_REP           8000            80
        160 Doran                     15-DEC-05 SA_REP           7500            80
        161 Sewall                    03-NOV-06 SA_REP           7000            80
        162 Vishney                   11-NOV-05 SA_REP          10500            80
        163 Greene                    19-MAR-07 SA_REP           9500            80
        164 Marvins                   24-JAN-08 SA_REP           7200            80
        165 Lee                       23-FEB-08 SA_REP           6800            80

EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY DEPARTMENT_ID
----------- ------------------------- --------- ---------- ---------- -------------
        166 Ande                      24-MAR-08 SA_REP           6400            80
        167 Banda                     21-APR-08 SA_REP           6200            80
        168 Ozer                      11-MAR-05 SA_REP          11500            80
        169 Bloom                     23-MAR-06 SA_REP          10000            80
        170 Fox                       24-JAN-06 SA_REP           9600            80
        171 Smith                     23-FEB-07 SA_REP           7400            80
        172 Bates                     24-MAR-07 SA_REP           7300            80
        173 Kumar                     21-APR-08 SA_REP           6100            80
        174 Abel                      11-MAY-04 SA_REP          11000            80
        175 Hutton                    19-MAR-05 SA_REP           8800            80
        176 Taylor                    24-MAR-06 SA_REP           8600            80

EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY DEPARTMENT_ID
----------- ------------------------- --------- ---------- ---------- -------------
        177 Livingston                23-APR-06 SA_REP           8400            80
        178 Grant                     24-MAY-07 SA_REP           7000
        179 Johnson                   04-JAN-08 SA_REP           6200            80
        180 Taylor                    24-JAN-06 SH_CLERK         3200            50
        181 Fleaur                    23-FEB-06 SH_CLERK         3100            50
        182 Sullivan                  21-JUN-07 SH_CLERK         2500            50
        183 Geoni                     03-FEB-08 SH_CLERK         2800            50
        184 Sarchand                  27-JAN-04 SH_CLERK         4200            50
        185 Bull                      20-FEB-05 SH_CLERK         4100            50
        186 Dellinger                 24-JUN-06 SH_CLERK         3400            50
        187 Cabrio                    07-FEB-07 SH_CLERK         3000            50

EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY DEPARTMENT_ID
----------- ------------------------- --------- ---------- ---------- -------------
        188 Chung                     14-JUN-05 SH_CLERK         3800            50
        189 Dilly                     13-AUG-05 SH_CLERK         3600            50
        190 Gates                     11-JUL-06 SH_CLERK         2900            50
        191 Perkins                   19-DEC-07 SH_CLERK         2500            50
        192 Bell                      04-FEB-04 SH_CLERK         4000            50
        193 Everett                   03-MAR-05 SH_CLERK         3900            50
        194 McCain                    01-JUL-06 SH_CLERK         3200            50
        195 Jones                     17-MAR-07 SH_CLERK         2800            50
        196 Walsh                     24-APR-06 SH_CLERK         3100            50
        197 Feeney                    23-MAY-06 SH_CLERK         3000            50
        198 OConnell                  21-JUN-07 SH_CLERK         2600            50

EMPLOYEE_ID LAST_NAME                 HIRE_DATE JOB_ID         SALARY DEPARTMENT_ID
----------- ------------------------- --------- ---------- ---------- -------------
        199 Grant                     13-JAN-08 SH_CLERK         2600            50
        200 Whalen                    17-SEP-03 AD_ASST          4400            10
        201 Hartstein                 17-FEB-04 MK_MAN          13000            20
        202 Fay                       17-AUG-05 MK_REP           6000            20
        203 Mavris                    07-JUN-02 HR_REP           6500            40
        204 Baer                      07-JUN-02 PR_REP          10000            70
        205 Higgins                   07-JUN-02 AC_MGR          12008           110
        206 Gietz                     07-JUN-02 AC_ACCOUNT       8300           110

107 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date  , job_id, salary, salary *12 "Annual Pay"department_id
  2* FROM employees
SQL> /
SELECT employee_id "#id", last_name "Name", hire_date  , job_id, salary, salary *12 "Annual Pay"department_id
                                                                                                *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> /
SELECT employee_id "#id", last_name "Name", hire_date  , job_id, salary, salary *12 "Annual Pay"department_id
                                                                                                *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2* FROM employees
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       102 De Haan                   13-JAN-01 AD_VP           17000     204000            90
       103 Hunold                    03-JAN-06 IT_PROG          9000     108000            60
       104 Ernst                     21-MAY-07 IT_PROG          6000      72000            60
       105 Austin                    25-JUN-05 IT_PROG          4800      57600            60
       106 Pataballa                 05-FEB-06 IT_PROG          4800      57600            60
       107 Lorentz                   07-FEB-07 IT_PROG          4200      50400            60
       108 Greenberg                 17-AUG-02 FI_MGR          12008     144096           100
       109 Faviet                    16-AUG-02 FI_ACCOUNT       9000     108000           100
       110 Chen                      28-SEP-05 FI_ACCOUNT       8200      98400           100

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       111 Sciarra                   30-SEP-05 FI_ACCOUNT       7700      92400           100
       112 Urman                     07-MAR-06 FI_ACCOUNT       7800      93600           100
       113 Popp                      07-DEC-07 FI_ACCOUNT       6900      82800           100
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       115 Khoo                      18-MAY-03 PU_CLERK         3100      37200            30
       116 Baida                     24-DEC-05 PU_CLERK         2900      34800            30
       117 Tobias                    24-JUL-05 PU_CLERK         2800      33600            30
       118 Himuro                    15-NOV-06 PU_CLERK         2600      31200            30
       119 Colmenares                10-AUG-07 PU_CLERK         2500      30000            30
       120 Weiss                     18-JUL-04 ST_MAN           8000      96000            50
       121 Fripp                     10-APR-05 ST_MAN           8200      98400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       122 Kaufling                  01-MAY-03 ST_MAN           7900      94800            50
       123 Vollman                   10-OCT-05 ST_MAN           6500      78000            50
       124 Mourgos                   16-NOV-07 ST_MAN           5800      69600            50
       125 Nayer                     16-JUL-05 ST_CLERK         3200      38400            50
       126 Mikkilineni               28-SEP-06 ST_CLERK         2700      32400            50
       127 Landry                    14-JAN-07 ST_CLERK         2400      28800            50
       128 Markle                    08-MAR-08 ST_CLERK         2200      26400            50
       129 Bissot                    20-AUG-05 ST_CLERK         3300      39600            50
       130 Atkinson                  30-OCT-05 ST_CLERK         2800      33600            50
       131 Marlow                    16-FEB-05 ST_CLERK         2500      30000            50
       132 Olson                     10-APR-07 ST_CLERK         2100      25200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       133 Mallin                    14-JUN-04 ST_CLERK         3300      39600            50
       134 Rogers                    26-AUG-06 ST_CLERK         2900      34800            50
       135 Gee                       12-DEC-07 ST_CLERK         2400      28800            50
       136 Philtanker                06-FEB-08 ST_CLERK         2200      26400            50
       137 Ladwig                    14-JUL-03 ST_CLERK         3600      43200            50
       138 Stiles                    26-OCT-05 ST_CLERK         3200      38400            50
       139 Seo                       12-FEB-06 ST_CLERK         2700      32400            50
       140 Patel                     06-APR-06 ST_CLERK         2500      30000            50
       141 Rajs                      17-OCT-03 ST_CLERK         3500      42000            50
       142 Davies                    29-JAN-05 ST_CLERK         3100      37200            50
       143 Matos                     15-MAR-06 ST_CLERK         2600      31200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       144 Vargas                    09-JUL-06 ST_CLERK         2500      30000            50
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       147 Errazuriz                 10-MAR-05 SA_MAN          12000     144000            80
       148 Cambrault                 15-OCT-07 SA_MAN          11000     132000            80
       149 Zlotkey                   29-JAN-08 SA_MAN          10500     126000            80
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80
       151 Bernstein                 24-MAR-05 SA_REP           9500     114000            80
       152 Hall                      20-AUG-05 SA_REP           9000     108000            80
       153 Olsen                     30-MAR-06 SA_REP           8000      96000            80
       154 Cambrault                 09-DEC-06 SA_REP           7500      90000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       155 Tuvault                   23-NOV-07 SA_REP           7000      84000            80
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       157 Sully                     04-MAR-04 SA_REP           9500     114000            80
       158 McEwen                    01-AUG-04 SA_REP           9000     108000            80
       159 Smith                     10-MAR-05 SA_REP           8000      96000            80
       160 Doran                     15-DEC-05 SA_REP           7500      90000            80
       161 Sewall                    03-NOV-06 SA_REP           7000      84000            80
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80
       163 Greene                    19-MAR-07 SA_REP           9500     114000            80
       164 Marvins                   24-JAN-08 SA_REP           7200      86400            80
       165 Lee                       23-FEB-08 SA_REP           6800      81600            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       166 Ande                      24-MAR-08 SA_REP           6400      76800            80
       167 Banda                     21-APR-08 SA_REP           6200      74400            80
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80
       169 Bloom                     23-MAR-06 SA_REP          10000     120000            80
       170 Fox                       24-JAN-06 SA_REP           9600     115200            80
       171 Smith                     23-FEB-07 SA_REP           7400      88800            80
       172 Bates                     24-MAR-07 SA_REP           7300      87600            80
       173 Kumar                     21-APR-08 SA_REP           6100      73200            80
       174 Abel                      11-MAY-04 SA_REP          11000     132000            80
       175 Hutton                    19-MAR-05 SA_REP           8800     105600            80
       176 Taylor                    24-MAR-06 SA_REP           8600     103200            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       177 Livingston                23-APR-06 SA_REP           8400     100800            80
       178 Grant                     24-MAY-07 SA_REP           7000      84000
       179 Johnson                   04-JAN-08 SA_REP           6200      74400            80
       180 Taylor                    24-JAN-06 SH_CLERK         3200      38400            50
       181 Fleaur                    23-FEB-06 SH_CLERK         3100      37200            50
       182 Sullivan                  21-JUN-07 SH_CLERK         2500      30000            50
       183 Geoni                     03-FEB-08 SH_CLERK         2800      33600            50
       184 Sarchand                  27-JAN-04 SH_CLERK         4200      50400            50
       185 Bull                      20-FEB-05 SH_CLERK         4100      49200            50
       186 Dellinger                 24-JUN-06 SH_CLERK         3400      40800            50
       187 Cabrio                    07-FEB-07 SH_CLERK         3000      36000            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       188 Chung                     14-JUN-05 SH_CLERK         3800      45600            50
       189 Dilly                     13-AUG-05 SH_CLERK         3600      43200            50
       190 Gates                     11-JUL-06 SH_CLERK         2900      34800            50
       191 Perkins                   19-DEC-07 SH_CLERK         2500      30000            50
       192 Bell                      04-FEB-04 SH_CLERK         4000      48000            50
       193 Everett                   03-MAR-05 SH_CLERK         3900      46800            50
       194 McCain                    01-JUL-06 SH_CLERK         3200      38400            50
       195 Jones                     17-MAR-07 SH_CLERK         2800      33600            50
       196 Walsh                     24-APR-06 SH_CLERK         3100      37200            50
       197 Feeney                    23-MAY-06 SH_CLERK         3000      36000            50
       198 OConnell                  21-JUN-07 SH_CLERK         2600      31200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       199 Grant                     13-JAN-08 SH_CLERK         2600      31200            50
       200 Whalen                    17-SEP-03 AD_ASST          4400      52800            10
       201 Hartstein                 17-FEB-04 MK_MAN          13000     156000            20
       202 Fay                       17-AUG-05 MK_REP           6000      72000            20
       203 Mavris                    07-JUN-02 HR_REP           6500      78000            40
       204 Baer                      07-JUN-02 PR_REP          10000     120000            70
       205 Higgins                   07-JUN-02 AC_MGR          12008     144096           110
       206 Gietz                     07-JUN-02 AC_ACCOUNT       8300      99600           110

107 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE department_id = 90
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       102 De Haan                   13-JAN-01 AD_VP           17000     204000            90

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE job_id='IT_PROG'
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       103 Hunold                    03-JAN-06 IT_PROG          9000     108000            60
       104 Ernst                     21-MAY-07 IT_PROG          6000      72000            60
       105 Austin                    25-JUN-05 IT_PROG          4800      57600            60
       106 Pataballa                 05-FEB-06 IT_PROG          4800      57600            60
       107 Lorentz                   07-FEB-07 IT_PROG          4200      50400            60

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE employee_id=100
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE last_name ='King'
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       100 King                      17-JUN-03 AD_PRES         24000     288000            90

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE hire_date= '17-OCT-03'
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       141 Rajs                      17-OCT-03 ST_CLERK         3500      42000            50

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE hire_date > '17-OCT-03'
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       103 Hunold                    03-JAN-06 IT_PROG          9000     108000            60
       104 Ernst                     21-MAY-07 IT_PROG          6000      72000            60
       105 Austin                    25-JUN-05 IT_PROG          4800      57600            60
       106 Pataballa                 05-FEB-06 IT_PROG          4800      57600            60
       107 Lorentz                   07-FEB-07 IT_PROG          4200      50400            60
       110 Chen                      28-SEP-05 FI_ACCOUNT       8200      98400           100
       111 Sciarra                   30-SEP-05 FI_ACCOUNT       7700      92400           100
       112 Urman                     07-MAR-06 FI_ACCOUNT       7800      93600           100
       113 Popp                      07-DEC-07 FI_ACCOUNT       6900      82800           100
       116 Baida                     24-DEC-05 PU_CLERK         2900      34800            30

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       117 Tobias                    24-JUL-05 PU_CLERK         2800      33600            30
       118 Himuro                    15-NOV-06 PU_CLERK         2600      31200            30
       119 Colmenares                10-AUG-07 PU_CLERK         2500      30000            30
       120 Weiss                     18-JUL-04 ST_MAN           8000      96000            50
       121 Fripp                     10-APR-05 ST_MAN           8200      98400            50
       123 Vollman                   10-OCT-05 ST_MAN           6500      78000            50
       124 Mourgos                   16-NOV-07 ST_MAN           5800      69600            50
       125 Nayer                     16-JUL-05 ST_CLERK         3200      38400            50
       126 Mikkilineni               28-SEP-06 ST_CLERK         2700      32400            50
       127 Landry                    14-JAN-07 ST_CLERK         2400      28800            50
       128 Markle                    08-MAR-08 ST_CLERK         2200      26400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       129 Bissot                    20-AUG-05 ST_CLERK         3300      39600            50
       130 Atkinson                  30-OCT-05 ST_CLERK         2800      33600            50
       131 Marlow                    16-FEB-05 ST_CLERK         2500      30000            50
       132 Olson                     10-APR-07 ST_CLERK         2100      25200            50
       133 Mallin                    14-JUN-04 ST_CLERK         3300      39600            50
       134 Rogers                    26-AUG-06 ST_CLERK         2900      34800            50
       135 Gee                       12-DEC-07 ST_CLERK         2400      28800            50
       136 Philtanker                06-FEB-08 ST_CLERK         2200      26400            50
       138 Stiles                    26-OCT-05 ST_CLERK         3200      38400            50
       139 Seo                       12-FEB-06 ST_CLERK         2700      32400            50
       140 Patel                     06-APR-06 ST_CLERK         2500      30000            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       142 Davies                    29-JAN-05 ST_CLERK         3100      37200            50
       143 Matos                     15-MAR-06 ST_CLERK         2600      31200            50
       144 Vargas                    09-JUL-06 ST_CLERK         2500      30000            50
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       147 Errazuriz                 10-MAR-05 SA_MAN          12000     144000            80
       148 Cambrault                 15-OCT-07 SA_MAN          11000     132000            80
       149 Zlotkey                   29-JAN-08 SA_MAN          10500     126000            80
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80
       151 Bernstein                 24-MAR-05 SA_REP           9500     114000            80
       152 Hall                      20-AUG-05 SA_REP           9000     108000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       153 Olsen                     30-MAR-06 SA_REP           8000      96000            80
       154 Cambrault                 09-DEC-06 SA_REP           7500      90000            80
       155 Tuvault                   23-NOV-07 SA_REP           7000      84000            80
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       157 Sully                     04-MAR-04 SA_REP           9500     114000            80
       158 McEwen                    01-AUG-04 SA_REP           9000     108000            80
       159 Smith                     10-MAR-05 SA_REP           8000      96000            80
       160 Doran                     15-DEC-05 SA_REP           7500      90000            80
       161 Sewall                    03-NOV-06 SA_REP           7000      84000            80
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80
       163 Greene                    19-MAR-07 SA_REP           9500     114000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       164 Marvins                   24-JAN-08 SA_REP           7200      86400            80
       165 Lee                       23-FEB-08 SA_REP           6800      81600            80
       166 Ande                      24-MAR-08 SA_REP           6400      76800            80
       167 Banda                     21-APR-08 SA_REP           6200      74400            80
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80
       169 Bloom                     23-MAR-06 SA_REP          10000     120000            80
       170 Fox                       24-JAN-06 SA_REP           9600     115200            80
       171 Smith                     23-FEB-07 SA_REP           7400      88800            80
       172 Bates                     24-MAR-07 SA_REP           7300      87600            80
       173 Kumar                     21-APR-08 SA_REP           6100      73200            80
       174 Abel                      11-MAY-04 SA_REP          11000     132000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       175 Hutton                    19-MAR-05 SA_REP           8800     105600            80
       176 Taylor                    24-MAR-06 SA_REP           8600     103200            80
       177 Livingston                23-APR-06 SA_REP           8400     100800            80
       178 Grant                     24-MAY-07 SA_REP           7000      84000
       179 Johnson                   04-JAN-08 SA_REP           6200      74400            80
       180 Taylor                    24-JAN-06 SH_CLERK         3200      38400            50
       181 Fleaur                    23-FEB-06 SH_CLERK         3100      37200            50
       182 Sullivan                  21-JUN-07 SH_CLERK         2500      30000            50
       183 Geoni                     03-FEB-08 SH_CLERK         2800      33600            50
       184 Sarchand                  27-JAN-04 SH_CLERK         4200      50400            50
       185 Bull                      20-FEB-05 SH_CLERK         4100      49200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       186 Dellinger                 24-JUN-06 SH_CLERK         3400      40800            50
       187 Cabrio                    07-FEB-07 SH_CLERK         3000      36000            50
       188 Chung                     14-JUN-05 SH_CLERK         3800      45600            50
       189 Dilly                     13-AUG-05 SH_CLERK         3600      43200            50
       190 Gates                     11-JUL-06 SH_CLERK         2900      34800            50
       191 Perkins                   19-DEC-07 SH_CLERK         2500      30000            50
       192 Bell                      04-FEB-04 SH_CLERK         4000      48000            50
       193 Everett                   03-MAR-05 SH_CLERK         3900      46800            50
       194 McCain                    01-JUL-06 SH_CLERK         3200      38400            50
       195 Jones                     17-MAR-07 SH_CLERK         2800      33600            50
       196 Walsh                     24-APR-06 SH_CLERK         3100      37200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       197 Feeney                    23-MAY-06 SH_CLERK         3000      36000            50
       198 OConnell                  21-JUN-07 SH_CLERK         2600      31200            50
       199 Grant                     13-JAN-08 SH_CLERK         2600      31200            50
       201 Hartstein                 17-FEB-04 MK_MAN          13000     156000            20
       202 Fay                       17-AUG-05 MK_REP           6000      72000            20

93 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE hire_date < '17-OCT-03'
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       102 De Haan                   13-JAN-01 AD_VP           17000     204000            90
       108 Greenberg                 17-AUG-02 FI_MGR          12008     144096           100
       109 Faviet                    16-AUG-02 FI_ACCOUNT       9000     108000           100
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       115 Khoo                      18-MAY-03 PU_CLERK         3100      37200            30
       122 Kaufling                  01-MAY-03 ST_MAN           7900      94800            50
       137 Ladwig                    14-JUL-03 ST_CLERK         3600      43200            50
       200 Whalen                    17-SEP-03 AD_ASST          4400      52800            10
       203 Mavris                    07-JUN-02 HR_REP           6500      78000            40
       204 Baer                      07-JUN-02 PR_REP          10000     120000            70

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       205 Higgins                   07-JUN-02 AC_MGR          12008     144096           110
       206 Gietz                     07-JUN-02 AC_ACCOUNT       8300      99600           110

13 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE salary =10000
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       169 Bloom                     23-MAR-06 SA_REP          10000     120000            80
       204 Baer                      07-JUN-02 PR_REP          10000     120000            70

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE salary >=10000
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       102 De Haan                   13-JAN-01 AD_VP           17000     204000            90
       108 Greenberg                 17-AUG-02 FI_MGR          12008     144096           100
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       147 Errazuriz                 10-MAR-05 SA_MAN          12000     144000            80
       148 Cambrault                 15-OCT-07 SA_MAN          11000     132000            80
       149 Zlotkey                   29-JAN-08 SA_MAN          10500     126000            80
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80
       169 Bloom                     23-MAR-06 SA_REP          10000     120000            80
       174 Abel                      11-MAY-04 SA_REP          11000     132000            80
       201 Hartstein                 17-FEB-04 MK_MAN          13000     156000            20
       204 Baer                      07-JUN-02 PR_REP          10000     120000            70
       205 Higgins                   07-JUN-02 AC_MGR          12008     144096           110

19 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE salary >10000
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       102 De Haan                   13-JAN-01 AD_VP           17000     204000            90
       108 Greenberg                 17-AUG-02 FI_MGR          12008     144096           100
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       147 Errazuriz                 10-MAR-05 SA_MAN          12000     144000            80
       148 Cambrault                 15-OCT-07 SA_MAN          11000     132000            80
       149 Zlotkey                   29-JAN-08 SA_MAN          10500     126000            80
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80
       174 Abel                      11-MAY-04 SA_REP          11000     132000            80
       201 Hartstein                 17-FEB-04 MK_MAN          13000     156000            20
       205 Higgins                   07-JUN-02 AC_MGR          12008     144096           110

15 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE salary <10000
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       103 Hunold                    03-JAN-06 IT_PROG          9000     108000            60
       104 Ernst                     21-MAY-07 IT_PROG          6000      72000            60
       105 Austin                    25-JUN-05 IT_PROG          4800      57600            60
       106 Pataballa                 05-FEB-06 IT_PROG          4800      57600            60
       107 Lorentz                   07-FEB-07 IT_PROG          4200      50400            60
       109 Faviet                    16-AUG-02 FI_ACCOUNT       9000     108000           100
       110 Chen                      28-SEP-05 FI_ACCOUNT       8200      98400           100
       111 Sciarra                   30-SEP-05 FI_ACCOUNT       7700      92400           100
       112 Urman                     07-MAR-06 FI_ACCOUNT       7800      93600           100
       113 Popp                      07-DEC-07 FI_ACCOUNT       6900      82800           100
       115 Khoo                      18-MAY-03 PU_CLERK         3100      37200            30

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       116 Baida                     24-DEC-05 PU_CLERK         2900      34800            30
       117 Tobias                    24-JUL-05 PU_CLERK         2800      33600            30
       118 Himuro                    15-NOV-06 PU_CLERK         2600      31200            30
       119 Colmenares                10-AUG-07 PU_CLERK         2500      30000            30
       120 Weiss                     18-JUL-04 ST_MAN           8000      96000            50
       121 Fripp                     10-APR-05 ST_MAN           8200      98400            50
       122 Kaufling                  01-MAY-03 ST_MAN           7900      94800            50
       123 Vollman                   10-OCT-05 ST_MAN           6500      78000            50
       124 Mourgos                   16-NOV-07 ST_MAN           5800      69600            50
       125 Nayer                     16-JUL-05 ST_CLERK         3200      38400            50
       126 Mikkilineni               28-SEP-06 ST_CLERK         2700      32400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       127 Landry                    14-JAN-07 ST_CLERK         2400      28800            50
       128 Markle                    08-MAR-08 ST_CLERK         2200      26400            50
       129 Bissot                    20-AUG-05 ST_CLERK         3300      39600            50
       130 Atkinson                  30-OCT-05 ST_CLERK         2800      33600            50
       131 Marlow                    16-FEB-05 ST_CLERK         2500      30000            50
       132 Olson                     10-APR-07 ST_CLERK         2100      25200            50
       133 Mallin                    14-JUN-04 ST_CLERK         3300      39600            50
       134 Rogers                    26-AUG-06 ST_CLERK         2900      34800            50
       135 Gee                       12-DEC-07 ST_CLERK         2400      28800            50
       136 Philtanker                06-FEB-08 ST_CLERK         2200      26400            50
       137 Ladwig                    14-JUL-03 ST_CLERK         3600      43200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       138 Stiles                    26-OCT-05 ST_CLERK         3200      38400            50
       139 Seo                       12-FEB-06 ST_CLERK         2700      32400            50
       140 Patel                     06-APR-06 ST_CLERK         2500      30000            50
       141 Rajs                      17-OCT-03 ST_CLERK         3500      42000            50
       142 Davies                    29-JAN-05 ST_CLERK         3100      37200            50
       143 Matos                     15-MAR-06 ST_CLERK         2600      31200            50
       144 Vargas                    09-JUL-06 ST_CLERK         2500      30000            50
       151 Bernstein                 24-MAR-05 SA_REP           9500     114000            80
       152 Hall                      20-AUG-05 SA_REP           9000     108000            80
       153 Olsen                     30-MAR-06 SA_REP           8000      96000            80
       154 Cambrault                 09-DEC-06 SA_REP           7500      90000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       155 Tuvault                   23-NOV-07 SA_REP           7000      84000            80
       157 Sully                     04-MAR-04 SA_REP           9500     114000            80
       158 McEwen                    01-AUG-04 SA_REP           9000     108000            80
       159 Smith                     10-MAR-05 SA_REP           8000      96000            80
       160 Doran                     15-DEC-05 SA_REP           7500      90000            80
       161 Sewall                    03-NOV-06 SA_REP           7000      84000            80
       163 Greene                    19-MAR-07 SA_REP           9500     114000            80
       164 Marvins                   24-JAN-08 SA_REP           7200      86400            80
       165 Lee                       23-FEB-08 SA_REP           6800      81600            80
       166 Ande                      24-MAR-08 SA_REP           6400      76800            80
       167 Banda                     21-APR-08 SA_REP           6200      74400            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       170 Fox                       24-JAN-06 SA_REP           9600     115200            80
       171 Smith                     23-FEB-07 SA_REP           7400      88800            80
       172 Bates                     24-MAR-07 SA_REP           7300      87600            80
       173 Kumar                     21-APR-08 SA_REP           6100      73200            80
       175 Hutton                    19-MAR-05 SA_REP           8800     105600            80
       176 Taylor                    24-MAR-06 SA_REP           8600     103200            80
       177 Livingston                23-APR-06 SA_REP           8400     100800            80
       178 Grant                     24-MAY-07 SA_REP           7000      84000
       179 Johnson                   04-JAN-08 SA_REP           6200      74400            80
       180 Taylor                    24-JAN-06 SH_CLERK         3200      38400            50
       181 Fleaur                    23-FEB-06 SH_CLERK         3100      37200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       182 Sullivan                  21-JUN-07 SH_CLERK         2500      30000            50
       183 Geoni                     03-FEB-08 SH_CLERK         2800      33600            50
       184 Sarchand                  27-JAN-04 SH_CLERK         4200      50400            50
       185 Bull                      20-FEB-05 SH_CLERK         4100      49200            50
       186 Dellinger                 24-JUN-06 SH_CLERK         3400      40800            50
       187 Cabrio                    07-FEB-07 SH_CLERK         3000      36000            50
       188 Chung                     14-JUN-05 SH_CLERK         3800      45600            50
       189 Dilly                     13-AUG-05 SH_CLERK         3600      43200            50
       190 Gates                     11-JUL-06 SH_CLERK         2900      34800            50
       191 Perkins                   19-DEC-07 SH_CLERK         2500      30000            50
       192 Bell                      04-FEB-04 SH_CLERK         4000      48000            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       193 Everett                   03-MAR-05 SH_CLERK         3900      46800            50
       194 McCain                    01-JUL-06 SH_CLERK         3200      38400            50
       195 Jones                     17-MAR-07 SH_CLERK         2800      33600            50
       196 Walsh                     24-APR-06 SH_CLERK         3100      37200            50
       197 Feeney                    23-MAY-06 SH_CLERK         3000      36000            50
       198 OConnell                  21-JUN-07 SH_CLERK         2600      31200            50
       199 Grant                     13-JAN-08 SH_CLERK         2600      31200            50
       200 Whalen                    17-SEP-03 AD_ASST          4400      52800            10
       202 Fay                       17-AUG-05 MK_REP           6000      72000            20
       203 Mavris                    07-JUN-02 HR_REP           6500      78000            40
       206 Gietz                     07-JUN-02 AC_ACCOUNT       8300      99600           110

88 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE salary <= 10000
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       103 Hunold                    03-JAN-06 IT_PROG          9000     108000            60
       104 Ernst                     21-MAY-07 IT_PROG          6000      72000            60
       105 Austin                    25-JUN-05 IT_PROG          4800      57600            60
       106 Pataballa                 05-FEB-06 IT_PROG          4800      57600            60
       107 Lorentz                   07-FEB-07 IT_PROG          4200      50400            60
       109 Faviet                    16-AUG-02 FI_ACCOUNT       9000     108000           100
       110 Chen                      28-SEP-05 FI_ACCOUNT       8200      98400           100
       111 Sciarra                   30-SEP-05 FI_ACCOUNT       7700      92400           100
       112 Urman                     07-MAR-06 FI_ACCOUNT       7800      93600           100
       113 Popp                      07-DEC-07 FI_ACCOUNT       6900      82800           100
       115 Khoo                      18-MAY-03 PU_CLERK         3100      37200            30

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       116 Baida                     24-DEC-05 PU_CLERK         2900      34800            30
       117 Tobias                    24-JUL-05 PU_CLERK         2800      33600            30
       118 Himuro                    15-NOV-06 PU_CLERK         2600      31200            30
       119 Colmenares                10-AUG-07 PU_CLERK         2500      30000            30
       120 Weiss                     18-JUL-04 ST_MAN           8000      96000            50
       121 Fripp                     10-APR-05 ST_MAN           8200      98400            50
       122 Kaufling                  01-MAY-03 ST_MAN           7900      94800            50
       123 Vollman                   10-OCT-05 ST_MAN           6500      78000            50
       124 Mourgos                   16-NOV-07 ST_MAN           5800      69600            50
       125 Nayer                     16-JUL-05 ST_CLERK         3200      38400            50
       126 Mikkilineni               28-SEP-06 ST_CLERK         2700      32400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       127 Landry                    14-JAN-07 ST_CLERK         2400      28800            50
       128 Markle                    08-MAR-08 ST_CLERK         2200      26400            50
       129 Bissot                    20-AUG-05 ST_CLERK         3300      39600            50
       130 Atkinson                  30-OCT-05 ST_CLERK         2800      33600            50
       131 Marlow                    16-FEB-05 ST_CLERK         2500      30000            50
       132 Olson                     10-APR-07 ST_CLERK         2100      25200            50
       133 Mallin                    14-JUN-04 ST_CLERK         3300      39600            50
       134 Rogers                    26-AUG-06 ST_CLERK         2900      34800            50
       135 Gee                       12-DEC-07 ST_CLERK         2400      28800            50
       136 Philtanker                06-FEB-08 ST_CLERK         2200      26400            50
       137 Ladwig                    14-JUL-03 ST_CLERK         3600      43200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       138 Stiles                    26-OCT-05 ST_CLERK         3200      38400            50
       139 Seo                       12-FEB-06 ST_CLERK         2700      32400            50
       140 Patel                     06-APR-06 ST_CLERK         2500      30000            50
       141 Rajs                      17-OCT-03 ST_CLERK         3500      42000            50
       142 Davies                    29-JAN-05 ST_CLERK         3100      37200            50
       143 Matos                     15-MAR-06 ST_CLERK         2600      31200            50
       144 Vargas                    09-JUL-06 ST_CLERK         2500      30000            50
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80
       151 Bernstein                 24-MAR-05 SA_REP           9500     114000            80
       152 Hall                      20-AUG-05 SA_REP           9000     108000            80
       153 Olsen                     30-MAR-06 SA_REP           8000      96000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       154 Cambrault                 09-DEC-06 SA_REP           7500      90000            80
       155 Tuvault                   23-NOV-07 SA_REP           7000      84000            80
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       157 Sully                     04-MAR-04 SA_REP           9500     114000            80
       158 McEwen                    01-AUG-04 SA_REP           9000     108000            80
       159 Smith                     10-MAR-05 SA_REP           8000      96000            80
       160 Doran                     15-DEC-05 SA_REP           7500      90000            80
       161 Sewall                    03-NOV-06 SA_REP           7000      84000            80
       163 Greene                    19-MAR-07 SA_REP           9500     114000            80
       164 Marvins                   24-JAN-08 SA_REP           7200      86400            80
       165 Lee                       23-FEB-08 SA_REP           6800      81600            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       166 Ande                      24-MAR-08 SA_REP           6400      76800            80
       167 Banda                     21-APR-08 SA_REP           6200      74400            80
       169 Bloom                     23-MAR-06 SA_REP          10000     120000            80
       170 Fox                       24-JAN-06 SA_REP           9600     115200            80
       171 Smith                     23-FEB-07 SA_REP           7400      88800            80
       172 Bates                     24-MAR-07 SA_REP           7300      87600            80
       173 Kumar                     21-APR-08 SA_REP           6100      73200            80
       175 Hutton                    19-MAR-05 SA_REP           8800     105600            80
       176 Taylor                    24-MAR-06 SA_REP           8600     103200            80
       177 Livingston                23-APR-06 SA_REP           8400     100800            80
       178 Grant                     24-MAY-07 SA_REP           7000      84000

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       179 Johnson                   04-JAN-08 SA_REP           6200      74400            80
       180 Taylor                    24-JAN-06 SH_CLERK         3200      38400            50
       181 Fleaur                    23-FEB-06 SH_CLERK         3100      37200            50
       182 Sullivan                  21-JUN-07 SH_CLERK         2500      30000            50
       183 Geoni                     03-FEB-08 SH_CLERK         2800      33600            50
       184 Sarchand                  27-JAN-04 SH_CLERK         4200      50400            50
       185 Bull                      20-FEB-05 SH_CLERK         4100      49200            50
       186 Dellinger                 24-JUN-06 SH_CLERK         3400      40800            50
       187 Cabrio                    07-FEB-07 SH_CLERK         3000      36000            50
       188 Chung                     14-JUN-05 SH_CLERK         3800      45600            50
       189 Dilly                     13-AUG-05 SH_CLERK         3600      43200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       190 Gates                     11-JUL-06 SH_CLERK         2900      34800            50
       191 Perkins                   19-DEC-07 SH_CLERK         2500      30000            50
       192 Bell                      04-FEB-04 SH_CLERK         4000      48000            50
       193 Everett                   03-MAR-05 SH_CLERK         3900      46800            50
       194 McCain                    01-JUL-06 SH_CLERK         3200      38400            50
       195 Jones                     17-MAR-07 SH_CLERK         2800      33600            50
       196 Walsh                     24-APR-06 SH_CLERK         3100      37200            50
       197 Feeney                    23-MAY-06 SH_CLERK         3000      36000            50
       198 OConnell                  21-JUN-07 SH_CLERK         2600      31200            50
       199 Grant                     13-JAN-08 SH_CLERK         2600      31200            50
       200 Whalen                    17-SEP-03 AD_ASST          4400      52800            10

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       202 Fay                       17-AUG-05 MK_REP           6000      72000            20
       203 Mavris                    07-JUN-02 HR_REP           6500      78000            40
       204 Baer                      07-JUN-02 PR_REP          10000     120000            70
       206 Gietz                     07-JUN-02 AC_ACCOUNT       8300      99600           110

92 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE salary BETWEEN 10000 AND 15000
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       108 Greenberg                 17-AUG-02 FI_MGR          12008     144096           100
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       147 Errazuriz                 10-MAR-05 SA_MAN          12000     144000            80
       148 Cambrault                 15-OCT-07 SA_MAN          11000     132000            80
       149 Zlotkey                   29-JAN-08 SA_MAN          10500     126000            80
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       169 Bloom                     23-MAR-06 SA_REP          10000     120000            80
       174 Abel                      11-MAY-04 SA_REP          11000     132000            80
       201 Hartstein                 17-FEB-04 MK_MAN          13000     156000            20
       204 Baer                      07-JUN-02 PR_REP          10000     120000            70
       205 Higgins                   07-JUN-02 AC_MGR          12008     144096           110

16 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE salary BETWEEN 100000 AND 150000
SQL> /

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE salary BETWEEN 10000 AND 150000
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       102 De Haan                   13-JAN-01 AD_VP           17000     204000            90
       108 Greenberg                 17-AUG-02 FI_MGR          12008     144096           100
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       147 Errazuriz                 10-MAR-05 SA_MAN          12000     144000            80
       148 Cambrault                 15-OCT-07 SA_MAN          11000     132000            80
       149 Zlotkey                   29-JAN-08 SA_MAN          10500     126000            80
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80
       169 Bloom                     23-MAR-06 SA_REP          10000     120000            80
       174 Abel                      11-MAY-04 SA_REP          11000     132000            80
       201 Hartstein                 17-FEB-04 MK_MAN          13000     156000            20
       204 Baer                      07-JUN-02 PR_REP          10000     120000            70
       205 Higgins                   07-JUN-02 AC_MGR          12008     144096           110

19 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE salary BETWEEN 10000 AND 150000
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       102 De Haan                   13-JAN-01 AD_VP           17000     204000            90
       108 Greenberg                 17-AUG-02 FI_MGR          12008     144096           100
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       147 Errazuriz                 10-MAR-05 SA_MAN          12000     144000            80
       148 Cambrault                 15-OCT-07 SA_MAN          11000     132000            80
       149 Zlotkey                   29-JAN-08 SA_MAN          10500     126000            80
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80
       169 Bloom                     23-MAR-06 SA_REP          10000     120000            80
       174 Abel                      11-MAY-04 SA_REP          11000     132000            80
       201 Hartstein                 17-FEB-04 MK_MAN          13000     156000            20
       204 Baer                      07-JUN-02 PR_REP          10000     120000            70
       205 Higgins                   07-JUN-02 AC_MGR          12008     144096           110

19 rows selected.

SQL> eded
SP2-0042: unknown command "eded" - rest of line ignored.
SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE salary BETWEEN 1000 AND 150000
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       102 De Haan                   13-JAN-01 AD_VP           17000     204000            90
       103 Hunold                    03-JAN-06 IT_PROG          9000     108000            60
       104 Ernst                     21-MAY-07 IT_PROG          6000      72000            60
       105 Austin                    25-JUN-05 IT_PROG          4800      57600            60
       106 Pataballa                 05-FEB-06 IT_PROG          4800      57600            60
       107 Lorentz                   07-FEB-07 IT_PROG          4200      50400            60
       108 Greenberg                 17-AUG-02 FI_MGR          12008     144096           100
       109 Faviet                    16-AUG-02 FI_ACCOUNT       9000     108000           100
       110 Chen                      28-SEP-05 FI_ACCOUNT       8200      98400           100

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       111 Sciarra                   30-SEP-05 FI_ACCOUNT       7700      92400           100
       112 Urman                     07-MAR-06 FI_ACCOUNT       7800      93600           100
       113 Popp                      07-DEC-07 FI_ACCOUNT       6900      82800           100
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       115 Khoo                      18-MAY-03 PU_CLERK         3100      37200            30
       116 Baida                     24-DEC-05 PU_CLERK         2900      34800            30
       117 Tobias                    24-JUL-05 PU_CLERK         2800      33600            30
       118 Himuro                    15-NOV-06 PU_CLERK         2600      31200            30
       119 Colmenares                10-AUG-07 PU_CLERK         2500      30000            30
       120 Weiss                     18-JUL-04 ST_MAN           8000      96000            50
       121 Fripp                     10-APR-05 ST_MAN           8200      98400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       122 Kaufling                  01-MAY-03 ST_MAN           7900      94800            50
       123 Vollman                   10-OCT-05 ST_MAN           6500      78000            50
       124 Mourgos                   16-NOV-07 ST_MAN           5800      69600            50
       125 Nayer                     16-JUL-05 ST_CLERK         3200      38400            50
       126 Mikkilineni               28-SEP-06 ST_CLERK         2700      32400            50
       127 Landry                    14-JAN-07 ST_CLERK         2400      28800            50
       128 Markle                    08-MAR-08 ST_CLERK         2200      26400            50
       129 Bissot                    20-AUG-05 ST_CLERK         3300      39600            50
       130 Atkinson                  30-OCT-05 ST_CLERK         2800      33600            50
       131 Marlow                    16-FEB-05 ST_CLERK         2500      30000            50
       132 Olson                     10-APR-07 ST_CLERK         2100      25200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       133 Mallin                    14-JUN-04 ST_CLERK         3300      39600            50
       134 Rogers                    26-AUG-06 ST_CLERK         2900      34800            50
       135 Gee                       12-DEC-07 ST_CLERK         2400      28800            50
       136 Philtanker                06-FEB-08 ST_CLERK         2200      26400            50
       137 Ladwig                    14-JUL-03 ST_CLERK         3600      43200            50
       138 Stiles                    26-OCT-05 ST_CLERK         3200      38400            50
       139 Seo                       12-FEB-06 ST_CLERK         2700      32400            50
       140 Patel                     06-APR-06 ST_CLERK         2500      30000            50
       141 Rajs                      17-OCT-03 ST_CLERK         3500      42000            50
       142 Davies                    29-JAN-05 ST_CLERK         3100      37200            50
       143 Matos                     15-MAR-06 ST_CLERK         2600      31200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       144 Vargas                    09-JUL-06 ST_CLERK         2500      30000            50
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       147 Errazuriz                 10-MAR-05 SA_MAN          12000     144000            80
       148 Cambrault                 15-OCT-07 SA_MAN          11000     132000            80
       149 Zlotkey                   29-JAN-08 SA_MAN          10500     126000            80
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80
       151 Bernstein                 24-MAR-05 SA_REP           9500     114000            80
       152 Hall                      20-AUG-05 SA_REP           9000     108000            80
       153 Olsen                     30-MAR-06 SA_REP           8000      96000            80
       154 Cambrault                 09-DEC-06 SA_REP           7500      90000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       155 Tuvault                   23-NOV-07 SA_REP           7000      84000            80
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       157 Sully                     04-MAR-04 SA_REP           9500     114000            80
       158 McEwen                    01-AUG-04 SA_REP           9000     108000            80
       159 Smith                     10-MAR-05 SA_REP           8000      96000            80
       160 Doran                     15-DEC-05 SA_REP           7500      90000            80
       161 Sewall                    03-NOV-06 SA_REP           7000      84000            80
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80
       163 Greene                    19-MAR-07 SA_REP           9500     114000            80
       164 Marvins                   24-JAN-08 SA_REP           7200      86400            80
       165 Lee                       23-FEB-08 SA_REP           6800      81600            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       166 Ande                      24-MAR-08 SA_REP           6400      76800            80
       167 Banda                     21-APR-08 SA_REP           6200      74400            80
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80
       169 Bloom                     23-MAR-06 SA_REP          10000     120000            80
       170 Fox                       24-JAN-06 SA_REP           9600     115200            80
       171 Smith                     23-FEB-07 SA_REP           7400      88800            80
       172 Bates                     24-MAR-07 SA_REP           7300      87600            80
       173 Kumar                     21-APR-08 SA_REP           6100      73200            80
       174 Abel                      11-MAY-04 SA_REP          11000     132000            80
       175 Hutton                    19-MAR-05 SA_REP           8800     105600            80
       176 Taylor                    24-MAR-06 SA_REP           8600     103200            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       177 Livingston                23-APR-06 SA_REP           8400     100800            80
       178 Grant                     24-MAY-07 SA_REP           7000      84000
       179 Johnson                   04-JAN-08 SA_REP           6200      74400            80
       180 Taylor                    24-JAN-06 SH_CLERK         3200      38400            50
       181 Fleaur                    23-FEB-06 SH_CLERK         3100      37200            50
       182 Sullivan                  21-JUN-07 SH_CLERK         2500      30000            50
       183 Geoni                     03-FEB-08 SH_CLERK         2800      33600            50
       184 Sarchand                  27-JAN-04 SH_CLERK         4200      50400            50
       185 Bull                      20-FEB-05 SH_CLERK         4100      49200            50
       186 Dellinger                 24-JUN-06 SH_CLERK         3400      40800            50
       187 Cabrio                    07-FEB-07 SH_CLERK         3000      36000            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       188 Chung                     14-JUN-05 SH_CLERK         3800      45600            50
       189 Dilly                     13-AUG-05 SH_CLERK         3600      43200            50
       190 Gates                     11-JUL-06 SH_CLERK         2900      34800            50
       191 Perkins                   19-DEC-07 SH_CLERK         2500      30000            50
       192 Bell                      04-FEB-04 SH_CLERK         4000      48000            50
       193 Everett                   03-MAR-05 SH_CLERK         3900      46800            50
       194 McCain                    01-JUL-06 SH_CLERK         3200      38400            50
       195 Jones                     17-MAR-07 SH_CLERK         2800      33600            50
       196 Walsh                     24-APR-06 SH_CLERK         3100      37200            50
       197 Feeney                    23-MAY-06 SH_CLERK         3000      36000            50
       198 OConnell                  21-JUN-07 SH_CLERK         2600      31200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       199 Grant                     13-JAN-08 SH_CLERK         2600      31200            50
       200 Whalen                    17-SEP-03 AD_ASST          4400      52800            10
       201 Hartstein                 17-FEB-04 MK_MAN          13000     156000            20
       202 Fay                       17-AUG-05 MK_REP           6000      72000            20
       203 Mavris                    07-JUN-02 HR_REP           6500      78000            40
       204 Baer                      07-JUN-02 PR_REP          10000     120000            70
       205 Higgins                   07-JUN-02 AC_MGR          12008     144096           110
       206 Gietz                     07-JUN-02 AC_ACCOUNT       8300      99600           110

107 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE salary BETWEEN 1000 AND 1500
SQL> /

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3* WHERE salary BETWEEN 1000 AND 40000
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       102 De Haan                   13-JAN-01 AD_VP           17000     204000            90
       103 Hunold                    03-JAN-06 IT_PROG          9000     108000            60
       104 Ernst                     21-MAY-07 IT_PROG          6000      72000            60
       105 Austin                    25-JUN-05 IT_PROG          4800      57600            60
       106 Pataballa                 05-FEB-06 IT_PROG          4800      57600            60
       107 Lorentz                   07-FEB-07 IT_PROG          4200      50400            60
       108 Greenberg                 17-AUG-02 FI_MGR          12008     144096           100
       109 Faviet                    16-AUG-02 FI_ACCOUNT       9000     108000           100
       110 Chen                      28-SEP-05 FI_ACCOUNT       8200      98400           100

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       111 Sciarra                   30-SEP-05 FI_ACCOUNT       7700      92400           100
       112 Urman                     07-MAR-06 FI_ACCOUNT       7800      93600           100
       113 Popp                      07-DEC-07 FI_ACCOUNT       6900      82800           100
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       115 Khoo                      18-MAY-03 PU_CLERK         3100      37200            30
       116 Baida                     24-DEC-05 PU_CLERK         2900      34800            30
       117 Tobias                    24-JUL-05 PU_CLERK         2800      33600            30
       118 Himuro                    15-NOV-06 PU_CLERK         2600      31200            30
       119 Colmenares                10-AUG-07 PU_CLERK         2500      30000            30
       120 Weiss                     18-JUL-04 ST_MAN           8000      96000            50
       121 Fripp                     10-APR-05 ST_MAN           8200      98400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       122 Kaufling                  01-MAY-03 ST_MAN           7900      94800            50
       123 Vollman                   10-OCT-05 ST_MAN           6500      78000            50
       124 Mourgos                   16-NOV-07 ST_MAN           5800      69600            50
       125 Nayer                     16-JUL-05 ST_CLERK         3200      38400            50
       126 Mikkilineni               28-SEP-06 ST_CLERK         2700      32400            50
       127 Landry                    14-JAN-07 ST_CLERK         2400      28800            50
       128 Markle                    08-MAR-08 ST_CLERK         2200      26400            50
       129 Bissot                    20-AUG-05 ST_CLERK         3300      39600            50
       130 Atkinson                  30-OCT-05 ST_CLERK         2800      33600            50
       131 Marlow                    16-FEB-05 ST_CLERK         2500      30000            50
       132 Olson                     10-APR-07 ST_CLERK         2100      25200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       133 Mallin                    14-JUN-04 ST_CLERK         3300      39600            50
       134 Rogers                    26-AUG-06 ST_CLERK         2900      34800            50
       135 Gee                       12-DEC-07 ST_CLERK         2400      28800            50
       136 Philtanker                06-FEB-08 ST_CLERK         2200      26400            50
       137 Ladwig                    14-JUL-03 ST_CLERK         3600      43200            50
       138 Stiles                    26-OCT-05 ST_CLERK         3200      38400            50
       139 Seo                       12-FEB-06 ST_CLERK         2700      32400            50
       140 Patel                     06-APR-06 ST_CLERK         2500      30000            50
       141 Rajs                      17-OCT-03 ST_CLERK         3500      42000            50
       142 Davies                    29-JAN-05 ST_CLERK         3100      37200            50
       143 Matos                     15-MAR-06 ST_CLERK         2600      31200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       144 Vargas                    09-JUL-06 ST_CLERK         2500      30000            50
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       147 Errazuriz                 10-MAR-05 SA_MAN          12000     144000            80
       148 Cambrault                 15-OCT-07 SA_MAN          11000     132000            80
       149 Zlotkey                   29-JAN-08 SA_MAN          10500     126000            80
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80
       151 Bernstein                 24-MAR-05 SA_REP           9500     114000            80
       152 Hall                      20-AUG-05 SA_REP           9000     108000            80
       153 Olsen                     30-MAR-06 SA_REP           8000      96000            80
       154 Cambrault                 09-DEC-06 SA_REP           7500      90000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       155 Tuvault                   23-NOV-07 SA_REP           7000      84000            80
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       157 Sully                     04-MAR-04 SA_REP           9500     114000            80
       158 McEwen                    01-AUG-04 SA_REP           9000     108000            80
       159 Smith                     10-MAR-05 SA_REP           8000      96000            80
       160 Doran                     15-DEC-05 SA_REP           7500      90000            80
       161 Sewall                    03-NOV-06 SA_REP           7000      84000            80
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80
       163 Greene                    19-MAR-07 SA_REP           9500     114000            80
       164 Marvins                   24-JAN-08 SA_REP           7200      86400            80
       165 Lee                       23-FEB-08 SA_REP           6800      81600            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       166 Ande                      24-MAR-08 SA_REP           6400      76800            80
       167 Banda                     21-APR-08 SA_REP           6200      74400            80
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80
       169 Bloom                     23-MAR-06 SA_REP          10000     120000            80
       170 Fox                       24-JAN-06 SA_REP           9600     115200            80
       171 Smith                     23-FEB-07 SA_REP           7400      88800            80
       172 Bates                     24-MAR-07 SA_REP           7300      87600            80
       173 Kumar                     21-APR-08 SA_REP           6100      73200            80
       174 Abel                      11-MAY-04 SA_REP          11000     132000            80
       175 Hutton                    19-MAR-05 SA_REP           8800     105600            80
       176 Taylor                    24-MAR-06 SA_REP           8600     103200            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       177 Livingston                23-APR-06 SA_REP           8400     100800            80
       178 Grant                     24-MAY-07 SA_REP           7000      84000
       179 Johnson                   04-JAN-08 SA_REP           6200      74400            80
       180 Taylor                    24-JAN-06 SH_CLERK         3200      38400            50
       181 Fleaur                    23-FEB-06 SH_CLERK         3100      37200            50
       182 Sullivan                  21-JUN-07 SH_CLERK         2500      30000            50
       183 Geoni                     03-FEB-08 SH_CLERK         2800      33600            50
       184 Sarchand                  27-JAN-04 SH_CLERK         4200      50400            50
       185 Bull                      20-FEB-05 SH_CLERK         4100      49200            50
       186 Dellinger                 24-JUN-06 SH_CLERK         3400      40800            50
       187 Cabrio                    07-FEB-07 SH_CLERK         3000      36000            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       188 Chung                     14-JUN-05 SH_CLERK         3800      45600            50
       189 Dilly                     13-AUG-05 SH_CLERK         3600      43200            50
       190 Gates                     11-JUL-06 SH_CLERK         2900      34800            50
       191 Perkins                   19-DEC-07 SH_CLERK         2500      30000            50
       192 Bell                      04-FEB-04 SH_CLERK         4000      48000            50
       193 Everett                   03-MAR-05 SH_CLERK         3900      46800            50
       194 McCain                    01-JUL-06 SH_CLERK         3200      38400            50
       195 Jones                     17-MAR-07 SH_CLERK         2800      33600            50
       196 Walsh                     24-APR-06 SH_CLERK         3100      37200            50
       197 Feeney                    23-MAY-06 SH_CLERK         3000      36000            50
       198 OConnell                  21-JUN-07 SH_CLERK         2600      31200            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       199 Grant                     13-JAN-08 SH_CLERK         2600      31200            50
       200 Whalen                    17-SEP-03 AD_ASST          4400      52800            10
       201 Hartstein                 17-FEB-04 MK_MAN          13000     156000            20
       202 Fay                       17-AUG-05 MK_REP           6000      72000            20
       203 Mavris                    07-JUN-02 HR_REP           6500      78000            40
       204 Baer                      07-JUN-02 PR_REP          10000     120000            70
       205 Higgins                   07-JUN-02 AC_MGR          12008     144096           110
       206 Gietz                     07-JUN-02 AC_ACCOUNT       8300      99600           110

107 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id "#id", last_name "Name", hire_date, job_id, salary, salary *12 "Annual Pay", department_id
  2  FROM employees
  3  WHERE last_name BETWEEN 'King' AND 'Whalen'
  4* ORDER BY last_name
  5  /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       173 Kumar                     21-APR-08 SA_REP           6100      73200            80
       137 Ladwig                    14-JUL-03 ST_CLERK         3600      43200            50
       127 Landry                    14-JAN-07 ST_CLERK         2400      28800            50
       165 Lee                       23-FEB-08 SA_REP           6800      81600            80
       177 Livingston                23-APR-06 SA_REP           8400     100800            80
       107 Lorentz                   07-FEB-07 IT_PROG          4200      50400            60
       133 Mallin                    14-JUN-04 ST_CLERK         3300      39600            50
       128 Markle                    08-MAR-08 ST_CLERK         2200      26400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       131 Marlow                    16-FEB-05 ST_CLERK         2500      30000            50
       164 Marvins                   24-JAN-08 SA_REP           7200      86400            80
       143 Matos                     15-MAR-06 ST_CLERK         2600      31200            50
       203 Mavris                    07-JUN-02 HR_REP           6500      78000            40
       194 McCain                    01-JUL-06 SH_CLERK         3200      38400            50
       158 McEwen                    01-AUG-04 SA_REP           9000     108000            80
       126 Mikkilineni               28-SEP-06 ST_CLERK         2700      32400            50
       124 Mourgos                   16-NOV-07 ST_MAN           5800      69600            50
       125 Nayer                     16-JUL-05 ST_CLERK         3200      38400            50
       198 OConnell                  21-JUN-07 SH_CLERK         2600      31200            50
       153 Olsen                     30-MAR-06 SA_REP           8000      96000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       132 Olson                     10-APR-07 ST_CLERK         2100      25200            50
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       106 Pataballa                 05-FEB-06 IT_PROG          4800      57600            60
       140 Patel                     06-APR-06 ST_CLERK         2500      30000            50
       191 Perkins                   19-DEC-07 SH_CLERK         2500      30000            50
       136 Philtanker                06-FEB-08 ST_CLERK         2200      26400            50
       113 Popp                      07-DEC-07 FI_ACCOUNT       6900      82800           100
       141 Rajs                      17-OCT-03 ST_CLERK         3500      42000            50
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       134 Rogers                    26-AUG-06 ST_CLERK         2900      34800            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       184 Sarchand                  27-JAN-04 SH_CLERK         4200      50400            50
       111 Sciarra                   30-SEP-05 FI_ACCOUNT       7700      92400           100
       139 Seo                       12-FEB-06 ST_CLERK         2700      32400            50
       161 Sewall                    03-NOV-06 SA_REP           7000      84000            80
       171 Smith                     23-FEB-07 SA_REP           7400      88800            80
       159 Smith                     10-MAR-05 SA_REP           8000      96000            80
       138 Stiles                    26-OCT-05 ST_CLERK         3200      38400            50
       182 Sullivan                  21-JUN-07 SH_CLERK         2500      30000            50
       157 Sully                     04-MAR-04 SA_REP           9500     114000            80
       180 Taylor                    24-JAN-06 SH_CLERK         3200      38400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       176 Taylor                    24-MAR-06 SA_REP           8600     103200            80
       117 Tobias                    24-JUL-05 PU_CLERK         2800      33600            30
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80
       155 Tuvault                   23-NOV-07 SA_REP           7000      84000            80
       112 Urman                     07-MAR-06 FI_ACCOUNT       7800      93600           100
       144 Vargas                    09-JUL-06 ST_CLERK         2500      30000            50
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80
       123 Vollman                   10-OCT-05 ST_MAN           6500      78000            50
       196 Walsh                     24-APR-06 SH_CLERK         3100      37200            50
       120 Weiss                     18-JUL-04 ST_MAN           8000      96000            50
       200 Whalen                    17-SEP-03 AD_ASST          4400      52800            10

55 rows selected.

SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       173 Kumar                     21-APR-08 SA_REP           6100      73200            80
       137 Ladwig                    14-JUL-03 ST_CLERK         3600      43200            50
       127 Landry                    14-JAN-07 ST_CLERK         2400      28800            50
       165 Lee                       23-FEB-08 SA_REP           6800      81600            80
       177 Livingston                23-APR-06 SA_REP           8400     100800            80
       107 Lorentz                   07-FEB-07 IT_PROG          4200      50400            60
       133 Mallin                    14-JUN-04 ST_CLERK         3300      39600            50
       128 Markle                    08-MAR-08 ST_CLERK         2200      26400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       131 Marlow                    16-FEB-05 ST_CLERK         2500      30000            50
       164 Marvins                   24-JAN-08 SA_REP           7200      86400            80
       143 Matos                     15-MAR-06 ST_CLERK         2600      31200            50
       203 Mavris                    07-JUN-02 HR_REP           6500      78000            40
       194 McCain                    01-JUL-06 SH_CLERK         3200      38400            50
       158 McEwen                    01-AUG-04 SA_REP           9000     108000            80
       126 Mikkilineni               28-SEP-06 ST_CLERK         2700      32400            50
       124 Mourgos                   16-NOV-07 ST_MAN           5800      69600            50
       125 Nayer                     16-JUL-05 ST_CLERK         3200      38400            50
       198 OConnell                  21-JUN-07 SH_CLERK         2600      31200            50
       153 Olsen                     30-MAR-06 SA_REP           8000      96000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       132 Olson                     10-APR-07 ST_CLERK         2100      25200            50
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       106 Pataballa                 05-FEB-06 IT_PROG          4800      57600            60
       140 Patel                     06-APR-06 ST_CLERK         2500      30000            50
       191 Perkins                   19-DEC-07 SH_CLERK         2500      30000            50
       136 Philtanker                06-FEB-08 ST_CLERK         2200      26400            50
       113 Popp                      07-DEC-07 FI_ACCOUNT       6900      82800           100
       141 Rajs                      17-OCT-03 ST_CLERK         3500      42000            50
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       134 Rogers                    26-AUG-06 ST_CLERK         2900      34800            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       184 Sarchand                  27-JAN-04 SH_CLERK         4200      50400            50
       111 Sciarra                   30-SEP-05 FI_ACCOUNT       7700      92400           100
       139 Seo                       12-FEB-06 ST_CLERK         2700      32400            50
       161 Sewall                    03-NOV-06 SA_REP           7000      84000            80
       171 Smith                     23-FEB-07 SA_REP           7400      88800            80
       159 Smith                     10-MAR-05 SA_REP           8000      96000            80
       138 Stiles                    26-OCT-05 ST_CLERK         3200      38400            50
       182 Sullivan                  21-JUN-07 SH_CLERK         2500      30000            50
       157 Sully                     04-MAR-04 SA_REP           9500     114000            80
       180 Taylor                    24-JAN-06 SH_CLERK         3200      38400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       176 Taylor                    24-MAR-06 SA_REP           8600     103200            80
       117 Tobias                    24-JUL-05 PU_CLERK         2800      33600            30
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80
       155 Tuvault                   23-NOV-07 SA_REP           7000      84000            80
       112 Urman                     07-MAR-06 FI_ACCOUNT       7800      93600           100
       144 Vargas                    09-JUL-06 ST_CLERK         2500      30000            50
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80
       123 Vollman                   10-OCT-05 ST_MAN           6500      78000            50
       196 Walsh                     24-APR-06 SH_CLERK         3100      37200            50
       120 Weiss                     18-JUL-04 ST_MAN           8000      96000            50
       200 Whalen                    17-SEP-03 AD_ASST          4400      52800            10

55 rows selected.

SQL>
SQL>
SQL>
SQL>
SQL>
SQL>
SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       173 Kumar                     21-APR-08 SA_REP           6100      73200            80
       137 Ladwig                    14-JUL-03 ST_CLERK         3600      43200            50
       127 Landry                    14-JAN-07 ST_CLERK         2400      28800            50
       165 Lee                       23-FEB-08 SA_REP           6800      81600            80
       177 Livingston                23-APR-06 SA_REP           8400     100800            80
       107 Lorentz                   07-FEB-07 IT_PROG          4200      50400            60
       133 Mallin                    14-JUN-04 ST_CLERK         3300      39600            50
       128 Markle                    08-MAR-08 ST_CLERK         2200      26400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       131 Marlow                    16-FEB-05 ST_CLERK         2500      30000            50
       164 Marvins                   24-JAN-08 SA_REP           7200      86400            80
       143 Matos                     15-MAR-06 ST_CLERK         2600      31200            50
       203 Mavris                    07-JUN-02 HR_REP           6500      78000            40
       194 McCain                    01-JUL-06 SH_CLERK         3200      38400            50
       158 McEwen                    01-AUG-04 SA_REP           9000     108000            80
       126 Mikkilineni               28-SEP-06 ST_CLERK         2700      32400            50
       124 Mourgos                   16-NOV-07 ST_MAN           5800      69600            50
       125 Nayer                     16-JUL-05 ST_CLERK         3200      38400            50
       198 OConnell                  21-JUN-07 SH_CLERK         2600      31200            50
       153 Olsen                     30-MAR-06 SA_REP           8000      96000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       132 Olson                     10-APR-07 ST_CLERK         2100      25200            50
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       106 Pataballa                 05-FEB-06 IT_PROG          4800      57600            60
       140 Patel                     06-APR-06 ST_CLERK         2500      30000            50
       191 Perkins                   19-DEC-07 SH_CLERK         2500      30000            50
       136 Philtanker                06-FEB-08 ST_CLERK         2200      26400            50
       113 Popp                      07-DEC-07 FI_ACCOUNT       6900      82800           100
       141 Rajs                      17-OCT-03 ST_CLERK         3500      42000            50
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       134 Rogers                    26-AUG-06 ST_CLERK         2900      34800            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       184 Sarchand                  27-JAN-04 SH_CLERK         4200      50400            50
       111 Sciarra                   30-SEP-05 FI_ACCOUNT       7700      92400           100
       139 Seo                       12-FEB-06 ST_CLERK         2700      32400            50
       161 Sewall                    03-NOV-06 SA_REP           7000      84000            80
       171 Smith                     23-FEB-07 SA_REP           7400      88800            80
       159 Smith                     10-MAR-05 SA_REP           8000      96000            80
       138 Stiles                    26-OCT-05 ST_CLERK         3200      38400            50
       182 Sullivan                  21-JUN-07 SH_CLERK         2500      30000            50
       157 Sully                     04-MAR-04 SA_REP           9500     114000            80
       180 Taylor                    24-JAN-06 SH_CLERK         3200      38400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       176 Taylor                    24-MAR-06 SA_REP           8600     103200            80
       117 Tobias                    24-JUL-05 PU_CLERK         2800      33600            30
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80
       155 Tuvault                   23-NOV-07 SA_REP           7000      84000            80
       112 Urman                     07-MAR-06 FI_ACCOUNT       7800      93600           100
       144 Vargas                    09-JUL-06 ST_CLERK         2500      30000            50
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80
       123 Vollman                   10-OCT-05 ST_MAN           6500      78000            50
       196 Walsh                     24-APR-06 SH_CLERK         3100      37200            50
       120 Weiss                     18-JUL-04 ST_MAN           8000      96000            50
       200 Whalen                    17-SEP-03 AD_ASST          4400      52800            10

55 rows selected.

SQL> /

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       100 King                      17-JUN-03 AD_PRES         24000     288000            90
       156 King                      30-JAN-04 SA_REP          10000     120000            80
       101 Kochhar                   21-SEP-05 AD_VP           17000     204000            90
       173 Kumar                     21-APR-08 SA_REP           6100      73200            80
       137 Ladwig                    14-JUL-03 ST_CLERK         3600      43200            50
       127 Landry                    14-JAN-07 ST_CLERK         2400      28800            50
       165 Lee                       23-FEB-08 SA_REP           6800      81600            80
       177 Livingston                23-APR-06 SA_REP           8400     100800            80
       107 Lorentz                   07-FEB-07 IT_PROG          4200      50400            60
       133 Mallin                    14-JUN-04 ST_CLERK         3300      39600            50
       128 Markle                    08-MAR-08 ST_CLERK         2200      26400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       131 Marlow                    16-FEB-05 ST_CLERK         2500      30000            50
       164 Marvins                   24-JAN-08 SA_REP           7200      86400            80
       143 Matos                     15-MAR-06 ST_CLERK         2600      31200            50
       203 Mavris                    07-JUN-02 HR_REP           6500      78000            40
       194 McCain                    01-JUL-06 SH_CLERK         3200      38400            50
       158 McEwen                    01-AUG-04 SA_REP           9000     108000            80
       126 Mikkilineni               28-SEP-06 ST_CLERK         2700      32400            50
       124 Mourgos                   16-NOV-07 ST_MAN           5800      69600            50
       125 Nayer                     16-JUL-05 ST_CLERK         3200      38400            50
       198 OConnell                  21-JUN-07 SH_CLERK         2600      31200            50
       153 Olsen                     30-MAR-06 SA_REP           8000      96000            80

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       132 Olson                     10-APR-07 ST_CLERK         2100      25200            50
       168 Ozer                      11-MAR-05 SA_REP          11500     138000            80
       146 Partners                  05-JAN-05 SA_MAN          13500     162000            80
       106 Pataballa                 05-FEB-06 IT_PROG          4800      57600            60
       140 Patel                     06-APR-06 ST_CLERK         2500      30000            50
       191 Perkins                   19-DEC-07 SH_CLERK         2500      30000            50
       136 Philtanker                06-FEB-08 ST_CLERK         2200      26400            50
       113 Popp                      07-DEC-07 FI_ACCOUNT       6900      82800           100
       141 Rajs                      17-OCT-03 ST_CLERK         3500      42000            50
       114 Raphaely                  07-DEC-02 PU_MAN          11000     132000            30
       134 Rogers                    26-AUG-06 ST_CLERK         2900      34800            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       145 Russell                   01-OCT-04 SA_MAN          14000     168000            80
       184 Sarchand                  27-JAN-04 SH_CLERK         4200      50400            50
       111 Sciarra                   30-SEP-05 FI_ACCOUNT       7700      92400           100
       139 Seo                       12-FEB-06 ST_CLERK         2700      32400            50
       161 Sewall                    03-NOV-06 SA_REP           7000      84000            80
       171 Smith                     23-FEB-07 SA_REP           7400      88800            80
       159 Smith                     10-MAR-05 SA_REP           8000      96000            80
       138 Stiles                    26-OCT-05 ST_CLERK         3200      38400            50
       182 Sullivan                  21-JUN-07 SH_CLERK         2500      30000            50
       157 Sully                     04-MAR-04 SA_REP           9500     114000            80
       180 Taylor                    24-JAN-06 SH_CLERK         3200      38400            50

       #id Name                      HIRE_DATE JOB_ID         SALARY Annual Pay DEPARTMENT_ID
---------- ------------------------- --------- ---------- ---------- ---------- -------------
       176 Taylor                    24-MAR-06 SA_REP           8600     103200            80
       117 Tobias                    24-JUL-05 PU_CLERK         2800      33600            30
       150 Tucker                    30-JAN-05 SA_REP          10000     120000            80
       155 Tuvault                   23-NOV-07 SA_REP           7000      84000            80
       112 Urman                     07-MAR-06 FI_ACCOUNT       7800      93600           100
       144 Vargas                    09-JUL-06 ST_CLERK         2500      30000            50
       162 Vishney                   11-NOV-05 SA_REP          10500     126000            80
       123 Vollman                   10-OCT-05 ST_MAN           6500      78000            50
       196 Walsh                     24-APR-06 SH_CLERK         3100      37200            50
       120 Weiss                     18-JUL-04 ST_MAN           8000      96000            50
       200 Whalen                    17-SEP-03 AD_ASST          4400      52800            10

55 rows selected.

SQL> SELECT employee_id, last_name, salary, manager_id
  2  FROM employees
  3  WHERE manager_id IN (100, 101, 201);

EMPLOYEE_ID LAST_NAME                     SALARY MANAGER_ID
----------- ------------------------- ---------- ----------
        101 Kochhar                        17000        100
        102 De Haan                        17000        100
        114 Raphaely                       11000        100
        120 Weiss                           8000        100
        121 Fripp                           8200        100
        122 Kaufling                        7900        100
        123 Vollman                         6500        100
        124 Mourgos                         5800        100
        145 Russell                        14000        100
        146 Partners                       13500        100
        147 Errazuriz                      12000        100

EMPLOYEE_ID LAST_NAME                     SALARY MANAGER_ID
----------- ------------------------- ---------- ----------
        148 Cambrault                      11000        100
        149 Zlotkey                        10500        100
        201 Hartstein                      13000        100
        108 Greenberg                      12008        101
        200 Whalen                          4400        101
        203 Mavris                          6500        101
        204 Baer                           10000        101
        205 Higgins                        12008        101
        202 Fay                             6000        201

20 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, salary, manager_id
  2  FROM employees
  3* WHERE manager_id IN (100, 101, 201)
SQL> /

EMPLOYEE_ID LAST_NAME                     SALARY MANAGER_ID
----------- ------------------------- ---------- ----------
        101 Kochhar                        17000        100
        102 De Haan                        17000        100
        114 Raphaely                       11000        100
        120 Weiss                           8000        100
        121 Fripp                           8200        100
        122 Kaufling                        7900        100
        123 Vollman                         6500        100
        124 Mourgos                         5800        100
        145 Russell                        14000        100
        146 Partners                       13500        100
        147 Errazuriz                      12000        100

EMPLOYEE_ID LAST_NAME                     SALARY MANAGER_ID
----------- ------------------------- ---------- ----------
        148 Cambrault                      11000        100
        149 Zlotkey                        10500        100
        201 Hartstein                      13000        100
        108 Greenberg                      12008        101
        200 Whalen                          4400        101
        203 Mavris                          6500        101
        204 Baer                           10000        101
        205 Higgins                        12008        101
        202 Fay                             6000        201

20 rows selected.

*/




/* 3/3/2025 


SQL*Plus: Release 19.0.0.0.0 - Production on Mon Mar 3 09:28:10 2025
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Enter user-name: sys as sysdba
Enter password:

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> alter session set container=orclpdb;

Session altered.

SQL> alter pluggable database open;
alter pluggable database open
*
ERROR at line 1:
ORA-65019: pluggable database ORCLPDB already open


SQL> conn hr/hr@orclpdb;
Connected.
SQL> desc departments
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPARTMENT_ID                             NOT NULL NUMBER(4)
 DEPARTMENT_NAME                           NOT NULL VARCHAR2(30)
 MANAGER_ID                                         NUMBER(6)
 LOCATION_ID                                        NUMBER(4)

SQL> desc employees
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                               NOT NULL NUMBER(6)
 FIRST_NAME                                         VARCHAR2(20)
 LAST_NAME                                 NOT NULL VARCHAR2(25)
 EMAIL                                     NOT NULL VARCHAR2(25)
 PHONE_NUMBER                                       VARCHAR2(20)
 HIRE_DATE                                 NOT NULL DATE
 JOB_ID                                    NOT NULL VARCHAR2(10)
 SALARY                                             NUMBER(8,2)
 COMMISSION_PCT                                     NUMBER(2,2)
 MANAGER_ID                                         NUMBER(6)
 DEPARTMENT_ID                                      NUMBER(4)

SQL> desc  jobs
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 JOB_ID                                    NOT NULL VARCHAR2(10)
 JOB_TITLE                                 NOT NULL VARCHAR2(35)
 MIN_SALARY                                         NUMBER(6)
 MAX_SALARY                                         NUMBER(6)

SQL> SELECT last_name, hire_date
  2  FROM employees
  3  WHERE hire_date > (SELECT hire_date
  4                     FROM employees
  5                     WHERE last_name = 'Davies');

LAST_NAME                 HIRE_DATE
------------------------- ---------
Kochhar                   21-SEP-05
Hunold                    03-JAN-06
Ernst                     21-MAY-07
Austin                    25-JUN-05
Pataballa                 05-FEB-06
Lorentz                   07-FEB-07
Chen                      28-SEP-05
Sciarra                   30-SEP-05
Urman                     07-MAR-06
Popp                      07-DEC-07
Baida                     24-DEC-05

LAST_NAME                 HIRE_DATE
------------------------- ---------
Tobias                    24-JUL-05
Himuro                    15-NOV-06
Colmenares                10-AUG-07
Fripp                     10-APR-05
Vollman                   10-OCT-05
Mourgos                   16-NOV-07
Nayer                     16-JUL-05
Mikkilineni               28-SEP-06
Landry                    14-JAN-07
Markle                    08-MAR-08
Bissot                    20-AUG-05

LAST_NAME                 HIRE_DATE
------------------------- ---------
Atkinson                  30-OCT-05
Marlow                    16-FEB-05
Olson                     10-APR-07
Rogers                    26-AUG-06
Gee                       12-DEC-07
Philtanker                06-FEB-08
Stiles                    26-OCT-05
Seo                       12-FEB-06
Patel                     06-APR-06
Matos                     15-MAR-06
Vargas                    09-JUL-06

LAST_NAME                 HIRE_DATE
------------------------- ---------
Errazuriz                 10-MAR-05
Cambrault                 15-OCT-07
Zlotkey                   29-JAN-08
Tucker                    30-JAN-05
Bernstein                 24-MAR-05
Hall                      20-AUG-05
Olsen                     30-MAR-06
Cambrault                 09-DEC-06
Tuvault                   23-NOV-07
Smith                     10-MAR-05
Doran                     15-DEC-05

LAST_NAME                 HIRE_DATE
------------------------- ---------
Sewall                    03-NOV-06
Vishney                   11-NOV-05
Greene                    19-MAR-07
Marvins                   24-JAN-08
Lee                       23-FEB-08
Ande                      24-MAR-08
Banda                     21-APR-08
Ozer                      11-MAR-05
Bloom                     23-MAR-06
Fox                       24-JAN-06
Smith                     23-FEB-07

LAST_NAME                 HIRE_DATE
------------------------- ---------
Bates                     24-MAR-07
Kumar                     21-APR-08
Hutton                    19-MAR-05
Taylor                    24-MAR-06
Livingston                23-APR-06
Grant                     24-MAY-07
Johnson                   04-JAN-08
Taylor                    24-JAN-06
Fleaur                    23-FEB-06
Sullivan                  21-JUN-07
Geoni                     03-FEB-08

LAST_NAME                 HIRE_DATE
------------------------- ---------
Bull                      20-FEB-05
Dellinger                 24-JUN-06
Cabrio                    07-FEB-07
Chung                     14-JUN-05
Dilly                     13-AUG-05
Gates                     11-JUL-06
Perkins                   19-DEC-07
Everett                   03-MAR-05
McCain                    01-JUL-06
Jones                     17-MAR-07
Walsh                     24-APR-06

LAST_NAME                 HIRE_DATE
------------------------- ---------
Feeney                    23-MAY-06
OConnell                  21-JUN-07
Grant                     13-JAN-08
Fay                       17-AUG-05

81 rows selected.

SQL> SELECT last_name, job_id
  2  FROM employees
  3  WHERE job_id =(SELECT job_id
  4             FROM employees
  5             WHERE employee_id =141);

LAST_NAME                 JOB_ID
------------------------- ----------
Nayer                     ST_CLERK
Mikkilineni               ST_CLERK
Landry                    ST_CLERK
Markle                    ST_CLERK
Bissot                    ST_CLERK
Atkinson                  ST_CLERK
Marlow                    ST_CLERK
Olson                     ST_CLERK
Mallin                    ST_CLERK
Rogers                    ST_CLERK
Gee                       ST_CLERK

LAST_NAME                 JOB_ID
------------------------- ----------
Philtanker                ST_CLERK
Ladwig                    ST_CLERK
Stiles                    ST_CLERK
Seo                       ST_CLERK
Patel                     ST_CLERK
Rajs                      ST_CLERK
Davies                    ST_CLERK
Matos                     ST_CLERK
Vargas                    ST_CLERK

20 rows selected.

SQL> SELECT last_name, job_id, salary
  2  FROM employees
  3  WHERE job_id=(SELECT job_id
  4             FROM employees
  5             WHERE last_name ='Taylor')
  6  AND salary > (SELECT salary
  7             FROM employees
  8             WHERE last_name='Abel');
WHERE job_id=(SELECT job_id
              *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row


SQL> ed
Wrote file afiedt.buf

  1  SELECT last_name, job_id, salary
  2  FROM employees
  3  WHERE job_id=(SELECT job_id
  4             FROM employees
  5             WHERE last_name 'Abel')
  6  AND salary > (SELECT salary
  7             FROM employees
  8*            WHERE last_name='Abel')
SQL> /
                WHERE last_name 'Abel')
                                *
ERROR at line 5:
ORA-00920: invalid relational operator


SQL> ed
Wrote file afiedt.buf

  1  SELECT last_name, job_id, salary
  2  FROM employees
  3  WHERE job_id=(SELECT job_id
  4             FROM employees
  5             WHERE last_name= 'Abel')
  6  AND salary >(SELECT salary
  7             FROM employees
  8*            WHERE last_name='Abel')
SQL> /

LAST_NAME                 JOB_ID         SALARY
------------------------- ---------- ----------
Ozer                      SA_REP          11500

SQL> SELECT last_name, job_id, salary
  2  FROM employees
  3  WHERE salary = (SELECT MIN(salary)
  4                     FROM employees);

LAST_NAME                 JOB_ID         SALARY
------------------------- ---------- ----------
Olson                     ST_CLERK         2100

SQL> SELECT department_id, MIN(salary)
  2  FROM employees
  3  GROUP BY department_id
  4  HAVING MIN(salary)>(SELECT MIN(salary)
  5                     FROM employees
  6                     WHERE department_id = 30);

DEPARTMENT_ID MIN(SALARY)
------------- -----------
           40        6500
          110        8300
           90       17000
           70       10000
                     7000
           10        4400
           20        6000
           60        4200
          100        6900
           80        6100

10 rows selected.

SQL> SELECT job_id, AVG(salary)
  2  FROM employees
  3  GROUP BY job_id
  4  HAVING AVG(salary) = (SELECT MIN(AVG(salary))
  5                     FROM employees
  6                     GROUP BY job_id);

JOB_ID     AVG(SALARY)
---------- -----------
PU_CLERK          2780

SQL> SELECT employee_id, last_name
  2  FROM employees
  3  WHERE salary=(SELECT MIN(salary)
  4             FROM employees
  5             GROUP BY department_id);
WHERE salary=(SELECT MIN(salary)
              *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row


SQL> eed
SP2-0042: unknown command "eed" - rest of line ignored.
SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name
  2  FROM employees
  3  WHERE salary=(SELECT MIN(salary)
  4             FROM employees
  5*            GROUP BY department_id)
SQL> SELECT last_name, job_id
  2  FROM employees
  3  WHERE job_id=(SELECT job_id
  4             FROM employees
  5             WHERE last_name ='Haas');

no rows selected

SQL> SELECT last_name, salary, department_id
  2  FROM employees
  3  /

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
King                           24000            90
Kochhar                        17000            90
De Haan                        17000            90
Hunold                          9000            60
Ernst                           6000            60
Austin                          4800            60
Pataballa                       4800            60
Lorentz                         4200            60
Greenberg                      12008           100
Faviet                          9000           100
Chen                            8200           100

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Sciarra                         7700           100
Urman                           7800           100
Popp                            6900           100
Raphaely                       11000            30
Khoo                            3100            30
Baida                           2900            30
Tobias                          2800            30
Himuro                          2600            30
Colmenares                      2500            30
Weiss                           8000            50
Fripp                           8200            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Kaufling                        7900            50
Vollman                         6500            50
Mourgos                         5800            50
Nayer                           3200            50
Mikkilineni                     2700            50
Landry                          2400            50
Markle                          2200            50
Bissot                          3300            50
Atkinson                        2800            50
Marlow                          2500            50
Olson                           2100            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Mallin                          3300            50
Rogers                          2900            50
Gee                             2400            50
Philtanker                      2200            50
Ladwig                          3600            50
Stiles                          3200            50
Seo                             2700            50
Patel                           2500            50
Rajs                            3500            50
Davies                          3100            50
Matos                           2600            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Vargas                          2500            50
Russell                        14000            80
Partners                       13500            80
Errazuriz                      12000            80
Cambrault                      11000            80
Zlotkey                        10500            80
Tucker                         10000            80
Bernstein                       9500            80
Hall                            9000            80
Olsen                           8000            80
Cambrault                       7500            80

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Tuvault                         7000            80
King                           10000            80
Sully                           9500            80
McEwen                          9000            80
Smith                           8000            80
Doran                           7500            80
Sewall                          7000            80
Vishney                        10500            80
Greene                          9500            80
Marvins                         7200            80
Lee                             6800            80

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Ande                            6400            80
Banda                           6200            80
Ozer                           11500            80
Bloom                          10000            80
Fox                             9600            80
Smith                           7400            80
Bates                           7300            80
Kumar                           6100            80
Abel                           11000            80
Hutton                          8800            80
Taylor                          8600            80

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Livingston                      8400            80
Grant                           7000
Johnson                         6200            80
Taylor                          3200            50
Fleaur                          3100            50
Sullivan                        2500            50
Geoni                           2800            50
Sarchand                        4200            50
Bull                            4100            50
Dellinger                       3400            50
Cabrio                          3000            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Chung                           3800            50
Dilly                           3600            50
Gates                           2900            50
Perkins                         2500            50
Bell                            4000            50
Everett                         3900            50
McCain                          3200            50
Jones                           2800            50
Walsh                           3100            50
Feeney                          3000            50
OConnell                        2600            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Grant                           2600            50
Whalen                          4400            10
Hartstein                      13000            20
Fay                             6000            20
Mavris                          6500            40
Baer                           10000            70
Higgins                        12008           110
Gietz                           8300           110

107 rows selected.

SQL> desc departmnets
ERROR:
ORA-04043: object departmnets does not exist


SQL> desc departments
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPARTMENT_ID                             NOT NULL NUMBER(4)
 DEPARTMENT_NAME                           NOT NULL VARCHAR2(30)
 MANAGER_ID                                         NUMBER(6)
 LOCATION_ID                                        NUMBER(4)

SQL> INSERT INTO DEPARTMENTS(department_id, department_name, manager_id,location_id)
  2  VALUES(280, 'Software',100,1700);

1 row created.

SQL> SELECT * FROM departments
  2  WHERE department_id=280;

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
          280 Software                              100        1700

SQL> INSERT INTO DEPARTMENTS(department_id, department_name, manager_id, location_id)
  2  /
INSERT INTO DEPARTMENTS(department_id, department_name, manager_id, location_id)
                                                                               *
ERROR at line 1:
ORA-00926: missing VALUES keyword


SQL> SELECT employee_id, last_name
  2  FROM employees
  3  WHERE salary =(SELECT MIN(salary)
  4             FROM employees
  5             GROUP BY department_id);
WHERE salary =(SELECT MIN(salary)
               *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name
  2  FROM employees
  3  WHERE salary = (SELECT MIN(salary)
  4             FROM employees
  5*            GROUP BY department_id)
SQL> /
WHERE salary = (SELECT MIN(salary)
                *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row


SQL> INSERT INTO departments
  2  VALUES(290,'IT'100,1700);
VALUES(290,'IT'100,1700)
               *
ERROR at line 2:
ORA-00917: missing comma


SQL> INSERT INTO departments
  2  VALUES(290, 'IT', 100,1700);

1 row created.

SQL> INSERT INTO departments(department_id, department_name)
  2  VALUES(300, 'Soft');

1 row created.

SQL> SELECT * FROM departments
  2  WHERE department_id=300,'Soft');
WHERE department_id=300,'Soft')
                       *
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> ed
Wrote file afiedt.buf

  1  SELECT * FROM departments
  2* WHERE department_id=300;
SQL> /
WHERE department_id=300;
                       *
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> ed
Wrote file afiedt.buf

  1  SELECT * FROM departments
  2* WHERE department_id = 300;
SQL> /
WHERE department_id = 300;
                         *
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> INSERT INTO departments(department_id, department_name)
  2  VALUES (300, 'Soft');
INSERT INTO departments(department_id, department_name)
*
ERROR at line 1:
ORA-00001: unique constraint (HR.DEPT_ID_PK) violated


SQL> SELECT * FROM departments
  2  WHERE department_id = 300;

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
          300 Soft

SQL> INSERT INTO departments
  2  VALUES (310,'Soft', NULL, NULL);

1 row created.

SQL> INSERT INTO departments (department_id, department_name)
  2  VALUES (30, 'Purchasing');
INSERT INTO departments (department_id, department_name)
*
ERROR at line 1:
ORA-00001: unique constraint (HR.DEPT_ID_PK) violated




SQL> ed
Wrote file afiedt.buf

  1  INSERT INTO employees
  2                     (employee_id, first_name, last_name,
  3                      email, phone_number, hire_date, job_id,
  4                     salary, commission_pct, manager_id, department_id)
  5* VALUES (314, 'Louis','Popp','LLPOPP','515.124.4567', CURRENT_DATE, 'AC_ACCOUNT', 6900, NULL, 205, 110);


1 row created.

SQL>*/