01.
conn sys / as sysdba
create user patel identified by patel;

02.
grant create table, create session, create constraint, create view, create sequence to patel;
grant unlimited tablespace to patel;
conn patel /patel@orclpdb;

03.
create table dept27
(dept_id number(5) constraint dept_id_pk primary key, name varchar2(30));

04.
create table emp27 (
emp_id number(5),
l_name varchar2(30),
f_name varchar2(30),
salary number(8) constraint emp27_chk_salary check(salary>500),
user_id varchar2(10));

05.
alter table emp27
add dept_id number(5);

06.
alter table dept27
modify name varchar2(35);

07.
alter table emp27
drop column user_id;

08.
alter table emp27
add constraint my__emp27_emp_id_pk primary key (emp_id);

09.
alter table emp27
add constraint my_emp27_dept_id_fk
foreign key (dept_id) references dept27;

10.
select constraint_name, constraint_type
from user_constraints
where table_name = 'EMP27';

11.
alter table emp27
modify l_name varchar(30) not null;

12.
drop table emp27;
flashback table emp27 to before drop;

16.
select last_name, department_id, salary
from employees
where (department_id,salary) in(select department_id, salary from employees where commission_pct is not null);

17.
SELECT e.last_name, d.department_name, e.salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
AND (salary, job_id) IN
(SELECT e.salary, e.job_id
FROM employees e JOIN
departments d
ON e.department_id =
d.department_id
AND d.location_id = 1700);

18.
SELECT last_name, hire_date, salary
FROM employees
WHERE (salary, manager_id) IN
(SELECT salary, manager_id
FROM employees
WHERE last_name = 'Kochhar')
AND last_name != 'Kochhar';

19.
SELECT last_name, job_id, salary
FROM employees
WHERE salary > ALL
(SELECT salary
FROM employees
WHERE job_id = 'SA_MAN')
ORDER BY salary DESC;

20.
SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN (SELECT department_id
FROM departments
WHERE location_id IN
(SELECT location_id
FROM locations
WHERE city LIKE 'T%'));

21.
SELECT last_name
FROM employees outer
WHERE outer.salary < (SELECT AVG(inner.salary)
FROM employees inner
WHERE inner.department_id
= outer.department_id);


-- PLSQL
1

BEGIN

  DBMS_OUTPUT.PUT_LINE( 'Hello World');
  END;
  /

  -- A)
DECLARE
v_today date:=sysdate;
v_tommorrow date;

BEGIN
v_tommorrow:=sysdate+1;

  DBMS_OUTPUT.PUT_LINE( 'Today''s date is '||v_today);
  DBMS_OUTPUT.PUT_LINE( 'Tommorow''s date is '||v_tommorrow);
  END;
  /
-- B)
  DECLARE
v_today date:=sysdate;
v_tommorrow date;

BEGIN
v_tommorrow:=sysdate+1;

  DBMS_OUTPUT.PUT_LINE( 'Hello World');
  DBMS_OUTPUT.PUT_LINE( 'Today''s date is '||v_today);
  DBMS_OUTPUT.PUT_LINE( 'Tommorow''s date is '||v_tommorrow);
  END;
  /

-- 2
DECLARE
v_pf_sal number:=12;
v_base_sal number:=45;
v_sal employees.salary%TYPE;
v_contribution employees.salary%type;

BEGIN
SELECT salary into v_sal
from employees
where employee_id=180;
v_contribution :=v_sal*v_pf_sal/100*v_base_sal/100;



  DBMS_OUTPUT.PUT_LINE( 'Employees salary is : '||v_sal);
  DBMS_OUTPUT.PUT_LINE( 'Employees contribution to the providend fund is '||v_contribution);

  END;
  /


-- 3
DECLARE

v_max_dpt departments.department_id%TYPE;
BEGIN
SELECT max(department_id) INTO v_max_dpt
from employees;
  DBMS_OUTPUT.PUT_LINE( 'The max dept ID  is: '||v_max_dpt);

