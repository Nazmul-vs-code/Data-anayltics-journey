-- Data cleaning

select *
from layoffs;

-- 1.Remove duplicates
-- 2.Standardize data
-- 3.Null value or blank values
-- 4.Remove columns and rows unncessary


-- Create a copy of the table
create table layoff_staging
like layoffs;


select *
from layoff_staging;

insert layoff_staging
select *
from layoffs;

-- Making unique

select *,
row_number() over(
	partition by company, industry, total_laid_off, percentage_laid_off, `date` 
    ) as row_num
from layoff_staging;

with duplicate_cte as 
(
	select *,
row_number() over(
	partition by company, country, stage, funds_raised_millions, industry, total_laid_off, percentage_laid_off, `date` 
    ) as row_num
from layoff_staging
)
select * 
from duplicate_cte
where row_num > 1
;

-- Remove dup
with duplicate_cte as 
(
	select *,
row_number() over(
	partition by company, country, stage, funds_raised_millions, industry, total_laid_off, percentage_laid_off, `date` 
    ) as row_num
from layoff_staging
)
delete
from duplicate_cte
where row_num > 1
;


-- second try to remov duplicate

CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoff_staging2
	select *,
row_number() over(
	partition by company, country, stage, funds_raised_millions, industry, total_laid_off, percentage_laid_off, `date` 
    ) as row_num
from layoff_staging;

-- now remove
delete
from layoff_staging2
where row_num > 1
;


-- temp check
select *
from layoff_staging2
where row_num > 1
;
