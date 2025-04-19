1
create table dept27(dept_id number(5) constraint dept1_id_pk primary key, name varchar2(30));



alter table dept27
  2  drop constraint dept1_id_pk;

  create table emp27( emp_id number(5), l_name varchar2(30), f_name varchar2(30), 
salary number(8) constraint)









4.

create table emp27 (
emp_id number(5),
l_name varchar2(30),
f_name varchar2(30),
salary number(8) constraint emp27_chk_salary check(salary>500),
user_id varchar2(10))

5.

 alter table emp27
 add dept_id number(5)

6.

alter table dept27
modify name varchar2(35);

7.

alter table emp27
drop column user_id

8.

alter table emp27
add constraint my__emp27_emp_id_pk primary key (emp_id);

9. 

alter table emp27
add constraint my_emp27_dept_id_fk
foreign key (dept_id) references dept27


10.

alter table emp27
modify l_name varchar(30) not null;

11.

select constraint_name, constraint_type
from user_constraints
where table_name = 'EMP27'

12.

drop table emp27;
flashback table emp27 to before drop;

13.

INSERT ALL WHEN SAL > 20000 THEN 
INTO  special_sal VALUES (EMPID, SAL) 
ELSE INTO sal_history VALUES(EMPID,HIREDATE,SAL) 
INTO mgr_history VALUES(EMPID,MGR,SAL) 
SELECT employee_id EMPID, hire_date HIREDATE, salary SAL, manager_id MGR 
FROM employees  
WHERE employee_id < 125;

SELECT * FROM  special_sal;


SELECT * FROM  sal_history;

SELECT * FROM mgr_history;


14.

 create table sales_source_data(
employee_id number(6),
week_id number(2),
sales_mon number(8,2),
sales_wed number(8,2),
sales_thur number(8,2),
sales_fri number (8,2))

 




-- full book
1.
conn/ as sysdba

2.
 create user patel identified by patel;

3.

 grant create session, create view, create table, create sequence
 to patel;

4.
CREATE TABLE DEPT27(DEPT_ID NUMBER(5) CONSTRAINT DEPT_ID PRIMARY KEY, NAME VARCHAR2(30));

5.
CREATE TABLE EMPT27 (EMP_ID NUMBER(5), L_NAME VARCHAR2(30), F_NAME VARCHAR2(30), SALARY NUMBER(8) CONSTRAINT EMP_CHK_SALARY CHECK (SALARY>500), USER_ID VARCHAR2(10))

6.
ALTER TABLE DEPT27
MODIFY NAME VARCHAR2(35);

7.
 ALTER TABLE EMPT27
 DROP COLUMN USER_ID;

8.
ALTER TABLE EMPT27
ADD CONSTRAINT MY_EMP27_EMP_ID_PK PRIMARY KEY(EMP_ID);



-- 222222222222222


1.	Query the data dictionary to see information about the tables you  own. 

SELECT table_name 
   FROM   user_tables; 
 
2.	Query the dictionary view to see information about all the tables that you can access. 
Exclude tables that you own. 

SELECT table_name, owner 
  FROM   all_tables 
  WHERE  owner <>'ORAxx'; 
 
3.	For a specified table, create a script that reports the column names, data types, and data types’ lengths, as well as whether nulls are allowed. Prompt the user to enter the table name. Give appropriate aliases to the DATA_PRECISION and DATA_SCALE columns. Save this script in a file named lab_02_03.sql.  

SELECT column_name, data_type, data_length, 
       data_precision PRECISION, data_scale SCALE, nullable 
FROM   user_tab_columns 
WHERE  table_name = UPPER('&tab_name'); 
To test, run the script and enter DEPARTMENTS as the table name. 

4.	Create a script that reports the column name, constraint name, constraint type, search condition, and status for a specified table. You must join the USER_CONSTRAINTS and USER_CONS_COLUMNS tables to obtain all this information. Prompt the user to enter the table name. Save the script in a file named lab_02_04.sql. 

SELECT ucc.column_name, uc.constraint_name, uc.constraint_type,           uc.search_condition, uc.status 
FROM   user_constraints uc JOIN user_cons_columns ucc 
ON     uc.table_name = ucc.table_name 
AND    uc.constraint_name = ucc.constraint_name AND    uc.table_name = UPPER('&tab_name');  
 	To test, run the script and enter DEPARTMENTS as the table name. 

5.	Add a comment to the DEPARTMENTS table. Then query the USER_TAB_COMMENTS view to verify that the comment is present. 

COMMENT ON TABLE departments IS  
  'Company department information including name, code, and location.'; 
 
