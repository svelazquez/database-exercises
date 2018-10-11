use employees; 

-- show each department along with name of current manager for that dept.    
describe departments;
describe dept_manager; 
select * from dept_manager limit 10;

select d.dept_name as 'Department Name', concat(e.first_name, ' ', e.last_name) as 'Department Manager'
from departments as d
join dept_manager as dm
	on dm.dept_no = d.dept_no
join employees e 
	on e.emp_no = dm.emp_no
where dm.to_date > now();

-- select name of all departments currently managed by women
describe departments;
describe employees;

select d.dept_name as 'Department Name', concat(e.first_name, ' ', e.last_name) as 'Department Manager'
from departments as d
join dept_manager as dm
	on dm.dept_no = d.dept_no
join employees e 
	on e.emp_no = dm.emp_no
where dm.to_date > now() and e.gender = 'F';    

-- find current titles of employes currently working in customer service
describe titles;
describe departments;
-- grab from and to date
describe dept_emp;

select t.title, count(t.title) as 'Count'
from titles t
join dept_emp de on de.emp_no = t.emp_no
join departments d on d.dept_no = de.dept_no
where t.to_date > now()
and de.to_date > now()
and d.dept_name = 'Customer Service'
group by t.title;

-- current salary of all current managers
describe salaries;

select d.dept_name as 'Department Name', concat(e.first_name, ' ', e.last_name) as 'Department Manager'
	, s.salary
from departments as d
join dept_manager as dm
	on dm.dept_no = d.dept_no
join employees e 
	on e.emp_no = dm.emp_no
join salaries s
	on s.emp_no = e.emp_no
where dm.to_date > now()
	and s.to_date > now();
    
-- current employees, dept name, manager name
describe employees;



select concat(e.first_name, ' ', e.last_name) as 'Employee Name'
	, d.dept_name as 'Department Name'
    , concat(em.first_name, ' ', em.last_name) as 'Department Manager'
	from employees e
join dept_emp de
	on de.emp_no = e.emp_no
join departments d
	on d.dept_no = de.dept_no
join dept_manager dm
	on dm.dept_no = d.dept_no
join employees em
	on em.emp_no = dm.emp_no
where de.to_date > now() and dm.to_date > now();
