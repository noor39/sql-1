DECLARE v_lname employees.last_name%TYPE;
BEGIN 
SELECT last_name INTO v_lname
FROM employees
WHERE employee_id=100;
DBMS_OUTPUT.PUT_LINE('the haramzadas name is : '|| v_lname);
END;
DECLARE 
v_lname employees.last_name%TYPE;
BEGIN
SELECT last_name INTO v_lname
FROM employees
WHERE employee_id =100;
DBMS_OUTPUT.PUT_LINE('the mofiz is :' ||v_lname);
END;
/

set serveroutput on 



DECLARE 
v_hiredate employees.hire_date%TYPE;
v_salary employees.salary%TYPE;
BEGIN
SELECT hire_date, salary INTO v_hiredate, v_salary
FROM employees
WHERE employee_id =100;
DBMS_OUTPUT.PUT_LINE('the mofiz  started his work in :' ||v_hiredate);
DBMS_OUTPUT.PUT_LINE('the mofiz  earns his salary is :' ||v_salary);
END;
/


DECLARE 
v_hiredate employees.hire_date%TYPE;
v_salary employees.salary%TYPE;
BEGIN
SELECT hire_date+30, salary*COMMISSION_PCT INTO v_hiredate, v_salary
FROM employees
WHERE employee_id =100;
DBMS_OUTPUT.PUT_LINE('the mofiz  started his work in :' ||v_hiredate);
DBMS_OUTPUT.PUT_LINE('the mofiz  earns his salary is :' ||v_salary);
END;
/

-- the creation of sumsal into use hoy just to gain the insight to create a temporary storage for the variable in order to store them in the BEGIN section 
DECLARE 
v_sumsal NUMBER(10,2);
BEGIN
SELECT SUM(SALARY) INTO    v_sumsal
FROM employees
WHERE department_id =60;

DBMS_OUTPUT.PUT_LINE('the sum salary is :' ||v_sumsal);

END;
/


DECLARE 

BEGIN
    select sum(hire_date) into 





BEGIN
SELECT SUM(SALARY) INTO    v_sumsal
FROM employees
WHERE department_id =60;

DBMS_OUTPUT.PUT_LINE('the sum salary is :' ||v_sumsal);

END;



-- evidence
BEGIN
   DBMS_OUTPUT.put_line ('Hello World!');
END;

DECLARE 
v_today  date:=sysdate;
v_tomorrow  v_today%TYPE;

BEGIN
v_tomorrow := v_today+1;
DBMS_OUTPUT.put_line ('Hello World!');
DBMS_OUTPUT.PUT_LINE('Today''s date is  :'||v_today);
DBMS_OUTPUT.PUT_LINE('Tomorrow''s date is :'||v_tomorrow);

END;
/




CREATE INDEX emp_last_name_idx
ON employees (last_name);

CREATE TABLE NEW

select * from tabs;

-- number 1 
DECLARE
    v_emp_name employees.last_name%TYPE;
    v_ann_sal NUMBER;
BEGIN
    SELECT last_name, 12 * salary INTO v_emp_name, v_ann_sal
    FROM employees
    WHERE employee_id = 110; 

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_emp_name || '  Annual Salary: ' || v_ann_sal);
END;
/
-- number 2
DECLARE
  v_sum_sal employees.salary%TYPE;
  v_max_sal employees.salary%TYPE;
BEGIN
  SELECT SUM(salary), MAX(salary) INTO v_sum_sal, v_max_sal
  FROM employees
  WHERE department_id = 50;
  
  DBMS_OUTPUT.PUT_LINE('Sum of Salaries: ' || v_sum_sal);
  DBMS_OUTPUT.PUT_LINE('Maximum Salary: ' || v_max_sal);
END;
/

BEGIN
INSERT INTO employees 
(employee_id, first_name, last_name, email, hire_date, job_id, salary)
values(employees_seq.NEXTVAL, 'NOOR','Ahmed','kzhmd@gmail.com',sysdate, 'IT_PROG',4000);
END;
/
BEGIN
SELECT employee_id, last_name, salary
FROM employees
WHERE job_id='ST_CLERK';
END;

BEGIN
UPDATE employees 
SET salary = salary+1000
WHERE job_id='ST_CLERK';
END;

DECLARE
v_sal_increase employees.salary%TYPE:=1200;;
v_sal_increase 
BEGIN
UPDATE employees 
SET salary = salary+v_sal_increase
WHERE job_id='ST_CLERK';
END;
/



DECLARE
v_desc_size INTEGER(5);
v_tenure INTEGER(23);
v_hiredate employee.hire_date%TYPE;
v_product_description VARCHAR2(70):='You can use this product with your radios for higher frequency';
-- get the length of the string in prod_description
BEGIN
v_desc_size:=LENGTH(v_product_description);
v_tenure:=MONTHS_BETWEEN (CURRENT_DATE, v_hiredate);
END;
/


-- using sequences in PL/SQL expressions

DECLARE
v_new_id NUMBER (7);
BEGIN 
  v_new_id := my_seq.NEXTVAL;
  END;
  /


DECLARE
v_myage NUMBER:=1;
BEGIN
  IF v_myage<11
    THEN 
    DBMS_OUTPUT.PUT_LINE('I am a child');
  END IF;
END;
/


DECLARE
v_myage NUMBER:=31;
BEGIN
  IF v_myage<11 --if this condition is true only then the following code will go to the then condition else it will not go to the then statements instruction
    THEN 
    DBMS_OUTPUT.PUT_LINE('I am a child');
  END IF;
END;
/


DECLARE
v_myage NUMBER:=1;
v_myfirstname VARCHAR2(30):='Noor';
BEGIN
  IF (v_myfirstname='Noor' AND v_myage<11)
    THEN 
    DBMS_OUTPUT.PUT_LINE('I am a child');
    ELSE 
    DBMS_OUTPUT.PUT_LINE('I am not a child');
  END IF;
END;
/

DECLARE
v_myage NUMBER:=31;
v_myfirstname VARCHAR2(30):='Noor';
BEGIN
  IF (v_myfirstname='Noor' AND v_myage<11)
    THEN 
    DBMS_OUTPUT.PUT_LINE('I am a child');
    ELSE 
    DBMS_OUTPUT.PUT_LINE('I am not a child');
  END IF;
END;
/

DECLARE
v_myage NUMBER:=31;
v_myfirstname VARCHAR2(30):='Noor';
BEGIN
  IF (v_myfirstname='Noor' OR v_myage<11)
    THEN 
    DBMS_OUTPUT.PUT_LINE('I am a child');
    ELSE 
    DBMS_OUTPUT.PUT_LINE('I am not a child');
  END IF;
END;
/



DECLARE
v_myage NUMBER:=50;

BEGIN
  IF v_myage<11
    THEN 
    DBMS_OUTPUT.PUT_LINE('I am a child');
    ELSIF v_myage<20 THEN  
    DBMS_OUTPUT.PUT_LINE('I am young');
     ELSIF v_myage<30 THEN  
    DBMS_OUTPUT.PUT_LINE('I am in my twenties');
     ELSIF v_myage<40 THEN  
    DBMS_OUTPUT.PUT_LINE('I am in my thirties');
     ELSIF v_myage<50 THEN  
    DBMS_OUTPUT.PUT_LINE('I am yin my fifties');
    ELSE 
    DBMS_OUTPUT.PUT_LINE('I am always young');
  END IF;
END;
/

DECLARE
v_myage NUMBER:=50;

BEGIN
  IF v_myage<11
    THEN 
    DBMS_OUTPUT.PUT_LINE('I am a child');
    ELSIF v_myage<20 THEN  
    DBMS_OUTPUT.PUT_LINE('I am young');
     ELSIF v_myage<30 THEN  
    DBMS_OUTPUT.PUT_LINE('I am in my twenties');
     ELSIF v_myage<40 THEN  
    DBMS_OUTPUT.PUT_LINE('I am in my thirties');
     ELSIF v_myage<50 THEN  
    DBMS_OUTPUT.PUT_LINE('I am yin my fifties');
    ELSE 
    DBMS_OUTPUT.PUT_LINE('I am always young');
  END IF;
