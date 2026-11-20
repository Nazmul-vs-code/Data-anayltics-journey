-- Grup By and Order By --
select *
from parks_and_recreation.employee_demographics;

select *
from parks_and_recreation.employee_salary;

select gender
from parks_and_recreation.employee_demographics 
group by gender;

select gender, avg(age),max(age), min(age), count(age)
from parks_and_recreation.employee_demographics 
group by gender;

select occupation, salary
from parks_and_recreation.employee_salary
group by occupation, salary;

select *
from parks_and_recreation.employee_demographics
order by first_name desc;


select *
from parks_and_recreation.employee_demographics
order by gender, age;

