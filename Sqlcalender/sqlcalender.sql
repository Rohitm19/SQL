https://www.sqlcalendar.com/app/sql-challenge/1

1. A ski resort company want to know which customers rented ski equipment for more than one type of activity (e.g., skiing and snowboarding). List the customer names and the number of distinct activities they rented equipment for.

Table name: rentals

rental_id	customer_name	activity	rental_date
1	Emily	Skiing	2024-01-01
2	Michael	Snowboarding	2024-01-02
3	Emily	Snowboarding	2024-01-03
4	Sarah	Skiing	2024-01-01
5	Michael	Skiing	2024-01-02
6	Michael	Snowtubing	2024-01-02

Solution:
SELECT customer_name, COUNT(DISTINCT activity) AS distinct_activities
FROM rentals
GROUP BY customer_name
HAVING COUNT(DISTINCT activity) > 1;

2. Santa wants to know which gifts weigh more than 1 kg. Can you list them?

Table name: gifts

gift_name	recipient	weight_kg
Toy Train	John	2.5
Chocolate Box	Alice	0.8
Teddy Bear	Sophia	1.2
Board Game	Liam	0.9

Solution:
SELECT gift_name 
FROM gifts 
WHERE weight_kg > 1;

3. You’re trying to identify the most calorie-packed candies to avoid during your holiday binge. Write a query to rank candies based on their calorie count within each category. Include the candy name, category, calories, and rank (rank_in_category) within the category.

Table name: candy_nutrition

candy_id	candy_name	calories	candy_category
1	Candy Cane	200	Sweets
2	Chocolate Bar	250	Chocolate
3	Gingerbread Cookie	150	Baked Goods
4	Lollipop	100	Sweets
5	Dark Chocolate Truffle	180	Chocolate
6	Marshmallow	900	Sweets
7	Sugar Cookie	140	Baked Goods

Solution:
SELECT 
    candy_name, 
    candy_category, 
    calories, 
    RANK() OVER (PARTITION BY candy_category ORDER BY calories DESC) AS rank_in_category
FROM 
    candy_nutrition;

4. You’re planning your next ski vacation and want to find the best regions with heavy snowfall. Given the tables resorts and snowfall, find the average snowfall for each region and sort the regions in descending order of average snowfall. Return the columns region and average_snowfall.

Table name: ski_resorts

resort_id	resort_name	region
1	Snowy Peaks	Rocky Mountains
2	Winter Wonderland	Wasatch Range
3	Frozen Slopes	Alaska Range
4	Powder Paradise	Rocky Mountains
Table name: snowfall

resort_id	snowfall_inches
1	60
2	45
3	75
4	55

Solution:
SELECT 
    sr.region, 
    ROUND(AVG(sf.snowfall_inches), 2) AS average_snowfall
FROM 
    ski_resorts sr
JOIN 
    snowfall sf
ON 
    sr.resort_id = sf.resort_id
GROUP BY 
    sr.region
ORDER BY 
    average_snowfall DESC;

5. This year, we are celebrating Christmas in the Southern Hemisphere! Which beaches are expected to have temperatures above 30°C on Christmas Day?

Table name: beach_temperature_predictions

beach_name	country	expected_temperature_c	date
Bondi Beach	Australia	32	2024-12-24
Copacabana Beach	Brazil	28	2024-12-24
Clifton Beach	South Africa	31	2024-12-25
Brighton Beach	New Zealand	25	2024-12-25

Solution:
SELECT 
    beach_name, 
    country, 
    expected_temperature_c 
FROM 
    beach_temperature_predictions
WHERE 
    date = '2024-12-25' AND 
    expected_temperature_c > 30;

6. Scientists are tracking polar bears across the Arctic to monitor their migration patterns and caloric intake. Write a query to find the top 3 polar bears that have traveled the longest total distance in December 2024. Include their bear_id, bear_name, and total_distance_traveled in the results.

Table name: polar_bears

bear_id	bear_name	age
1	Snowball	10
2	Frosty	7
3	Iceberg	15
4	Chilly	5
Table name: tracking

tracking_id	bear_id	distance_km	date
1	1	25	2024-12-01
2	2	40	2024-12-02
3	1	30	2024-12-03
4	3	50	2024-12-04
5	2	35	2024-12-05
6	4	20	2024-12-06
7	3	55	2024-12-07
8	1	45	2024-12-08

Solution:
SELECT 
    p.bear_id, 
    p.bear_name, 
    SUM(t.distance_km) AS total_distance_traveled
FROM 
    polar_bears p
JOIN 
    tracking t 
ON 
    p.bear_id = t.bear_id
WHERE 
    t.date BETWEEN '2024-12-01' AND '2024-12-31'
GROUP BY 
    p.bear_id, p.bear_name
ORDER BY 
    total_distance_traveled DESC
LIMIT 3;
