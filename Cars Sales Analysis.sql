create database cars;

use cars;


-- READ DATA

select * from carsdetails;

-- Total Cars : To get a count of total Car records

select count(*) as no_of_records
from carsdetails;

-- How many cars are availablle in 2023 ?

select count(*) as no_of_cars_available_in_2023 from 
carsdetails
where year = 2023;

-- How many cars available in 2022,2021,2020 ?
  
  select year ,
  count(*)  as no_of_cars_available
  from carsdetails
  group by year
  having  year in(2020,2021,2022)
 order by year ;

-- To print the total of all cars by year.

select year,
count(*) as no_of_cars
from carsdetails
group by year
order by year;

-- How many diesel cars are available in 2020

select year, count(*) as no_of_diesel_cars 
from carsdetails
where year =2020 and lower(fuel) = 'diesel';

--  How many petrol cars are available in 2020

select year, count(*) as no_of_petrol_cars 
from carsdetails
where year =2020 and lower(fuel) = 'petrol';

-- Print How many fuel cars (petrol,diesel and cng) come by all the year

SELECT year,
  count(*) as no_of_cars
FROM carsdetails
WHERE fuel IN ('petrol', 'diesel', 'cng')
GROUP BY year
order by year;

-- Which year had the sale of more than 100 cars ?

select year,
count(*) as no_of_cars
from carsdetails
group by year
having count(*) > 100
order by year; 

-- All cars details between 2015 and 2023 

select * from carsdetails where year between 2015 and 2023;


-- No of Cars which are buyed between the year 2015 and 2023 
select year,count(*) as no_of_cars from carsdetails where year between 2015 and 2023
group by year;

-- Name all the unique second owner cars

select distinct name from carsdetails
where  lower(owner) = 'second owner';

-- Find the car which has driven for long distance

select name ,km_driven from carsdetails
where km_driven = (select max(km_driven) from carsdetails);

-- Find the car which has the highest selling price and seller type is dealer

select Name,selling_price from carsdetails
where lower(seller_type) = 'dealer'
order by selling_price desc
limit 1;

-- Find the car which has the  highest selling price and seller type is individual

select Name,selling_price from carsdetails
where lower(seller_type )= 'individual'
order by selling_price desc
limit 1;

-- How many automatic cars are available under each name

select name,count(*) as no_of_automatic_cars  from carsdetails
where lower(transmission)='automatic'
group by name
order by no_of_automatic_cars desc ;

-- Find the unique car which has the third owner

select distinct name from carsdetails
where lower(owner)='third owner';

-- How many cars has the fuel as electric

select name ,count(*) as no_of_electric_cars from carsdetails
where fuel ='electric'
group by name;

-- How many cars has the fuel as cng

select name,count(*) as no_of_cng_cars from carsdetails
where lower(fuel) ='cng'
group by name
order by no_of_cng_cars desc;

-- what is the lowest mileage among the cars

select * from carsdetails
order by mileage
limit 1;

-- what is the highest seats among the cars

select * from carsdetails
order by seats desc
limit 1;

-- Name all the unique car name starts with renault

select distinct name from carsdetails
where lower(name) like 'renault%';

-- Name all the unique car name starts with BMW

select distinct name from carsdetails
where lower(name) like 'bmw%';


-- Name all the unique car name which has figo

select distinct name
from carsdetails
where lower(name) like '%figo%';

-- How many customers use each category fuel

select fuel ,count(*) as count_Of_each_fuel from carsdetails
group by fuel
order by 2 desc;