END;
/
--  CASE expressions
DECLARE 
v_grade CHAR(1):= UPPER('&grade'); -- CHAR holo fixed length, VARCHAR holo variable length jototuku jayga diba tototuku kaj hobe
v_apprisal VARCHAR2(20);
BEGIN
  v_apprisal :=
  CASE v_grade
  WHEN 'A' THEN 'SHABBASH, Bagher Baccha'
  WHEN 'B' THEN 'MOTAMUTI, Chole'
  WHEN 'C' THEN 'Eivabe hobe na, kopila!'
  ELSE 'Ore baba nai to konokisu'
  END;
  DBMS_OUTPUT.put_line('TUMI PAISO GRADE'||v_grade||'tahole tomar aprisal holo'||v_apprisal);
END;
/

DECLARE 
v_weight NUMBER(3):= 600;
v_message VARCHAR2(255):='Product 10012';
BEGIN 
  DECLARE
  v_weight NUMBER(3):=1;
  v_message VARCHAR2(255):='Product 11001';
  v_new_locn VARCHAR2(50):='Europe';
  BEGIN
    v_weight:=v_weight+1;
    v_new_locn:='Western' ||v_new_locn;

  END;
  v_weight :=v_weight+1;
  v_message:=v_message||'is in stock';
  v_new_locn:='Western'||v_new_locn;
  END;
  /


  DECLARE 
  v_customer VARCHAR2(50):='Womansport';
  v_credit_rating VARCHAR2(50):='EXCELLENT';
  BEGIN 
    DECLARE
      v_customer NUMBER(7):=201;
      v_name VARCHAR2(25):='Unisports';
    BEGIN
      v_credit_rating:='Good';
    END;
  END;
  /

  --VARIABLE b_basic_percent NUMBER 
  -- VARIABLE v_pf_percent NUMBER
  SET SERVEROUTPUT ON
  /*:b_basic_percent:=45;
  :b_pf_percent:=12;*/

  DECLARE
  -- b_basic_percent:=45;
  -- b_pf_percent:=12;
  v_fname VARCHAR2(15);
  v_emp_sal NUMBER(10);

BEGIN
  SELECT first_name, salary INTO v_fname, v_emp_sal
  FROM employees
  WHERE employee_id=110;

  DBMS_OUTPUT.PUT_LINE('Hello'||v_fname );
END;
/

DECLARE 
v_fname VARCHAR2(20);
v_lname VARCHAR2(15) DEFAULT 'fernandez';
BEGIN
  DBMS_OUTPUT.PUT_LINE(v_fname||' '||v_lname);
END;
/


DECLARE 
v_today DATE:=sysdate;
v_tomorrow v_today%TYPE;
BEGIN
  v_tomorrow=v_today+1;
  DBMS_OUTPUT.PUT_LINE('Hello World');
  DBMS_OUTPUT.PUT_LINE('Today''s date is'||today);
  DBMS_OUTPUT.PUT_LINE('Tommorow's'date is'||v_tomorrow);
END;
/












-- evidence
1
DECLARE
v_basic_sal  NUMBER:=12;
v_pf NUMBER:=45;
v_contribute NUMBER;
v_sal NUMBER;
BEGIN
SELECT salary INTO v_sal
FROM employees
WHERE employee_id=150;
v_contribute:=v_sal*v_basic_sal/100*v_pf/100;
DBMS_OUTPUT.PUT_LINE('The employee''s salary:'||v_sal);
DBMS_OUTPUT.PUT_LINE('HER/HIS contributions to Provident fund are :'||v_contribute);
END;
/

2
DECLARE v_max_deptno departments.department_id%TYPE;
v_max_sal NUMBER;
BEGIN
  SELECT MAX(department_id) INTO v_max_deptno
  FROM departments;
  DBMS_OUTPUT.PUT_LINE('maximum department id is :'||v_max_deptno );

END;
/