SELECT COMMENTS  
FROM   user_tab_comments 
WHERE  table_name = 'DEPARTMENTS';  
 

6.	Run the lab_02_06_tab.sql script as a prerequisite for exercises 6 through 9. 
Alternatively, open the script file to copy the code and paste it into your SQL Worksheet. Then execute the script. This script: 
	Drops the DEPT2 and EMP2 tables 
	Creates the DEPT2 and EMP2 tables 

7.	Confirm that both the DEPT2 and EMP2 tables are stored in the data dictionary. 

SELECT   table_name 
FROM     user_tables 
WHERE    table_name IN ('DEPT2', 'EMP2');  
 
8.	Query the data dictionary to find out the constraint names and types for both the tables. 

SELECT   constraint_name, constraint_type FROM     user_constraints 
WHERE    table_name IN ('EMP2', 'DEPT2');  
 
9.	Display the object names and types from the USER_OBJECTS data dictionary view for the EMP2 and DEPT2 tables. 

SELECT   object_name, object_type 
FROM     user_objects 
WHERE    object_name= 'EMP2' 
OR       object_name= 'DEPT2'; 



3.333
1.	Create the DEPT table based on the following table instance chart. Confirm that the table is created. 
Column Name 	ID 	NAME 
Key Type 	Primary key 	 
Null/Unique 	 	 
FK Table 	 	 
FK Column 	 	 
Data Type 	NUMBER 	VARCHAR2 
Length 	7 	25 
 
CREATE TABLE dept 
 (id   NUMBER(7)CONSTRAINT department_id_pk PRIMARY KEY,   name VARCHAR2(25)); 
     
To confirm that the table was created and to view its structure, issue the following command: 
DESCRIBE dept; 

2.	You need a sequence that can be used with the primary key column of the DEPT table. The sequence should start at 200 and have a maximum value of 1,000. Have your sequence increment by 10. Name the sequence DEPT_ID_SEQ. 

CREATE SEQUENCE dept_id_seq 
  START WITH 200 
  INCREMENT BY 10 
  MAXVALUE 1000; 
 
3.	To test your sequence, write a script to insert two rows in the DEPT table. Name your script lab_03_03.sql. Be sure to use the sequence that you created for the ID column. Add two departments: Education and Administration. Confirm your additions. Run the commands in your script. 

INSERT INTO dept 
VALUES (dept_id_seq.nextval, 'Education'); 
INSERT INTO dept 
VALUES (dept_id_seq.nextval, 'Administration'); 
 
 	 
4.	Find the names of your sequences. Write a query in a script to display the following information about your sequences: sequence name, maximum value, increment size, and last number. Name the script lab_03_04.sql. Run the statement in your script. 
 
SELECT   sequence_name, max_value, increment_by, last_number FROM user_sequences; 
 
5.	Create a synonym for your EMPLOYEES table. Call it EMP1. Then find the names of all synonyms that are in your schema. 

CREATE SYNONYM emp1 FOR EMPLOYEES; 
SELECT *  
FROM   user_synonyms; 
 
6.	Drop the EMP1 synonym.  

DROP SYNONYM emp1; 

7.	Create a nonunique index on the NAME column in the DEPT table. 

CREATE INDEX dept_name_idx ON dept (name); 
 
8.	Create the SALES_DEPT table based on the following table instance chart. Name the index for the PRIMARY KEY column SALES_PK_IDX. Then query the data dictionary view to find the index name, table name, and whether the index is unique. 
        Column Name 	Team_Id 	Location 	
	Primary Key 	Yes 	 	
	Data Type 	Number 	VARCHAR2 	
	Length 	3 	30 	
 
CREATE TABLE SALES_DEPT   
       (team_id NUMBER(3) 
       PRIMARY KEY USING INDEX 
       (CREATE INDEX sales_pk_idx ON         SALES_DEPT(team_id)),         location VARCHAR2(30)); 
SELECT INDEX_NAME, TABLE_NAME, UNIQUENESS 
FROM USER_INDEXES 
WHERE TABLE_NAME = 'SALES_DEPT'; 
 
 
9.	Drop the tables and sequences created in this practice. 
DROP TABLE DEPT; 
DROP TABLE SALES_DEPT; 
DROP SEQUENCE dept_id_seq; 


4444..

1.	The staff in the HR department wants to hide some of the data in the EMPLOYEES table. Create a view called EMPLOYEES_VU based on the employee numbers, employee last names, and department numbers from the EMPLOYEES table. The heading for the employee name should be EMPLOYEE. 

CREATE OR REPLACE VIEW employees_vu AS 
    SELECT employee_id, last_name employee, department_id     FROM employees; 
 

