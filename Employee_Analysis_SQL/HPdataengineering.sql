--run first 
create table departments(
	dept_no VARCHAR(40) not null,
	dept_name VARCHAR(30) not null,
	PRIMARY KEY(dept_no)
);


--run second 
create table titles(
	title_id VARCHAR(17) not null,
	title VARCHAR(40) not null,
	PRIMARY KEY(title_id)
);

--run third
create table employees(
	emp_no INT not null,
	emp_title_id VARCHAR(30) not null,
	birth_date DATE not null,
	first_name VARCHAR(30) not null,
	last_name VARCHAR(30) not null,
	sex VARCHAR(15) not null,
	hire_date DATE not null,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);


--Run fourth 
create table dept_emp(
	emp_no INT not null,
	dept_no VARCHAR(40) not null,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

--Run Fifth same as above
create table dept_manager(
	dept_no VARCHAR(40) not null,
	emp_no INT not null,
	PRIMARY KEY(dept_no, emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

--Lastly run the sixth table 
create table salaries(
	emp_no INT not null,
	salary INT not null, 
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

--Make sure import of data works on each table 
SELECT * FROM departments
SELECT * FROM titles
SELECT * FROM employees
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM salaries 






