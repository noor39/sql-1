conn hr/hr@orclpdb;
select * from employees;
SQL> insert into departments
  2  values(639, 'Test_dept3', NULL, NULL);

1 row created.

SQL> insert into departments
  2  values(610, 'TEST_dept1', 101, 1200);
insert into departments
*
ERROR at line 1:
ORA-00001: unique constraint (HR.DEPT_ID_PK) violated


SQL> ed
Wrote file afiedt.buf

  1  insert into departments
  2* values(611, 'TEST_dept1', 101, 1200)
SQL> /

1 row created.

SQL> create sequence seq12
  2  /

Sequence created.

SQL> insert into departments
  2  values(seq12.nextval, 'test_dept2', 103, 1200);

1 row created.

SQL> select * from departments where department_name= UPPER('test_dept2');

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  select * from departments
  2* where department_name= 'TEST_DEPT2'
SQL> /

no rows selected

SQL> ed
Wrote file afiedt.buf

  1  select * from departments
  2* where department_name= 'test_dept2'
SQL> /

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
            1 test_dept2                            103        1200

SQL> ed
Wrote file afiedt.buf

  1  insert into departments
  2*   2  values(seq12.nextval, 'test_dept2', 103, 1200)
SQL> /
  2  values(seq12.nextval, 'test_dept2', 103, 1200)
  *
ERROR at line 2:
ORA-00926: missing VALUES keyword


SQL> ed
Wrote file afiedt.buf

  1  insert into departments
  2* values(seq12.nextval, 'test_dept2', 103, 1200)
SQL> /

1 row created.

SQL> ed
Wrote file afiedt.buf

  1  insert into departments
  2* values(seq12.nextval, 'test_dept2', 103, 1200)
SQL> /

1 row created.

SQL> select * from departments where department_name= 'test_dept2';

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
            1 test_dept2                            103        1200
            2 test_dept2                            103        1200
            3 test_dept2                            103        1200

SQL> ed
Wrote file afiedt.buf

  1   insert into departments
  2*  values(seq12.currval, 'test_dept2', 103, 1200)
SQL> /
 insert into departments
*
ERROR at line 1:
ORA-00001: unique constraint (HR.DEPT_ID_PK) violated


SQL> ed
Wrote file afiedt.buf

  1   insert into departments
  2*  values(seq12.currval, 'test_dept2', 103, 1200)
SQL> select seq12.currval
  2  from departments;

   CURRVAL
----------
         3
         3
         3
         3
         3
         3
         3
         3
         3
         3
         3

   CURRVAL
----------
         3
         3
         3
         3
         3
         3
         3
         3
         3
         3
         3

   CURRVAL
----------
         3
         3
         3
         3
         3
         3
         3
         3
         3
         3
         3

   CURRVAL
----------
         3
         3
         3
         3
         3
         3
         3

40 rows selected.

SQL> insert into departments
  2  values(seq12.nextval, 'test_dept2', 103, 1200)
  3  /

1 row created.

SQL> insert into departments
  2  values(seq12.nextval, 'test_dept2', 103, 1200)
  3  /

1 row created.

SQL> insert into departments
  2  values(seq12.nextval, 'test_dept2', 103, 1200);

1 row created.

SQL> insert into departments
  2  values(seq12.nextval, 'test_dept2', 103, 1200);

1 row created.

SQL> select * from departmentsselect * from departments where department_name= 'test_dept2';
select * from departmentsselect * from departments where department_name= 'test_dept2'
                                *
ERROR at line 1:
ORA-00933: SQL command not properly ended


SQL> select * from departments where department_name= 'test_dept2';

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
            1 test_dept2                            103        1200
            2 test_dept2                            103        1200
            3 test_dept2                            103        1200
            4 test_dept2                            103        1200
            5 test_dept2                            103        1200
            6 test_dept2                            103        1200
            7 test_dept2                            103        1200

7 rows selected.

SQL>  select seq12.currval
  2   from departments;

   CURRVAL
----------
         7
         7
         7
         7
         7
         7
         7
         7
         7
         7
         7

   CURRVAL
----------
         7
         7
         7
         7
         7
         7
         7
         7
         7
         7
         7

   CURRVAL
----------
         7
         7
         7
         7
         7
         7
         7
         7
         7
         7
         7

   CURRVAL
----------
         7
         7
         7
         7
         7
         7
         7
         7
         7
         7
         7

