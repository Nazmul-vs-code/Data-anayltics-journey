-- Temporary tables

create temporary table tmep_table2
(
	first_name varchar(50),
	last_name varchar(50),
    favorite_movie varchar(500)
    );

insert into tmep_table2 
values (
	'lol2', 'fol2', 'ye 2le '
);

select * 
from tmep_table2;

select * 
from employee_demographics;

create temporary table salary_over_50k
(
	select *
    from employee_salary
    where salary >= 50000
);


select * 
from salary_over_50k;