2.	Confirm that the view works. Display the contents of the EMPLOYEES_VU view. 

SELECT   * 
FROM     employees_vu; 
 
3.	Using your EMPLOYEES_VU view, write a query for the HR department to display all employee names and department numbers. 

SELECT   employee, department_id  
FROM     employees_vu; 
 

4.	Department 80 needs access to its employee data. Create a view named DEPT80 that contains the employee numbers, employee last names, and department numbers for all employees in department 80. They have requested that you label the view columns EMPNO, EMPLOYEE, and DEPTNO. For security purposes, do not allow an employee to be reassigned to another department through the view. 

CREATE VIEW dept80 AS    
   SELECT   employee_id empno, last_name employee,             department_id deptno    FROM     employees 
   WHERE    department_id = 80 
   WITH CHECK OPTION CONSTRAINT emp_dept_80; 
 

5.	Display the structure and contents of the DEPT80 view. 
DESCRIBE dept80 
 
SELECT   * 
FROM     dept80; 
 

6.	Test your view. Attempt to reassign Abel to department 50. 
UPDATE   dept80 SET      deptno = 50 
WHERE    employee = 'Abel'; 
The error is because the DEPT50 view has been created with the WITH CHECK OPTION constraint. This ensures that the DEPTNO column in the view is protected from being changed. 

7.	Run lab_04_07.sql to create the dept50 view for this exercise. You need to determine the names and definitions of all the views in your schema. Create a report that retrieves view information: the view name and text from the USER_VIEWS data dictionary view. 
Note: The EMP_DETAILS_VIEW was created as part of your schema.  
Note: You can see the complete definition of the view if you use Run Script (or press F5) in SQL Developer. If you use Execute Statement (or press F9) in SQL Developer, scroll horizontally in the result pane. If you use SQL*Plus to see more contents of a LONG column, use the SET LONG n command, where n is the value of the number of characters of the LONG column that you want to see. 


SELECT   view_name, text 
FROM     user_views; 
 

8.	Remove the views created in this practice. 

DROP VIEW employees_vu; 
DROP VIEW dept80; 
DROP VIEW dept50; 
 	 
 
55555555
.
1.	Create the DEPT2 table based on the following table instance chart. Enter the syntax in the SQL Worksheet. Then, execute the statement to create the table. Confirm that the table is created. 
Column Name 	ID	NAME
Key Type 	 	 
Nulls/Unique 	 	 
FK Table 	 	 
FK Column 	 	 
Data type 	NUMBER	VARCHAR2 
Length 	7 	25 
 

CREATE TABLE dept2        (id NUMBER(7),         name VARCHAR2(25)); 
 
D
ESCRIBE dept2 
 
 
2.	Populate the DEPT2 table with data from the DEPARTMENTS table. Include only the columns that you need. 
      

INSERT INTO dept2 
      SELECT  department_id, department_name 
      FROM    departments; 
 
 
3.	Create the EMP2 table based on the following table instance chart. Enter the syntax in the SQL Worksheet. Then execute the statement to create the table. Confirm that the table is created. 
Column 
Name 	ID 	LAST_NAME 	FIRST_NAME 	DEPT_ID 
Key Type 	 	 	 	 
Nulls/Unique 	 	 	 	 
FK Table 	 	 	 	 
FK Column 	 	 	 	 
Data type 	NUMBER 	VARCHAR2 	VARCHAR2 	NUMBER 
Length 	7 	25 	25 	7 
 
 
 
      CREATE TABLE  emp2       (id           NUMBER(7),        last_name     VARCHAR2(25),        first_name    VARCHAR2(25),        dept_id       NUMBER(7)); 
 
      

DESCRIBE emp2 
 
 
4.	Add a table-level PRIMARY KEY constraint to the EMP2 table on the ID column. The constraint should be named at creation. Name the constraint my_emp_id_pk. 
      
ALTER TABLE    emp2 
      ADD CONSTRAINT my_emp_id_pk PRIMARY KEY (id);  


5.	Create a PRIMARY KEY constraint to the DEPT2 table using the ID column. The constraint should be named at creation. Name the constraint my_dept_id_pk.  
     

ALTER TABLE    dept2 
     ADD CONSTRAINT my_dept_id_pk PRIMARY KEY(id); 
 

6.	Add a foreign key reference on the EMP2 table that ensures that the employee is not assigned to a nonexistent department. Name the constraint my_emp_dept_id_fk.  
     
 ALTER TABLE emp2 
      ADD CONSTRAINT my_emp_dept_id_fk 
      FOREIGN KEY (dept_id) REFERENCES dept2(id); 
 

