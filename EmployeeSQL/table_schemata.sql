-- drop tables in case tables already exist
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


-- create tales and import csv files (so fun)

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

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
	emp_no INT,
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
