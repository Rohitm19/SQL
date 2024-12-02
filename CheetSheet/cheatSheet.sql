-- SQL CHEAT SHEET

-- SELECT: Retrieve data from a table
SELECT column1, column2 FROM table_name;

-- DISTINCT: Return unique values
SELECT DISTINCT column_name FROM table_name;

-- WHERE: Filter rows based on conditions
SELECT * FROM table_name WHERE condition;

-- AND & OR: Combine conditions
SELECT * FROM table_name WHERE condition1 AND condition2;

-- IN: Match any value in a list
SELECT * FROM table_name WHERE column_name IN ('value1', 'value2');

-- BETWEEN: Filter within a range
SELECT * FROM table_name WHERE column_name BETWEEN value1 AND value2;

-- LIKE: Search for patterns
SELECT * FROM table_name WHERE column_name LIKE 'A%'; -- Starts with 'A'

-- IS NULL: Check for NULL values
SELECT * FROM table_name WHERE column_name IS NULL;

-- ORDER BY: Sort results
SELECT * FROM table_name ORDER BY column_name ASC; -- Or DESC

-- LIMIT: Limit the number of rows returned
SELECT * FROM table_name LIMIT 5;

-- Aggregates
SELECT COUNT(column_name) FROM table_name; -- Count rows
SELECT SUM(column_name) FROM table_name; -- Sum
SELECT AVG(column_name) FROM table_name; -- Average
SELECT MAX(column_name) FROM table_name; -- Maximum
SELECT MIN(column_name) FROM table_name; -- Minimum

-- GROUP BY: Group rows by a column
SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name;

-- HAVING: Filter grouped rows
SELECT column_name, COUNT(*) 
FROM table_name 
GROUP BY column_name 
HAVING COUNT(*) > 1;

-- Joins
-- INNER JOIN: Return matching rows
SELECT a.column1, b.column2
FROM table_a a
INNER JOIN table_b b ON a.common_column = b.common_column;

-- LEFT JOIN: Return all rows from the left table
SELECT a.column1, b.column2
FROM table_a a
LEFT JOIN table_b b ON a.common_column = b.common_column;

-- INSERT: Add rows
INSERT INTO table_name (column1, column2) VALUES (value1, value2);

-- UPDATE: Modify rows
UPDATE table_name SET column_name = value WHERE condition;

-- DELETE: Remove rows
DELETE FROM table_name WHERE condition;

-- CREATE TABLE: Create a new table
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype
);

-- DROP TABLE: Delete a table
DROP TABLE table_name;

-- ALTER TABLE: Modify a table structure
ALTER TABLE table_name ADD column_name datatype;
ALTER TABLE table_name DROP column_name;

-- Indexes
-- Create Index: Improve query speed
CREATE INDEX index_name ON table_name(column_name);

-- Drop Index: Remove an index
DROP INDEX index_name;

-- Subqueries
-- In SELECT
SELECT column1, (SELECT MAX(column2) FROM table_name) AS max_value 
FROM another_table;

-- In WHERE
SELECT * FROM table_name WHERE column1 = (SELECT column2 FROM another_table);

-- String Functions
SELECT UPPER(column_name), LOWER(column_name), LENGTH(column_name) 
FROM table_name;

-- Date Functions
SELECT NOW(), CURDATE(), YEAR(column_name) FROM table_name;

-- EXPLAIN: Analyze query performance
EXPLAIN SELECT * FROM table_name;

-- Additional SQL Cheat Sheet

-- CONVERT: Convert data from one type to another
SELECT CONVERT(column_name, datatype) FROM table_name;

-- CAST: Convert data to another type
SELECT CAST(column_name AS datatype) FROM table_name;

-- CONCAT: Combine two or more strings into one
SELECT CONCAT(column1, ' ', column2) AS full_name FROM table_name;

-- COALESCE: Return the first non-null value
SELECT COALESCE(column1, column2, 'default_value') FROM table_name;

-- NULLIF: Return NULL if two expressions are equal
SELECT NULLIF(column1, column2) FROM table_name;

-- CASE: Conditional expressions (like IF-ELSE)
SELECT 
    column1, 
    CASE
        WHEN condition THEN 'result1'
        ELSE 'result2'
    END AS new_column
FROM table_name;

-- SUBSTRING: Extract part of a string
SELECT SUBSTRING(column_name, start_position, length) FROM table_name;

-- REPLACE: Replace part of a string
SELECT REPLACE(column_name, 'old_value', 'new_value') FROM table_name;

