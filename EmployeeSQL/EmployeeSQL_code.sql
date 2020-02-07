-- drop tables in case tables already exist
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


-- create tales (so fun)

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL
    );

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
    );

-- not sure if this table is even needed because all of this info exists in dept_emp table
CREATE TABLE dept_manager (
    emp_no INT,
    dept_no VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
    );

CREATE TABLE employees (
    emp_no INT,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender VARCHAR NOT NULL,
    hire_date DATE NOT NULL
    );

CREATE TABLE salaries (
    emp_no INT,
    salary INT,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
    );

CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
    );

-- select statements to explore table

SELECT * FROM departments LIMIT 50;
SELECT * FROM dept_emp LIMIT 50;
SELECT * FROM dept_manager LIMIT 50;
SELECT * FROM employees LIMIT 50;
SELECT * FROM salaries LIMIT 50;
SELECT * FROM titles LIMIT 50;


-------------------------------------#### Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

-- using the join method
SELECT s.salary, e.emp_no, e.last_name, e.first_name, e.gender, e.salary
FROM salaries AS s
JOIN employees AS e
ON (s.emp_no = e.emp_no)

-- using sub-query method

SELECT salary
FROM salaries
WHERE emp_no IN
    (
    SELECT emp_no, last_name, first_name, gender
    FROM employees
    );


-- 2. List employees who were hired in 1986.

SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date = 1986


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.



-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

-- ## Bonus (Optional)

-- As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:

-- 1. Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all, trying to prove your technical mettle.) This step may require some research. Feel free to use the code below to get started. Be sure to make any necessary modifications for your username, password, host, port, and database name:
