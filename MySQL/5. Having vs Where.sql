-- Having vs Where

select gender, avg(age)
from  parks_and_recreation.employee_demographics
group by gender 
having AVG(age)>40;

select occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like '%mana%'
group by occupation
having avg(salary) > 50;

select occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like '%mana%' and salary > 75000
group by occupation;

