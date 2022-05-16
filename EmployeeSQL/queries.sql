-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date FROM employees AS e
WHERE hire_date LIKE '%1986'; 
-- using the WHERE and LIKE in this case since hire_date is a varchar 

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- tables: dept_manager, departments, employees
-- departments as d, dept_manager as dm, employees as e
-- dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name FROM dept_manager AS dm
INNER JOIN departments AS d
ON dm.dept_no = d.dept_no
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- tables: dept_emp, employees, departments
-- dept_emp as de, employees as e, departments as d 
-- de.emp_no, e.last_name, e.first_name, d.dept_name

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name FROM dept_emp AS de
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
INNER JOIN employees AS e
ON de.emp_no = e.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- tables: dept_emp, departments, employees
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name FROM dept_emp AS de
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
INNER JOIN employees AS e
ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name FROM dept_emp AS de
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
INNER JOIN employees AS e
ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT e.last_name, COUNT (last_name) AS Frequency
FROM employees AS e
GROUP BY last_name
ORDER BY
COUNT (last_name) DESC;
