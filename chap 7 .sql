/*


*/


/*##############chapter 7-8


Chapter 7: Displaying Data from Multiple Tables Using Joins
•
Objectives: After completing this lesson, it will be possible to write SELECT statements to access data from more than one table using equijoins and nonequijoins, join a table to itself by using a self-join, and view data that generally does not meet a join condition by using OUTER joins.
•
Key points on joins:
◦
It is possible to retrieve data from multiple tables.
◦
There are different types of joins.
◦
SQL:1999 syntax can be used to join tables.
◦
A natural join can be created.
◦
The USING clause can be used to create joins, referencing common column names.
◦
It is possible to qualify ambiguous column names.
◦
Table aliases can be used with the USING clause.
◦
The ON clause can be used to create joins.
◦
Three-way joins can be created.
◦
Additional conditions can be applied to a join.
◦
A table can be joined to itself.
◦
Self-joins can be performed using the ON clause.
◦
Nonequijoins are possible.
◦
It is possible to return records with no direct match using OUTER joins.
◦
INNER versus OUTER joins: An inner join returns only the rows that satisfy the join condition, while an outer join returns all rows from one or both tables, regardless of whether they match the join condition.
◦
Different types of OUTER joins: LEFT, RIGHT, and FULL OUTER JOIN.
◦
Cartesian products can be generated.
◦
Cross joins can be created. Note: Information about joins is found in the “SQL Queries and Subqueries: Joins” section in Oracle Database SQL Language Reference for 12c database.
Chapter 8: Using Subqueries to Solve Queries
•
Objectives: This chapter aims to define subqueries, describe the types of problems that the subqueries can solve, list the types of subqueries, and write single-row, multiple-row, multiple-column subqueries.
•
Key points on subqueries:
◦
A subquery can be used to solve a problem.
◦
There is a specific syntax for subqueries.
◦
There are rules and guidelines for using subqueries.
◦
Different types of subqueries: Single-row, multiple-row, and multiple-column subqueries.
◦
Group functions can be used in a subquery.
◦
The HAVING clause can be used with subqueries.
◦
It is important to consider scenarios where no rows are returned by the inner query.
◦
The ANY operator can be used in multiple-row subqueries.
◦
The ALL operator can be used in multiple-row subqueries.
◦
Consideration of Null Values in a Subquery.
Chapter 9: Using the Set Operators
•
Objectives: This chapter aims to describe set operators, use a set operator to combine multiple queries into a single query, and control the order of rows returned.
•
Key points of set operators:
◦
Set operators are used to combine multiple queries into a single query.
◦
Types of set operators:
▪
UNION and UNION ALL: The UNION operator returns all distinct rows selected by either query. The UNION ALL operator returns all rows selected by either query, including duplicates.
▪
INTERSECT: Returns all rows that are shared by both queries.
▪
MINUS: Returns all distinct rows that are selected by the first query but not by the second.
◦
There are guidelines for using set operators.
◦
When using set operators, the SELECT statements must match.
◦
The ORDER BY clause can be used in set operations to control the order of rows returned. The ORDER BY clause can only be used at the very end of the statement.
Write down the guidelines for using table aliases

When using table aliases, the following guidelines should be followed:
•
Table aliases can be up to 30 characters in length, but shorter aliases are better.
•
If a table alias is used for a particular table name in the FROM clause, that table alias must be substituted for the table name throughout the SELECT statement.
•
Table aliases should be meaningful.
•
A table alias is valid only for the current SELECT statement.
In addition, table aliases should be used to qualify column names that are in multiple tables. Using table prefixes can also improve performance.


# write down the difference between Equijoin and NON-Equijions

Here are the key differences between Equijoins and Nonequijoins, according to the sources:
•
Equijoin:
◦
An equijoin is a join with a join condition containing an equality operator.
◦
It combines rows that have equivalent values for the specified columns.
◦
Equijoins are also called simple joins.
◦
Often involves primary and foreign key complements.
•
Nonequijoin:
◦
A nonequijoin is a join condition containing something other than an equality operator.
◦
Uses operators other than the equality (=) operator.
◦
An example of a nonequijoin involves the EMPLOYEES table and the JOB_GRADES table, where an employee's salary falls within a range defined by the LOWEST_SAL and HIGHEST_SAL columns of the JOB_GRADES table.
◦
All employees appear exactly once when this query is executed, because none of the rows in the job grade table contain grades that overlap.
what is self join?

A self-join involves joining a table to itself. To perform a self-join, the same table is referenced twice in the FROM clause using table aliases to simulate two different tables. The ON clause is used to specify the relationship between the two instances of the table.
Key characteristics of self-joins:
•
A self-join is performed to find hierarchical relationships within a table.
•
It is used to find the name of each employee’s manager, requiring the EMPLOYEES table to be joined to itself.
•
Table aliases are necessary to distinguish the different roles that the same table plays in the join. Aliases simulate two tables in the FROM clause for the same table.
•
The ON clause can also be used to join columns that have different names, within the same table or in a different table.
•
A self-join of the EMPLOYEES table, based on the EMPLOYEE_ID and MANAGER_ID columns, can be performed using the ON clause.
For example, to find the name of Ernst’s manager, you would need to find Ernst in the EMPLOYEES table by looking at the LAST_NAME column and then find the manager number for Ernst by looking at the MANAGER_ID column. Then, you would find the name of the manager with the EMPLOYEE_ID of Ernst's manager.
what is natural join?

A natural join is a type of join that automatically connects tables based on columns that share the same name and data type.
Here's what you need to know about natural joins:
•
The NATURAL JOIN clause is based on all columns that have the same name in two tables.
•
It selects rows from the tables where the matched columns have equal values.
•
If columns with the same name have different data types, an error occurs.
•
Additional restrictions on a natural join are implemented by using a WHERE clause.
For example, the COUNTRIES table can be joined to the LOCATIONS table using the COUNTRY_ID column, as it is the only column with the same name in both tables. If there were other common columns, the join would use all of them.
write down the guidelines for using subqueries

The guidelines for using subqueries are as follows:
•
Subqueries must be enclosed in parentheses.
•
For readability, place subqueries on the right side of the comparison condition. However, subqueries can be on either side of the comparison operator.
•
Use single-row operators with single-row subqueries and multiple-row operators with multiple-row subqueries.
Additionally, a subquery is a SELECT statement that is embedded in a clause of another SQL statement. Subqueries are also referred to as a nested SELECT, sub-SELECT, or inner SELECT statement. Subqueries are useful when a query is based on a search criterion with unknown intermediate values.
A subquery is often executed first, and its output is used to complete the query condition for the main (or outer) query.
write down the types of error during execute the subquery

When executing subqueries, common errors can occur in the following situations:
•
Single-row operator with multiple-row subquery: This happens when a subquery returns more than one row for a single-row subquery. This occurs when the subquery contains a GROUP BY clause, which implies that the subquery will return multiple rows, one for each group that it finds. The single-row comparison operator expects only one value and cannot accept more than one value from the subquery. To correct this error, change the = operator to IN.
•
No rows returned by the inner query: This occurs when the inner query returns no rows. The outer query takes the results of the subquery (null) and uses these results in its WHERE clause. The outer query finds no match and returns no rows.
•
Null values: When null values are likely to be part of the result set of a subquery, do not use the NOT IN operator, which is equivalent to <> ALL. Conditions that compare a null value result in a null. The null value as part of the result set of a subquery is not a problem if the IN operator, equivalent to =ANY, is used.
what are the types of subquery? define these

The sources indicate the following types of subqueries:
•
Single-row subquery: This is a query that returns only one row from the inner SELECT statement.
 This type of subquery uses single-row operators, such as =, >, <, >=, <=, and <>.
•
Multiple-row subquery: This is a query that returns more than one row from the inner SELECT statement. It uses multiple-row operators.
•
Multiple-column subquery: This is a query that returns more than one column from the inner SELECT statement. It can be used in the FROM, WHERE, or HAVING clause of the outer query.


*/










