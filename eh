-- 5. Create a procedure called RAISE_SALARY to increase the employee salary?
CREATE OR REPLACE PROCEDURE RAISE_SALARY (
    p_id IN EMPLOYEES.EMPLOYEE_ID%TYPE,
    p_percent IN NUMBER
) IS
BEGIN
    UPDATE EMPLOYEES
    SET salary = salary * (1 + p_percent / 100)
    WHERE employee_id = p_id;
END;
/

-- Invocation
EXECUTE RAISE_SALARY(100, 10);
 select salary from employees where employee_id=100;



CREATE OR REPLACE PROCEDURE RAISlE_SALARY(
  p_id IN employees.employee_id%TYPE,
  p_percent IN NUMBER 
  ) IS
  BEGIN 
  UPDATE employees
  set salary=salary*(1+p_percent/100)
  WHERE employee_id=p_id;
  END;
  /
  EXECUTE RAISlE_SALARY(100,10);
  select salary from employees where employee_id=100;
   drop trigger hr.salary_check
 drop trigger secure_emp

-- 6. Create a procedure called QUERY_EMP to query the employee last_name and salary from the EMPLOYEES table.
CREATE OR REPLACE PROCEDURE QUERY_EMP (
    p_id IN EMPLOYEES.EMPLOYEE_ID%TYPE,
    p_name OUT EMPLOYEES.LAST_NAME%TYPE,
    p_salary OUT EMPLOYEES.SALARY%TYPE
) IS
BEGIN
    SELECT last_name, salary INTO p_name, p_salary
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = p_id;
END;
/

-- Invocation
DECLARE
    v_name EMPLOYEES.LAST_NAME%TYPE;
    v_sal  EMPLOYEES.SALARY%TYPE;
BEGIN
    QUERY_EMP(100, v_name, v_sal);
    DBMS_OUTPUT.PUT_LINE(v_name || ' earns ' || TO_CHAR(v_sal, '$999,999.00'));
END;

-- 8. Create and invoke the GET_SAL function with a single input parameter and to returns the salary of inputted employee.
CREATE OR REPLACE FUNCTION GET_SAL (
    p_empid EMPLOYEES.EMPLOYEE_ID%TYPE
) RETURN NUMBER IS
    v_sal EMPLOYEES.SALARY%TYPE;
BEGIN
    SELECT SALARY INTO v_sal
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = p_empid;
    RETURN v_sal;
END;
/
-- Invocation
SELECT GET_SAL(100) AS salary FROM DUAL;

variable b_sal number
execute :b_sal:=get_sal(100);

-- 9. Create and invoke the TAX function with a single input parameter and to returns the income tax based on simple flat tax rate for inputted salary.
CREATE OR REPLACE FUNCTION TAX (
    p_salary IN NUMBER
) RETURN NUMBER IS
    v_tax_rate CONSTANT NUMBER := 0.15;
BEGIN
    RETURN ROUND(p_salary * v_tax_rate, 2);
END;
/

-- Invocation
select salary, tax(salary) from employees;

-- 12.Create a procedure ADD_EMPLOYEE to insert a new employee into the EMPLOYEES table. The procedure should call a VALID_DEPTID function to check wheather the department_id for the new employee exists in the DEPARTMENTS table.
CREATE OR REPLACE FUNCTION VALID_DEPTID(
  p_deptid IN departments.department_id%TYPE
) RETURN BOOLEAN IS 
v_dummy PLS_INTEGER;

BEGIN 
  SELECT 1
  INTO v_dummy
  FROM departments
  WHERE department_id=p_deptid;
  RETURN TRUE;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN FALSE;
END VALID_DEPTID;
/
CREATE OR REPLACE PROCEDURE   ADD_EMPLOYEE(
  p_first_name employees.first_name%Type,
  p_last_name employees.last_name%TYPE,
  p_email employees.email%TYPE,
  p_job employees.job_id%TYPE DEFAULT 'SA_REP',
  p_mgr employees.manager_id%TYPE DEFAULT 145,
  p_sal employees.salary%TYPE DEFAULT 1000,
  p_comm employees.commission_pct%TYPE DEFAULT 0,
  p_deptid employees.department_id%TYPE DEFAULT 30) IS
  BEGIN
   IF VALID_DEPTID(p_deptid) THEN
    INSERT INTO employees(employee_id,first_name,last_name,email,job_id,manager_id,hire_date,salary,commission_pct,department_id)
    values(employees_seq.NEXTVAL,p_first_name,p_last_name,p_email,p_job,p_mgr,TRUNC(SYSDATE),p_sal,p_comm,p_deptid);
    ELSE
    RAISE_APPLICATION_ERROR (-20204,' HEY BROTHER, Invalid department ID. TRY again!');
    END IF;
    END ADD_EMPLOYEE;
/


execute add_employee( 'shohan','ahmed','asdkjf') ;
select * from employees where first_name='shohan'

FROM employees
WHERE department_id=30
