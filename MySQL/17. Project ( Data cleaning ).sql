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

-- **Remove dup**
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

select *
from layoff_staging2
where row_num > 1
;

-- **standerdizing data**

select trim(company), company
from layoff_staging2
;
-- update with trimmed version
update layoff_staging2
set company = trim(company)
;

select distinct(industry)
from layoff_staging2
order by 1
;

-- Cleaning data by industry name with related things
select *
from layoff_staging2
where industry like 'crypto%'
;

update layoff_staging2
set industry='Crypto'
where industry like 'crypto%';

-- checking for location issues
select distinct(location) -- no expleicit issues found
from layoff_staging2
order by 1
;

-- checking for country issues
select distinct country -- one issue found, a ',' after us and got dup
from layoff_staging2
order by 1
;

select distinct country , trim( trailing '.' from country)
from layoff_staging2
order by 1
;

-- select trim( trailing ',' from 'lol,')
-- ;

update layoff_staging2
set country = trim( trailing '.' from country)
where country like 'United States%'
;

-- Date related cleaning
select `date`,
str_to_date(`date`, '%m/%d/%Y') as dateUPdate
from layoff_staging2
;

update layoff_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y')
;

-- Final type casting for data
alter table layoff_staging2
modify column `date` date;

-- temp check
select *
from layoff_staging2
;

-- ** This helped me restore the country, I made a mistake, I update all the country started with united to updae with us rather than updateing all the country name starts with us, there are other cuontrie's names start with united
-- UPDATE layoff_staging2 AS s2
-- JOIN layoff_staging AS s1
--     ON  s2.company <=> s1.company
--     AND s2.location <=> s1.location
--     AND s2.industry <=> s1.industry
--     AND s2.total_laid_off <=> s1.total_laid_off
--     AND s2.percentage_laid_off <=> s1.percentage_laid_off
--     AND s2.`date` <=> s1.`date`
--     AND s2.stage <=> s1.stage
--     AND s2.funds_raised_millions <=> s1.funds_raised_millions
-- SET s2.country = s1.country;
