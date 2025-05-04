-- chapter 2
describe dictionary
select * from dictionary
WHERE table_name='USER_OBJECTS';

SELECT table_name
FROM dictionary
WHERE LOWER(comments) LIKE '%columns%';

-- User objects view
SELECT  object_name, object_type, created, status
FROM USER_OBJECTS
ORDER BY object_type;
-- table information
DESCRIBE user_tables

SELECT table_name
FROM user_tables;

SELECT table_name
FROM tabs;
DESCRIBE user_tab_columns





--  column information

SELECT column_name, data_type, data_length, data_precision, data_scale,nullable
FROM user_tab_columns
WHERE table_name='EMPLOYEES';

SELECT column_name, data_type, data_length, data_precision, data_scale
FROM user_unused_col_tabs
WHERE table_name='EMPLOYEES';

-- Constraint information

 select constraint_name, constraint_type from user_constraints
 where table_name='EMPLOYEES';

 select constraint_name, constraint_type from user_constraints;


describe user_constraints -- constraint definitions on your tables
DESCRIBE user_cons_columns --columns owned by you 

-- adding comments to your table
COMMENT ON TABLE employees
IS 'Employee Information';

COMMENT ON COLUMN employees.first_name
IS 'First name of the employee';




-- chapter 3 creating sequences synonyms and indexes


/* 
comments can be views through the data dicitonary
=ALL_COL_COMMENTS
USER_COL_COMMENTS
ALL_TAB_COMMENTS
USER_TAB_COMMENTS

*/




select * 
FROM userB.employees;

SELECT * 
useraA.employees;
-- Syntax


CREATE SEQUENCE dept_deptid_seq
START WITH 280
INCREMENT BY 10
MAXVALUE 9999
NOCACHE
NOCYCLE;

-- the class evidence

  alter session set container=orclpdb;
   conn /as sysdba

   create user patel identified by patel;
   alter session set container= orclpdb;
   show con_name;

grant create session,  create table, create view, create sequence to patel;
 conn patel/patel@orclpdb;
 
create table
dept27(
dept_id NUMBER(5)
constraint dept_id_pk primary key,
name varchar2(30))



alter session set container=orclpdb
conn /as sysdba;

SQL> create user patel identified by patel;
create user patel identified by patel
            *
ERROR at line 1:
ORA-65096: invalid common user or role name

alter session set container=orclpdb;
show con_name;

create user patel identified by patel;
create user patel identified by patel
            *
ERROR at line 1:
ORA-01920: user name 'PATEL' conflicts with another user or role name


SQL> ed
Wrote file afiedt.buf

  1* create user patel identified by patel
SQL>
SQL> drop user patel;

User dropped.

SQL> create user patel identified by patel;

User created.

SQL> grant create session, create table, create view, create sequence to patel;

Grant succeeded.

SQL> conn patel/patel@orclpdb;
Connected.
SQL> create dept27 (dept_id number(5) constraint dept_id_pk primary key(dept_id), name varchar2(30));
create dept27 (dept_id number(5) constraint dept_id_pk primary key(dept_id), name varchar2(30))
       *
ERROR at line 1:
ORA-00901: invalid CREATE command


SQL> ed
Wrote file afiedt.buf

  1* create dept27 (dept_id number(5) constraint dept_id_pk primary key, name varchar2(30))
SQL> /
create dept27 (dept_id number(5) constraint dept_id_pk primary key, name varchar2(30))
       *
ERROR at line 1:
ORA-00901: invalid CREATE command


SQL> ed
Wrote file afiedt.buf

  1* create table dept27 (dept_id number(5) constraint dept_id_pk primary key, name varchar2(30))
SQL> /

Table created.

SQL> create table emp27(emp_id nuber(5),l_name varchar2(30), f_name varchar2(30), salary number(8) constraint emp27_ck check (salary>500), user_id varchar2(10));
create table emp27(emp_id nuber(5),l_name varchar2(30), f_name varchar2(30), salary number(8) constraint emp27_ck check (salary>500), user_id varchar2(10))
                               *
ERROR at line 1:
ORA-00907: missing right parenthesis


SQL> ed
Wrote file afiedt.buf

  1  create table emp27
  2  (emp_id nuber(5),l_name varchar2(30),
  3  f_name varchar2(30),
  4  salary number(8) constraint emp27_ck check(salary>500),
  5* user_id varchar2(10))
SQL> /
(emp_id nuber(5),l_name varchar2(30),
             *
ERROR at line 2:
ORA-00907: missing right parenthesis


SQL> ed
Wrote file afiedt.buf

  1  create table emp27
  2  (emp_id nuber(5),
  3  l_name varchar2(30),
  4  f_name varchar2(30),
  5  salary number(8) constraint emp27_ck check(salary>500),
  6* user_id varchar2(10))
SQL> /
(emp_id nuber(5),
             *
ERROR at line 2:
ORA-00907: missing right parenthesis


SQL> ed
Wrote file afiedt.buf

  1  create table emp27
  2  (emp_id number(5),
  3  l_name varchar2(30),
  4  f_name varchar2(30),
  5  salary number(8) constraint emp27_ck check(salary>500),
  6* user_id varchar2(10))
SQL> /

Table created.

SQL> insert into emp27
  2  values dept_id number(10);
values dept_id number(10)
               *
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> ed
Wrote file afiedt.buf

  1  alter table emp27
  2* add dept_id number(10)
SQL> /

Table altered.

SQL> update table dept27
  2  set name varchar(35);
update table dept27
       *
ERROR at line 1:
ORA-00903: invalid table name


SQL> ed
Wrote file afiedt.buf

  1  update table dept27
  2* modify name varchar(35)
SQL> /
update table dept27
       *
ERROR at line 1:
ORA-00903: invalid table name


SQL> desc dept27
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPT_ID                                   NOT NULL NUMBER(5)
 NAME                                               VARCHAR2(30)

SQL> alter table dept27
  2  modify name varchar2(35);

Table altered.

SQL> alter table emp27
  2  drop user_id;
drop user_id
     *
ERROR at line 2:
ORA-00905: missing keyword


SQL> ed
Wrote file afiedt.buf

  1  alter table emp27
  2* drop column user_id
SQL> /

Table altered.

SQL> desc emp27
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_ID                                             NUMBER(5)
 L_NAME                                             VARCHAR2(30)
 F_NAME                                             VARCHAR2(30)
 SALARY                                             NUMBER(8)
 DEPT_ID                                            NUMBER(10)

SQL> desc dept27
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPT_ID                                   NOT NULL NUMBER(5)
 NAME                                               VARCHAR2(35)

SQL> alter table emp27
  2  add constraint my_em27_emp_id_pk primary key (emp_id);

Table altered.

SQL> alter table emp27
  2  add constraint my_emp27_emp_id_fk froe




