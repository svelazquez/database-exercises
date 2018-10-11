use employees;

-- find all employees with the same hiredate as emp 101010
select e.first_name, e.last_name
from employees e
where hire_date in (
	select hire_date
    from employees
	where emp_no = 101010
    );
    
-- find all titles held by all employees with first name Aamod
select e.first_name, t.title
from employees e
join titles t
	on t.emp_no = e.emp_no
where e.first_name = ( 
		select e.first_name 
        where e.first_name = 'Aamod'
        );
        
-- find current female department managers
select e.first_name, e.last_name, e.gender
from employees e
where emp_no in (
	select emp_no
    from dept_manager dm
    where e.gender= 'F' and dm.to_date > now()
    );
    
-- find dept names that currently have female managers
select d.dept_name
from departments d
where d.dept_no in(
	select dept_no
    from dept_manager dm
    join employees e on e.emp_no= dm.emp_no
    where e.gender= 'F' and dm.to_date > now()
	);
    
-- find name of employee with highest salary
select salary from salaries order by salary desc limit 10;

select concat(e.first_name, ' ', e.last_name) as 'Employee Name'
from employees e
where emp_no = (
	select emp_no
    from salaries
    where salary in (
		select max(salary)
        from salaries
        )
	);


    