3
DECLARE 
v_sal employees.salary%TYPE;
v_hire employees.hire_date%TYPE;
BEGIN
  SELECT hire_date, salary INTO v_hire,v_sal
  FROM employees
  WHERE employee_id=110;
  DBMS_OUTPUT.PUT_LINE('employee Join DATE is :'||v_hire);
  DBMS_OUTPUT.PUT_LINE('employee''s salary is :'||v_sal );

END;
/

4

DECLARE
v_dpt_name VARCHAR2(20):='Software';
v_dpt_id departments.department_id%TYPE;;
v_max_dpt NUMBER;
BEGIN
  SELECT MAX(department_id)+10 INTO v_max_dpt;
  INSERT INTO departments (department_id, department_name, location_id)
   VALUES (v_dpt_id, v_dpt_name,NULL); 
 
  DBMS_OUTPUT.PUT_LINE('the new max dept is :'||v_max_dpt);
  DBMS_OUTPUT.PUT_LINE('new departments id is :'||v_dpt_id );

END;
/


DECLARE
  l_department_id departments.department_id%TYPE;
BEGIN
  -- Fetch the maximum department_id and add 10 to it
  SELECT MAX(department_id) + 10 INTO l_department_id FROM department;

  -- Insert the new department
  INSERT INTO department (department_id, department_name)
  VALUES (l_department_id, 'Software'); 


END;
/

--  basic loop example
CREATE TABLE loc(location_id NUMBER(10),
city   VARCHAR2(30),
country_id VARCHAR2(5));

INSERT INTO loc
VALUES (1000,'Mexico City','MX');

INSERT INTO loc
VALUES (1100,'Oxford','UK');

INSERT INTO loc
VALUES (1200,'Montreal','CA');

SELECT * from loc
COUNT(loc)

-- LOOP
DECLARE 
v_countryid loc.country_id%TYPE:='CA';
v_loc_id loc.location_id%TYPE;
v_counter NUMBER(20):=1;
v_new_city loc.city%TYPE:='Montreal';

BEGIN 
  SELECT MAX(location_id) INTO v_loc_id
  FROM loc
  WHERE country_id=v_countryid;

LOOP 
  INSERT INTO loc(location_id, city, country_id)
  VALUES((v_loc_id+v_counter),v_new_city,v_countryid);
  v_counter:=v_counter+1;
  EXIT WHEN v_counter>252;
END LOOP;
DBMS_OUTPUT.PUT_LINE(v_loc_id||' '||v_new_city||' '||v_countryid);
DBMS_OUTPUT.PUT_LINE(v_counter);
END;
/


DECLARE 
v_countryid loc.country_id%TYPE:='BD';
v_loc_id loc.location_id%TYPE;
v_counter NUMBER(2):=1;
v_new_city loc.city%TYPE:='DHAKA';

BEGIN 
  SELECT MAX(location_id) INTO v_loc_id
  FROM loc
  WHERE country_id=v_countryid;

      WHILE v_counter<=3 
        LOOP 
  INSERT INTO loc(location_id, city, country_id)
  VALUES((v_loc_id+v_counter),v_new_city,v_countryid);
  v_counter:=v_counter+1;
DBMS_OUTPUT.PUT_LINE(v_counter);
END LOOP;
END;
/




DECLARE 
v_countryid loc.country_id%TYPE:='BD';
v_loc_id loc.location_id%TYPE;
v_new_city loc.city%TYPE:='Chittagong';

BEGIN 
  SELECT MAX(location_id) INTO v_loc_id
  FROM loc
  WHERE country_id=v_countryid;

      FOR i IN 2..5
      LOOP 
  INSERT INTO loc(location_id, city, country_id)
  VALUES((v_loc_id+i),v_new_city,v_countryid);


END LOOP;
END;
/


DECLARE 
v_countryid loc.country_id%TYPE:='BD';
v_loc_id loc.location_id%TYPE;
v_new_city loc.city%TYPE:='Chittagong';

BEGIN 
  SELECT MAX(location_id) INTO v_loc_id
  FROM loc
  WHERE location_id=1200;

      FOR i IN 2..5
      LOOP 
  INSERT INTO loc(location_id, city, country_id)
  VALUES((v_loc_id+i),v_new_city,v_countryid);


