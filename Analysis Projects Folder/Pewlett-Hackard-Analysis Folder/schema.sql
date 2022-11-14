-- Creating tables for PH-EmployeeDB
Create Table departments (
	dept_no VARCHAR (4) NOT NULL,
	dept_name VARCHAR (40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

Create Table employees (
	emp_no int NOT NULL,
	birth_date date NOT NULL,
	first_name VARCHAR (40) not null,
	last_name VARCHAR (40) not null,
	gender VARCHAR (6) not null,
	hire_date date not null,
	PRIMARY KEY (emp_no)
);

Create Table dept_manager (
	dept_no VARCHAR (4) not null,
	emp_no int NOT NULL,
	from_date date NOT NULL,
	to_date date not null,
	foreign key (emp_no) REFERENCES employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE table salaries(
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
	FOREIGN key (emp_no) references employees (emp_no),
	primary key (emp_no)
);

create table titles (
	emp_no int not null,
	title varchar (40) not null,
	from_date date not null,
	to_date date not null,
	FOREIGN key (emp_no) references employees (emp_no),
	primary key (emp_no, title, from_date)
);

Create Table dept_emp (
	emp_no int NOT NULL,
	dept_no VARCHAR (4) not null,
	from_date date NOT NULL,
	to_date date not null,
	foreign key (emp_no) REFERENCES employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);