END;
/


-- 4

DECLARE
v_hire_date employees.hire_date%TYPE;

v_sal employees.salary%TYPE;


BEGIN
SELECT hire_date, salary INTO v_hire_date, v_sal
from employees
where employee_id=100;

DBMS_OUTPUT.PUT_LINE( 'The employee joined in: '||v_hire_date);
DBMS_OUTPUT.PUT_LINE( 'The employee''s SALARY is : '||v_sal);

END;
/


-- 5
DECLARE
v_new_dept departments.department_id%TYPE;
v_dept_name departments.department_name%TYPE:='Software'; 
BEGIN
SELECT max(department_id)+10 INTO v_new_dept
from departments;
insert into departments(department_id, department_name, location_id)
values(v_new_dept,'Software',NULL);
DBMS_OUTPUT.PUT_LINE( 'The NEW dept id IS: '||v_new_dept);
DBMS_OUTPUT.PUT_LINE( 'The NEW dept NAME IS: '||v_dept_name);
END;
/

SELECT * from departments
where department_name='Software';

where location_id is null;
-- 6
DECLARE
v_new_dept departments.department_id%TYPE;
v_dept_name departments.department_name%TYPE:='Education'; 
BEGIN
SELECT max(department_id)+10 INTO v_new_dept
from departments;
insert into departments(department_id, department_name, location_id)
values(v_new_dept,v_dept_name,NULL);
DBMS_OUTPUT.PUT_LINE( 'The NEW dept id IS: '||v_new_dept);
DBMS_OUTPUT.PUT_LINE( 'SQL%rowcount is: '||sql%rowcount);
END;
/



-- 7
create table messages(results number);

BEGIN 
  FOR i in 1..10 loop 
  if i=6 or i=8 then null;
  else 
  insert into messages(results)
  values(i);
  end if;
  end loop;
  END;
/


DELETE FROM messages WHERE resultS IN (1,2,3,4,5,7,9,10);
select * from messages; 
-- 8
create table emp
as select employee_id, salary from employees;

 alter table emp
 add stars varchar2(50);

 declare
   v_empno emp.employee_id%type := 176;
   v_asterisk emp.stars%type := null;
   v_sal emp.salary%type;
begin
   select nvl(round(salary/1000),0) into v_sal
   from emp
   where employee_id = v_empno;
   for i in 1..v_sal loop
   v_asterisk := v_asterisk || '*';
   end loop;
   update emp
   set stars = v_asterisk;
   end;
/







create table emply
as select employee_id, salary from employees;

alter table emply
add bangu varchar2(50);

declare v_empno emply.employee_id%TYPE:=176;
v_asterisk emply.bangu%TYPE :=NULL;
v_sal emply.salary%TYPE;
BEGIN
select nvl(round(salary/1000),0) into v_sal
from emply
where employee_id = v_empno;
for i in 1..v_sal loop
v_asterisk := v_asterisk ||'*';
end loop;
update emply
set bangu=v_asterisk;
end;


DECLARE
variable b_basic_percent NUMBER
VARIABLE b_pf_percent NUMBER
:b_basic_percent:=45;
:b_pf_percent:=12;
BEGIN
print b_basic_percent
print b_pf_percent
END;
/


DECLARE
v_weight NUMBER(3):=600;
v_message VARCHAR2(255):='Product 10012';

BEGIN
  DECLARE
  v_weight NUMBER(3):=1;
  v_message VARCHAR2(255):='Product 11001';
  v_new_locn VARCHAR2(50):='Europe';
  BEGIN
    v_weight:=v_weight+1;
    v_new_locn:='Western'||v_new_locn; 
  END;
  v_weight:=v_weight+1;
  v_message:=v_message||'Is in stock!';
  v_new_locn:='Western'||v_new_locn;
END;
/

-- VARIABLE b_basic_percent NUMBER
-- VARIABLE b_pf_percent NUMBER
SET SERVEROUTPUT ON