END LOOP;
END;
/

DECLARE 
v_countryid loc.country_id%TYPE:='BD';
v_loc_id loc.location_id%TYPE;
v_new_city loc.city%TYPE:='Chittagong';

BEGIN 
  SELECT MAX(location_id) INTO v_loc_id
  FROM loc
  WHERE location_id=1200;

      FOR i IN REVERSE 2..5 
      LOOP 
  INSERT INTO loc(location_id, city, country_id)
  VALUES((v_loc_id+i),v_new_city,v_countryid);


END LOOP;
END;
/

DECLARE 
v_myage VARCHAR2(30);
BEGIN
  IF v_myage <11
  THEN 
    DBMS_OUTPUT.PUT_LINE('I am a child');
  END IF;
END;
/

DECLARE
  v_myage number:=31;
BEGIN
  IF 
    v_myage <11 THEN 
    DBMS_OUTPUT.PUT_LINE('I am a child');
  ELSE
    DBMS_OUTPUT.PUT_LINE('I am not a child');
  END IF;
END;
/

-- chapter 7 working with composite data type
DECLARE
 emp_rec employees%ROWTYPE;
BEGIN
   SELECT * INTO emp_rec FROM employees
   WHERE employee_id =100;
   DBMS_OUTPUT.PUT_LINE(emp_rec.last_name||' '||
emp_rec.job_id||' '||emp_rec.salary);
END;
/

-- user defined record royeche, variable explicitly declare korechen, ekhon 1 ta record means onekgula variables. onekgula fields. last name reference korle last name declasre korete parben. user defined way ta pacchen. declare kore oi field huloke ekta type  nite hoy, type er jonno identifier nite hoy . field declare , field ke type e ba group e nilam, oi group er jonno ekta row. etai holo user defined. 
--  jemon field record ke record er 


-- creating a PL/SQL record

DECLARE
TYPE t_rec IS RECORD 
(v_sal number(8), 
v_minsal number(8) DEFAULT 1000, 
v_hire_date employees.hire_date%type,
v_rec1 employees%rowtype);
v_myrec t_rec;
BEGIN 
  v_myrec.v_sal := v_rec.v_minsal+500;
  v_myrec.v_hire_date:=sysdate;
  SELECT * INTO v_myrec.v_rec1
    FROM employees WHERE employee_id=100;
    DBMS_OUTPUT.PUT_LINE(v_myrec.v_rec1.last_name||
    ' '||to_char(v_myrec.v_hire_date)||
    ' '||(v_myrec.v_sal));
END;
/

-- record use hoy SELECT,UPDATE , DELETE korte
CREATE TABLE retired_emps
(empno NUMBER)

/*to create the messages table write a PL/SQL block to insert numbers into the messages table. a) insert the numbers 1 through 10, excluding 6 and 8. b) commit before the end of the block.
*/
-- Create the messages table
CREATE TABLE messages (
    num NUMBER
);

-- PL/SQL block to insert numbers and commit
BEGIN
    FOR i IN 1..10 LOOP
        IF i NOT IN (6, 8) THEN
            INSERT INTO messages (num) VALUES (i);
        END IF;
    END LOOP;
    COMMIT;
END;
/

/*write logic append an asterisk(*) to the string for every $1000 of the salary, for example , if the employee earns $8000, the string of the asterisks should contain eight asterisks. IF the employee earns $12500 the string of asterisks should contain 13 asterisks;*/


-- Example for a specific salary value (e.g., $12500)
SELECT RPAD('*', CEIL(12500 / 1000), '*') AS asterisks FROM DUAL;

-- For an employees table:
SELECT 
    employee_id, 
    salary, 
    RPAD('*', CEIL(salary / 1000), '*') AS salary_asterisks 
FROM employees;




DECLARE
    v_salary NUMBER := 12500; -- Example salary
    v_asterisks VARCHAR2(100);
BEGIN
    v_asterisks := RPAD('*', CEIL(v_salary / 1000), '*');
    DBMS_OUTPUT.PUT_LINE('Asterisks: ' || v_asterisks);
END;
/





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

