
select * from employees where first_name in ('Irena', 'Maya', 'Vidya') and gender = 'M';
select * from employees where last_name like 'E%';
select * from employees where hire_date >='1990-01-01' and hire_date < '2000-01-01';
select * from employees where birth_date like '%-12-25';
select * from employees where last_name like '%q%';
select * from employees where last_name like '%E' and last_name like  'E%';
select * from employees where birth_date like '%-12-25' and 
	(hire_date >='1990-01-01' and hire_date < '2000-01-01');
select * from employees where last_name like '%q%' and last_name not like '%qu%';


