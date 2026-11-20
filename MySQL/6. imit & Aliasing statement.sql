-- Limit & Aliasing statement

-- Limit
select * 
from parks_and_recreation.employee_demographics;

select * 
from parks_and_recreation.employee_demographics
order by age desc
limit 4,1; 

-- Aliasing
select gender , avg(age) as lol
from parks_and_recreation.employee_demographics
group by gender
having lol > 40;

