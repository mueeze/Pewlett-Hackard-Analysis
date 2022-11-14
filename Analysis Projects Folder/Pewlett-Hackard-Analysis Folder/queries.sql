-- Retirement Eligibility
select first_name, last_name
from employees
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and (hire_date BETWEEN '1985-01-01' and '1988-12-31');

select first_name, last_name
from employees
where birth_date BETWEEN '1952-01-01' AND '1952-12-31';

select first_name, last_name
from employees
where birth_date BETWEEN '1953-01-01' AND '1953-12-31';

select first_name, last_name
from employees
where birth_date BETWEEN '1954-01-01' AND '1954-12-31';

select first_name, last_name
from employees
where birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Number of employeed retiring
select count(first_name)
from employees
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and (hire_date BETWEEN '1985-01-01' and '1988-12-31');

-- New table from a query
select first_name, last_name
into retirement_info
from employees
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and (hire_date BETWEEN '1985-01-01' and '1988-12-31');

drop table retirement_info;
-- Create new table for retiring employees
select emp_no, first_name, last_name
into retirement_info
from employees
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and (hire_date BETWEEN '1985-01-01' and '1988-12-31');
-- Check the table
select * from retirement_info;

-- Joining department and dep_manager tables
select d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
from departments as d
inner join dept_manager as dm
on d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
Into current_emp
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no
where de.to_date = ('9999-01-01');

-- Employee count by department number
select count(ce.emp_no), de.dept_no
into count_curr_emp
from current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

select * from count_curr_emp;

-- Emp-Info table

select e.emp_no, e.first_name, e.last_name, e.gender, s.salary, de.to_date
into emp_info
from employees as e
inner join salaries as s
on (e.emp_no = s.emp_no)
inner join dept_emp as de
on (e.emp_no = de.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
and (e.hire_date between '1985-01-01' and '1988-12-31')
and (de.to_date = '9999-01-01');

-- Dept Managers Table
select dm.dept_no, d.dept_name, dm.emp_no, ce.last_name, ce.first_name, dm.from_date, dm.to_date
into manager_info
from dept_manager as dm
inner join departments as d
on(dm.dept_no = d.dept_no)
inner join current_emp as ce
on (dm.emp_no = ce.emp_no);

-- Sales_Retirement Table
select e.emp_no, e.first_name, e.last_name, d.dept_name
into sales_retirement
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and (e.hire_date BETWEEN '1985-01-01' and '1988-12-31')
and (d.dept_name = 'Sales')
order by e.emp_no;
-- Check the table
--select * from sales_retirement;

-- Mentor Table
select e.emp_no, e.first_name, e.last_name, d.dept_name
into mentor
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and (e.hire_date BETWEEN '1985-01-01' and '1988-12-31')
and d.dept_name in ('Sales', 'Development')
order by e.emp_no;