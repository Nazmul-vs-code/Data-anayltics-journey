-- Triggers and event

select *
from employee_demographics;

select *
from employee_salary;

delimiter $$
create trigger emp_insert
	after insert on employee_salary
    for each row 
begin 
	insert into employee_demographics( employee_id, first_name, last_name)
    values (NEW.employee_id, NEW.first_name, NEW.last_name);
end $$
delimiter ;
    
insert into employee_salary( employee_id, first_name, last_name, occupation, salary, dept_id)
values(13, 'lol',' Last', 'entertainments', 40000, null);


-- Events

select *
from employee_demographics;

delimiter $$
create event delete_retire
on schedule every 30 second
do
begin
	delete 
	from employee_demographics
	where age >= 60;
end $$
delimiter ;

show variables like 'event%';

-- DROP EVENT IF EXISTS delete_retire;
        