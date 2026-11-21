-- case statement

select first_name, last_name, age,
case
	when age < 30 then 'young'
    when age between 30 and 50 then 'old'
end as youth_check

from employee_demographics;

-- Pay increase
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10%

select first_name, last_name, salary,occupation, dept_id,
case
	when dept_id =6 then (salary*(10/100)) + salary
	when salary < 50000 then (salary*(5/100)) + salary
    when salary > 50000 then (salary*(7/100)) + salary
end as bonus
from employee_salary;


select *
from parks_departments;

