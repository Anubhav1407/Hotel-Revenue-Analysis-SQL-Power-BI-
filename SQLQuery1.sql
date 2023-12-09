
-- Q1. Is our hotel revenue growing by year?
WITH Hotels AS (
SELECT * FROM [dbo].['2018$']
UNION
SELECT * FROM [dbo].['2019$']
UNION
SELECT * FROM [dbo].['2020$']
)

SELECT arrival_date_year, hotel, sum((stays_in_week_nights + stays_in_weekend_nights)*adr) as Revenue 
FROM Hotels
GROUP BY arrival_date_year, hotel;

-- Creating the final single table for the analysation process in POWER BI
WITH Hotels AS (
SELECT * FROM [dbo].['2018$']
UNION
SELECT * FROM [dbo].['2019$']
UNION
SELECT * FROM [dbo].['2020$']
)

SELECT * FROM Hotels
LEFT JOIN [dbo].[market_segment$]
ON Hotels.market_segment = market_segment$.market_segment
LEFT JOIN [dbo].[meal_cost$]
ON Hotels.meal = meal_cost$.meal  