SQL*Plus: Release 19.0.0.0.0 - Production on Mon Mar 3 19:33:23 2025
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Enter user-name: sys as sysdba
Enter password:

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> alter session set container =orclpdb;

Session altered.

SQL> alter pluggable database open;
alter pluggable database open
*
ERROR at line 1:
ORA-65019: pluggable database ORCLPDB already open


SQL> conn hr/hr@orclpdb;
Connected.
SQL> SELECT employee_id, first_name, job_id, job_title
  2  FROM employees NATURAL JOIN jobs;

EMPLOYEE_ID FIRST_NAME           JOB_ID     JOB_TITLE
----------- -------------------- ---------- -----------------------------------
        206 William              AC_ACCOUNT Public Accountant
        205 Shelley              AC_MGR     Accounting Manager
        200 Jennifer             AD_ASST    Administration Assistant
        100 Steven               AD_PRES    President
        102 Lex                  AD_VP      Administration Vice President
        101 Neena                AD_VP      Administration Vice President
        110 John                 FI_ACCOUNT Accountant
        109 Daniel               FI_ACCOUNT Accountant
        113 Luis                 FI_ACCOUNT Accountant
        111 Ismael               FI_ACCOUNT Accountant
        112 Jose Manuel          FI_ACCOUNT Accountant


107 rows selected.

SQL> SELECT department_id, department_name, location_id, city
  2  FROM departments
  3  NATURAL JOIN locations
  4  WHERE department_id IN(20, 50);

DEPARTMENT_ID DEPARTMENT_NAME                LOCATION_ID
------------- ------------------------------ -----------
CITY
------------------------------
           20 Marketing                             1800
Toronto

           50 Shipping                              1500
South San Francisco


SQL> SELECT employee_id, last_name, location_id, department_id
  2  FROM employees JOIN departments
  3  USING (department_id);

EMPLOYEE_ID LAST_NAME                 LOCATION_ID DEPARTMENT_ID
----------- ------------------------- ----------- -------------
        200 Whalen                           1700            10
        201 Hartstein                        1800            20
        202 Fay                              1800            20
        114 Raphaely                         1700            30
        115 Khoo                             1700            30
        116 Baida                            1700            30
        117 Tobias                           1700            30
        118 Himuro                           1700            30
        119 Colmenares                       1700            30
        203 Mavris                           2400            40
        120 Weiss                            1500            50


106 rows selected.

