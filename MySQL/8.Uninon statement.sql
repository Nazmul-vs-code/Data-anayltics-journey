-- Uninon statement

select first_name, last_name
from employee_demographics
union ALL
select first_name, last_name
from employee_salary;

select * 
from employee_salary;

select first_name, last_name, 'old male' as lable
from employee_demographics
where age > 40 and gender='male'
UNION
select first_name, last_name, 'old female' as lable
from employee_demographics
where age > 40 and gender='female'
UNION
select first_name, last_name, 'highly_paid' as lable
from employee_salary
where salary > 70000
order by first_name, last_name
;