7.	Modify the EMP2 table. Add a COMMISSION column of the NUMBER data type, precision 2, scale 2. Add a constraint to the COMMISSION column that ensures that a commission value is greater than zero.  
     
 ALTER TABLE emp2 
      ADD commission NUMBER(2,2) 
      CONSTRAINT my_emp_comm_ck CHECK (commission > 0); 
 
8.	Drop the EMP2 and DEPT2 tables so that they cannot be restored.  
    
 DROP TABLE emp2 PURGE;      DROP TABLE dept2 PURGE; 
 
 
 	 
9.	Create an external table library_items_ext. Use the ORACLE_LOADER access driver.  
Note: The emp_dir directory and library_items.dat are already created for this exercise. Ensure that the external file and the database are on the same machine. 
 
library_items.dat has records in the following format: 
  2354,    2264, 13.21, 150,      2355,    2289, 46.23, 200, 
     2355,    2264, 50.00, 100, 
a. 	Open the lab_05_09.sql file. Observe the code snippet to create the  library_items_ext external table. Then, replace <TODO1>, <TODO2>,  
 <TODO3>, and <TODO4> as appropriate and save the file as lab_05_09_soln.sql. Run the script to create the external table.  


CREATE TABLE library_items_ext ( category_id   number(12) 
                               , book_id number(6) 
                               , book_price number(8,2)                                , quantity   number(8) 
                               ) 
ORGANIZATION EXTERNAL 
 (TYPE ORACLE_LOADER  
  DEFAULT DIRECTORY emp_dir 
  ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE                      FIELDS TERMINATED BY ',') 
 LOCATION ('library_items.dat') 
 ) 
REJECT LIMIT UNLIMITED; 


	b. 	Query the library_items_ext table. 
SELECT * FROM library_items_ext; 
 


10.	The HR department needs a report of addresses of all the departments. Create an external table as dept_add_ext using the ORACLE_DATAPUMP access driver. The report should show the location ID, street address, city, state or province, and country in the output. Use a NATURAL JOIN to produce the results. 
Note: The emp_dir directory is already created for this exercise. Ensure that the external file and the database are on the same machine. 
a.	Open the lab_05_10.sql file. Observe the code snippet to create the dept_add_ext external table. Then, replace <TODO1>, <TODO2>, and <TODO3> with appropriate code. Replace <oraxx_emp4.exp> and <oraxx_emp5.exp> with appropriate file names. For example, if you are user ora21, your file names are ora21_emp4.exp and ora21_emp5.exp. Save the script as lab_5_10_soln.sql. 
 	 
 
CREATE TABLE dept_add_ext (location_id,                            street_address, city,                            state_province,                            country_name) 
ORGANIZATION EXTERNAL( 
TYPE ORACLE_DATAPUMP 
DEFAULT DIRECTORY emp_dir 
LOCATION ('oraxx_emp4.exp','oraxx_emp5.exp')) 
PARALLEL 
AS  
SELECT location_id, street_address, city, state_province, country_name 
FROM locations  
NATURAL JOIN countries; 


Note: When you perform the preceding step, two files oraxx_emp4.exp and oraxx_emp5.exp are created under the default directory emp_dir. 
b.	Run the lab_05_10_soln.sql script to create the external table.  
c.	Query the dept_add_ext table. 


SELECT * FROM dept_add_ext; 
 
 
11.	Create the emp_books table and populate it with data. Set the primary key as deferred and observe what happens at the end of the transaction.  
a.	Run the lab_05_11_a.sql script to create the emp_books table. Observe that the emp_books_pk primary key is not created as deferrable. 
 
DROP TABLE emp_books CASCADE CONSTRAINTS; CREATE TABLE emp_books (book_id number, 
                       title varchar2(20), CONSTRAINT emp_books_pk  PRIMARY KEY (book_id)); 
 



b.	Run the lab_05_11_b.sql script to populate data into the emp_books table. 
What do you observe? 


INSERT INTO emp_books VALUES(300,'Organizations'); 
INSERT INTO emp_books VALUES(300,'Change Management'); 
The first row is inserted. However, you see the ora-00001 error with the second row insertion. 



c.	Set the emp_books_pk constraint as deferred. What do you observe? 


SET CONSTRAINT emp_books_pk DEFERRED; 



You see the following error: “ORA-02447: Cannot defer a constraint that is not deferrable.” 
 	 
d.	Drop the emp_books_pk constraint. 


ALTER TABLE emp_books DROP CONSTRAINT emp_books_pk; 


e.	Modify the emp_books table definition to add the emp_books_pk constraint as deferrable this time. 


