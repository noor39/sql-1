
SQL*Plus: Release 19.0.0.0.0 - Production on Mon Mar 17 09:06:10 2025
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Enter user-name: sys
Enter password:
ERROR:
ORA-28009: connection as SYS should be as SYSDBA or SYSOPER


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
SQL> select * from job_history;

EMPLOYEE_ID START_DAT END_DATE  JOB_ID     DEPARTMENT_ID
----------- --------- --------- ---------- -------------
        102 13-JAN-01 24-JUL-06 IT_PROG               60
        101 21-SEP-97 27-OCT-01 AC_ACCOUNT           110
        101 28-OCT-01 15-MAR-05 AC_MGR               110
        201 17-FEB-04 19-DEC-07 MK_REP                20
        114 24-MAR-06 31-DEC-07 ST_CLERK              50
        122 01-JAN-07 31-DEC-07 ST_CLERK              50
        200 17-SEP-95 17-JUN-01 AD_ASST               90
        176 24-MAR-06 31-DEC-06 SA_REP                80
        176 01-JAN-07 31-DEC-07 SA_MAN                80
        200 01-JUL-02 31-DEC-06 AC_ACCOUNT            90

10 rows selected.

SQL> select last_name, salary, job_id from employees
  2  where salary=(select min(salary)
  3  from employees);

LAST_NAME                     SALARY JOB_ID
------------------------- ---------- ----------
Olson                           2100 ST_CLERK

SQL> create table emp2 as select*from employees;
create table emp2 as select*from employees
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object


SQL> select * from emp2
  2  /

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

SQL> desc emp2
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEE_ID                                        NUMBER(6)
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

SQL> desc user constraints
Usage: DESCRIBE [schema.]object[@db_link]
SQL> desc user_constraints
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

SQL> alter table emp2
  2  modify employee_id primary key;

Table altered.

SQL> alter table emp2
  2  add constraint emp_mgr_fk
  3  foreign key(manager_id)
  4  references emp2(employee_id);

Table altered.

SQL> alter table emp2 drop constraint emp_mgr_fk;

Table altered.

SQL> alter table emp2 drop primary key cascade;

Table altered.

SQL> alter table myemp2
  2  drop constraint emp_name_pk ONLINE;
alter table myemp2
*
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> alter table emp2 modify employee_id primary key;

Table altered.

SQL> select constraint_name, constraint_type, table_name from user_constraints where table_name='EMP2';

CONSTRAINT_NAME
--------------------------------------------------------------------------------
C
-
TABLE_NAME
--------------------------------------------------------------------------------
SYS_C007727
C
EMP2

SYS_C007728
C
EMP2

CONSTRAINT_NAME
--------------------------------------------------------------------------------
C
-
TABLE_NAME
--------------------------------------------------------------------------------

SYS_C007729
C
EMP2

SYS_C007730
C

CONSTRAINT_NAME
--------------------------------------------------------------------------------
C
-
TABLE_NAME
--------------------------------------------------------------------------------
EMP2

SYS_C007755
P
EMP2


SQL> set lines 300
SQL> /

CONSTRAINT_NAME                                                                                                                  C TABLE_NAME
-------------------------------------------------------------------------------------------------------------------------------- - --------------------------------------------------------------------------------------------------------------------------------
SYS_C007727                                                                                                                      C EMP2
SYS_C007728                                                                                                                      C EMP2
SYS_C007729                                                                                                                      C EMP2
SYS_C007730                                                                                                                      C EMP2
SYS_C007755                                                                                                                      P EMP2

SQL> desc emp2;
 Name                                                                                                                                                                          Null? Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- --------------------------------------------------------------------------------------------------------------------
 EMPLOYEE_ID                                                                                                                                                                   NOT NULL NUMBER(6)
 FIRST_NAME
                VARCHAR2(20)
 LAST_NAME                                                                                                                                                                     NOT NULL VARCHAR2(25)
 EMAIL                                                                                                                                                                         NOT NULL VARCHAR2(25)
 PHONE_NUMBER
                VARCHAR2(20)
 HIRE_DATE                                                                                                                                                                     NOT NULL DATE
 JOB_ID                                                                                                                                                                        NOT NULL VARCHAR2(10)
 SALARY
                NUMBER(8,2)
 COMMISSION_PCT
                NUMBER(2,2)
 MANAGER_ID
                NUMBER(6)
 DEPARTMENT_ID
                NUMBER(4)

SQL> set lines 399
SQL> /

CONSTRAINT_NAME                                                                                                                  C TABLE_NAME
-------------------------------------------------------------------------------------------------------------------------------- - --------------------------------------------------------------------------------------------------------------------------------
SYS_C007727                                                                                                                      C EMP2
SYS_C007728                                                                                                                      C EMP2
SYS_C007729                                                                                                                      C EMP2
SYS_C007730                                                                                                                      C EMP2
SYS_C007755                                                                                                                      P EMP2

SQL> alter table emp2
  2  add constraint emp_mgr_fk
  3  foreign key(manager_id)
  4  references emp2(employee_id);

Table altered.

SQL> select constraint_name, constraint_type, table_name from user_constraints where table_name='EMP2';

CONSTRAINT_NAME                                                                                                                  C TABLE_NAME
-------------------------------------------------------------------------------------------------------------------------------- - --------------------------------------------------------------------------------------------------------------------------------
EMP_MGR_FK                                                                                                                       R EMP2
SYS_C007727                                                                                                                      C EMP2
SYS_C007728                                                                                                                      C EMP2
SYS_C007729                                                                                                                      C EMP2
SYS_C007730                                                                                                                      C EMP2
SYS_C007755                                                                                                                      P EMP2

6 rows selected.

SQL> create table dept2 as select* from departments;
create table dept2 as select* from departments
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object


