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