SQL> SELECT employee_id, last_name, job_id, department_name
  2  FROM employees JOIN departments
  3  USING (manager_id);

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_NAME
----------- ------------------------- ---------- ------------------------------
        101 Kochhar                   AD_VP      Executive
        102 De Haan                   AD_VP      Executive
        104 Ernst                     IT_PROG    IT
        105 Austin                    IT_PROG    IT
        106 Pataballa                 IT_PROG    IT
        107 Lorentz                   IT_PROG    IT
        109 Faviet                    FI_ACCOUNT Finance
        110 Chen                      FI_ACCOUNT Finance
        111 Sciarra                   FI_ACCOUNT Finance
        112 Urman                     FI_ACCOUNT Finance
        113 Popp                      FI_ACCOUNT Finance


44 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, department_id, department_name
  2  FROM employees JOIN departments
  3* USING (manager_id)
SQL> /
SELECT employee_id, last_name, job_id, department_id, department_name
                                       *
ERROR at line 1:
ORA-00918: column ambiguously defined


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, last_name, job_id, department_id, department_name
  2  FROM employees JOIN departments
  3* USING (manager_id)
SQL> /
SELECT employee_id, last_name, job_id, department_id, department_name
                                       *
ERROR at line 1:
ORA-00918: column ambiguously defined


SQL> SELECT l.city, d.department_name
  2  FROM locations l JOIN departments d
  3  USING(location_id)
  4  WHERE d.location_id=1400;
WHERE d.location_id=1400
      *
ERROR at line 4:
ORA-25154: column part of USING clause cannot have qualifier


SQL> SELECT employee_id, last_name, job_id, departments.department_id, department_name
  2  FROM employees JOIN departments
  3  USING (manager_id)
  4  /

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
DEPARTMENT_NAME
------------------------------
        101 Kochhar                   AD_VP                 90
Executive

        102 De Haan                   AD_VP                 90
Executive

        104 Ernst                     IT_PROG               60
IT




44 rows selected.

SQL> set lines 3000
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID DEPARTMENT_NAME
----------- ------------------------- ---------- ------------- ------------------------------
        101 Kochhar                   AD_VP                 90 Executive
        102 De Haan                   AD_VP                 90 Executive
        104 Ernst                     IT_PROG               60 IT
        105 Austin                    IT_PROG               60 IT
        106 Pataballa                 IT_PROG               60 IT
        107 Lorentz                   IT_PROG               60 IT
        109 Faviet                    FI_ACCOUNT           100 Finance
        110 Chen                      FI_ACCOUNT           100 Finance
        111 Sciarra                   FI_ACCOUNT           100 Finance
        112 Urman                     FI_ACCOUNT           100 Finance
        113 Popp                      FI_ACCOUNT           100 Finance

44 rows selected.

SQL> SELECT l.city, d.department_name
  2  FROM locations l JOIN departments d USING(location_id)
  3  WHERE location_id=1400;

CITY                           DEPARTMENT_NAME
------------------------------ ------------------------------
Southlake                      IT

SQL> SELECT first_name, e.department_name, d.manager_id
  2  FROM employees e JOIN departments d USING (department_id)
  3  WHERE department_id =50;
SELECT first_name, e.department_name, d.manager_id
                   *
ERROR at line 1:
ORA-00904: "E"."DEPARTMENT_NAME": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  SELECT first_name, e.department_name, d.manager_id
  2  FROM employees e JOIN departments d USING (department_id)
  3* WHERE department_id =50

SELECT first_name, e.department_name, d.manager_id
                   *
ERROR at line 1:
ORA-00904: "E"."DEPARTMENT_NAME": invalid identifier


SELECT first_name, e.department_name, d.manager_id
                   *
ERROR at line 1:
ORA-00904: "E"."DEPARTMENT_NAME": invalid identifier


SQL> desc departments
 Name
                                               Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- --------------------------------------------------------------------------------------------------------------------
 DEPARTMENT_ID
                                               NOT NULL NUMBER(4)
 DEPARTMENT_NAME
                                               NOT NULL VARCHAR2(30)
 MANAGER_ID
                                                        NUMBER(6)
 LOCATION_ID
                                                        NUMBER(4)

SQL> desc employees
 Name
                                               Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- --------------------------------------------------------------------------------------------------------------------
 EMPLOYEE_ID
                                               NOT NULL NUMBER(6)
 FIRST_NAME
                                                        VARCHAR2(20)
 LAST_NAME
                                               NOT NULL VARCHAR2(25)
 EMAIL
                                               NOT NULL VARCHAR2(25)
 PHONE_NUMBER
                                                        VARCHAR2(20)
 HIRE_DATE
                                               NOT NULL DATE
 JOB_ID
                                               NOT NULL VARCHAR2(10)
 SALARY
                                                        NUMBER(8,2)
 COMMISSION_PCT
                                                        NUMBER(2,2)
 MANAGER_ID
                                                        NUMBER(6)
 DEPARTMENT_ID
                                                        NUMBER(4)

SQL> ed
Wrote file afiedt.buf

  1  SELECT first_name, d.department_name, e.manager_id
  2  FROM employees e JOIN departments d USING (department_id)
  3* WHERE department_id =50
SQL> /

FIRST_NAME           DEPARTMENT_NAME                MANAGER_ID
-------------------- ------------------------------ ----------
Matthew              Shipping                              100
Adam                 Shipping                              100
Payam                Shipping                              100
Shanta               Shipping                              100
Kevin                Shipping                              100
Julia                Shipping                              120
Irene                Shipping                              120
James                Shipping                              120
Steven               Shipping                              120
Laura                Shipping                              121
Mozhe                Shipping                              121