SQL> select * from dept2
  2  /

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        100 Steven               King                      SKING                     515.123.4567         17-JUN-03 AD_PRES         24000                                      90
        101 Neena                Kochhar                   NKOCHHAR                  515.123.4568         21-SEP-05 AD_VP           17000                       100            90
        102 Lex                  De Haan                   LDEHAAN                   515.123.4569         13-JAN-01 AD_VP           17000                       100            90
        103 Alexander            Hunold                    AHUNOLD                   590.423.4567         03-JAN-06 IT_PROG          9000                       102            60
        104 Bruce                Ernst                     BERNST                    590.423.4568         21-MAY-07 IT_PROG          6000                       103            60
        105 David                Austin                    DAUSTIN                   590.423.4569         25-JUN-05 IT_PROG          4800                       103            60
        106 Valli                Pataballa                 VPATABAL                  590.423.4560         05-FEB-06 IT_PROG          4800                       103            60
        107 Diana                Lorentz                   DLORENTZ                  590.423.5567         07-FEB-07 IT_PROG          4200                       103            60
        108 Nancy                Greenberg                 NGREENBE                  515.124.4569         17-AUG-02 FI_MGR          12008                       101           100
        109 Daniel               Faviet                    DFAVIET                   515.124.4169         16-AUG-02 FI_ACCOUNT       9000                       108           100
        110 John                 Chen                      JCHEN                     515.124.4269         28-SEP-05 FI_ACCOUNT       8200                       108           100

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        111 Ismael               Sciarra                   ISCIARRA                  515.124.4369         30-SEP-05 FI_ACCOUNT       7700                       108           100
        112 Jose Manuel          Urman                     JMURMAN                   515.124.4469         07-MAR-06 FI_ACCOUNT       7800                       108           100
        113 Luis                 Popp                      LPOPP                     515.124.4567         07-DEC-07 FI_ACCOUNT       6900                       108           100
        114 Den                  Raphaely                  DRAPHEAL                  515.127.4561         07-DEC-02 PU_MAN          11000                       100            30
        115 Alexander            Khoo                      AKHOO                     515.127.4562         18-MAY-03 PU_CLERK         3100                       114            30
        116 Shelli               Baida                     SBAIDA                    515.127.4563         24-DEC-05 PU_CLERK         2900                       114            30
        117 Sigal                Tobias                    STOBIAS                   515.127.4564         24-JUL-05 PU_CLERK         2800                       114            30
        118 Guy                  Himuro                    GHIMURO                   515.127.4565         15-NOV-06 PU_CLERK         2600                       114            30
        119 Karen                Colmenares                KCOLMENA                  515.127.4566         10-AUG-07 PU_CLERK         2500                       114            30
        120 Matthew              Weiss                     MWEISS                    650.123.1234         18-JUL-04 ST_MAN           8000                       100            50
        121 Adam                 Fripp                     AFRIPP                    650.123.2234         10-APR-05 ST_MAN           8200                       100            50

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        122 Payam                Kaufling                  PKAUFLIN                  650.123.3234         01-MAY-03 ST_MAN           7900                       100            50
        123 Shanta               Vollman                   SVOLLMAN                  650.123.4234         10-OCT-05 ST_MAN           6500                       100            50
        124 Kevin                Mourgos                   KMOURGOS                  650.123.5234         16-NOV-07 ST_MAN           5800                       100            50
        125 Julia                Nayer                     JNAYER                    650.124.1214         16-JUL-05 ST_CLERK         3200                       120            50
        126 Irene                Mikkilineni               IMIKKILI                  650.124.1224         28-SEP-06 ST_CLERK         2700                       120            50
        127 James                Landry                    JLANDRY                   650.124.1334         14-JAN-07 ST_CLERK         2400                       120            50
        128 Steven               Markle                    SMARKLE                   650.124.1434         08-MAR-08 ST_CLERK         2200                       120            50
        129 Laura                Bissot                    LBISSOT                   650.124.5234         20-AUG-05 ST_CLERK         3300                       121            50
        130 Mozhe                Atkinson                  MATKINSO                  650.124.6234         30-OCT-05 ST_CLERK         2800                       121            50
        131 James                Marlow                    JAMRLOW                   650.124.7234         16-FEB-05 ST_CLERK         2500                       121            50
        132 TJ                   Olson                     TJOLSON                   650.124.8234         10-APR-07 ST_CLERK         2100                       121            50

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        133 Jason                Mallin                    JMALLIN                   650.127.1934         14-JUN-04 ST_CLERK         3300                       122            50
        134 Michael              Rogers                    MROGERS                   650.127.1834         26-AUG-06 ST_CLERK         2900                       122            50
        135 Ki                   Gee                       KGEE                      650.127.1734         12-DEC-07 ST_CLERK         2400                       122            50
        136 Hazel                Philtanker                HPHILTAN                  650.127.1634         06-FEB-08 ST_CLERK         2200                       122            50
        137 Renske               Ladwig                    RLADWIG                   650.121.1234         14-JUL-03 ST_CLERK         3600                       123            50
        138 Stephen              Stiles                    SSTILES                   650.121.2034         26-OCT-05 ST_CLERK         3200                       123            50
        139 John                 Seo                       JSEO                      650.121.2019         12-FEB-06 ST_CLERK         2700                       123            50
        140 Joshua               Patel                     JPATEL                    650.121.1834         06-APR-06 ST_CLERK         2500                       123            50
        141 Trenna               Rajs                      TRAJS                     650.121.8009         17-OCT-03 ST_CLERK         3500                       124            50
        142 Curtis               Davies                    CDAVIES                   650.121.2994         29-JAN-05 ST_CLERK         3100                       124            50
        143 Randall              Matos                     RMATOS                    650.121.2874         15-MAR-06 ST_CLERK         2600                       124            50

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        144 Peter                Vargas                    PVARGAS                   650.121.2004         09-JUL-06 ST_CLERK         2500                       124            50
        145 John                 Russell                   JRUSSEL                   011.44.1344.429268   01-OCT-04 SA_MAN          14000             .4        100            80
        146 Karen                Partners                  KPARTNER                  011.44.1344.467268   05-JAN-05 SA_MAN          13500             .3        100            80
        147 Alberto              Errazuriz                 AERRAZUR                  011.44.1344.429278   10-MAR-05 SA_MAN          12000             .3        100            80
        148 Gerald               Cambrault                 GCAMBRAU                  011.44.1344.619268   15-OCT-07 SA_MAN          11000             .3        100            80
        149 Eleni                Zlotkey                   EZLOTKEY                  011.44.1344.429018   29-JAN-08 SA_MAN          10500             .2        100            80
        150 Peter                Tucker                    PTUCKER                   011.44.1344.129268   30-JAN-05 SA_REP          10000             .3        145            80
        151 David                Bernstein                 DBERNSTE                  011.44.1344.345268   24-MAR-05 SA_REP           9500            .25        145            80
        152 Peter                Hall                      PHALL                     011.44.1344.478968   20-AUG-05 SA_REP           9000            .25        145            80
        153 Christopher          Olsen                     COLSEN                    011.44.1344.498718   30-MAR-06 SA_REP           8000             .2        145            80
        154 Nanette              Cambrault                 NCAMBRAU                  011.44.1344.987668   09-DEC-06 SA_REP           7500             .2        145            80

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        155 Oliver               Tuvault                   OTUVAULT                  011.44.1344.486508   23-NOV-07 SA_REP           7000            .15        145            80
        156 Janette              King                      JKING                     011.44.1345.429268   30-JAN-04 SA_REP          10000            .35        146            80
        157 Patrick              Sully                     PSULLY                    011.44.1345.929268   04-MAR-04 SA_REP           9500            .35        146            80
        158 Allan                McEwen                    AMCEWEN                   011.44.1345.829268   01-AUG-04 SA_REP           9000            .35        146            80
        159 Lindsey              Smith                     LSMITH                    011.44.1345.729268   10-MAR-05 SA_REP           8000             .3        146            80
        160 Louise               Doran                     LDORAN                    011.44.1345.629268   15-DEC-05 SA_REP           7500             .3        146            80
        161 Sarath               Sewall                    SSEWALL                   011.44.1345.529268   03-NOV-06 SA_REP           7000            .25        146            80
        162 Clara                Vishney                   CVISHNEY                  011.44.1346.129268   11-NOV-05 SA_REP          10500            .25        147            80
        163 Danielle             Greene                    DGREENE                   011.44.1346.229268   19-MAR-07 SA_REP           9500            .15        147            80
        164 Mattea               Marvins                   MMARVINS                  011.44.1346.329268   24-JAN-08 SA_REP           7200             .1        147            80
        165 David                Lee                       DLEE                      011.44.1346.529268   23-FEB-08 SA_REP           6800             .1        147            80

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        166 Sundar               Ande                      SANDE                     011.44.1346.629268   24-MAR-08 SA_REP           6400             .1        147            80
        167 Amit                 Banda                     ABANDA                    011.44.1346.729268   21-APR-08 SA_REP           6200             .1        147            80
        168 Lisa                 Ozer                      LOZER                     011.44.1343.929268   11-MAR-05 SA_REP          11500            .25        148            80
        169 Harrison             Bloom                     HBLOOM                    011.44.1343.829268   23-MAR-06 SA_REP          10000             .2        148            80
        170 Tayler               Fox                       TFOX                      011.44.1343.729268   24-JAN-06 SA_REP           9600             .2        148            80
        171 William              Smith                     WSMITH                    011.44.1343.629268   23-FEB-07 SA_REP           7400            .15        148            80
        172 Elizabeth            Bates                     EBATES                    011.44.1343.529268   24-MAR-07 SA_REP           7300            .15        148            80
        173 Sundita              Kumar                     SKUMAR                    011.44.1343.329268   21-APR-08 SA_REP           6100             .1        148            80
        174 Ellen                Abel                      EABEL                     011.44.1644.429267   11-MAY-04 SA_REP          11000             .3        149            80
        175 Alyssa               Hutton                    AHUTTON                   011.44.1644.429266   19-MAR-05 SA_REP           8800            .25        149            80
        176 Jonathon             Taylor                    JTAYLOR                   011.44.1644.429265   24-MAR-06 SA_REP           8600             .2        149            80

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        177 Jack                 Livingston                JLIVINGS                  011.44.1644.429264   23-APR-06 SA_REP           8400             .2        149            80
        178 Kimberely            Grant                     KGRANT                    011.44.1644.429263   24-MAY-07 SA_REP           7000            .15        149
        179 Charles              Johnson                   CJOHNSON                  011.44.1644.429262   04-JAN-08 SA_REP           6200             .1        149            80
        180 Winston              Taylor                    WTAYLOR                   650.507.9876         24-JAN-06 SH_CLERK         3200                       120            50
        181 Jean                 Fleaur                    JFLEAUR                   650.507.9877         23-FEB-06 SH_CLERK         3100                       120            50
        182 Martha               Sullivan                  MSULLIVA                  650.507.9878         21-JUN-07 SH_CLERK         2500                       120            50
        183 Girard               Geoni                     GGEONI                    650.507.9879         03-FEB-08 SH_CLERK         2800                       120            50
        184 Nandita              Sarchand                  NSARCHAN                  650.509.1876         27-JAN-04 SH_CLERK         4200                       121            50
        185 Alexis               Bull                      ABULL                     650.509.2876         20-FEB-05 SH_CLERK         4100                       121            50
        186 Julia                Dellinger                 JDELLING                  650.509.3876         24-JUN-06 SH_CLERK         3400                       121            50
        187 Anthony              Cabrio                    ACABRIO                   650.509.4876         07-FEB-07 SH_CLERK         3000                       121            50

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        188 Kelly                Chung                     KCHUNG                    650.505.1876         14-JUN-05 SH_CLERK         3800                       122            50
        189 Jennifer             Dilly                     JDILLY                    650.505.2876         13-AUG-05 SH_CLERK         3600                       122            50
        190 Timothy              Gates                     TGATES                    650.505.3876         11-JUL-06 SH_CLERK         2900                       122            50
        191 Randall              Perkins                   RPERKINS                  650.505.4876         19-DEC-07 SH_CLERK         2500                       122            50
        192 Sarah                Bell                      SBELL                     650.501.1876         04-FEB-04 SH_CLERK         4000                       123            50
        193 Britney              Everett                   BEVERETT                  650.501.2876         03-MAR-05 SH_CLERK         3900                       123            50
        194 Samuel               McCain                    SMCCAIN                   650.501.3876         01-JUL-06 SH_CLERK         3200                       123            50
        195 Vance                Jones                     VJONES                    650.501.4876         17-MAR-07 SH_CLERK         2800                       123            50
        196 Alana                Walsh                     AWALSH                    650.507.9811         24-APR-06 SH_CLERK         3100                       124            50
        197 Kevin                Feeney                    KFEENEY                   650.507.9822         23-MAY-06 SH_CLERK         3000                       124            50
        198 Donald               OConnell                  DOCONNEL                  650.507.9833         21-JUN-07 SH_CLERK         2600                       124            50

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- --------- ---------- ---------- -------------- ---------- -------------
        199 Douglas              Grant                     DGRANT                    650.507.9844         13-JAN-08 SH_CLERK         2600                       124            50
        200 Jennifer             Whalen                    JWHALEN                   515.123.4444         17-SEP-03 AD_ASST          4400                       101            10
        201 Michael              Hartstein                 MHARTSTE                  515.123.5555         17-FEB-04 MK_MAN          13000                       100            20
        202 Pat                  Fay                       PFAY                      603.123.6666         17-AUG-05 MK_REP           6000                       201            20
        203 Susan                Mavris                    SMAVRIS                   515.123.7777         07-JUN-02 HR_REP           6500                       101            40
        204 Hermann              Baer                      HBAER                     515.123.8888         07-JUN-02 PR_REP          10000                       101            70
        205 Shelley              Higgins                   SHIGGINS                  515.123.8080         07-JUN-02 AC_MGR          12008                       101           110
        206 William              Gietz                     WGIETZ                    515.123.8181         07-JUN-02 AC_ACCOUNT       8300                       205           110
        400                      NOOR                      kznrahmd@gmail.com                             04-MAR-25 IT_PROG         10000                                      60
        401                      NOOR AHMED                kznrahmd3@gmail.com                            02-MAR-25 IT_PROG         10000                                      60
        402                      Noor Ahmed                kznrahmd120225@gmail.com                       04-MAR-25 IT_PROG         10000                                      60

