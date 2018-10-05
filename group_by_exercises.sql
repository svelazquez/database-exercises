use employees;

select distinct title from titles;

-- employees whos last name starts and end with E
select last_name from employees
		where last_name like '%E' and last_name like  'E%' group by last_name;
        
select distinct last_name, count(*) from employees where last_name like '%q%' and last_name not like '%qu%' group by last_name;

select gender, count(*) from employees where first_name in ('Irena', 'Maya', 'Vidya') group by gender ;
