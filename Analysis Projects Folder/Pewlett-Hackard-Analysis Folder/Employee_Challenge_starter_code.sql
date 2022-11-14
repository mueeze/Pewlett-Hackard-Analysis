-- Deliverable 1

select e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
into retirement_titles
from employees as e
inner join titles as ti
on (e.emp_no = ti.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate row

SELECT DISTINCT ON (rt.title) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Count of Titles

SELECT count(ut.titles), ut.title
-- INTO retirint_titles
FROM unique_titles as ut
Group BY ut.title 
order by count DESC;

-- Deliverable 2

select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
into mentorship_eligibility
from employees as e
inner join dept_emp as de
on (e.emp_no = de.emp_no)
inner join titles as t
on (e.emp_no = t.emp_no)
where (de.to_date = '9999-01-01')
and (e.birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no;

-- Deliverable 3

SELECT count(me.titles), me.title
-- INTO retirint_titles
FROM unique_titles as ut
Group BY ut.title 
order by count DESC;