ALTER TABLE emp_books ADD (CONSTRAINT emp_books_pk PRIMARY KEY 
(book_id) DEFERRABLE); 


f.	Set the emp_books_pk constraint as deferred. 


SET CONSTRAINT emp_books_pk DEFERRED;  


g.	Run the lab_05_11_g.sql script to populate data into the emp_books table. What do you observe? 

INSERT INTO emp_books VALUES (300,'Change Management'); 
INSERT INTO emp_books VALUES (300,'Personality'); 
INSERT INTO emp_books VALUES (350,'Creativity'); 

You see that all the rows are inserted. 
h.	Commit the transaction. What do you observe? 

COMMIT; 
 
You see that the transaction is rolled back by the database at this point, because the               COMMIT failed due to the constraint violation.  
 

66666.666
 1.	Write a query to display the last name, department number, and salary of any employee whose department number and salary match the department number and salary of any employee who earns a commission. 
   

 SELECT last_name, department_id, salary 
    FROM   employees 
    WHERE  (salary, department_id) IN  
              (SELECT  salary, department_id 
               FROM    employees 
             WHERE   commission_pct IS NOT NULL);   
 
2.	Display the last name, department name, and salary of any employee whose salary and job_ID match the salary and job_ID of any employee located in location ID 1700.  


SELECT e.last_name, d.department_name, e.salary  
FROM   employees e JOIN departments d ON  e.department_id = d.department_id 
AND  (salary, job_id) IN  
                          (SELECT e.salary, e.job_id 
                           FROM employees e JOIN departments d 
                           ON e.department_id = d.department_id 
                           AND d.location_id = 1700); 
 

3.	Create a query to display the last name, hire date, and salary for all employees who have the same salary and manager_ID as Kochhar. 
Note: Do not display Kochhar in the result set. 


SELECT last_name, hire_date, salary 
FROM   employees 
WHERE  (salary, manager_id) IN  
             (SELECT salary, manager_id 
              FROM   employees 
              WHERE  last_name = 'Kochhar') 
AND last_name != 'Kochhar'; 
 


4.	Create a query to display the employees who earn a salary that is higher than the salary of all the sales managers (JOB_ID = 'SA_MAN'). Sort the results on salary from the highest to the lowest. 
 
    SELECT last_name, job_id, salary 
    FROM   employees 
    WHERE  salary > ALL  
                 (SELECT salary 
                  FROM   employees 
    WHERE  job_id = 'SA_MAN')     ORDER BY salary DESC; 
 


5.	Display details such as the employee ID, last name, and department ID of those employees who live in cities the names of which begin with T. 
     

SELECT employee_id, last_name, department_id 
     FROM   employees 
     WHERE  department_id IN (SELECT department_id 
                              FROM departments 
                              WHERE location_id IN   
                                   (SELECT  location_id 
                                    FROM locations 
                                    WHERE city LIKE 'T%')); 
 

6.	Write a query to find all employees who earn more than the average salary in their departments. Display last name, salary, department ID, and the average salary for the department. Sort by average salary and round to two decimals. Use aliases for the columns retrieved by the query as shown in the sample output.  
 	 

SELECT e.last_name ename, e.salary salary,  
             e.department_id deptno, ROUND(AVG(a.salary),2) dept_avg 
       FROM   employees e, employees a 
       WHERE  e.department_id = a.department_id 
       AND    e.salary > (SELECT AVG(salary) 
                    FROM   employees 
                    WHERE  department_id = e.department_id )        GROUP BY e.last_name, e.salary, e.department_id 
       ORDER BY AVG(a.salary); 


7.	Find all employees who are not supervisors. 
a.	First, do this by using the NOT EXISTS operator. 
   


SELECT outer.last_name 
   FROM    employees outer 
   WHERE  NOT EXISTS (SELECT 'X' 
                      FROM employees inner                        WHERE inner.manager_id =                               outer.employee_id); 


b.	Can this be done by using the NOT IN operator? How, or why not? 


SELECT outer.last_name 
FROM   employees outer 
WHERE  outer.employee_id  
NOT IN (SELECT inner.manager_id         FROM   employees inner); 
 


This alternative solution is not a good one. The subquery picks up a NULL value, so the entire query returns no rows. The reason is that all conditions that compare a NULL value result in NULL. Whenever NULL values are likely to be part of the value set, do not use NOT IN as a substitute for NOT EXISTS. A much better solution would be a subquery like the following: 


SELECT last_name 
FROM employees  
WHERE employee_id NOT IN (SELECT manager_id 
                          FROM employees WHERE manager_id IS NOT NULL); 
 


