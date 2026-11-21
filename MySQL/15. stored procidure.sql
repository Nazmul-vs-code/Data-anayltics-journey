-- Stored Procedure

select * 
from employee_salary
where salary >= 50000;

create procedure large_salary()
select * 
from employee_salary
where salary >= 50000;

call large_salary();

delimiter $$
create procedure large_salary3()
begin
	select * 
	from employee_salary
	where salary >= 50000;
	select * 
	from employee_salary
	where salary >= 10000;
end $$
delimiter ;
call large_salary3();

delimiter $$
create procedure large_salary4(amp_id int)
begin
	select * 
	from employee_salary
	where employee_id = amp_id;
end $$
delimiter ;

call large_salary4(8);