110 rows selected.

SQL> alter table dept2
  2  add primary key(department_id);
add primary key(department_id)
                *
ERROR at line 2:
ORA-01449: column contains NULL values; cannot alter to NOT NULL


SQL> alter table dept2 add primary key(department_id);
alter table dept2 add primary key(department_id)
                                  *
ERROR at line 1:
ORA-01449: column contains NULL values; cannot alter to NOT NULL


SQL> alter table dept2 add primary key (deartment_id);
alter table dept2 add primary key (deartment_id)
                                   *
ERROR at line 1:
ORA-00904: "DEARTMENT_ID": invalid identifier


SQL> drop table dept2
  2  /

Table dropped.

SQL> commit
  2  /

Commit complete.

SQL> create table dept2 from departments;
create table dept2 from departments
                   *
ERROR at line 1:
ORA-00922: missing or invalid option


SQL> ed
Wrote file afiedt.buf

  1* create table dept2 as select * from departments
SQL> /

Table created.

SQL> alter table dept2
  2  add primary key(department_id);

Table altered.

SQL> desc departments
 Name
                                                                  Null?    Type
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------
 DEPARTMENT_ID
                                                                  NOT NULL NUMBER(4)
 DEPARTMENT_NAME
                                                                  NOT NULL VARCHAR2(30)
 MANAGER_ID
                                                                           NUMBER(6)
 LOCATION_ID
                                                                           NUMBER(4)

