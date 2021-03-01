--DROP TABLE title;
CREATE TABLE title (
	title_id VARCHAR(10) NOT NULL PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

SELECT*
From title;

--DROP TABLE salaries;
CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT NOT NULL
);

SELECT*
From salaries;

--DROP TABLE employees;
CREATE TABLE employees (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	emp_title VARCHAR (10) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES title(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	sex VARCHAR (10) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no, emp_title)
);

SELECT*
From employees LIMIT 50;

--DROP TABLE departments;
CREATE TABLE departments (
	dept_no VARCHAR (10) NOT NULL PRIMARY KEY,
	dept_name VARCHAR (50) NOT NULL
);

SELECT*
From departments;

--DROP TABLE dept_manager;
CREATE TABLE dept_manager (
	dept_no VARCHAR (10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	PRIMARY KEY(dept_no, emp_no)
);

SELECT*
From dept_manager;

--DROP TABLE dept_emp;
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	dept_no VARCHAR (10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY(emp_no, dept_no)
);

SELECT*
From dept_emp;

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

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name  
FROM dept_emp
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name  
FROM dept_emp
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE 
	dept_name = 'Sales'
	OR dept_name = 'Development'
	
SELECT last_name, COUNT(*) AS same_Last_Name
FROM employees
GROUP BY last_name
HAVING COUNT(*) >1
ORDER BY COUNT(*) DESC; 