8.	Write a query to display the last names of the employees who earn less than the average salary in their departments. 
         SELECT last_name          FROM    employees outer 
         WHERE outer.salary < (SELECT AVG(inner.salary) 
                               FROM employees inner 
                               WHERE inner.department_id                                       = outer.department_id);  
 
9.	Write a query to display the last names of employees who have one or more coworkers in their departments with later hire dates but higher salaries. 
        

SELECT  last_name          FROM    employees outer 
         WHERE EXISTS (SELECT 'X' 
                       FROM employees inner 
                       WHERE inner.department_id =                               outer.department_id  
                       AND inner.hire_date > outer.hire_date 
                       AND inner.salary > outer.salary);  
 


10.	Write a query to display the employee ID, last names, and department names of all employees. 
Note: Use a scalar subquery to retrieve the department name in the SELECT statement.  
 
        

SELECT employee_id, last_name,  
            (SELECT department_name 
           	FROM departments d 
             WHERE   e.department_id =    
                  d.department_id ) department 
     FROM employees e 
     ORDER BY department; 
 
 


11.	Write a query to display the department names of those departments whose total salary cost is above one-eighth (1/8) of the total salary cost of the whole company. Use the WITH clause to write this query. Name the query SUMMARY.  


WITH  summary AS ( 
  SELECT d.department_name, SUM(e.salary) AS dept_total 
  FROM employees e JOIN departments d 
  ON e.department_id = d.department_id 
  GROUP BY d.department_name) 
SELECT department_name, dept_total 
FROM summary 
WHERE dept_total > ( SELECT SUM(dept_total) * 1/8 
                    FROM summary  ) 
ORDER BY dept_total DESC; 
 	 
 


888888
8.	Grant another user query privilege on your table. Then, verify whether that user can use the privilege. 
Note: For this exercise, open another SQL Developer session and connect as a different user. For example, if you are currently using ora21, open another SQL Developer session and connect as ora22. Here onwards we would refer the first SQL Developer session as Team 1 and the second SQL Developer session as Team 2. 
a.	Grant another user privilege to view records in your REGIONS table. Include an option for this user to further grant this privilege to other users. 
Note: Replace <team2_oraxx> with ora22, <team1_oraxx> with ora21, and <team3_oraxx> with ora23. 
Team 1 executes this statement:  


GRANT select 
ON regions 
TO <team2_oraxx> WITH GRANT OPTION; 


b.	Have the user query your REGIONS table. 
Team 2 executes this statement: 


SELECT * FROM <team1_oraxx>.regions; 


c.	Have the user pass on the query privilege to a third user, ora23. 
Team 2 executes this statement. 


GRANT select 
ON <team1_oraxx>.regions 
TO <team3_oraxx>; 


d.	Take back the privilege from the user who performs step b. 
             Team 1 executes this statement. 


REVOKE select 
ON regions 
FROM <team2_oraxx>; 


9.	Grant another user query and data manipulation privileges on your COUNTRIES table. Make sure the user cannot pass on these privileges to other users. 
  Team 1 executes this statement. 


GRANT select, update, insert 
ON COUNTRIES  
TO <team2_oraxx>; 


10.	Take back the privileges on the COUNTRIES table granted to another user. 
 Team 1 executes this statement. 


REVOKE select, update, insert ON COUNTRIES FROM <team2_oraxx>; 


11.	Grant another user access to your DEPARTMENTS table. Have the user grant you query access to his or her DEPARTMENTS table. 
a.	Team 2 executes the GRANT statement. 


GRANT select 
ON departments 
TO <team1_oraxx>; 
 	 


b.	Team 1 executes the GRANT statement. 
GRANT select 
ON departments 
TO <team2_oraxx>; 
 
Here, <team1_oraxx> is the username of Team 1 and <team2_oraxx> is the username of Team 2. 
12.	Query all the rows in your DEPARTMENTS table. 
      

SELECT  * 
      FROM    departments; 
 	 
13.	Add a new row to your DEPARTMENTS table. Team 1 should add Education as department number 500. Team 2 should add Human Resources as department number 510. Query the other team’s table.  
a.	Team 1 executes this INSERT statement. 
        

INSERT INTO departments(department_id, department_name) 
        VALUES (500, 'Education'); 
        COMMIT; 


b.	Team 2 executes this INSERT statement. 
       

INSERT INTO departments(department_id, department_name) 
        VALUES (510, 'Human Resources');         COMMIT; 
 


14.	Create a synonym for the other team’s DEPARTMENTS table. 
a.	Team 1 creates a synonym named team 2. 


CREATE SYNONYM team2 
         FOR <team2_oraxx>.DEPARTMENTS; 


b.	Team 2 creates a synonym named team 1. 


