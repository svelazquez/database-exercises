use employees;

select * from employees where first_name in ('Irena', 'Maya', 'Vidya') and gender = 'M'
	order by last_name, first_name DESC;
select * from employees where last_name like 'E%' order by emp_no desc;
select * from employees where hire_date >='1990-01-01' and hire_date < '2000-01-01';
select * from employees where birth_date like '%-12-25';
select * from employees where last_name like '%q%';

-- employees whos last name starts and end with E
select CONCAT(first_name , " ", last_name) from employees
		where last_name like '%E' and last_name like  'E%';

-- find how many days employee has been working for the company
select datediff(curdate(), hire_date) from employees where birth_date like '%-12-25' and 
	(hire_date >='1990-01-01' and hire_date < '2000-01-01') 
    order by birth_date asc, hire_date desc;
    
select * from employees where last_name like '%q%' and last_name not like '%qu%';