/*
:b_basic_percent:=45;
:b_pf_percent:=12;
*/

 
DECLARE
v_basic_percent NUMBER:=45;
v_pf_percent NUMBER:=12;
v_fname VARCHAR2(15);

v_emp_sal NUMBER(10);

BEGIN
SELECT first_name, salary INTO v_fname, v_emp_sal
FROM employees WHERE employee_id=110;

DBMS_OUTPUT.PUT_LINE(' Hello '|| v_fname);
-- DBMS_OUTPUT.PUT_LINE('Today is :'||v_today);
-- DBMS_OUTPUT.PUT_LINE('Tommorrow is :'||v_tommorrow);
DBMS_OUTPUT.PUT_LINE('Your salary is:'||v_emp_sal);
DBMS_OUTPUT.put_line('Your contribution to the pf :'||v_emp_sal*v_basic_percent/100*v_pf_percent/100);
END;
/

-- solve 5


DECLARE
v_max_deptno NUMBER;
BEGIN
  SELECT MAX(department_id) INTO v_max_deptno 
  FROM departments;

  DBMS_OUTPUT.PUT_LINE('The maximum department_id is :'||v_max_deptno);

END;
/



DECLARE
v_dept_name departments.department_name%type:='Education';
v_dept_id NUMBER;
v_max_deptno NUMBER;
BEGIN
  SELECT MAX(department_id) INTO v_max_deptno 
  FROM departments;
v_dept_id:=10+v_max_deptno;

INSERT INTO departments (department_id, department_name, location_id)
VALUES( v_dept_id, v_dept_name, NULL);
DBMS_OUTPUT.PUT_LINE('SQL%ROWCOUNT gives:'||SQL%ROWCOUNT);
  DBMS_OUTPUT.PUT_LINE('The maximum department_id is :'||v_max_deptno);

END;
/


DECLARE
BEGIN
  UPDATE departments SET location_id=3000 WHERE 
  department_id=699;
END;
/
 SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID=699;

DELETE FROM DEPARTMENTS WHERE DEPARTMENT_ID=699;
DE 


BEGIN
  FOR i in 1..10 LOOP 
    IF i=6 or i=8 THEN 
    null;
    ELSE 
    INSERT INTO messages(results) 
    VALUES(i);
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(select * from messages);
  COMMIT;
END;
/


BEGIN
  FOR i in 1..10 LOOP 
    IF i=6 or i=8 THEN 
    null;
    ELSE 
    INSERT INTO MSG(results) 
    VALUES(i);
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(select * from messages);
  COMMIT;
END;
/

DELETE FROM messages WHERE (results);


-- 2 
 create table emplo
  as  select *  from employees

alter table emplo add  stars varchar2(39) ;
 
DECLARE
v_empno emplo.employee_id%TYPE:=176;
v_asterisk emplo.stars%TYPE:=NULL;
v_sal emplo.salary%TYPE;
BEGIN
  SELECT NVL(Round(salary/1000),0) INTO v_sal
  FROM emplo 
  WHERE employee_id=v_empno;

  FOR i IN 1..v_sal
  LOOP
    v_asterisk:=v_asterisk||'*';
  END LOOP;
  UPDATE emplo 
  set stars = v_asterisk 
  WHERE employee_id= v_empno;
END;
/

SELECT employee_id, salary, stars
from emplo where employee_id=176;

SELECT employee_id, salary, stars
from emplo ;


-- it gives all stars to the table
DECLARE

v_asterisk emplo.stars%TYPE:=NULL;
v_sal emplo.salary%TYPE;
BEGIN
  SELECT NVL(Round(salary/1000),0) INTO v_sal
  FROM emplo where employee_id=176;

  FOR i IN 1..v_sal
  LOOP
    v_asterisk:=v_asterisk||'*';
  END LOOP;
  UPDATE emplo 
  set stars = v_asterisk ;
