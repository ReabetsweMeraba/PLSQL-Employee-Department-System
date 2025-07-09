# PLSQL Employee & Department Management System

This project demonstrates the use of multiple tables and PL/SQL blocks to manage employee and department data in an Oracle SQL environment. It covers core SQL operations along with record and row-type usage in PL/SQL.

---

## 🧾 About

This project creates two relational tables — `employees` and `departments` — with a foreign key relationship. It performs data insertion, updates, salary calculations, and data retrieval using `%ROWTYPE` and `RECORD` types. Useful for mastering PL/SQL fundamentals involving real-world HR-style datasets.

---

## 📁 Features

- ✅ Table creation with foreign key constraint
- ✅ Sample data insertion into both tables
- ✅ Salary total calculation by department
- ✅ Insertion of a new employee
- ✅ Salary update with increment
- ✅ Job title update
- ✅ Full row retrieval using `%ROWTYPE`
- ✅ Partial column retrieval using `RECORD`

---

## 🗃️ Tables Created

### `departments`
| Column           | Type         | Description           |
|------------------|--------------|------------------------|
| department_id    | NUMBER (PK)  | Unique ID              |
| department_name  | VARCHAR2(100)| Department name        |
| location         | VARCHAR2(100)| Location of department |

### `employees`
| Column         | Type            | Description                      |
|----------------|------------------|----------------------------------|
| employee_id    | NUMBER (PK)      | Unique employee ID               |
| first_name     | VARCHAR2(50)     | First name                       |
| last_name      | VARCHAR2(50)     | Last name                        |
| email          | VARCHAR2(100)    | Unique email                     |
| hire_date      | DATE             | Date of hiring                   |
| job_title      | VARCHAR2(50)     | Job title                        |
| salary         | NUMBER           | Monthly salary                   |
| department_id  | NUMBER (FK)      | Linked to `departments` table    |

---

## 🧪 Sample Code Highlights

### 📌 Salary Total by Department
```sql
SELECT SUM(salary)
INTO v_total
FROM employees
WHERE department_id = 1;