SQL> desc dept2
 Name
                                                                  Null?    Type
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------
 DEPARTMENT_ID
                                                                  NOT NULL NUMBER(4)
 DEPARTMENT_NAME
                                                                  NOT NULL VARCHAR2(30)
 MANAGER_ID
                                                                           NUMBER(6)
 LOCATION_ID
                                                                           NUMBER(4)

SQL> select constraint_name, constraint_type, table_name from user_constraints
  2  where table_name='dept';

no rows selected

SQL> select  constraint_name, consrtaint_type, table_name
  2  from user constraints where table_name='de
  3  /
ERROR:
ORA-01756: quoted string not properly terminated


SQL> select department_name, city
  2  from departments natural join
  3  (select l.location_id,l.city,l.country_id
  4  from locations l join countries c
  5  on(l.country_id=c.country_id)
  6  join regions
  7  using(region_id)
  8  where region_name='Europe')
  9  /

DEPARTMENT_NAME                CITY
------------------------------ ------------------------------
Human Resources                London
Sales                          Oxford
Public Relations               Munich

SQL> select department_name, city from departments Natural join
  2  (select l.location_id, l.city, l.country_id
  3  from locations l join countries c
  4  on(l.country_id=c.country_id)
  5  join regions
  6  using(region_id) where region_name='Europe')
  7  /

DEPARTMENT_NAME                CITY
------------------------------ ------------------------------
Human Resources                London
Sales                          Oxford
Public Relations               Munich

SQL> select employee_id, manager_id, department_id
  2  from employees
  3  where (manager_id, department_id) IN
  4  (select manager_id, department_id from employees
  5  where employee_id in (174,199))
  6  and employee_id not in (174,199);

EMPLOYEE_ID MANAGER_ID DEPARTMENT_ID
----------- ---------- -------------
        141        124            50
        142        124            50
        143        124            50
        144        124            50
        196        124            50
        197        124            50
        198        124            50
        175        149            80
        176        149            80
        177        149            80
        179        149            80

11 rows selected.

SQL> select emplyee_id, manager_id, department_id from employees
  2  where(manager_Id, department_id) in (select manager_id,department_id
  3  from employees
  4  where employee_id in(174,199))
  5  and employee_id not in (174,199);
select emplyee_id, manager_id, department_id from employees
       *
ERROR at line 1:
ORA-00904: "EMPLYEE_ID": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  select emplyee_id, manager_id, department_id
  2  from employees
  3  where(manager_Id, department_id) in (select manager_id,department_id
  4  from employees
  5  where employee_id in(174,199))
  6* and employee_id not in (174,199)
SQL> /
select emplyee_id, manager_id, department_id
       *
ERROR at line 1:
ORA-00904: "EMPLYEE_ID": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1  select employee_id, manager_id, department_id
  2  from employees
  3  where(manager_Id, department_id) in (select manager_id,department_id
  4  from employees
  5  where employee_id in(174,199))
  6* and employee_id not in (174,199)
SQL> /

EMPLOYEE_ID MANAGER_ID DEPARTMENT_ID
----------- ---------- -------------
        141        124            50
        142        124            50
        143        124            50
        144        124            50
        196        124            50
        197        124            50
        198        124            50
        175        149            80
        176        149            80
        177        149            80
        179        149            80

11 rows selected.

SQL> select employee_id, manager_id, department_id
  2  from employees
  3  where manager_id IN(
  4  select manager_id
  5  from employees
  6  where employee_id in(174,141))
  7  and department_id in
  8  (select department_id
  9  from employees
 10  where employee_id in (174,141))
 11  and employee_id not in (174,141);

EMPLOYEE_ID MANAGER_ID DEPARTMENT_ID
----------- ---------- -------------
        142        124            50
        143        124            50
        144        124            50
        196        124            50
        197        124            50
        198        124            50
        199        124            50
        175        149            80
        176        149            80
        177        149            80
        179        149            80

11 rows selected.

