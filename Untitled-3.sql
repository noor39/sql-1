
SQL*Plus: Release 19.0.0.0.0 - Production on Tue Mar 18 09:20:21 2025
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
SQL> insert into ( select location_id, city, countryid
  2             from loc
  3             where country_id IN
  4             (SELECT COUNTRY_id IN
  5  ed
  6
SQL> ed
Wrote file afiedt.buf

  1  insert into ( select location_id, city, countryid
  2             from loc
  3             where country_id IN
  4             (SELECT COUNTRY_id
  5             from countries
  6             natural join regions
  7             where region_name='Europe')
  8             with check option)
  9* values(3500,'Berlin', 'DE')
SQL> /
                from loc
                     *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> ed
Wrote file afiedt.buf

  1  insert into ( select location_id, city, countryid
  2             from locations
  3             where country_id IN
  4             (SELECT COUNTRY_id
  5             from countries
  6             natural join regions
  7             where region_name='Europe')
  8             with check option)
  9* values(3500,'Berlin', 'DE')
SQL> /
insert into ( select location_id, city, countryid
                                        *
ERROR at line 1:
ORA-00904: "COUNTRYID": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  insert into ( select location_id, city, country_id
  2             from locations
  3             where country_id IN
  4             (SELECT COUNTRY_id
  5             from countries
  6             natural join regions
  7             where region_name='Europe')
  8             with check option)
  9* values(3500,'Berlin', 'DE')
SQL> /

1 row created.

SQL> create table empl6
  2  as select * from employees;

Table created.

SQL> alter table empl6
  2  add(department_name varchar2(25));

Table altered.

SQL> update empl6 e
  2  set department_name=
  3  (select department_name
  4  from departments d
  5  where e.department_id=d.department_id);

110 rows updated.

SQL> update empl6
  2  set salary =(select empl6.salary +rewards.pay_raise
  3  from rewards
  4  where employee_id=empl6.employee_id
  5  and payraise_date=(select max(paryraise_date) from rewards
  6  where employee_id=empl6.employee_id))
  7  where empl6.employee_id
  8  IN (select employee_id from rewards);
from rewards
     *
ERROR at line 3:
ORA-00942: table or view does not exist


SQL> show con name
concat "." (hex 2e)
SP2-0158: unknown SHOW option "name"
SQL> show user
USER is "HR"
SQL> show con_name

CON_NAME
------------------------------
ORCLPDB
SQL> create user demo identified by demo;
create user demo identified by demo
*
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> conn/ as sysdba
Connected.
SQL> show user
USER is "SYS"
SQL> show con_name

CON_NAME
------------------------------
CDB$ROOT
SQL> alter session set container=orclpdb;

Session altered.

SQL> create user demo identified by demo;

User created.

SQL> grant create session to demo;;
grant create session to demo;
                            *
ERROR at line 1:
ORA-00933: SQL command not properly ended


SQL> grant create session to demo;

Grant succeeded.

SQL> show user
USER is "SYS"
SQL> grant create session, create table, create sequence, create view
  2  to demo;

Grant succeeded.

SQL> create role manager;

Role created.

SQL> grant create table, create view to manager;

Grant succeeded.

SQL> create role;
create role
          *
ERROR at line 1:
ORA-01937: missing or invalid role name


SQL> grant manager to alice;
grant manager to alice
                 *
ERROR at line 1:
ORA-01917: user or role 'ALICE' does not exist


SQL> grant manager to manager;
grant manager to manager
*
ERROR at line 1:
ORA-01934: circular role grant detected


SQL> grant create table, create view to manager;

Grant succeeded.

SQL> grant manager to alice;
grant manager to alice
                 *
ERROR at line 1:
ORA-01917: user or role 'ALICE' does not exist


SQL> grant manager to demo;

Grant succeeded.

SQL> desc demo;
ERROR:
ORA-04043: object demo does not exist


SQL> desc demo
ERROR:
ORA-04043: object demo does not exist


SQL> grant create table, create view to manager;

Grant succeeded.

SQL> grant create session to manager;

Grant succeeded.

SQL> create user munir identified by munid
  2  /

User created.

SQL> grant manager to munir;

Grant succeeded.

SQL> create role manager
  2  /
create role manager
            *
ERROR at line 1:
ORA-01921: role name 'MANAGER' conflicts with another user or role name


SQL> create role ceo
  2  /

Role created.

SQL> grant create table, create view to ceo
  2  grant create session to manager;
grant create session to manager
*
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> grant create session to ceo;

Grant succeeded.

SQL> create user noor identified by noor;

User created.

SQL> grant ceo to noor;

Grant succeeded.

SQL> grant create table, create view to ceo;

Grant succeeded.

SQL> grant create session to noor;

Grant succeeded.

SQL> grant create session to ceo;

Grant succeeded.

SQL> grant unlimited tablespace to noor;

Grant succeeded.

SQL> grant unlimited tablespace to noor;

Grant succeeded.

SQL> grant select on hr.employees to noor;

Grant succeeded.

SQL> create loveless machine as NOOR;
create loveless machine as NOOR
       *
ERROR at line 1:
ORA-00901: invalid CREATE command


SQL> lojjathaka uchit
SP2-0734: unknown command beginning "lojjathaka..." - rest of line ignored.
SQL> create table sal_history(
  2  empid NUMBER,
  3  hiredate DATE,
  4  sal NUMBER(8,2));

Table created.

SQL> create table mgr_history(
  2  empid NUMBER,
  3  mgr NUMBER,
  4  sal NUMBER(8,2));

Table created.

SQL> insert all into sal_history values(empid, hiredate, sal) into mgr_history values(empid, mgr, sal)
  2  select employee_id empid, hire_date HIREDATE, salary SAL, manager_id MGR FROM employees where employee_id>200;
select employee_id empid, hire_date HIREDATE, salary SAL, manager_id MGR FROM employees where employee_id>200
                                                                              *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> ed
Wrote file afiedt.buf

  1  insert all into sal_history values(empid, hiredate, sal) into mgr_history values(empid, mgr, sal)
  2* select employee_id empid, hire_date HIREDATE, salary SAL, manager_id MGR FROM employees where employee_id>200
  3  /
select employee_id empid, hire_date HIREDATE, salary SAL, manager_id MGR FROM employees where employee_id>200
                                                                              *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> ed
Wrote file afiedt.buf

  1  insert all into sal_history
  2  values(empid, hiredate, sal) into mgr_history values(empid, mgr, sal)
  3  select employee_id empid, hire_date HIREDATE, salary SAL, manager_id MGR
  4  FROM employees
  5* where employee_id>200
SQL> /
FROM employees
     *
ERROR at line 4:
ORA-00942: table or view does not exist


SQL> ed
Wrote file afiedt.buf

  1  insert all into sal_history
  2  values(empid, hiredate, sal) into mgr_history values(empid, mgr, sal)
  3  select employee_id empid, hire_date HIREDATE, salary SAL, manager_id MGR
  4  FROM hr.employees
  5* where employee_id>200
SQL> /

18 rows created.

SQL> select * from sal_history;

     EMPID HIREDATE         SAL
---------- --------- ----------
       201 17-FEB-04      13000
       202 17-AUG-05       6000
       203 07-JUN-02       6500
       204 07-JUN-02      10000
       205 07-JUN-02      12008
       206 07-JUN-02       8300
       400 04-MAR-25      10000
       401 02-MAR-25      10000
       402 04-MAR-25      10000

9 rows selected.

SQL>
SQL> SQL*Plus: Release 19.0.0.0.0 - Production on Tue Mar 18 09:20:21 2025
SP2-0734: unknown command beginning "SQL*Plus: ..." - rest of line ignored.
SQL> Version 19.3.0.0.0
SP2-0734: unknown command beginning "Version 19..." - rest of line ignored.
SQL>
SQL> Copyright (c) 1982, 2019, Oracle.  All rights reserved.
SP2-0734: unknown command beginning "Copyright ..." - rest of line ignored.
SQL>
SQL> Enter user-name: sys as sysdba
SP2-0734: unknown command beginning "Enter user..." - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL> Enter password:
SP2-0734: unknown command beginning "Enter pass..." - rest of line ignored.
SQL>
SQL> Connected to:
SP2-0734: unknown command beginning "Connected ..." - rest of line ignored.
SQL> Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
SP2-0734: unknown command beginning "Oracle Dat..." - rest of line ignored.
SQL> Version 19.3.0.0.0
SP2-0734: unknown command beginning "Version 19..." - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL>
SQL> SQL> alter session set container=orclpdb;
SP2-0734: unknown command beginning "SQL> alter..." - rest of line ignored.
SQL>
SQL> Session altered.
SP2-0734: unknown command beginning "Session al..." - rest of line ignored.
SQL>
SQL> SQL> alter pluggable database open;
SP2-0734: unknown command beginning "SQL> alter..." - rest of line ignored.
SQL> alter pluggable database open
  2  *
  3  ERROR at line 1:
  4  ORA-65019: pluggable database ORCLPDB already open
  5
SQL>
SQL> SQL> conn hr/hr@orclpdb;
SP2-0734: unknown command beginning "SQL> conn ..." - rest of line ignored.
SQL> Connected.
SP2-0042: unknown command "Connected." - rest of line ignored.
SQL> SQL> insert into ( select location_id, city, countryid
SP2-0734: unknown command beginning "SQL> inser..." - rest of line ignored.
SQL>   2             from loc
SQL>   3             where country_id IN
SQL>   4             (SELECT COUNTRY_id IN
SQL>   5  ed
SQL>   6
SP2-0226: Invalid line number
SQL> SQL> ed
SP2-0042: unknown command "SQL> ed" - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL> Wrote file afiedt.buf
SP2-0734: unknown command beginning "Wrote file..." - rest of line ignored.
SQL>
SQL>   1  insert into ( select location_id, city, countryid
SQL>   2             from loc
SQL>   3             where country_id IN
SQL>   4             (SELECT COUNTRY_id
SQL>   5             from countries
SQL>   6             natural join regions
SQL>   7             where region_name='Europe')
SQL>   8             with check option)
SQL>   9* values(3500,'Berlin', 'DE')
SP2-0734: unknown command beginning "9* values(..." - rest of line ignored.
SQL> SQL> /
SP2-0042: unknown command "SQL> /" - rest of line ignored.
SQL>                 from loc
SP2-0042: unknown command "from loc" - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL>                      *
SP2-0042: unknown command "*" - rest of line ignored.
SQL> ERROR at line 2:
SP2-0734: unknown command beginning "ERROR at l..." - rest of line ignored.
SQL> ORA-00942: table or view does not exist
SP2-0734: unknown command beginning "ORA-00942:..." - rest of line ignored.
SQL>
SQL>
SQL> SQL> ed
SP2-0042: unknown command "SQL> ed" - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL> Wrote file afiedt.buf
SP2-0734: unknown command beginning "Wrote file..." - rest of line ignored.
SQL>
SQL>   1  insert into ( select location_id, city, countryid
SQL>   2             from locations
SQL>   3             where country_id IN
SQL>   4             (SELECT COUNTRY_id
SQL>   5             from countries
SQL>   6             natural join regions
SQL>   7             where region_name='Europe')
SQL>   8             with check option)
SQL>   9* values(3500,'Berlin', 'DE')
SP2-0734: unknown command beginning "9* values(..." - rest of line ignored.
SQL> SQL> /
SP2-0042: unknown command "SQL> /" - rest of line ignored.
SQL> insert into ( select location_id, city, countryid
  2                                          *
  3  ERROR at line 1:
  4  ORA-00904: "COUNTRYID": invalid identifier
  5
SQL>
SQL> SQL> ed
SP2-0042: unknown command "SQL> ed" - rest of line ignored.
SQL> Wrote file afiedt.buf
SP2-0734: unknown command beginning "Wrote file..." - rest of line ignored.
SQL>
SQL>   1  insert into ( select location_id, city, country_id
SQL>   2             from locations
SQL>   3             where country_id IN
SQL>   4             (SELECT COUNTRY_id
SQL>   5             from countries
SQL>   6             natural join regions
SQL>   7             where region_name='Europe')
SQL>   8             with check option)
SQL>   9* values(3500,'Berlin', 'DE')
SP2-0734: unknown command beginning "9* values(..." - rest of line ignored.
SQL> SQL> /
SP2-0042: unknown command "SQL> /" - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL>
SQL> 1 row created.
SQL>
SQL> SQL> create table empl6
SP2-0734: unknown command beginning "SQL> creat..." - rest of line ignored.
SQL>   2  as select * from employees;
SQL>
SQL> Table created.
SP2-0734: unknown command beginning "Table crea..." - rest of line ignored.
SQL>
SQL> SQL> alter table empl6
SP2-0734: unknown command beginning "SQL> alter..." - rest of line ignored.
SQL>   2  add(department_name varchar2(25));
SQL>
SQL> Table altered.
SP2-0734: unknown command beginning "Table alte..." - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL>
SQL> SQL> update empl6 e
SP2-0734: unknown command beginning "SQL> updat..." - rest of line ignored.
SQL>   2  set department_name=
SQL>   3  (select department_name
SQL>   4  from departments d
SQL>   5  where e.department_id=d.department_id);
SQL>
SQL> 110 rows updated.
SQL>
SQL> SQL> update empl6
SP2-0734: unknown command beginning "SQL> updat..." - rest of line ignored.
SQL>   2  set salary =(select empl6.salary +rewards.pay_raise
SQL>   3  from rewards
SQL>   4  where employee_id=empl6.employee_id
SQL>   5  and payraise_date=(select max(paryraise_date) from rewards
SQL>   6  where employee_id=empl6.employee_id))
SQL>   7  where empl6.employee_id
SQL>   8  IN (select employee_id from rewards);
SQL> from rewards
SP2-0734: unknown command beginning "from rewar..." - rest of line ignored.
SQL>      *
SP2-0042: unknown command "*" - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL> ERROR at line 3:
SP2-0734: unknown command beginning "ERROR at l..." - rest of line ignored.
SQL> ORA-00942: table or view does not exist
SP2-0734: unknown command beginning "ORA-00942:..." - rest of line ignored.
SQL>
SQL>
SQL> SQL> show con name
SP2-0734: unknown command beginning "SQL> show ..." - rest of line ignored.
SQL> concat "." (hex 2e)
SP2-0734: unknown command beginning "concat "."..." - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL> SP2-0158: unknown SHOW option "name"
SP2-0734: unknown command beginning "SP2-0158: ..." - rest of line ignored.
SQL> SQL> show user
SP2-0734: unknown command beginning "SQL> show ..." - rest of line ignored.
SQL> USER is "HR"
SP2-0734: unknown command beginning "USER is "H..." - rest of line ignored.
SQL> SQL> show con_name
SP2-0734: unknown command beginning "SQL> show ..." - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL>
SQL> CON_NAME
SP2-0042: unknown command "CON_NAME" - rest of line ignored.
SQL> ------------------------------
SQL> ORCLPDB
SP2-0042: unknown command "ORCLPDB" - rest of line ignored.
SQL> SQL> create user demo identified by demo;
SP2-0734: unknown command beginning "SQL> creat..." - rest of line ignored.
SQL> create user demo identified by demo
  2  *
  3  ERROR at line 1:
  4  ORA-01031: insufficient privileges
  5
SQL>
SQL> SQL> conn/ as sysdba
SP2-0734: unknown command beginning "SQL> conn/..." - rest of line ignored.
SQL> Connected.
SP2-0042: unknown command "Connected." - rest of line ignored.
SQL> SQL> show user
SP2-0734: unknown command beginning "SQL> show ..." - rest of line ignored.
SQL> USER is "SYS"
SP2-0734: unknown command beginning "USER is "S..." - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL> SQL> show con_name
SP2-0734: unknown command beginning "SQL> show ..." - rest of line ignored.
SQL>
SQL> CON_NAME
SP2-0042: unknown command "CON_NAME" - rest of line ignored.
SQL> ------------------------------
SQL> CDB$ROOT
SP2-0042: unknown command "CDB$ROOT" - rest of line ignored.
SQL> SQL> alter session set container=orclpdb;
SP2-0734: unknown command beginning "SQL> alter..." - rest of line ignored.
SQL>
SQL> Session altered.
SP2-0734: unknown command beginning "Session al..." - rest of line ignored.
SQL>
SQL> SQL> create user demo identified by demo;
SP2-0734: unknown command beginning "SQL> creat..." - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL>
SQL> User created.
SP2-0734: unknown command beginning "User creat..." - rest of line ignored.
SQL>
SQL> SQL> grant create session to demo;;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL> grant create session to demo;

Grant succeeded.

SQL>                             *
SP2-0042: unknown command "*" - rest of line ignored.
SQL> ERROR at line 1:
SP2-0734: unknown command beginning "ERROR at l..." - rest of line ignored.
SQL> ORA-00933: SQL command not properly ended
SP2-0734: unknown command beginning "ORA-00933:..." - rest of line ignored.
SQL>
SQL>
SQL> SQL> grant create session to demo;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> show user
SP2-0734: unknown command beginning "SQL> show ..." - rest of line ignored.
SQL> USER is "SYS"
SP2-0734: unknown command beginning "USER is "S..." - rest of line ignored.
SQL> SQL> grant create session, create table, create sequence, create view
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>   2  to demo;
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> create role manager;
SP2-0734: unknown command beginning "SQL> creat..." - rest of line ignored.
SQL>
SQL> Role created.
SP2-0734: unknown command beginning "Role creat..." - rest of line ignored.
SQL>
SQL> SQL> grant create table, create view to manager;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> create role;
SP2-0734: unknown command beginning "SQL> creat..." - rest of line ignored.
SQL> create role
  2            *
  3  ERROR at line 1:
  4  ORA-01937: missing or invalid role name
  5
SQL>
SQL> SQL> grant manager to alice;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL> grant manager to alice
  2                   *
  3  ERROR at line 1:
  4  ORA-01917: user or role 'ALICE' does not exist
  5
SQL>
SQL> SQL> grant manager to manager;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL> grant manager to manager
  2  *
  3  ERROR at line 1:
  4  ORA-01934: circular role grant detected
  5
SQL>
SQL> SQL> grant create table, create view to manager;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> grant manager to alice;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL> grant manager to alice
  2                   *
  3  ERROR at line 1:
  4  ORA-01917: user or role 'ALICE' does not exist
  5
SQL>
SQL> SQL> grant manager to demo;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> desc demo;
SP2-0734: unknown command beginning "SQL> desc ..." - rest of line ignored.
SQL> ERROR:
SP2-0042: unknown command "ERROR:" - rest of line ignored.
SQL> ORA-04043: object demo does not exist
SP2-0734: unknown command beginning "ORA-04043:..." - rest of line ignored.
SQL>
SQL>
SQL> SQL> desc demo
SP2-0734: unknown command beginning "SQL> desc ..." - rest of line ignored.
SP2-0044: For a list of known commands enter HELP
and to leave enter EXIT.
SQL> ERROR:
SP2-0042: unknown command "ERROR:" - rest of line ignored.
SQL> ORA-04043: object demo does not exist
SP2-0734: unknown command beginning "ORA-04043:..." - rest of line ignored.
SQL>
SQL>
SQL> SQL> grant create table, create view to manager;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> grant create session to manager;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> create user munir identified by munid
SP2-0734: unknown command beginning "SQL> creat..." - rest of line ignored.
SQL>   2  /
SQL>
SQL> User created.
SP2-0734: unknown command beginning "User creat..." - rest of line ignored.
SQL>
SQL> SQL> grant manager to munir;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> create role manager
SP2-0734: unknown command beginning "SQL> creat..." - rest of line ignored.
SQL>   2  /
SQL> create role manager
  2              *
  3  ERROR at line 1:
  4  ORA-01921: role name 'MANAGER' conflicts with another user or role name
  5
SQL>
SQL> SQL> create role ceo
SP2-0734: unknown command beginning "SQL> creat..." - rest of line ignored.
SQL>   2  /
SQL>
SQL> Role created.
SP2-0734: unknown command beginning "Role creat..." - rest of line ignored.
SQL>
SQL> SQL> grant create table, create view to ceo
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>   2  grant create session to manager;
SQL> grant create session to manager
  2  *
  3  ERROR at line 2:
  4  ORA-00933: SQL command not properly ended
  5
SQL>
SQL> SQL> grant create session to ceo;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> create user noor identified by noor;
SP2-0734: unknown command beginning "SQL> creat..." - rest of line ignored.
SQL>
SQL> User created.
SP2-0734: unknown command beginning "User creat..." - rest of line ignored.
SQL>
SQL> SQL> grant ceo to noor;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> grant create table, create view to ceo;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> grant create session to noor;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> grant create session to ceo;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> grant unlimited tablespace to noor;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> grant unlimited tablespace to noor;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL> grant select on hr.employees to noor;
SP2-0734: unknown command beginning "SQL> grant..." - rest of line ignored.
SQL>
SQL> Grant succeeded.
  2
SQL> SQL>


-- ********************************************************************
-- ********************************************************************
-- ********************************************************************


SQL*Plus: Release 19.0.0.0.0 - Production on Tue Mar 18 11:25:22 2025
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Enter user-name: sys as sysdba
Enter password:

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> alter session set container=orclpdb;

Session altered.

SQL> alter pluggable database open
  2  /
alter pluggable database open
*
ERROR at line 1:
ORA-65019: pluggable database ORCLPDB already open


SQL> conn demo/demo@orclpdb;
Connected.
SQL> create table noor(last_name varchar2(34), first_name varchar2(32));

Table created.

SQL> desc noor
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 LAST_NAME                                          VARCHAR2(34)
 FIRST_NAME                                         VARCHAR2(32)

SQL> create role manager
  2  /
create role manager
*
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> conn munir/munir@orclpdb;
ERROR:
ORA-01017: invalid username/password; logon denied


Warning: You are no longer connected to ORACLE.
SQL> conn noor/noor@orclpdb;
Connected.
SQL> create table test_emp(id number, name varchar2(20));
create table test_emp(id number, name varchar2(20))
*
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> create table test_emp(id number, name varchar2(20));
create table test_emp(id number, name varchar2(20))
*
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> conn noor/noor@orclpdb;
Connected.
SQL>  create table test_emp(id number, name varchar2(20));
 create table test_emp(id number, name varchar2(20))
*
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> ed
Wrote file afiedt.buf

  1*  create table test_emp(id number(9), name varchar2(20))
SQL> /
 create table test_emp(id number(9), name varchar2(20))
*
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> ed
Wrote file afiedt.buf

  1*  create table test_emp(id number(9), name varchar2(20))
SQL> /

Table created.

SQL> select * from test_emp;

no rows selected

SQL> insert into test_emp( 9, loki)
  2  /
insert into test_emp( 9, loki)
                      *
ERROR at line 1:
ORA-00928: missing SELECT keyword


SQL> ed
Wrote file afiedt.buf

  1* insert into test_emp( 9, 'loki')
SQL> /
insert into test_emp( 9, 'loki')
                      *
ERROR at line 1:
ORA-00928: missing SELECT keyword


SQL> ed
Wrote file afiedt.buf

  1  insert into test_emp
  2* values( 9, 'loki')
SQL> /
insert into test_emp
            *
ERROR at line 1:
ORA-01950: no privileges on tablespace 'USERS'


SQL> ed
Wrote file afiedt.buf

  1  insert into test_emp
  2* values( 9, 'loki')
SQL> insert into test_emp( /
  2
SQL> /
insert into test_emp( /
                      *
ERROR at line 1:
ORA-00928: missing SELECT keyword


SQL> ed
Wrote file afiedt.buf

  1  insert into test_emp
  2* values( 9, 'loki')
SQL> /

1 row created.

SQL> select * from employees;
select * from employees
              *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> conn_name;
Enter password:
ERROR:
ORA-01005: null password given; logon denied


Warning: You are no longer connected to ORACLE.
SQL>
SQL> select * from hr.employees;
SP2-0640: Not connected
SQL>
SQL> conn noor/noor@orclpdb;
Connected.
SQL> select * from hr.employees;

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        100 Steven               King
SKING                     515.123.4567         17-JUN-03 AD_PRES         24000
                                     90

        101 Neena                Kochhar
NKOCHHAR                  515.123.4568         21-SEP-05 AD_VP           17000
                      100            90

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        102 Lex                  De Haan
LDEHAAN                   515.123.4569         13-JAN-01 AD_VP           17000
                      100            90

        103 Alexander            Hunold
AHUNOLD                   590.423.4567         03-JAN-06 IT_PROG          9000

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      102            60

        104 Bruce                Ernst
BERNST                    590.423.4568         21-MAY-07 IT_PROG          6000
                      103            60

        105 David                Austin

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
DAUSTIN                   590.423.4569         25-JUN-05 IT_PROG          4800
                      103            60

        106 Valli                Pataballa
VPATABAL                  590.423.4560         05-FEB-06 IT_PROG          4800
                      103            60


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        107 Diana                Lorentz
DLORENTZ                  590.423.5567         07-FEB-07 IT_PROG          4200
                      103            60

        108 Nancy                Greenberg
NGREENBE                  515.124.4569         17-AUG-02 FI_MGR          12008
                      101           100

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        109 Daniel               Faviet
DFAVIET                   515.124.4169         16-AUG-02 FI_ACCOUNT       9000
                      108           100

        110 John                 Chen
JCHEN                     515.124.4269         28-SEP-05 FI_ACCOUNT       8200

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      108           100

        111 Ismael               Sciarra
ISCIARRA                  515.124.4369         30-SEP-05 FI_ACCOUNT       7700
                      108           100

        112 Jose Manuel          Urman

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
JMURMAN                   515.124.4469         07-MAR-06 FI_ACCOUNT       7800
                      108           100

        113 Luis                 Popp
LPOPP                     515.124.4567         07-DEC-07 FI_ACCOUNT       6900
                      108           100


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        114 Den                  Raphaely
DRAPHEAL                  515.127.4561         07-DEC-02 PU_MAN          11000
                      100            30

        115 Alexander            Khoo
AKHOO                     515.127.4562         18-MAY-03 PU_CLERK         3100
                      114            30

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        116 Shelli               Baida
SBAIDA                    515.127.4563         24-DEC-05 PU_CLERK         2900
                      114            30

        117 Sigal                Tobias
STOBIAS                   515.127.4564         24-JUL-05 PU_CLERK         2800

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      114            30

        118 Guy                  Himuro
GHIMURO                   515.127.4565         15-NOV-06 PU_CLERK         2600
                      114            30

        119 Karen                Colmenares

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
KCOLMENA                  515.127.4566         10-AUG-07 PU_CLERK         2500
                      114            30

        120 Matthew              Weiss
MWEISS                    650.123.1234         18-JUL-04 ST_MAN           8000
                      100            50


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        121 Adam                 Fripp
AFRIPP                    650.123.2234         10-APR-05 ST_MAN           8200
                      100            50

        122 Payam                Kaufling
PKAUFLIN                  650.123.3234         01-MAY-03 ST_MAN           7900
                      100            50

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        123 Shanta               Vollman
SVOLLMAN                  650.123.4234         10-OCT-05 ST_MAN           6500
                      100            50

        124 Kevin                Mourgos
KMOURGOS                  650.123.5234         16-NOV-07 ST_MAN           5800

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      100            50

        125 Julia                Nayer
JNAYER                    650.124.1214         16-JUL-05 ST_CLERK         3200
                      120            50

        126 Irene                Mikkilineni

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
IMIKKILI                  650.124.1224         28-SEP-06 ST_CLERK         2700
                      120            50

        127 James                Landry
JLANDRY                   650.124.1334         14-JAN-07 ST_CLERK         2400
                      120            50


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        128 Steven               Markle
SMARKLE                   650.124.1434         08-MAR-08 ST_CLERK         2200
                      120            50

        129 Laura                Bissot
LBISSOT                   650.124.5234         20-AUG-05 ST_CLERK         3300
                      121            50

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        130 Mozhe                Atkinson
MATKINSO                  650.124.6234         30-OCT-05 ST_CLERK         2800
                      121            50

        131 James                Marlow
JAMRLOW                   650.124.7234         16-FEB-05 ST_CLERK         2500

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      121            50

        132 TJ                   Olson
TJOLSON                   650.124.8234         10-APR-07 ST_CLERK         2100
                      121            50

        133 Jason                Mallin

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
JMALLIN                   650.127.1934         14-JUN-04 ST_CLERK         3300
                      122            50

        134 Michael              Rogers
MROGERS                   650.127.1834         26-AUG-06 ST_CLERK         2900
                      122            50


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        135 Ki                   Gee
KGEE                      650.127.1734         12-DEC-07 ST_CLERK         2400
                      122            50

        136 Hazel                Philtanker
HPHILTAN                  650.127.1634         06-FEB-08 ST_CLERK         2200
                      122            50

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        137 Renske               Ladwig
RLADWIG                   650.121.1234         14-JUL-03 ST_CLERK         3600
                      123            50

        138 Stephen              Stiles
SSTILES                   650.121.2034         26-OCT-05 ST_CLERK         3200

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      123            50

        139 John                 Seo
JSEO                      650.121.2019         12-FEB-06 ST_CLERK         2700
                      123            50

        140 Joshua               Patel

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
JPATEL                    650.121.1834         06-APR-06 ST_CLERK         2500
                      123            50

        141 Trenna               Rajs
TRAJS                     650.121.8009         17-OCT-03 ST_CLERK         3500
                      124            50


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        142 Curtis               Davies
CDAVIES                   650.121.2994         29-JAN-05 ST_CLERK         3100
                      124            50

        143 Randall              Matos
RMATOS                    650.121.2874         15-MAR-06 ST_CLERK         2600
                      124            50

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        144 Peter                Vargas
PVARGAS                   650.121.2004         09-JUL-06 ST_CLERK         2500
                      124            50

        145 John                 Russell
JRUSSEL                   011.44.1344.429268   01-OCT-04 SA_MAN          14000

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
            .4        100            80

        146 Karen                Partners
KPARTNER                  011.44.1344.467268   05-JAN-05 SA_MAN          13500
            .3        100            80

        147 Alberto              Errazuriz

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
AERRAZUR                  011.44.1344.429278   10-MAR-05 SA_MAN          12000
            .3        100            80

        148 Gerald               Cambrault
GCAMBRAU                  011.44.1344.619268   15-OCT-07 SA_MAN          11000
            .3        100            80


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        149 Eleni                Zlotkey
EZLOTKEY                  011.44.1344.429018   29-JAN-08 SA_MAN          10500
            .2        100            80

        150 Peter                Tucker
PTUCKER                   011.44.1344.129268   30-JAN-05 SA_REP          10000
            .3        145            80

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        151 David                Bernstein
DBERNSTE                  011.44.1344.345268   24-MAR-05 SA_REP           9500
           .25        145            80

        152 Peter                Hall
PHALL                     011.44.1344.478968   20-AUG-05 SA_REP           9000

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
           .25        145            80

        153 Christopher          Olsen
COLSEN                    011.44.1344.498718   30-MAR-06 SA_REP           8000
            .2        145            80

        154 Nanette              Cambrault

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
NCAMBRAU                  011.44.1344.987668   09-DEC-06 SA_REP           7500
            .2        145            80

        155 Oliver               Tuvault
OTUVAULT                  011.44.1344.486508   23-NOV-07 SA_REP           7000
           .15        145            80


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        156 Janette              King
JKING                     011.44.1345.429268   30-JAN-04 SA_REP          10000
           .35        146            80

        157 Patrick              Sully
PSULLY                    011.44.1345.929268   04-MAR-04 SA_REP           9500
           .35        146            80

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        158 Allan                McEwen
AMCEWEN                   011.44.1345.829268   01-AUG-04 SA_REP           9000
           .35        146            80

        159 Lindsey              Smith
LSMITH                    011.44.1345.729268   10-MAR-05 SA_REP           8000

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
            .3        146            80

        160 Louise               Doran
LDORAN                    011.44.1345.629268   15-DEC-05 SA_REP           7500
            .3        146            80

        161 Sarath               Sewall

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
SSEWALL                   011.44.1345.529268   03-NOV-06 SA_REP           7000
           .25        146            80

        162 Clara                Vishney
CVISHNEY                  011.44.1346.129268   11-NOV-05 SA_REP          10500
           .25        147            80


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        163 Danielle             Greene
DGREENE                   011.44.1346.229268   19-MAR-07 SA_REP           9500
           .15        147            80

        164 Mattea               Marvins
MMARVINS                  011.44.1346.329268   24-JAN-08 SA_REP           7200
            .1        147            80

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        165 David                Lee
DLEE                      011.44.1346.529268   23-FEB-08 SA_REP           6800
            .1        147            80

        166 Sundar               Ande
SANDE                     011.44.1346.629268   24-MAR-08 SA_REP           6400

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
            .1        147            80

        167 Amit                 Banda
ABANDA                    011.44.1346.729268   21-APR-08 SA_REP           6200
            .1        147            80

        168 Lisa                 Ozer

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
LOZER                     011.44.1343.929268   11-MAR-05 SA_REP          11500
           .25        148            80

        169 Harrison             Bloom
HBLOOM                    011.44.1343.829268   23-MAR-06 SA_REP          10000
            .2        148            80


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        170 Tayler               Fox
TFOX                      011.44.1343.729268   24-JAN-06 SA_REP           9600
            .2        148            80

        171 William              Smith
WSMITH                    011.44.1343.629268   23-FEB-07 SA_REP           7400
           .15        148            80

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        172 Elizabeth            Bates
EBATES                    011.44.1343.529268   24-MAR-07 SA_REP           7300
           .15        148            80

        173 Sundita              Kumar
SKUMAR                    011.44.1343.329268   21-APR-08 SA_REP           6100

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
            .1        148            80

        174 Ellen                Abel
EABEL                     011.44.1644.429267   11-MAY-04 SA_REP          11000
            .3        149            80

        175 Alyssa               Hutton

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
AHUTTON                   011.44.1644.429266   19-MAR-05 SA_REP           8800
           .25        149            80

        176 Jonathon             Taylor
JTAYLOR                   011.44.1644.429265   24-MAR-06 SA_REP           8600
            .2        149            80


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        177 Jack                 Livingston
JLIVINGS                  011.44.1644.429264   23-APR-06 SA_REP           8400
            .2        149            80

        178 Kimberely            Grant
KGRANT                    011.44.1644.429263   24-MAY-07 SA_REP           7000
           .15        149

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        179 Charles              Johnson
CJOHNSON                  011.44.1644.429262   04-JAN-08 SA_REP           6200
            .1        149            80

        180 Winston              Taylor
WTAYLOR                   650.507.9876         24-JAN-06 SH_CLERK         3200

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      120            50

        181 Jean                 Fleaur
JFLEAUR                   650.507.9877         23-FEB-06 SH_CLERK         3100
                      120            50

        182 Martha               Sullivan

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
MSULLIVA                  650.507.9878         21-JUN-07 SH_CLERK         2500
                      120            50

        183 Girard               Geoni
GGEONI                    650.507.9879         03-FEB-08 SH_CLERK         2800
                      120            50


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        184 Nandita              Sarchand
NSARCHAN                  650.509.1876         27-JAN-04 SH_CLERK         4200
                      121            50

        185 Alexis               Bull
ABULL                     650.509.2876         20-FEB-05 SH_CLERK         4100
                      121            50

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        186 Julia                Dellinger
JDELLING                  650.509.3876         24-JUN-06 SH_CLERK         3400
                      121            50

        187 Anthony              Cabrio
ACABRIO                   650.509.4876         07-FEB-07 SH_CLERK         3000

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      121            50

        188 Kelly                Chung
KCHUNG                    650.505.1876         14-JUN-05 SH_CLERK         3800
                      122            50

        189 Jennifer             Dilly

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
JDILLY                    650.505.2876         13-AUG-05 SH_CLERK         3600
                      122            50

        190 Timothy              Gates
TGATES                    650.505.3876         11-JUL-06 SH_CLERK         2900
                      122            50


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        191 Randall              Perkins
RPERKINS                  650.505.4876         19-DEC-07 SH_CLERK         2500
                      122            50

        192 Sarah                Bell
SBELL                     650.501.1876         04-FEB-04 SH_CLERK         4000
                      123            50

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        193 Britney              Everett
BEVERETT                  650.501.2876         03-MAR-05 SH_CLERK         3900
                      123            50

        194 Samuel               McCain
SMCCAIN                   650.501.3876         01-JUL-06 SH_CLERK         3200

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      123            50

        195 Vance                Jones
VJONES                    650.501.4876         17-MAR-07 SH_CLERK         2800
                      123            50

        196 Alana                Walsh

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
AWALSH                    650.507.9811         24-APR-06 SH_CLERK         3100
                      124            50

        197 Kevin                Feeney
KFEENEY                   650.507.9822         23-MAY-06 SH_CLERK         3000
                      124            50


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        198 Donald               OConnell
DOCONNEL                  650.507.9833         21-JUN-07 SH_CLERK         2600
                      124            50

        199 Douglas              Grant
DGRANT                    650.507.9844         13-JAN-08 SH_CLERK         2600
                      124            50

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        200 Jennifer             Whalen
JWHALEN                   515.123.4444         17-SEP-03 AD_ASST          4400
                      101            10

        201 Michael              Hartstein
MHARTSTE                  515.123.5555         17-FEB-04 MK_MAN          13000

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                      100            20

        202 Pat                  Fay
PFAY                      603.123.6666         17-AUG-05 MK_REP           6000
                      201            20

        203 Susan                Mavris

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
SMAVRIS                   515.123.7777         07-JUN-02 HR_REP           6500
                      101            40

        204 Hermann              Baer
HBAER                     515.123.8888         07-JUN-02 PR_REP          10000
                      101            70


EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        205 Shelley              Higgins
SHIGGINS                  515.123.8080         07-JUN-02 AC_MGR          12008
                      101           110

        206 William              Gietz
WGIETZ                    515.123.8181         07-JUN-02 AC_ACCOUNT       8300
                      205           110

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        400                      NOOR
kznrahmd@gmail.com                             04-MAR-25 IT_PROG         10000
                                     60

        401                      NOOR AHMED
kznrahmd3@gmail.com                            02-MAR-25 IT_PROG         10000

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                                     60

        402                      Noor Ahmed
kznrahmd120225@gmail.com                       04-MAR-25 IT_PROG         10000
                                     60


110 rows selected.

SQL>