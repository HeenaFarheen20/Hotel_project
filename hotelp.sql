Create database Project;
Show databases;

Use project;

* -- To get the answer of how  much revenue generated in each hotel type in three diffirent years.

With hotels
as (select * from project.2018
union
select * from project.2019
union
select * from project.2020)
select 
arrival_date_year, hotel,
round(sum((stays_in_week_nights + stays_in_weekend_nights)*adr),2) as Revenue 
FROM hotels 
group by arrival_date_year, hotel;

*-- Get the answer how much discount associated and how much cost earned by meals in each hotel type.

WITH HOTELS AS(
SELECT * FROM project.`2018`
UNION
SELECT * FROM project.`2019`
UNION
SELECT * FROM project.`2020`)

SELECT * from hotels
left join project.market_segment
on hotels.market_segment = market_segment.market_segment
left join project.meal_cost
on meal_cost.meal = hotels.meal;
