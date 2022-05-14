DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
	title_id varchar(30) NOT NULL PRIMARY KEY,
	title varchar(30) NOT NULL
);

CREATE TABLE employees (
	emp_no int NOT NULL PRIMARY KEY,
	emp_title_id varchar(30) NOT NULL,
	birth_date varchar(30),
	first_name varchar(30),
	last_name varchar(30) NOT NULL,
	sex varchar NOT NULL,
	hire_date varchar(30) NOT NULL
);

ALTER TABLE employees
ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);

CREATE TABLE salaries (
	emp_no int NOT NULL,
	salary int NOT NULL);

ALTER TABLE salaries
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

CREATE TABLE departments (
	dept_no varchar(30) NOT NULL PRIMARY KEY,
	dept_name varchar(30)NOT NULL);

CREATE TABLE dept_manager (
	dept_no varchar(30) NOT NULL,
	emp_no int NOT NULL
);

ALTER TABLE dept_manager
ADD CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_manager
ADD CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

-- create new composite primary key for dept_manager
ALTER TABLE dept_manager
ADD CONSTRAINT dept_manager_compkey PRIMARY KEY (dept_no, emp_no);

CREATE TABLE dept_emp (
	emp_no int NOT NULL,
	dept_no varchar (30) NOT NULL
);
-- add foreign keys to dept_emp table
ALTER TABLE dept_emp
ADD CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp
ADD CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

-- create new composite primary key for dept_emp
ALTER TABLE dept_emp
ADD CONSTRAINT dept_emp_compkey PRIMARY KEY (emp_no, dept_no);

-- run each table separately to make sure they display correctly
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM salaries;
SELECT * FROM employees;
SELECT * FROM titles;