45 rows selected.

SQL> SELECT e.employee_id, e.last_name, e.department_id
  2  d.department_id, d.location_id
  3  FROM employees e JOIN departments d
  4  ON (e.department id = d.department id);
d.department_id, d.location_id
 *
ERROR at line 2:
ORA-00923: FROM keyword not found where expected


SQL> ed
Wrote file afiedt.buf

  1  SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
  2  FROM employees e JOIN departments d
  3* ON (e.department id = d.department id)
SQL> /
ON (e.department id = d.department id)
                 *
ERROR at line 3:
ORA-00920: invalid relational operator


SQL> ed
Wrote file afiedt.buf

  1  SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
  2  FROM employees e JOIN departments d
  3* ON (e.department_id = d.department_id)
SQL> /

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID DEPARTMENT_ID LOCATION_ID
----------- ------------------------- ------------- ------------- -----------
        200 Whalen                               10            10        1700
        201 Hartstein                            20            20        1800
        202 Fay                                  20            20        1800
        114 Raphaely                             30            30        1700
        115 Khoo                                 30            30        1700
        116 Baida                                30            30        1700
        117 Tobias                               30            30        1700
        118 Himuro                               30            30        1700
        119 Colmenares                           30            30        1700
        203 Mavris                               40            40        2400
        120 Weiss                                50            50        1500


106 rows selected.

SQL> SELECT employee_id, city, department_name
  2  FROM employees
  3  JOIN departments d
  4  ON d.department_id =    e.department_id
  5  JOIN locations l
  6  ON d.location_id=l.location_id;
ON d.department_id =    e.department_id
                        *
ERROR at line 4:
ORA-00904: "E"."DEPARTMENT_ID": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  SELECT employee_id, city, department_name
  2  FROM employees e
  3  JOIN departments d
  4  ON d.department_id =    e.department_id
  5  JOIN locations l
  6* ON d.location_id=l.location_id
SQL> /

EMPLOYEE_ID CITY                           DEPARTMENT_NAME
----------- ------------------------------ ------------------------------
        100 Seattle                        Executive
        101 Seattle                        Executive
        102 Seattle                        Executive
        103 Southlake                      IT
        104 Southlake                      IT
        105 Southlake                      IT
        106 Southlake                      IT
        107 Southlake                      IT
        108 Seattle                        Finance
        109 Seattle                        Finance
        110 Seattle                        Finance

106 rows selected.

SQL> SELECT e.employee_id, l.city, d.department_name
  2  FROM employees e
  3  JOIN departments d
  4  USING (department_id)
  5  JOIN locations l
  6  USING(location_id);

EMPLOYEE_ID CITY                           DEPARTMENT_NAME
----------- ------------------------------ ------------------------------
        100 Seattle                        Executive
        101 Seattle                        Executive
        102 Seattle                        Executive
        103 Southlake                      IT
        104 Southlake                      IT
        105 Southlake                      IT
        106 Southlake                      IT
        107 Southlake                      IT
        108 Seattle                        Finance
        109 Seattle                        Finance
        110 Seattle                        Finance

106 rows selected.

SQL> SELECT e.employee_id, e.last_name, e.department_id, d.department_id,d.location_id
  2  FROM employees e JOIN departments d
  3  ON (e.department_id = d.department_id)
  4  AND e.manager_id =149;

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID DEPARTMENT_ID LOCATION_ID
----------- ------------------------- ------------- ------------- -----------
        174 Abel                                 80            80        2500
        175 Hutton                               80            80        2500
        179 Johnson                              80            80        2500
        177 Livingston                           80            80        2500
        176 Taylor                               80            80        2500

SQL> SElECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
  2  FROM employees e JOIN departments d
  3  ON (e.department_id = d.department_id)
  4  WHERE e.manager_id=149;

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID DEPARTMENT_ID LOCATION_ID
----------- ------------------------- ------------- ------------- -----------
        174 Abel                                 80            80        2500
        175 Hutton                               80            80        2500
        179 Johnson                              80            80        2500
        177 Livingston                           80            80        2500
        176 Taylor                               80            80        2500

SQL> SELECT worker.last_name emp, manager.last_name mgr
  2  FROM employees worker JOIN employees manager
  3  ON (worker.manager_id =manager.employee_id);

EMP                       MGR
------------------------- -------------------------
Bates                     Cambrault
Bloom                     Cambrault
Fox                       Cambrault
Kumar                     Cambrault
Ozer                      Cambrault
Smith                     Cambrault
Hunold                    De Haan
Ande                      Errazuriz
Banda                     Errazuriz
Greene                    Errazuriz
Lee                       Errazuriz

106 rows selected.

SQL> SELECT e.last_name, e.salary, j.grade_level
  2  FROM employees e JOIN job_grades j
  3  ON e.salary
  4  BETWEEN j.lowest_sal AND j.highest_sal;
FROM employees e JOIN job_grades j
                      *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> SELECT l.city, d.department_name
  2  FROM locations l JOIN departments d USING (location_id)
  3  /