-- TRIM: Remove spaces from both ends of a string
SELECT TRIM(column_name) FROM table_name;

-- GROUP_CONCAT: Combine multiple rows into a single string
SELECT GROUP_CONCAT(column_name SEPARATOR ', ') FROM table_name;

-- RANK: Ranking rows based on a specific order
SELECT column_name, RANK() OVER (ORDER BY column_name DESC) FROM table_name;

-- ROW_NUMBER: Assign unique row numbers to each row
SELECT column_name, ROW_NUMBER() OVER (ORDER BY column_name) FROM table_name;

-- DENSE_RANK: Rank rows without gaps in ranking
SELECT column_name, DENSE_RANK() OVER (ORDER BY column_name) FROM table_name;

-- WINDOW FUNCTIONS (Analytic Functions):
-- Moving Average Example:
SELECT column_name, 
       AVG(column_name) OVER (ORDER BY column_name ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_avg 
FROM table_name;

-- Common Table Expressions (CTE)
-- WITH: Temporary result set used in the SELECT query
WITH temp AS (
    SELECT column_name FROM table_name WHERE condition
)
SELECT * FROM temp;

-- Recursive CTE (used for hierarchical data)
WITH RECURSIVE temp AS (
    SELECT column_name FROM table_name WHERE condition
    UNION ALL
    SELECT column_name FROM table_name WHERE condition
)
SELECT * FROM temp;

-- TEMPORARY TABLE: A table that exists temporarily
CREATE TEMPORARY TABLE temp_table AS
SELECT * FROM table_name;

-- UNPIVOT: Convert columns into rows (Not available in MySQL, but in other databases)
SELECT column1, column2 FROM 
(SELECT column1, column2 FROM table_name) AS p 
UNPIVOT (column2 FOR column_name IN (column1, column2)) AS unpvt;

-- LIMIT with OFFSET: Skip a specific number of rows
SELECT * FROM table_name LIMIT 5 OFFSET 10; -- Skip first 10 rows, show 5 rows

-- SELECT INTO: Copy data from one table into another table
SELECT * INTO new_table FROM old_table;

-- EXISTS: Check for existence of a subquery result
SELECT * FROM table_name WHERE EXISTS (SELECT column_name FROM other_table WHERE condition);

-- NOT EXISTS: Ensure no result exists from a subquery
SELECT * FROM table_name WHERE NOT EXISTS (SELECT column_name FROM other_table WHERE condition);

-- FULL OUTER JOIN: Return all rows when there is a match in either left (table1) or right (table2) table
-- (Not supported directly in MySQL, but other databases like PostgreSQL support it)
SELECT * FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name;

-- CROSS JOIN: Return the Cartesian product of two tables
SELECT * FROM table1
CROSS JOIN table2;

-- INTERSECT: Return common rows between two queries (Not directly supported in MySQL)
SELECT column_name FROM table1
INTERSECT
SELECT column_name FROM table2;

-- EXCEPT: Return rows from the first query that do not exist in the second query (Not directly supported in MySQL)
SELECT column_name FROM table1
EXCEPT
SELECT column_name FROM table2;

-- TRANSACTIONS: To ensure a set of SQL statements execute together
START TRANSACTION;
-- SQL statements
COMMIT; -- Commit changes
ROLLBACK; -- Rollback changes in case of error

-- Savepoints: Set a point to rollback to within a transaction
SAVEPOINT savepoint_name;
-- SQL statements
ROLLBACK TO SAVEPOINT savepoint_name;

-- FOREIGN KEY: Define a foreign key constraint
ALTER TABLE table_name
ADD CONSTRAINT fk_name
FOREIGN KEY (column_name) REFERENCES other_table (column_name);

-- DROP CONSTRAINT: Remove a foreign key constraint
ALTER TABLE table_name
DROP CONSTRAINT fk_name;

-- CHECK CONSTRAINT: Enforce a condition on a column
ALTER TABLE table_name
ADD CONSTRAINT chk_name CHECK (column_name > 0);

-- AUTO_INCREMENT: Automatically increment numeric values (MySQL)
CREATE TABLE table_name (
    id INT AUTO_INCREMENT PRIMARY KEY,
    column_name VARCHAR(255)
);

-- UNIQUE: Ensure column has unique values
ALTER TABLE table_name
ADD CONSTRAINT unique_name UNIQUE (column_name);

-- FULLTEXT INDEX: Search within large text-based columns
CREATE FULLTEXT INDEX index_name ON table_name(column_name);