SQL> select employee_id, last_name,
  2  (CASE
  3  when department_id=
  4  (select department_id
  5  from departments
  6  where location_id=1800)
  7  then 'Canada' ELSE 'USA' END) location
  8  FROM employees;

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        100 King                      USA
        101 Kochhar                   USA
        102 De Haan                   USA
        103 Hunold                    USA
        104 Ernst                     USA
        105 Austin                    USA
        106 Pataballa                 USA
        107 Lorentz                   USA
        108 Greenberg                 USA
        109 Faviet                    USA
        110 Chen                      USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        111 Sciarra                   USA
        112 Urman                     USA
        113 Popp                      USA
        114 Raphaely                  USA
        115 Khoo                      USA
        116 Baida                     USA
        117 Tobias                    USA
        118 Himuro                    USA
        119 Colmenares                USA
        120 Weiss                     USA
        121 Fripp                     USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        122 Kaufling                  USA
        123 Vollman                   USA
        124 Mourgos                   USA
        125 Nayer                     USA
        126 Mikkilineni               USA
        127 Landry                    USA
        128 Markle                    USA
        129 Bissot                    USA
        130 Atkinson                  USA
        131 Marlow                    USA
        132 Olson                     USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        133 Mallin                    USA
        134 Rogers                    USA
        135 Gee                       USA
        136 Philtanker                USA
        137 Ladwig                    USA
        138 Stiles                    USA
        139 Seo                       USA
        140 Patel                     USA
        141 Rajs                      USA
        142 Davies                    USA
        143 Matos                     USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        144 Vargas                    USA
        145 Russell                   USA
        146 Partners                  USA
        147 Errazuriz                 USA
        148 Cambrault                 USA
        149 Zlotkey                   USA
        150 Tucker                    USA
        151 Bernstein                 USA
        152 Hall                      USA
        153 Olsen                     USA
        154 Cambrault                 USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        155 Tuvault                   USA
        156 King                      USA
        157 Sully                     USA
        158 McEwen                    USA
        159 Smith                     USA
        160 Doran                     USA
        161 Sewall                    USA
        162 Vishney                   USA
        163 Greene                    USA
        164 Marvins                   USA
        165 Lee                       USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        166 Ande                      USA
        167 Banda                     USA
        168 Ozer                      USA
        169 Bloom                     USA
        170 Fox                       USA
        171 Smith                     USA
        172 Bates                     USA
        173 Kumar                     USA
        174 Abel                      USA
        175 Hutton                    USA
        176 Taylor                    USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        177 Livingston                USA
        178 Grant                     USA
        179 Johnson                   USA
        180 Taylor                    USA
        181 Fleaur                    USA
        182 Sullivan                  USA
        183 Geoni                     USA
        184 Sarchand                  USA
        185 Bull                      USA
        186 Dellinger                 USA
        187 Cabrio                    USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        188 Chung                     USA
        189 Dilly                     USA
        190 Gates                     USA
        191 Perkins                   USA
        192 Bell                      USA
        193 Everett                   USA
        194 McCain                    USA
        195 Jones                     USA
        196 Walsh                     USA
        197 Feeney                    USA
        198 OConnell                  USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        199 Grant                     USA
        200 Whalen                    USA
        201 Hartstein                 Canada
        202 Fay                       Canada
        203 Mavris                    USA
        204 Baer                      USA
        205 Higgins                   USA
        206 Gietz                     USA
        400 NOOR                      USA
        401 NOOR AHMED                USA
        402 Noor Ahmed                USA

110 rows selected.

SQL> select department_id, department_name,
  2  (select count(*)
  3  from employees e
  4  where e.department_id=d.department_id) as emp_count
  5  from departments d;

DEPARTMENT_ID DEPARTMENT_NAME                 EMP_COUNT
------------- ------------------------------ ----------
           10 Administration                          1
           20 Marketing                               2
           30 Purchasing                              6
           40 Human Resources                         1
           50 Shipping                               45
           60 IT                                      8
           70 Public Relations                        1
           80 Sales                                  34
           90 Executive                               3
          100 Finance                                 6
          110 Accounting                              2

DEPARTMENT_ID DEPARTMENT_NAME                 EMP_COUNT
------------- ------------------------------ ----------
          120 Treasury                                0
          130 Corporate Tax                           0
          140 Control And Credit                      0
          150 Shareholder Services                    0
          160 Benefits                                0
          170 Manufacturing                           0
          180 Construction                            0
          190 Contracting                             0
          200 Operations                              0
          210 IT Support                              0
          220 NOC                                     0

DEPARTMENT_ID DEPARTMENT_NAME                 EMP_COUNT
------------- ------------------------------ ----------
          230 IT Helpdesk                             0
          240 Government Sales                        0
          250 Retail Sales                            0
          260 Recruiting                              0
          270 Payroll                                 0
          600 Test_dept1                              0
          610 Test_dept2                              0
          620 Test_dept3                              0
          630 Test_dept4                              0
          300 NOC                                     0
          310 ROC                                     0

33 rows selected.

SQL> select department_id, department_name,
  2  (select count(*)
  3  from employees e
  4  where e.department_id =d.department_id) as emp_count
  5  from departments d;

DEPARTMENT_ID DEPARTMENT_NAME                 EMP_COUNT
------------- ------------------------------ ----------
           10 Administration                          1
           20 Marketing                               2
           30 Purchasing                              6
           40 Human Resources                         1
           50 Shipping                               45
           60 IT                                      8
           70 Public Relations                        1
           80 Sales                                  34
           90 Executive                               3
          100 Finance                                 6
          110 Accounting                              2

DEPARTMENT_ID DEPARTMENT_NAME                 EMP_COUNT
------------- ------------------------------ ----------
          120 Treasury                                0
          130 Corporate Tax                           0
          140 Control And Credit                      0
          150 Shareholder Services                    0
          160 Benefits                                0
          170 Manufacturing                           0
          180 Construction                            0
          190 Contracting                             0
          200 Operations                              0
          210 IT Support                              0
          220 NOC                                     0

DEPARTMENT_ID DEPARTMENT_NAME                 EMP_COUNT
------------- ------------------------------ ----------
          230 IT Helpdesk                             0
          240 Government Sales                        0
          250 Retail Sales                            0
          260 Recruiting                              0
          270 Payroll                                 0
          600 Test_dept1                              0
          610 Test_dept2                              0
          620 Test_dept3                              0
          630 Test_dept4                              0
          300 NOC                                     0
          310 ROC                                     0

33 rows selected.

SQL> select employee_id, last_name,
  2  (case
  3  when department_id-
  4  (select department_id
  5  from departments
  6  where location_id=1800)
  7  then 'Canada' else 'USA' end) location
  8  from employees;
then 'Canada' else 'USA' end) location
*
ERROR at line 7:
ORA-00920: invalid relational operator


SQL> ed
Wrote file afiedt.buf

  1  select employee_id, last_name,
  2  (case
  3  when department_id-
  4  (select department_id
  5  from departments
  6  where location_id=1800)
  7  THEN 'Canada' else 'USA' end) location
  8* from employees
SQL> /
THEN 'Canada' else 'USA' end) location
*
ERROR at line 7:
ORA-00920: invalid relational operator


SQL> ed
Wrote file afiedt.buf

  1  select employee_id, last_name,
  2  (case
  3  when department_id=
  4  (select department_id
  5  from departments
  6  where location_id=1800)
  7  THEN 'Canada' else 'USA' end) location
  8* from employees
