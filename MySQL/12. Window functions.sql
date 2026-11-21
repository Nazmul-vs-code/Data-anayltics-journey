-- Window functions

select gender, avg(salary) as avg_sal
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
group by gender
;

select dem.first_name, dem.last_name,gender,
avg(salary) over( partition by gender )
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id 
;


select dem.first_name, dem.last_name,gender, salary,dem.employee_id,
avg(salary) over( partition by gender order by dem.employee_id ) as Rolling_total
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id 
;


select dem.first_name, dem.last_name,gender, salary,dem.employee_id,
row_number() over( partition by gender order by salary desc ) as row_num,
rank() over( partition by gender order by salary desc ) as rank_num,
dense_rank() over( partition by gender order by salary desc ) as rank_num
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id 
;

