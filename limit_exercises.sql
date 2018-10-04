use employees;

select distinct last_name from employees order by last_name desc;

select * from employees where birth_date like '%-12-25' and 
	(hire_date >='1990-01-01' and hire_date < '2000-01-01') 
    order by birth_date asc, hire_date desc limit 5 offset 45;