CREATE SYNONYM team1 
         FOR <team1_oraxx>. DEPARTMENTS; 
 


15.	Query all the rows in the other team’s DEPARTMENTS table by using your synonym. 
a.	Team 1 executes this SELECT statement. 


SELECT  * 
   FROM    team2; 


b.	Team 2 executes this SELECT statement. 


SELECT  * 
    FROM    team1; 
 
 	 

16.	Revoke the SELECT privilege from the other team. 
a.	Team 1 revokes the privilege. 


REVOKE select 
     ON departments 
     FROM  <team2_oraxx>; 


b.	Team 2 revokes the privilege. 


REVOKE select 
     ON departments  
     FROM <team1_oraxx>; 
 
 
17.	Remove the row that you inserted into the DEPARTMENTS table in step 13 and save the changes. 
a.	Team 1 executes this DELETE statement. 
        

DELETE FROM departments         WHERE department_id = 500; 
        COMMIT; 


b.	Team 2 executes this DELETE statement. 
        

DELETE FROM departments 
        WHERE department_id = 510;  
        COMMIT; 
 
 
18.	Drop the synonyms team 1 and team 2. 


DROP SYNONYM team1; 
DROP SYNONYM team2; 
 	 
 
99999999

1.	Run the lab_09_01.sql script in the lab folder to create the SAL_HISTORY table.  
2.	Display the structure of the SAL_HISTORY table. 

DESC sal_history 
 
3.	Run the lab_09_03.sql script in the lab folder to create the MGR_HISTORY table. 

4.	Display the structure of the MGR_HISTORY table.  

DESC mgr_history 
 

5.	Run the lab_09_05.sql script in the lab folder to create the SPECIAL_SAL table. 

6.	Display the structure of the SPECIAL_SAL table. 

DESC special_sal  
 

7. 	 
a.	Write a query to do the following: 
	Retrieve details such as the employee ID, hire date, salary, and manager ID of those employees whose employee ID is less than 125 from the EMPLOYEES table. 
	If the salary is more than $20,000, insert details such as the employee ID and salary into the SPECIAL_SAL table. 
	If the salary is less than $20,000: 
-	Insert details such as the employee ID, hire date, and salary into the SAL_HISTORY table 
-	Insert details such as the employee ID, manager ID, and salary into the MGR_HISTORY table 


INSERT ALL 
WHEN SAL > 20000 THEN 
INTO  special_sal VALUES (EMPID, SAL) 
ELSE 
INTO sal_history VALUES(EMPID,HIREDATE,SAL) 
INTO mgr_history VALUES(EMPID,MGR,SAL) SELECT employee_id EMPID, hire_date HIREDATE, salary SAL, manager_id MGR FROM employees  
WHERE employee_id < 125; 
 
 	 
b.	Display the records from the SPECIAL_SAL table.  
  
 SELECT * FROM  special_sal; 
 
c.	Display the records from the SAL_HISTORY table.  
   
 SELECT * FROM  sal_history; 
 
d.	Display the records from the MGR_HISTORY table. 
    
SELECT * FROM mgr_history; 
 
8. 	 
a.	Run the lab_09_08_a.sql script in the lab folder to create the SALES_WEEK_DATA table. 
b.	Run the lab_09_08_b.sql script in the lab folder to insert records into the SALES_WEEK_DATA table. 
c.	Display the structure of the SALES_WEEK_DATA table. 

DESC sales_week_data 
 
d.	Display the records from the SALES_WEEK_DATA table. 

SELECT * FROM SALES_WEEK_DATA; 
 
e.	Run the lab_09_08_e.sql script in the lab folder to create the EMP_SALES_INFO table. 
f.	Display the structure of the EMP_SALES_INFO table. 

DESC emp_sales_info 
 
g.	Write a query to do the following:  
	Retrieve details such as the employee ID, week ID, sales quantity on Monday, sales quantity on Tuesday, sales quantity on Wednesday, sales quantity on Thursday, and sales quantity on Friday from the SALES_WEEK_DATA table.  
	Build a transformation such that each record retrieved from the SALES_WEEK_DATA table is converted into multiple records for the EMP_SALES_INFO table. 
 
Hint: Use a pivoting INSERT statement. 
 

INSERT ALL 
      INTO emp_sales_info VALUES (id, week_id, QTY_MON) 
      INTO emp_sales_info VALUES (id, week_id, QTY_TUE) 
      INTO emp_sales_info VALUES (id, week_id, QTY_WED) 
      INTO emp_sales_info VALUES (id, week_id, QTY_THUR) 
      INTO emp_sales_info VALUES (id, week_id, QTY_FRI) 
 SELECT ID, week_id, QTY_MON, QTY_TUE, QTY_WED,  
      QTY_THUR,QTY_FRI FROM sales_week_data; 
       
	