END;
/
DECLARE
BEGIN
END;
/






DECLARE
BEGIN
END;
/



DECLARE
BEGIN
END;
/

DECLARE
BEGIN
END;
/


DECLARE
BEGIN
END;
/



DECLARE
BEGIN
END;
/



DECLARE
BEGIN
END;
/

DECLARE
BEGIN
END;
/


DECLARE
BEGIN
END;
/



DECLARE
BEGIN
END;
/


 

--  CHAP 9 SQL 2

-- USING EXPLICIT DEFAULT VALUES
CREATE TABLE DEPTM3(DEPARTMENT_ID NUMBER, department_name VARCHAR2(50), MANAGER_ID NUMBER(38));

INSERT INTO DEPTM3
(DEPARTMENT_ID, department_name, MANAGER_ID)
VALUES(300, 'ENGINEERING',DEFAULT);

UPDATE DEPTM3
SET MANAGER_ID=DEFAULT
WHERE DEPARTMENT_ID=10;


-- UNCONDITIONAL INSERT ALL

CREATE TABLE SAL_HISTORY(EMP_ID NUMBER, HIRE_DATE DATE,SALARY NUMBER, MANAGER_ID NUMBER(38));
INSERT ALL
          INTO SAL_HISTORY 
          VALUES(EMP_ID,HIRE_DATE,SALARY)
          INTO SAL_HISTORY 
          VALUES(EMP_ID,HIRE_DATE, SALARY)
          SELECT employee_id EMPID, HIRE_DATE HIREDATE, SALARY SAL, MANAGER_ID MGR
          FROM EMPLOYEES
          WHERE employee_id>200;

CREATE USER USER
IDENTIFIED BY PASSWORD

CREATE USER DEMO1
IDENTIFIED BY DEMO1;

GRANT CREATE SESSION, CREATE TABLE, CREATE sequence, CREATE VIEW, CREATE PROCEDURE 
TO DEMO1;

GRANT UNLIMITED TABLESPACE TO DEMO1;

CREATE ROLE MANAGER1;

GRANT CREATE TABLE, CREATE VIEW TO MANAGER1;


CREATE USER NOORK IDENTIFIED BY NOORK;
GRANT MANAGER1 TO NOORK;
-- DEMO1 ER PASSWORD EKHON EMPLOY HOYE GELO RE
ALTER USER DEMO1 
IDENTIFIED BY EMPLOY;

-- GRANTING OBJECT PRIVILEDGES
GRANT SELECT 
ON EMPLOYEES
TO DEMO1;

-- 
GRANT UPDATE ( department_name, location_id)
ON DEPARTMENTS
TO DEMO1, MANAGER1;




-- CHAP2

--  how to use the dictionary views
DESC DICTIONARY

SELECT * FROM DICTIONARY
WHERE TABLE_NAME='USER_OBJECTS';

SELECT TABLE_NAME
FROM DICTIONARY
WHERE LOWER (COMMENTS) LIKE'%columns%';
-- user_objects view


SELECT object_name, object_type, created , status
FROM USER_OBJECTS
ORDER BY object_type;

-- table info
DESCRIBE user_tables


SELECT TABLE_NAME
from user_tables;

select TABLE_NAME
from tabs;
-- column info
DESCRIBE user_tab_columns;

SELECT column_name, data_type, data_length,
data_precision, data_scale, nullable
FROM user_tab_columns
WHERE TABLE_NAME ='EMPLOYEES';

-- constraints informations
describe user_constraints

select constraint_name, constraint_type, search_condition, r_constraint_name, delete_rule, status
FROM user_constraints
WHERE TABLE_NAME='EMPLOYEES';

-- QUERYING USER_CONS_COLUMNS
DESCRIBE USER_CONS_COLUMNS

SELECT constraint_name, column_name
FROM USER_CONS_COLUMNS
WHERE table_name='EMPLOYEES';

-- CHAP4
-- CHAP5
-- CHAP6
-- CHAP7