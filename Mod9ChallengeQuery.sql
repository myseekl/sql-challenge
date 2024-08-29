CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);
SELECT * FROM departments;

CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);
SELECT * FROM titles;

CREATE TABLE employees (
	emp_no int PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date date NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date date NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
SELECT * FROM employees;

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no), -- composite key
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
SELECT * FROM dept_emp;

CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no), -- composite key
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
SELECT * FROM dept_manager;

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no, salary), -- composite key
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
SELECT * from salaries;

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM employees 
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no;

SELECT departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
FROM employees 
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

SELECT departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

SELECT departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name IN ('Sales', 'Development');

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;


