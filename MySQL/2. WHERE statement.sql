select * 
from parks_and_recreation.employee_salary
where salary > 75000;

select * 
from parks_and_recreation.employee_demographics
where gender='female';

select * 
from parks_and_recreation.employee_demographics
where gender='female' and age>40;

select * 
from parks_and_recreation.employee_demographics
where gender='female' or birth_date='1979-09-25';

select *
from parks_and_recreation.employee_demographics
where gender='female' or not birth_date>'1979-09-25';
