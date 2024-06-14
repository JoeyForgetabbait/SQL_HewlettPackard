--Begin creating important tables for analysis--
--First, list the employee_no, last and first name, sex and salary of employees. 

CREATE TABLE empl_salary_info AS(
	SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
	FROM employees e
	JOIN salaries s ON e.emp_no = s.emp_no
);

SELECT * FROM empl_salary_info

--Next look at employees from 1986 at Hewlett

CREATE TABLE empl_info_1986 AS(
	SELECT 
	first_name,
	last_name,
	hire_date
	FROM employees 
	WHERE EXTRACT(YEAR FROM hire_date) = 1986
);

SELECT * FROM empl_info_1986

--Look at the manager at Hewlett 


CREATE TABLE hp_managers AS(
	SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_no,
	dp.dept_name
	FROM employees e
	JOIN dept_manager d ON e.emp_no = d.emp_no
	JOIN departments dp ON d.dept_no = dp.dept_no
);

SELECT * FROM hp_managers


--look at general employees information

CREATE TABLE hp_employee_info AS(
	SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	de.dept_no,
	d.dept_name
	FROM employees e
	JOIN dept_emp de ON e.emp_no = de.emp_no
	JOIN departments d ON de.dept_no = d.dept_no
);

SELECT * FROM hp_employee_info

--Look specifically at employees at HP named "Hercules B."

CREATE TABLE hp_gladiators AS(
	SELECT 
	first_name,
	last_name,
	sex
	FROM employees
	WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
);

SELECT * FROM hp_gladiators

--List each employee in the sales department at HP

CREATE TABLE hp_sales_team AS(
	SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	de.dept_no,
	d.dept_name
	FROM employees e
	JOIN dept_emp de ON e.emp_no = de.emp_no
	JOIN departments d ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales'
);

ALTER TABLE hp_sales_team
DROP COLUMN dept_no,
DROP COLUMN dept_name;

SELECT * FROM hp_sales_team;

--Look at employees who work in sales and development

CREATE TABLE hp_sales_development AS(
	SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	de.dept_no,
	dp.dept_name
	FROM employees e
	JOIN dept_emp de ON e.emp_no = de.emp_no
	JOIN departments dp ON de.dept_no = dp.dept_no
	WHERE dept_name IN ('Sales', 'Development')
);

ALTER TABLE hp_sales_development
DROP COLUMN dept_no;

SELECT * FROM hp_sales_development

--Count the frequency of employee last names at HP

CREATE TABLE hp_last_name_frequency AS(
	SELECT last_name, COUNT(*) AS frequency
	FROM employees
	GROUP BY last_name
);

SELECT * FROM hp_last_name_frequency

--Hope you enjoyed this SQL analysis!
