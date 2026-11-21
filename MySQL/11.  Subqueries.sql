-- Subqueries

select *
from employee_demographics as emp1
where employee_id in ( 
		select employee_id
        from employee_salary as emp2
		where dept_id=1
)
;


-- Get avg salary along with their own salary in differen column

select first_name, last_name,salary,( 
	select avg(salary)
	from employee_salary 
	)
from employee_salary
group by first_name, last_name,salary
;


select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender
;

select gender, avg(`max(age)`), avg(`min(age)`), avg(`count(age)`)
from (
	select gender, avg(age), max(age), min(age), count(age)
	from employee_demographics
	group by gender
) as agrigated_table
group by gender
;