SQL> /

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        100 King                      USA
        101 Kochhar                   USA
        102 De Haan                   USA
        103 Hunold                    USA
        104 Ernst                     USA
        105 Austin                    USA
        106 Pataballa                 USA
        107 Lorentz                   USA
        108 Greenberg                 USA
        109 Faviet                    USA
        110 Chen                      USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        111 Sciarra                   USA
        112 Urman                     USA
        113 Popp                      USA
        114 Raphaely                  USA
        115 Khoo                      USA
        116 Baida                     USA
        117 Tobias                    USA
        118 Himuro                    USA
        119 Colmenares                USA
        120 Weiss                     USA
        121 Fripp                     USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        122 Kaufling                  USA
        123 Vollman                   USA
        124 Mourgos                   USA
        125 Nayer                     USA
        126 Mikkilineni               USA
        127 Landry                    USA
        128 Markle                    USA
        129 Bissot                    USA
        130 Atkinson                  USA
        131 Marlow                    USA
        132 Olson                     USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        133 Mallin                    USA
        134 Rogers                    USA
        135 Gee                       USA
        136 Philtanker                USA
        137 Ladwig                    USA
        138 Stiles                    USA
        139 Seo                       USA
        140 Patel                     USA
        141 Rajs                      USA
        142 Davies                    USA
        143 Matos                     USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        144 Vargas                    USA
        145 Russell                   USA
        146 Partners                  USA
        147 Errazuriz                 USA
        148 Cambrault                 USA
        149 Zlotkey                   USA
        150 Tucker                    USA
        151 Bernstein                 USA
        152 Hall                      USA
        153 Olsen                     USA
        154 Cambrault                 USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        155 Tuvault                   USA
        156 King                      USA
        157 Sully                     USA
        158 McEwen                    USA
        159 Smith                     USA
        160 Doran                     USA
        161 Sewall                    USA
        162 Vishney                   USA
        163 Greene                    USA
        164 Marvins                   USA
        165 Lee                       USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        166 Ande                      USA
        167 Banda                     USA
        168 Ozer                      USA
        169 Bloom                     USA
        170 Fox                       USA
        171 Smith                     USA
        172 Bates                     USA
        173 Kumar                     USA
        174 Abel                      USA
        175 Hutton                    USA
        176 Taylor                    USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        177 Livingston                USA
        178 Grant                     USA
        179 Johnson                   USA
        180 Taylor                    USA
        181 Fleaur                    USA
        182 Sullivan                  USA
        183 Geoni                     USA
        184 Sarchand                  USA
        185 Bull                      USA
        186 Dellinger                 USA
        187 Cabrio                    USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        188 Chung                     USA
        189 Dilly                     USA
        190 Gates                     USA
        191 Perkins                   USA
        192 Bell                      USA
        193 Everett                   USA
        194 McCain                    USA
        195 Jones                     USA
        196 Walsh                     USA
        197 Feeney                    USA
        198 OConnell                  USA

EMPLOYEE_ID LAST_NAME                 LOCATI
----------- ------------------------- ------
        199 Grant                     USA
        200 Whalen                    USA
        201 Hartstein                 Canada
        202 Fay                       Canada
        203 Mavris                    USA
        204 Baer                      USA
        205 Higgins                   USA
        206 Gietz                     USA
        400 NOOR                      USA
        401 NOOR AHMED                USA
        402 Noor Ahmed                USA

110 rows selected.

SQL> select last_name, salary, department_id
  2  from employees outer_table
  3  where salary>
  4  (select avg(salary)
  5  from employees inner_table
  6  where inner_table.department_id=outer_table.department_id);

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
King                           24000            90
Hunold                          9000            60
Greenberg                      12008           100
Faviet                          9000           100
Raphaely                       11000            30
Weiss                           8000            50
Fripp                           8200            50
Kaufling                        7900            50
Vollman                         6500            50
Mourgos                         5800            50
Ladwig                          3600            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Rajs                            3500            50
Russell                        14000            80
Partners                       13500            80
Errazuriz                      12000            80
Cambrault                      11000            80
Zlotkey                        10500            80
Tucker                         10000            80
Bernstein                       9500            80
Hall                            9000            80
King                           10000            80
Sully                           9500            80

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
McEwen                          9000            80
Vishney                        10500            80
Greene                          9500            80
Ozer                           11500            80
Bloom                          10000            80
Fox                             9600            80
Abel                           11000            80
Sarchand                        4200            50
Bull                            4100            50
Chung                           3800            50
Dilly                           3600            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Bell                            4000            50
Everett                         3900            50
Hartstein                      13000            20
Higgins                        12008           110
NOOR                           10000            60
NOOR AHMED                     10000            60
Noor Ahmed                     10000            60

40 rows selected.

SQL> select department_id, employee_id, salary
  2  from employees e
  3  where 1=
  4  (select count(distinct salary)
  5  from employees
  6  where e.department_id=department_id
  7  and e.salary<=salary);

DEPARTMENT_ID EMPLOYEE_ID     SALARY
------------- ----------- ----------
           90         100      24000
          100         108      12008
           30         114      11000
           50         121       8200
           80         145      14000
           10         200       4400
           20         201      13000
           40         203       6500
           70         204      10000
          110         205      12008
           60         400      10000

DEPARTMENT_ID EMPLOYEE_ID     SALARY
------------- ----------- ----------
           60         401      10000
           60         402      10000

13 rows selected.

SQL> select employee_id, last_name, job_id, deparment_id
  2  from employees outer
  3  where exists(select null
  4  from employees
  5  where manager_id=outer.employee_id);
select employee_id, last_name, job_id, deparment_id
                                       *
ERROR at line 1:
ORA-00904: "DEPARMENT_ID": invalid identifier


SQL> select employee_id, last_name, job_id, department_id
  2  from employees outer
  3  where exists (select null
  4  from employees
  5  where manager_id=outer.employee_id);

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        100 King                      AD_PRES               90
        101 Kochhar                   AD_VP                 90
        102 De Haan                   AD_VP                 90
        103 Hunold                    IT_PROG               60
        108 Greenberg                 FI_MGR               100
        114 Raphaely                  PU_MAN                30
        120 Weiss                     ST_MAN                50
        121 Fripp                     ST_MAN                50
        122 Kaufling                  ST_MAN                50
        123 Vollman                   ST_MAN                50
        124 Mourgos                   ST_MAN                50

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        145 Russell                   SA_MAN                80
        146 Partners                  SA_MAN                80
        147 Errazuriz                 SA_MAN                80
        148 Cambrault                 SA_MAN                80
        149 Zlotkey                   SA_MAN                80
        201 Hartstein                 MK_MAN                20
        205 Higgins                   AC_MGR               110

18 rows selected.

SQL> select deparment_id, department_name
  2  from departments d
  3  where not exists(select null
  4  from employees
  5  where department_id =d.department_id);
select deparment_id, department_name
       *
ERROR at line 1:
ORA-00904: "DEPARMENT_ID": invalid identifier


SQL> select department_id, department_name
  2  from departments d
  3  where not exists (select null
  4  from employees
  5  where department_id=d.department_id);

