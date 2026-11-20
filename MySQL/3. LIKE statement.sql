-- Like statement-- 

select *
from parks_and_recreation.employee_demographics 
where first_name like '%err%';

select *
from parks_and_recreation.employee_demographics 
where first_name like 'A__';