h. 	Display the records from the SALES_INFO table. 
    

SELECT * FROM emp_sales_info;   
 

9.	You have the data of past employees stored in a flat file called emp.data. You want to store the names and email IDs of all employees past and present in a table. To do this, first create an external table called EMP_DATA using the emp.dat source file in the emp_dir directory. You can use the script in lab_09_09.sql to do this. 


CREATE TABLE emp_data 
  (first_name  VARCHAR2(20) 
  ,last_name   VARCHAR2(20)   , email     VARCHAR2(30) 
  ) 
ORGANIZATION EXTERNAL 
( 
 TYPE oracle_loader 
 DEFAULT DIRECTORY emp_dir 
 ACCESS PARAMETERS 
 ( 
  RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII 
  NOBADFILE 
  NOLOGFILE 
  FIELDS 
  ( first_name POSITION ( 1:20) CHAR 
  , last_name POSITION (22:41) CHAR   ,  email   POSITION (43:72) CHAR ) 
 ) 
 LOCATION ('emp.dat') ) ; 
 
 


10.	Run the lab_09_10.sql script to create the EMP_HIST table.  
a.	Increase the size of the email column to 45. 

ALTER TABLE emp_hist MODIFY email varchar(45); 
 

b.	Merge the data in the EMP_DATA table created in the last lab into the data in the EMP_HIST table. Assume that the data in the external EMP_DATA table is the most upto-date. If a row in the EMP_DATA table matches the EMP_HIST table, update the email column of the EMP_HIST table to match the EMP_DATA table row. If a row in the 
EMP_DATA table does not match, insert it into the EMP_HIST table. Rows are considered matching when the employee’s first and last names are identical.  
 

MERGE INTO EMP_HIST f USING EMP_DATA h 
 ON (f.first_name = h.first_name  AND f.last_name = h.last_name) 
WHEN MATCHED THEN 
 UPDATE SET f.email = h.email 
WHEN NOT MATCHED THEN 
 INSERT (f.first_name 
    , f.last_name 
    , f.email) 
 VALUES (h.first_name 
    , h.last_name 
    , h.email); 
 

c.	Retrieve the rows from EMP_HIST after the merge. 

SELECT * FROM emp_hist;  
 

11.	Create the EMP2 table based on the following table instance chart. Enter the syntax in the SQL Worksheet. Then execute the statement to create the table. Confirm that the table is created. 
Column 
Name 	ID 	LAST_NAME	FIRST_NAME	DEPT_ID 
Key Type 	 	 	 	 
Nulls/Unique 	 	 	 	 
FK Table 	 	 	 	 
FK Column 	 	 	 	 
Data type 	NUMBER 	VARCHAR2	VARCHAR2	NUMBER 
Length 	7 	25 	25 	7 
 
 
 	 
      


CREATE TABLE  emp2       (id           NUMBER(7),        last_name     VARCHAR2(25),        first_name    VARCHAR2(25),        dept_id       NUMBER(7)); 
 
      


DESCRIBE emp2 
 
 


12.	Drop the EMP2 table. 
    
 DROP TABLE emp2; 
 


13.	Query the recycle bin to see whether the table is present. 


SELECT original_name, operation, droptime  
FROM recyclebin; 
 
 


14.	Restore the EMP2 table to a state before the DROP statement. 
     

 FLASHBACK TABLE emp2 TO BEFORE DROP;       




DESC emp2; 
 


15.	Create the EMP3 table using the lab_09_11.sql script. In the EMP3 table, change the department for Kochhar to 60 and commit your change. Next, change the department for 
Kochhar to 50 and commit your change. Track the changes to Kochhar using the Row Versions feature.  
    


UPDATE emp3 SET department_id = 60  
    WHERE last_name = 'Kochhar'; 
    COMMIT; 
    UPDATE emp3 SET department_id = 50  
    WHERE last_name = 'Kochhar'; 
    
COMMIT; 
 
SELECT VERSIONS_STARTTIME "START_DATE",         VERSIONS_ENDTIME "END_DATE",  DEPARTMENT_ID   
FROM EMP3   
   VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE  
WHERE LAST_NAME ='Kochhar'; 
 	 

16. Drop the EMP2 and EMP3 tables so that they cannot be restored. Check in the recycle bin. 
     

DROP TABLE emp2 PURGE;      

DROP TABLE emp3 PURGE; 
 
     
SELECT original_name, operation, droptime  
       FROM recyclebin;  

 	 
 	 
 
