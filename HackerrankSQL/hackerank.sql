-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'A%' 
   OR CITY LIKE 'E%' 
   OR CITY LIKE 'I%' 
   OR CITY LIKE 'O%' 
   OR CITY LIKE 'U%';
--or
select distinct city from station where left(lower(city),1) in ('a','e','i','o','u'); (conversts the city column into lower case and checks)
--or
SELECT DISTINCT(CITY) 
FROM STATION 
WHERE SUBSTRING(CITY, 1, 1) IN ('a', 'e', 'i', 'o', 'u'); -- substring is case sensitive

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%A' 
   OR CITY LIKE '%E' 
   OR CITY LIKE '%I' 
   OR CITY LIKE '%O' 
   OR CITY LIKE '%U';
--or
select distinct city from station where right(lower(city),1) in ('a','e','i','o','u'); (conversts the city column into lower case and checks)
--0r 
SELECT DISTINCT CITY
FROM STATION
WHERE (SUBSTRING(CITY, LENGTH(CITY), 1)) IN ('a', 'e', 'i', 'o', 'u');

--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION 
WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%') 
      AND (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u');
--OR
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u') AND RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u');
--OR
SELECT DISTINCT CITY FROM STATION WHERE UPPER(SUBSTR(CITY, 1, 1)) IN ('A', 'E', 'I', 'O', 'U') AND UPPER(SUBSTR(CITY, -1, 1)) IN ('A', 'E', 'I', 'O', 'U'); --- note: substr is case sensitive but you can use upper just to make sure if city column contains all upper case names. ALso instead of using length use can use -1.

--Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE 'A%'
      AND CITY NOT LIKE 'E%'
      AND CITY NOT LIKE 'I%'
      AND CITY NOT LIKE 'O%'
      AND CITY NOT LIKE 'U%';
--or
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('A', 'E', 'I', 'O', 'U');
--or
SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTR(CITY, 1, 1) NOT IN ('A', 'E', 'I', 'O', 'U');

-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '%A'
        AND CITY NOT LIKE '%E'
        AND CITY NOT LIKE '%I'
        AND CITY NOT LIKE '%O'
        AND CITY NOT LIKE '%U';
--OR
SELECT DISTINCT CITY
FROM STATION 
WHERE RIGHT(CITY,1) NOT IN('A','E','I','O','U');
--OR
SELECT DISTINCT CITY
FROM STATION 
WHERE SUBSTRING(CITY, -1, 1) NOT IN('A','E','I','O','U');

--Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) NOT IN ('A', 'E', 'I', 'O', 'U') OR RIGHT(CITY,1) NOT IN ('A', 'E', 'I', 'O', 'U');

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) NOT IN ('A', 'E', 'I', 'O', 'U') AND RIGHT(CITY,1) NOT IN ('A', 'E', 'I', 'O', 'U');

-- Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID ASC;

--Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT NAME
FROM EMPLOYEE
ORDER BY NAME;

--Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT NAME
FROM EMPLOYEE
ORDER BY NAME;

--Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.
SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000 AND MONTHS < 10
ORDER BY EMPLOYEE_ID ASC;

--Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
--Equilateral: It's a triangle with  sides of equal length.
--Isosceles: It's a triangle with  sides of equal length.
--Scalene: It's a triangle with  sides of differing lengths.
--Not A Triangle: The given values of A, B, and C don't form a triangle.
SELECT 
    CASE 
        WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle' -- The sum of the lengths of any two sides must be greater than the third side (inequality theorem)
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
    END AS TriangleType
FROM TRIANGLES;

--Query a count of the number of cities in CITY having a Population larger than .
Select Count(Name)
From City
Where Population > 100000;

--Query the total population of all cities in CITY where District is California.
Select Sum(Population) 
From City
Where District = 'California';

--Query the average population of all cities in CITY where District is California.
Select Avg (Population) 
From City
Where District = 'California';

--Query the average population for all cities in CITY, rounded down to the nearest integer.
Select Floor(Avg (Population))
From City;
--or
Select Round(Avg (Population))
From City;

--Query the difference between the maximum and minimum populations in CITY.
Select Max(Population) - Min(Population)
From City;

--Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's '0' key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
--Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.
SELECT ROUND(AVG(Salary) - AVG(REPLACE(Salary, '0', ''))) FROM Employee;  -- Round helps to round it up to next integer as specified. Floor doesnot guarantee.
--or
SELECT CEIL(AVG(SALARY)-AVG(REPLACE(SALARY,0,''))) AS DIFFERENCE FROM EMPLOYEES; -- The CEIL() function takes the result of the difference and rounds it up to the next whole integer.
--or
SELECT CEIL(AVG(SALARY) - AVG(CASE 
                                WHEN SALARY LIKE '%0%' THEN 
                                    CAST(REPLACE(SALARY, '0', '') AS DECIMAL) --CAST() is a function that is used to convert a value from one data type to another.
                                ELSE 
                                    SALARY 
                              END)) AS DIFFERENCE
FROM EMPLOYEES;
--or


--We define an employee's total earnings to be their monthly SALARY X MONTHS  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.
Select Max(Salary * Months), Count(*)
From Employee
Group By Salary * Months
Order By Max(Salary * Months) desc
Limit 1;                                   --Note: Count(*) provides the total count of all rows. But after grouping it counts the rows having maximum salary