CITY                           DEPARTMENT_NAME
------------------------------ ------------------------------
Southlake                      IT
South San Francisco            Shipping
Seattle                        Administration
Seattle                        Purchasing
Seattle                        Executive
Seattle                        Finance
Seattle                        Accounting
Seattle                        Treasury
Seattle                        Corporate Tax
Seattle                        Control And Credit
Seattle                        Shareholder Services


27 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  SELECT l.city, d.department_name
  2  FROM locations l JOIN departments d USING (location_id)
  3* WHERE location_id=1500
SQL> /

CITY                           DEPARTMENT_NAME
------------------------------ ------------------------------
South San Francisco            Shipping

SQL> SELECT *
  2  FROM employees
  3  WHERE ( department_id=50
  4  OR commission_pct IS NOT NULL
  5  OR salary<=2000)
  6  AND department_id=30;

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  SELECT *
  2  FROM employees
  3  WHERE ( department_id=50
  4  OR commission_pct IS NOT NULL
  5  OR salary<=2000)
  6* AND department_id=50
SQL> /

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        120 Matthew              Weiss                     MWEISS                    650.123.1234         18-JUL-04 ST_MAN           8000                      100            50
        121 Adam                 Fripp                     AFRIPP                    650.123.2234         10-APR-05 ST_MAN           8200                      100            50
        122 Payam                Kaufling                  PKAUFLIN                  650.123.3234         01-MAY-03 ST_MAN           7900                      100            50
        123 Shanta               Vollman                   SVOLLMAN                  650.123.4234         10-OCT-05 ST_MAN           6500                      100            50
        124 Kevin                Mourgos                   KMOURGOS                  650.123.5234         16-NOV-07 ST_MAN           5800                      100            50
        125 Julia                Nayer                     JNAYER                    650.124.1214         16-JUL-05 ST_CLERK         3200                      120            50
        126 Irene                Mikkilineni               IMIKKILI                  650.124.1224         28-SEP-06 ST_CLERK         2700                      120            50
        127 James                Landry                    JLANDRY                   650.124.1334         14-JAN-07 ST_CLERK         2400                      120            50
        128 Steven               Markle                    SMARKLE                   650.124.1434         08-MAR-08 ST_CLERK         2200                      120            50
        129 Laura                Bissot                    LBISSOT                   650.124.5234         20-AUG-05 ST_CLERK         3300                      121            50
        130 Mozhe                Atkinson                  MATKINSO                  650.124.6234         30-OCT-05 ST_CLERK         2800                      121            50

45 rows selected.

SQL> select last_name||' '||first_name as name, department_id, salary
  2  FROM employees;

NAME                                           DEPARTMENT_ID     SALARY
---------------------------------------------- ------------- ----------
King Steven                                               90      24000
Kochhar Neena                                             90      17000
De Haan Lex                                               90      17000
Hunold Alexander                                          60       9000
Ernst Bruce                                               60       6000
Austin David                                              60       4800
Pataballa Valli                                           60       4800
Lorentz Diana                                             60       4200
Greenberg Nancy                                          100      12008
Faviet Daniel                                            100       9000
Chen John                                                100       8200

107 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select first_name||' '||last_name as name, department_id, salary
  2* FROM employees
SQL> /

NAME                                           DEPARTMENT_ID     SALARY
---------------------------------------------- ------------- ----------
Steven King                                               90      24000
Neena Kochhar                                             90      17000
Lex De Haan                                               90      17000
Alexander Hunold                                          60       9000
Bruce Ernst                                               60       6000
David Austin                                              60       4800
Valli Pataballa                                           60       4800
Diana Lorentz                                             60       4200
Nancy Greenberg                                          100      12008
Daniel Faviet                                            100       9000
John Chen                                                100       8200


107 rows selected.

SQL> select salary as sal, commission_pct comm
  2  FROM employees;

       SAL       COMM
---------- ----------
     24000
     17000
     17000
      9000
      6000
      4800
      4800
      4200
     12008
      9000
      8200

42 rows selected.

SQL> SELECT *
  2  FROM (
  3  SELECT salary as sal, commission_pct as comm
  4  FROM employees)
  5  WHERE salary<5000;
WHERE salary<5000
      *
ERROR at line 5:
ORA-00904: "SALARY": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  SELECT *
  2  FROM (
  3  SELECT salary as sal, commission_pct as comm
  4  FROM employees
  5  )
  6* WHERE salary<5000
SQL> /
WHERE salary<5000
      *
ERROR at line 6:
ORA-00904: "SALARY": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  SELECT *
  2  FROM (
  3  SELECT salary as sal, commission_pct as comm
  4  FROM employees
  5  ) X
  6* WHERE salary<5000
SQL> /
WHERE salary<5000
      *
ERROR at line 6:
ORA-00904: "SALARY": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  SELECT *
  2  FROM (
  3  SELECT salary as sal, commission_pct as comm
  4  FROM employees
  5  ) as X
  6* WHERE salary < 5000
SQL> /
) as X
  *
ERROR at line 5:
ORA-00933: SQL command not properly ended


SQL> ed
Wrote file afiedt.buf

  1  SELECT *
  2  FROM (
  3  SELECT salary as sal, commission_pct as comm
  4  FROM employees
  5  ) X,
  6* WHERE salary < 5000
SQL> /
WHERE salary < 5000
*
ERROR at line 6:
ORA-00903: invalid table name


SQL>            _name, job_id, hire_date startdate
SQL> /
WHERE salary < 5000
*
ERROR at line 6:
ORA-00903: invalid table name


