-- CTEs
with cte_example as
(
select gender, avg(salary) avg_sal, max(salary) mx_sal, min(salary) min_sal, count(salary) coun_sal
from employee_demographics dem 
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal)
from cte_example
;

with cte2 as 
(
select employee_id, birth_date
from employee_demographics
where birth_date > '1985-01-01'
),
cte3 as (
	select employee_id, salary
    from employee_salary
)
select *
from cte2
join cte3 
	on cte2.employee_id = cte3.employee_id