44 rows selected.

SQL> select * from employees;

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
                      108            50


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

SQL> select * from employees;

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
                      108            50


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

SQL> select * from departments
  2  where department_id >600;

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
          610 Test_dept2                            101        1200
          611 TEST_dept1                            101        1200
          620 Test_dept3
          630 Test_dept4
          639 Test_dept3

SQL> ed
Wrote file afiedt.buf

  1  select * from departments
  2* where department_id >1
SQL> /

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
            2 test_dept2                            103        1200
            3 test_dept2                            103        1200
            4 test_dept2                            103        1200
            5 test_dept2                            103        1200
            6 test_dept2                            103        1200
            7 test_dept2                            103        1200
           10 Administration                        200        1700
           20 Marketing                             201        1800
           30 Purchasing                            114        1700
           40 Human Resources                       203        2400
           50 Shipping                              121        1500

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
           60 IT                                    103        1400
           70 Public Relations                      204        2700
           80 Sales                                 145        2500
           90 Executive                             100        1700
          100 Finance                               108        1700
          110 Accounting                            205        1700
          120 Treasury                                         1700
          130 Corporate Tax                                    1700
          140 Control And Credit                               1700
          150 Shareholder Services                             1700
          160 Benefits                                         1700

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
          170 Manufacturing                                    1700
          180 Construction                                     1700
          190 Contracting                                      1700
          200 Operations                                       1700
          210 IT Support                                       1700
          220 NOC                                              1700
          230 IT Helpdesk                                      1700
          240 Government Sales                                 1700
          250 Retail Sales                                     1700
          260 Recruiting                                       1700
          270 Payroll                                          1700

DEPARTMENT_ID DEPARTMENT_NAME                MANAGER_ID LOCATION_ID
------------- ------------------------------ ---------- -----------
          300 NOC                                   100        1200
          310 ROC                                   100        1200
          320 Support                                          2500
          330 Support                                          2500
          600 Test_dept1                            101        1200
          610 Test_dept2                            101        1200
          611 TEST_dept1                            101        1200
          620 Test_dept3
          630 Test_dept4
          639 Test_dept3

43 rows selected.

SQL> desc employees;
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

SQL> INSERT INTO employees( employee_id, last_name, email, hire_date, job_id, salary, department_id)
  2  values( 500, 'Allahuakbar', 'assalamualaikum@gmail.com',sysdate, 'IT_PROG',109000, 60);

1 row created.

SQL>  select seq12.currval
  2   from departments; select seq12.currval
  3   from departments;
 from departments; select seq12.currval
                 *
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> INSERT INTO employees( employee_id, last_name, email, hire_date, job_id, salary, department_id)
  2  values( 501, 'Allahuaakbar', 'assalamualaikum@gmdail.com',sysdate, 'IT_PROG',109000, 60);
values( 501, 'Allahuaakbar', 'assalamualaikum@gmdail.com',sysdate, 'IT_PROG',109000, 60)
                             *
ERROR at line 2:
ORA-12899: value too large for column "HR"."EMPLOYEES"."EMAIL" (actual: 26,
maximum: 25)


SQL> ed
Wrote file afiedt.buf

  1  INSERT INTO employees( employee_id, last_name, email, hire_date, job_id, salary, department_id)
  2* values( 501, 'Allahuaakbar', 'aalamualaikum@gmdail.com',sysdate, 'IT_PROG',109000, 60)
SQL> /

1 row created.

SQL> select * from employees where
  2  employee_id >400;

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
        401                      NOOR AHMED
kznrahmd3@gmail.com                            02-MAR-25 IT_PROG         10000
                                     60

        402                      Noor Ahmed
kznrahmd120225@gmail.com                       04-MAR-25 IT_PROG         10000
                                     60

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------

        500                      Allahuakbar
assalamualaikum@gmail.com                      06-APR-25 IT_PROG        109000
                                     60

        501                      Allahuaakbar
aalamualaikum@gmdail.com                       06-APR-25 IT_PROG        109000

EMPLOYEE_ID FIRST_NAME           LAST_NAME
----------- -------------------- -------------------------
EMAIL                     PHONE_NUMBER         HIRE_DATE JOB_ID         SALARY
------------------------- -------------------- --------- ---------- ----------
COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
-------------- ---------- -------------
                                     60


SQL>