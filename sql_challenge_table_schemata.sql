--DROP TABLE title CASCADE;
CREATE TABLE title (
	title_id VARCHAR(10) NOT NULL PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

SELECT*
From title;

--DROP TABLE salaries CASCADE;
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

--DROP TABLE departments CASCADE;
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