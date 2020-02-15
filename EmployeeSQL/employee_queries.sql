
-------------------------------------#### Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

-- using the join method

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM salaries AS s
JOIN employees AS e
ON (s.emp_no = e.emp_no)
ORDER BY "emp_no";

-- 2. List employees who were hired in 1986.

SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31'

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dpt.dept_no, dpt.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date  
FROM departments AS dpt
JOIN dept_manager AS dm
ON (dm.dept_no = dpt.dept_no)
	JOIN employees AS e
	ON (dm.emp_no = e.emp_no)
	ORDER BY "emp_no";

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, dpt.dept_name
FROM departments AS dpt
JOIN dept_emp AS de
ON (de.dept_no = dpt.dept_no)
	JOIN employees AS e
	ON (de.emp_no = e.emp_no)
	ORDER BY "emp_no";


-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name
LIKE 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT de.emp_no, e.first_name, e.last_name, dpt.dept_name
FROM departments AS dpt
JOIN dept_emp AS de
ON (de.dept_no = dpt.dept_no)
	JOIN employees AS e
	ON (de.emp_no = e.emp_no)
	WHERE dept_name = 'Sales'
	ORDER BY "emp_no";

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT de.emp_no, e.first_name, e.last_name, dpt.dept_name
FROM departments AS dpt
JOIN dept_emp AS de
ON (de.dept_no = dpt.dept_no)
	JOIN employees AS e
	ON (de.emp_no = e.emp_no)
	WHERE dept_name = 'Sales' 
	OR dept_name = 'Development'
	ORDER BY "emp_no";

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "count"
FROM employees
GROUP BY
last_name
ORDER BY "count" DESC;