SQL> /
WHERE salary < 5000
*
ERROR at line 6:
ORA-00903: invalid table name


SQL>

SElECT employee_id, last_name, job_id, d.department_id, e.manager_id, department_name
FROM employees e JOIN departments d
USING(manager_id);
-- ORA-25154: column part of USING clause cannot have qualifier


SELECT employee_id, job_id, job_title
FROM employees JOIN jobs
USING (job_id);


SELECT  employee_id, last_name, department_id, manager_id
FROM employees NATURAL JOIN  departments;
-- natural join using a where clause
SELECT department_id, department_name, location_id, CITY
FROM  departments NATURAL JOIN locations
WHERE  department_id IN (20, 50);
DEPARTMENT_ID DEPARTMENT_NAME                LOCATION_ID CITY
------------- ------------------------------ ----------- ------------------------------
           20 Marketing                             1800 Toronto
           50 Shipping                              1500 South San Francisco
-- RETRIEVING RECORDS with USING clause
SELECT employee_id, last_Name, location_id, department_id
FROM employees JOIN departments
USING(department_id);

EMPLOYEE_ID LAST_NAME                 LOCATION_ID DEPARTMENT_ID
----------- ------------------------- ----------- -------------
        200 Whalen                           1700            10
        201 Hartstein                        1800            20
        202 Fay                              1800            20
        114 Raphaely                         1700            30
        115 Khoo                             1700            30
        116 Baida                            1700            30
        117 Tobias                           1700            30
        118 Himuro                           1700            30
        119 Colmenares                       1700            30
        203 Mavris                           2400            40
        120 Weiss                            1500            50

-- using table aliases with the    USING   clause
SELECT l.city, d.department_name
FROM locations l JOIN departments d
USING(location_id)
WHERE d.location_id=1400;
ORA-25154: column part of USING clause cannot have qualifier


-- 1.	The HR department wants a query to display the last name, job code, hire date, and employee number for each employee, with employee number appearing first. Provide an alias STARTDATE for the HIRE_DATE column.

SElECT employee_id, last_name, job_id, hire_date startdate
FROM Employees;
-- 2.	The HR department needs a query to display all unique job codes from the EMPLOYEES table.
SELECT DISTINCT JOB_ID
FROM employees;
-- 3.	The HR department wants a query to display the last name, job code, hire date, and employee number for each employee, with employee number appearing first. Name the column headings Emp #, Employee, Job, and Hire Date, respectively.
SELECT employee_id AS "Emp#", last_name "Employee", job_id "Job", HIRE_DATE "Hire Date"
FROM employees;
-- 4.	The HR department has requested a report of all employees and their job IDs. Display the last name concatenated with the job ID (separated by a comma and space) and name the column Employee and Title.
SELECT last_name||' , '||job_id AS "Employee and Title"
FROM employees;
-- 5.	Create a report to display the last name, job ID, and start date for the employees with the last names of Matos and Taylor. Order the query in ascending order by start date.
SELECT last_name, job_id, hire_date
FROM employees
WHERE last_name IN( 'Matos', 'Taylor');
--6.	To display the last name and salary of employees who earn between $5,000 and $12,000 and are in department 20 or 50. Label the columns Employee and Monthly Salary, respectively.
SELECT last_name "employee", salary "Monthly Salary"
FROM employees
WHERE salary BETWEEN (5000 AND 12000)
AND department_id(20 or 50)  ;

SELECT last_name "Employee", salary "Monthly Salary"
FROM employees
WHERE salary BETWEEN 5000 AND 12000

SELECT LAST_NAME, SALARY, COMMISSION_PCT
FROM Employees
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY (SALARY, COMMISSION_PCT) DESC; 




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

1. The HR department wants a query to display the last name, job code, hire date, and employee number for each employee, with employee number appearing first. Provide an alias STARTDATE for the HIRE_DATE column.

select employee_id,last_name,job_id,hire_id"STARTDATE"
FROM EMPLOYEES;
2.
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;
3.
SELECT employee_id"Emp#",last_name"Employee", job_id"Job", hire_date"Hire_Date"
from employees;
4. 
select last_name ||', '|| job_id "Employee and Title"
from employee;
5.
select last_name,job_id,hire_date
from employees
where last_name in('Matos','Taylor')
order by hire_date;
6.
select last_name "Employee", salary"Monthly Salary"
from employees
where salary between 5000 and 12000
and department_id in (20,50);
7.
select last_name, hire_date
from employees
where hire_date LIKE '%05';
8.
select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by 2 asc, 3 asc;
9. 
select last_name
from employees
where last_name like '%a%'
and last_name like '%e%';
10.
select last_name,hire_date,salary, to_char(next_day(add_months(sysdate,6),'Monday'),'fmday, "the" ddspth "of" Month, yyyy') "Review"
from employees;
11.
select last_name,nvl(to_char(commission_pct),'No Commission') COMM
from employees;
12.
select last_name, hire_date, to_char(hire_date,'day') day
from employees
order by to_char(hire_date-3,'day');
13.
select count(distinct manager_id) "Number of Manager"
from employees;
14.
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id 
having min(salary) > 6000
order by min(salary);
15.
select employee_id,last_name,salary, round(salary*1.115,0) "New Salary", round(salary*1.115,0)-salary "Increase"
from employees;
16.
select initcap ( last_name) name, length(last_name) lenth
from employees
where last_name like '%J%'
or last_name like '%A%'
or last_name like '%M%'
order by last_name;
17.
select last_name, round(months_between(sysdate,hire_date)) "months_worked"
from employees
order by months_worked ;
18.
select last_name, lpad(salary,15,'$') salary
from employees;
19.
select substr(last_name,1,8), rpad('',salary/1000,'*') "EMPLOYEES_AND_THEIR_SALARIES"
from employees
order by salary desc;
20.
select to_char(hire_date,'fmddspth "of" Month yyyy fmhh:mi:ss AM')
from employees; 
21.
select last_name,job_id
from employees
where manager_id is null;
22. 
select last_name,hire_date
from employees
where department_id = (select department_id
			from employees
			where last_name='&&Enter_name')
and last_name<>'&Enter_name';
23.
select last_name,department_id,job_id
from employees
where department_id in (select department_id
			from departments
			where location_id =1700);
24.
select last_name
from employees
where salary >any (select salary
		from employees
		where department_id=60);
25.
select e.last_name,e.job_id,e.department_id,d.department_name
from employees e join departments d
on (e.department_id=d.department_id)
join locations l
using (location_id)
where lower (l.city)= 'toronto';
26.
select e.department_id department, e.last_name employee, m.last_name colleague
from employees e join employees m
on (e.department_id=m.department_id)
where e.employee_id<>m.employee_id
order by e.department_id, e.last_name,m.last_name;
27. 
select e.last_name,e.hire_date
from employees e join employees m
on (m.last_name='Davies')
where m.hire_date<e.hire_date;


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















-- $$$$$$$$$$$$$$$$$$$   chapter 10  $$$$$$$$$$$$$$$$$$$$



-- ?????????????????????????????????????????????????????
-- for UPDATE clause in a select statement for multiple clause
SELECT e.employee_id, e.salary, e.commission_pct
FROM employees e JOIN departments d
USING (department_id)
WHERE job_id= 'ST_CLERK'
AND location_id=1500
FOR UPDATE
ORDER BY e.employee_id;

EMPLOYEE_ID     SALARY COMMISSION_PCT
----------- ---------- --------------
        125       3200
        126       2700
        127       2400
        128       2200
        129       3300
        130       2800
        131       2500
        132       2100
        133       3300
        134       2900
        135       2400
20 rows selected.

SELECT e.employee_id, e.


-- 1
CREATE TABLE my_employee(id NUMBER(4) CONSTRAINT my_employee_id_pk PRIMARY Key, last_name VARCHAR2 (25), first_name VARCHAR2(25), user_id VARCHAR2(8),Salary NUMBER(9,2));

INSERT INTO departments
VALUES(600,'Test_dept1',101, 1200 );
INSERT INTO departments
VALUES(610,'Test_dept2',101, 1200 );
INSERT INTO departments
VALUES(620,'Test_dept3',NULL, NULL );
INSERT INTO departments
VALUES(630,'Test_dept4',NULL, NULL );



SELECT * FROM departments
WHERE department_id >=600;

INSERT INTO employees (employee_id, last_name, EMAIL, hire_date, JOB_ID, salary, department_id)
VALUES (400, 'NOOR', 'kznrahmd@gmail.com', SYSDATE, 'IT_PROG', 10000, 60);

INSERT INTO employees (employee_id, last_name, EMAIL, hire_date, JOB_ID, salary, department_id)
VALUES (401, 'NOOR AHMED', 'kznrahmd3@gmail.com', TO_DATE('MARCH 02, 25', 'MONTH DD, YY'), 'IT_PROG', 10000, 60);

INSERT INTO employees (employee_id, last_name, EMAIL, hire_date, JOB_ID, salary, department_id)
VALUES (402, 'Noor Ahmed', 'kznrahmd120225@gmail.com', SYSDATE, 'IT_PROG', 10000, 60);

CREATE TABLE sales_reps(
        id NUMBER(8),
        name VARCHAR2(30),
        salary NUMBER(8,2),
        commission_pct NUMBER(2,2));

SELECT * from sales_reps;


INSERT INTO sales_reps
SELECT employee_id, last_name, salary, commission_pct
FROM employees where job_id LIKE '%REP%';

CREATE TABLE copy_emp
AS select * from employees;
-- copy_emp is just employees table er replica create korlam amra

select count (*) from copy_emp;


SELECT employee_id, last_name, job_id, department_id
FROM copy_emp
WHERE department_id=60;


UPDATE copy_emp 
SET department_id =80
WHERE department_id= 60;


SELECT employee_id, last_name, job_id, department_id
FROM copy_emp
WHERE JOB_ID='IT_PROG';

UPDATE copy_emp 
SET department_id = 180
WHERE department_id= 80;


UPDATE copy_emp set  department_id =110
where department_id=180;

DELETE copy_emp
WHERE employee_id > 200;

SELECT * FROM copy_emp WHERE employee_id>200;

DELETE FROM copy_emp;


SELECT COUNT(*) FROM copy_emp ;


--  DELETING ROWS based on another table

--  TRUNCATE removes all rows from table permanenctly, r  rollback kora jabe na,
--  TABLE ER khali structure ta thake r kono data thake na
TRUNCATE TABLE copy_emp;

-- ROLLBACK 
r