DEPARTMENT_ID DEPARTMENT_NAME
------------- ------------------------------
          120 Treasury
          130 Corporate Tax
          140 Control And Credit
          150 Shareholder Services
          160 Benefits
          170 Manufacturing
          180 Construction
          190 Contracting
          200 Operations
          210 IT Support
          220 NOC

DEPARTMENT_ID DEPARTMENT_NAME
------------- ------------------------------
          230 IT Helpdesk
          240 Government Sales
          250 Retail Sales
          260 Recruiting
          270 Payroll
          600 Test_dept1
          610 Test_dept2
          620 Test_dept3
          630 Test_dept4
          300 NOC
          310 ROC

22 rows selected.

SQL> select department_id, department_name
  2  from departments where department_id not in(select department_id
  3  from employees);

no rows selected

SQL> select department_id, department_name
  2  from departments
  3  where department_id not in (select department_id
  4  from employees);

no rows selected

SQL> with cnt_dept as (select department_id, count(1) num_emp
  2  from employees
  3  group by  department_id;
group by  department_id
                      *
ERROR at line 3:
ORA-00907: missing right parenthesis


SQL> select employee_id, last_name, dapartment_id from employees ;
select employee_id, last_name, dapartment_id from employees
                               *
ERROR at line 1:
ORA-00904: "DAPARTMENT_ID": invalid identifier


SQL> ed
Wrote file afiedt.buf

  1* select employee_id, last_name, department_id from employees
SQL> /

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID
----------- ------------------------- -------------
        100 King                                 90
        101 Kochhar                              90
        102 De Haan                              90
        103 Hunold                               60
        104 Ernst                                60
        105 Austin                               60
        106 Pataballa                            60
        107 Lorentz                              60
        108 Greenberg                           100
        109 Faviet                              100
        110 Chen                                100

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID
----------- ------------------------- -------------
        111 Sciarra                             100
        112 Urman                               100
        113 Popp                                100
        114 Raphaely                             30
        115 Khoo                                 30
        116 Baida                                30
        117 Tobias                               30
        118 Himuro                               30
        119 Colmenares                           30
        120 Weiss                                50
        121 Fripp                                50

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID
----------- ------------------------- -------------
        122 Kaufling                             50
        123 Vollman                              50
        124 Mourgos                              50
        125 Nayer                                50
        126 Mikkilineni                          50
        127 Landry                               50
        128 Markle                               50
        129 Bissot                               50
        130 Atkinson                             50
        131 Marlow                               50
        132 Olson                                50

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID
----------- ------------------------- -------------
        133 Mallin                               50
        134 Rogers                               50
        135 Gee                                  50
        136 Philtanker                           50
        137 Ladwig                               50
        138 Stiles                               50
        139 Seo                                  50
        140 Patel                                50
        141 Rajs                                 50
        142 Davies                               50
        143 Matos                                50

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID
----------- ------------------------- -------------
        144 Vargas                               50
        145 Russell                              80
        146 Partners                             80
        147 Errazuriz                            80
        148 Cambrault                            80
        149 Zlotkey                              80
        150 Tucker                               80
        151 Bernstein                            80
        152 Hall                                 80
        153 Olsen                                80
        154 Cambrault                            80

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID
----------- ------------------------- -------------
        155 Tuvault                              80
        156 King                                 80
        157 Sully                                80
        158 McEwen                               80
        159 Smith                                80
        160 Doran                                80
        161 Sewall                               80
        162 Vishney                              80
        163 Greene                               80
        164 Marvins                              80
        165 Lee                                  80

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID
----------- ------------------------- -------------
        166 Ande                                 80
        167 Banda                                80
        168 Ozer                                 80
        169 Bloom                                80
        170 Fox                                  80
        171 Smith                                80
        172 Bates                                80
        173 Kumar                                80
        174 Abel                                 80
        175 Hutton                               80
        176 Taylor                               80

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID
----------- ------------------------- -------------
        177 Livingston                           80
        178 Grant
        179 Johnson                              80
        180 Taylor                               50
        181 Fleaur                               50
        182 Sullivan                             50
        183 Geoni                                50
        184 Sarchand                             50
        185 Bull                                 50
        186 Dellinger                            50
        187 Cabrio                               50

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID
----------- ------------------------- -------------
        188 Chung                                50
        189 Dilly                                50
        190 Gates                                50
        191 Perkins                              50
        192 Bell                                 50
        193 Everett                              50
        194 McCain                               50
        195 Jones                                50
        196 Walsh                                50
        197 Feeney                               50
        198 OConnell                             50

EMPLOYEE_ID LAST_NAME                 DEPARTMENT_ID
----------- ------------------------- -------------
        199 Grant                                50
        200 Whalen                               10
        201 Hartstein                            20
        202 Fay                                  20
        203 Mavris                               40
        204 Baer                                 70
        205 Higgins                             110
        206 Gietz                               110
        400 NOOR                                 60
        401 NOOR AHMED                           60
        402 Noor Ahmed                           60

110 rows selected.

SQL> select department_id, avg(salary)
  2  from meployees
  3  group by department_id;
from meployees
     *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> ed
Wrote file afiedt.buf

  1  select department_id, avg(salary)
  2  from employees
  3* group by department_id
SQL> /

DEPARTMENT_ID AVG(SALARY)
------------- -----------
           50  3475.55556
           40        6500
          110       10154
           90  19333.3333
           30        4150
           70       10000
                     7000
           10        4400
           20        9500
           60        7350
          100  8601.33333

DEPARTMENT_ID AVG(SALARY)
------------- -----------
           80  8955.88235

12 rows selected.

SQL> select last_name, salary, department_id
  2  from employees
  3  outer_table where salary>(select emplo
  4  /
outer_table where salary>(select emplo
                          *
ERROR at line 3:
ORA-00921: unexpected end of SQL command


SQL> select last_name, salary, department_id
  2  from meployees outer_table
  3  where salary>(select avg(salary)
  4  from employees inner_table
  5  where inner_table.department_id=outer_table.department_id);
from meployees outer_table
     *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> ed
Wrote file afiedt.buf

  1  select last_name, salary, department_id
  2  from employees outer_table
  3  where salary>(select avg(salary)
  4  from employees inner_table
  5* where inner_table.department_id=outer_table.department_id)
SQL> /

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
King                           24000            90
Hunold                          9000            60
Greenberg                      12008           100
Faviet                          9000           100
Raphaely                       11000            30
Weiss                           8000            50
Fripp                           8200            50
Kaufling                        7900            50
Vollman                         6500            50
Mourgos                         5800            50
Ladwig                          3600            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Rajs                            3500            50
Russell                        14000            80
Partners                       13500            80
Errazuriz                      12000            80
Cambrault                      11000            80
Zlotkey                        10500            80
Tucker                         10000            80
Bernstein                       9500            80
Hall                            9000            80
King                           10000            80
Sully                           9500            80

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
McEwen                          9000            80
Vishney                        10500            80
Greene                          9500            80
Ozer                           11500            80
Bloom                          10000            80
Fox                             9600            80
Abel                           11000            80
Sarchand                        4200            50
Bull                            4100            50
Chung                           3800            50
Dilly                           3600            50

LAST_NAME                     SALARY DEPARTMENT_ID
------------------------- ---------- -------------
Bell                            4000            50
Everett                         3900            50
Hartstein                      13000            20
Higgins                        12008           110
NOOR                           10000            60
NOOR AHMED                     10000            60
Noor Ahmed                     10000            60

40 rows selected.

SQL>
SQL> select employee_id, last_name, job_id, department_id
  2  from employees outer where exists (select employee_id from employees where manager_id= outer. employee_id)
  3  /

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        100 King                      AD_PRES               90
        101 Kochhar                   AD_VP                 90
        102 De Haan                   AD_VP                 90
        103 Hunold                    IT_PROG               60
        108 Greenberg                 FI_MGR               100
        114 Raphaely                  PU_MAN                30
        120 Weiss                     ST_MAN                50
        121 Fripp                     ST_MAN                50
        122 Kaufling                  ST_MAN                50
        123 Vollman                   ST_MAN                50
        124 Mourgos                   ST_MAN                50

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        145 Russell                   SA_MAN                80
        146 Partners                  SA_MAN                80
        147 Errazuriz                 SA_MAN                80
        148 Cambrault                 SA_MAN                80
        149 Zlotkey                   SA_MAN                80
        201 Hartstein                 MK_MAN                20
        205 Higgins                   AC_MGR               110

18 rows selected.

SQL> ed
Wrote file afiedt.buf

  1  select employee_id, last_name, job_id, department_id
  2* from employees outer where not exists (select employee_id from employees where manager_id= outer. employee_id)
SQL> /

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        104 Ernst                     IT_PROG               60
        105 Austin                    IT_PROG               60
        106 Pataballa                 IT_PROG               60
        107 Lorentz                   IT_PROG               60
        109 Faviet                    FI_ACCOUNT           100
        110 Chen                      FI_ACCOUNT           100
        111 Sciarra                   FI_ACCOUNT           100
        112 Urman                     FI_ACCOUNT           100
        113 Popp                      FI_ACCOUNT           100
        115 Khoo                      PU_CLERK              30
        116 Baida                     PU_CLERK              30

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        117 Tobias                    PU_CLERK              30
        118 Himuro                    PU_CLERK              30
        119 Colmenares                PU_CLERK              30
        125 Nayer                     ST_CLERK              50
        126 Mikkilineni               ST_CLERK              50
        127 Landry                    ST_CLERK              50
        128 Markle                    ST_CLERK              50
        129 Bissot                    ST_CLERK              50
        130 Atkinson                  ST_CLERK              50
        131 Marlow                    ST_CLERK              50
        132 Olson                     ST_CLERK              50

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        133 Mallin                    ST_CLERK              50
        134 Rogers                    ST_CLERK              50
        135 Gee                       ST_CLERK              50
        136 Philtanker                ST_CLERK              50
        137 Ladwig                    ST_CLERK              50
        138 Stiles                    ST_CLERK              50
        139 Seo                       ST_CLERK              50
        140 Patel                     ST_CLERK              50
        141 Rajs                      ST_CLERK              50
        142 Davies                    ST_CLERK              50
        143 Matos                     ST_CLERK              50

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        144 Vargas                    ST_CLERK              50
        150 Tucker                    SA_REP                80
        151 Bernstein                 SA_REP                80
        152 Hall                      SA_REP                80
        153 Olsen                     SA_REP                80
        154 Cambrault                 SA_REP                80
        155 Tuvault                   SA_REP                80
        156 King                      SA_REP                80
        157 Sully                     SA_REP                80
        158 McEwen                    SA_REP                80
        159 Smith                     SA_REP                80

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        160 Doran                     SA_REP                80
        161 Sewall                    SA_REP                80
        162 Vishney                   SA_REP                80
        163 Greene                    SA_REP                80
        164 Marvins                   SA_REP                80
        165 Lee                       SA_REP                80
        166 Ande                      SA_REP                80
        167 Banda                     SA_REP                80
        168 Ozer                      SA_REP                80
        169 Bloom                     SA_REP                80
        170 Fox                       SA_REP                80

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        171 Smith                     SA_REP                80
        172 Bates                     SA_REP                80
        173 Kumar                     SA_REP                80
        174 Abel                      SA_REP                80
        175 Hutton                    SA_REP                80
        176 Taylor                    SA_REP                80
        177 Livingston                SA_REP                80
        178 Grant                     SA_REP
        179 Johnson                   SA_REP                80
        180 Taylor                    SH_CLERK              50
        181 Fleaur                    SH_CLERK              50

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        182 Sullivan                  SH_CLERK              50
        183 Geoni                     SH_CLERK              50
        184 Sarchand                  SH_CLERK              50
        185 Bull                      SH_CLERK              50
        186 Dellinger                 SH_CLERK              50
        187 Cabrio                    SH_CLERK              50
        188 Chung                     SH_CLERK              50
        189 Dilly                     SH_CLERK              50
        190 Gates                     SH_CLERK              50
        191 Perkins                   SH_CLERK              50
        192 Bell                      SH_CLERK              50

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        193 Everett                   SH_CLERK              50
        194 McCain                    SH_CLERK              50
        195 Jones                     SH_CLERK              50
        196 Walsh                     SH_CLERK              50
        197 Feeney                    SH_CLERK              50
        198 OConnell                  SH_CLERK              50
        199 Grant                     SH_CLERK              50
        200 Whalen                    AD_ASST               10
        202 Fay                       MK_REP                20
        203 Mavris                    HR_REP                40
        204 Baer                      PR_REP                70

EMPLOYEE_ID LAST_NAME                 JOB_ID     DEPARTMENT_ID
----------- ------------------------- ---------- -------------
        206 Gietz                     AC_ACCOUNT           110
        400 NOOR                      IT_PROG               60
        401 NOOR AHMED                IT_PROG               60
        402 Noor Ahmed                IT_PROG               60

92 rows selected.

SQL> with dept_costs AS(
  2  SELECT d.department_name, SUM(e.salary) AS dept_total
  3  FROM employees e JOIN departments d
  4  ON e.department_id=d.department_id
  5  GROUP BY d.department_name)
  6  select * from dept_costs
  7  where dept_total>(select avg(dept_total)
  8  from dept_costs)
  9  order by department_name;

DEPARTMENT_NAME                DEPT_TOTAL
------------------------------ ----------
Sales                              304500
Shipping                           156400

SQL> ^S