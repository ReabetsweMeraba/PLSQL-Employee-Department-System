
CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100),
    location VARCHAR2(100)
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100) UNIQUE,
    hire_date DATE,
    job_title VARCHAR2(50),
    salary NUMBER,
    department_id NUMBER,
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments VALUES (1, 'IT', 'New York');
INSERT INTO departments VALUES (2, 'HR', 'London');
INSERT INTO departments VALUES (3, 'Finance', 'Paris');

INSERT INTO employees VALUES (101, 'John', 'Doe', 'jdoe@example.com', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'Software Engineer', 60000, 1);
INSERT INTO employees VALUES (102, 'Jane', 'Smith', 'jsmith@example.com', TO_DATE('2022-05-20', 'YYYY-MM-DD'), 'HR Specialist', 55000, 2);
INSERT INTO employees VALUES (103, 'Alice', 'Johnson', 'ajohnson@example.com', TO_DATE('2021-08-10', 'YYYY-MM-DD'), 'Financial Analyst', 75000, 3);
INSERT INTO employees VALUES (104, 'Bob', 'Brown', 'bbrown@example.com', TO_DATE('2020-09-05', 'YYYY-MM-DD'), 'Project Manager', 80000, 1);
COMMIT;



DECLARE 
V_TOTAL employees.salary%type ;

BEGIN 
SELECT SUM (salary)
INTO V_TOTAL
FROM employees
WHERE department_id=1;


dbms_output.put_line('total is:R'||V_TOTAL);

INSERT INTO employees VALUES(105,'Michael', 'Scott','mscott@example.com',TO_DATE ('2024-04-10','YYYY-MM-DD'),'Regional Manger',9000,3);
commit;

UPDATE employees
SET salary=salary*0.5+salary
WHERE employee_id=102;
commit;


update employees
set job_title='senior Manger'
WHERE employee_id=101;
commit;
end;
/

DECLARE
v_employee employees%rowtype;

BEGIN

SELECT *
INTO v_employee
FROM employees
WHERE employee_id =101;

dbms_output.put_line(v_employee.employee_id);
dbms_output.put_line(v_employee.first_name);
dbms_output.put_line(v_employee.last_name);
dbms_output.put_line(v_employee.email);
dbms_output.put_line(v_employee.hire_date);
dbms_output.put_line(v_employee.job_title);
dbms_output.put_line(v_employee.salary);
dbms_output.put_line(v_employee.department_id);
end;
/


DECLARE
type emp_record is RECORD (
first_name employees.first_name%type,
last_name employees.last_name%type);


v_employee emp_record;
BEGIN

SELECT first_name,last_name
into v_employee.first_name,v_employee.last_name
from employees
where employee_id=102;

dbms_output.put(v_employee.first_name);
dbms_output.put_line(v_employee.last_name);
 end;
 /
 
