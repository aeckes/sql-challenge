--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e
LEFT JOIN salaries AS s ON e.emp_no = s.emp_no;


--List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT e.last_name, e.first_name, dm.dept_no, d.dept_name, dm.emp_no, de.from_date, de.to_date
FROM dept_manager AS dm
INNER JOIN employees AS e ON dm.emp_no = e.emp_no
INNER JOIN departments AS d ON dm.dept_no = d.dept_no
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
ORDER BY d.dept_name ASC;


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no
ORDER BY e.emp_no ASC;


--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees AS e
WHERE e.last_name LIKE 'B%' AND e.first_name = 'Hercules';


--List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no ASC;


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no ASC;


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT e.last_name, COUNT(e.last_name) AS Frequency
FROM employees AS e
GROUP BY e.last_name
ORDER BY Frequency DESC;