INSERT into copy_emp 
select * FROM copy_emp;
-- -- removing rows from a table, how to use unwanted rows omit
-- truncate table er shokol data empty hobe
-- delete diye specific rows ke specify kore delte kora jabe
-- commit permanent
-- undo rollback




/* chapter 11 */


-- table creation

CREATE TABLE dept(deptno NUMBER(2), dname VARCHAR2(14), loc  VARCHAR2 (13), create_date DATE DEFAULT SYSDATE);

INSERT INTO dept 
VALUES (10, 'IT', 'Dhaka', '05-JAN-25');
commit;
SELECT * FROM dept;


INSERT INTO dept(DEPTNO, DNAME, LOC)
VALUES (30, 'PROCUREMENT', 'Dhaka');

INSERT INTO dept
VALUES (20, 'ACCOUNTING', 'Dhaka', NULL);




CREATE TABLE test_cons
(id number(4) primary key, name VARCHAR2(20));
-- Table created.
desc user_constraints
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 OWNER                                              VARCHAR2(128)
 CONSTRAINT_NAME                           NOT NULL VARCHAR2(128)
 CONSTRAINT_TYPE                                    VARCHAR2(1)
 TABLE_NAME                                NOT NULL VARCHAR2(128)
 SEARCH_CONDITION                                   LONG
 SEARCH_CONDITION_VC                                VARCHAR2(4000)
 R_OWNER                                            VARCHAR2(128)
 R_CONSTRAINT_NAME                                  VARCHAR2(128)
 DELETE_RULE                                        VARCHAR2(9)
 STATUS                                             VARCHAR2(8)
 DEFERRABLE                                         VARCHAR2(14)
 DEFERRED                                           VARCHAR2(9)
 VALIDATED                                          VARCHAR2(13)
 GENERATED                                          VARCHAR2(14)
 BAD                                                VARCHAR2(3)
 RELY                                               VARCHAR2(4)
 LAST_CHANGE                                        DATE
 INDEX_OWNER                                        VARCHAR2(128)
 INDEX_NAME                                         VARCHAR2(128)
 INVALID                                            VARCHAR2(7)
 VIEW_RELATED                                       VARCHAR2(14)
 ORIGIN_CON_ID                                      NUMBER

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM user_constraints
WHERE TABLE_NAME='TEST_CONS';
CONSTRAINT_NAME
--------------------------------------------------------------------------------
C
-
TABLE_NAME
--------------------------------------------------------------------------------
SYS_C007687
P
TEST_CONS

CREATE TABLE test_cons1
(id number(4) CONSTRAINT tc_id_pk primary key, name VARCHAR2(20));

-- Table created.

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM user_constraints
WHERE TABLE_NAME='TEST_CONS1';


CONSTRAINT_NAME
--------------------------------------------------------------------------------
C
-
TABLE_NAME
--------------------------------------------------------------------------------
TC_ID_PK
P
TEST_CONS1


CREATE TABLE test_cons2
(id number(4), CONSTRAINT VARCHAR2(20) NOT NULL, CONSTRAINT tc2_id_pk primary key (id));
-- Table created.

CREATE TABLE dept11
(d_id NUMBER(4) PRIMARY key, d_name VARCHAR2(20) NOT NULL);

create table emp11
(e_id number (3) primary key, 
e_name VARCHAR2 (20) NOT NULL, 
d_id NUMBER(4) References dept11(d_id));


INSERT INTO dept11
VALUES(10,'IT');


COMMIT;


INSERT INTO emp11
VALUES(101,'Rocky Bhai', NULL);
INSERT INTO emp11
VALUES(102,'Thangabali', NULL);
INSERT INTO emp11
VALUES(103,'Haramzada', NULL);
INSERT INTO dept11
VALUES(11,'MAN');
INSERT INTO dept11
VALUES(12,'OPERATION');
INSERT INTO dept11
VALUES(13,'SOFTWARE');



Create table 
teach_emp 
( empno NUMBER(5) PRIMARY KEY,
ename VARCHAR2(15) NOT NULL, job VARCHAR2(10), mgr NUMBER(5), email VARCHAR2(20) unique, hiredate date DEFAULT (sysdate),
photo BLOB, sal NUMBER(7,2) CONSTRAINT emp_sal_min CHECK (sal>1000),
deptno NUMBER (3) NOT NULL 
CONSTRAINT admin_dept_fkey REFERENCES departments(department_id))

INSERT INTO teach_emp VALUES(012,'shoytan','shoytani', 105, 'shoytan@gmail.com', sysdate, null, 20000, 50);
INSERT INTO teach_emp VALUES(013,'shoytan1','shoytani', 105, 'shoytan4@gmail.com', sysdate, null, 20000, 50);
INSERT INTO teach_emp VALUES(014,'shoytan11','shoytani', 105, 'shoytan3@gmail.com', sysdate, null, 20000, 50);
INSERT INTO teach_emp VALUES(012,'ashik','shoytani', 105, 'shoytan@gmail.com', sysdate, null, 20000, 50);
INSERT INTO teach_emp VALUES(013,'shamol','shoytani', 105, 'shoytan34@gmail.com', sysdate, null, 20000, 50);
INSERT INTO teach_emp VALUES(014,'robiul','shoytani', 105, 'shoytan53@gmail.com', sysdate, null, 20000, 50);
