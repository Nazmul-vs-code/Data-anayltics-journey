-- String functions

select length('sky');

select first_name, length(first_name)
from employee_demographics
order by 2
;

select * 
from employee_demographics
where length(first_name) > 4
;

select upper('lol');


select first_name, upper(first_name)
from employee_demographics
order by 2
;


select trim(' faa a ');

select first_name, 
left(first_name, 3), 
right(first_name, 3),
substring(first_name, 3, 1),
birth_date,
substring(birth_date, 6, 2) as birth_month
from employee_demographics
order by 2
;


select first_name, replace(first_name,'a', 'z') as replaced
from employee_demographics
order by 1
;

select locate('x', 'loxl');

select concat('lo', ' l');
