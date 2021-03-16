--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON salaries.emp_no = employees.emp_no;


--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name  
FROM departments
LEFT JOIN dept_manager
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees
ON employees.emp_no = dept_manager.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name  
FROM dept_emp
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE 
	first_name = 'Hercules'
	AND SUBSTRING(last_name, 1,1) = 'B';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name  
FROM dept_emp
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE 
	dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name  
FROM dept_emp
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE 
	dept_name = 'Sales'
	OR dept_name = 'Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS same_Last_Name
FROM employees
GROUP BY last_name
HAVING COUNT(*) >1
ORDER BY COUNT(*) DESC; 