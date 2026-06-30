/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 09_Functions.sql
* MODULE   : SQL Functions
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Demonstrates MySQL Built-in Functions.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- STRING FUNCTIONS
-- ===========================================================

-- UPPER()

SELECT
product_name,
UPPER(product_name) AS upper_name
FROM products;

---------------------------------------------------------------

-- LOWER()

SELECT
product_name,
LOWER(product_name) AS lower_name
FROM products;

---------------------------------------------------------------

-- LENGTH()

SELECT
product_name,
LENGTH(product_name) AS total_characters
FROM products;

---------------------------------------------------------------

-- CONCAT()

SELECT
first_name,
last_name,
CONCAT(first_name,' ',last_name) AS full_name
FROM customers;

---------------------------------------------------------------

-- LEFT()

SELECT
product_name,
LEFT(product_name,5) AS first_five
FROM products;

---------------------------------------------------------------

-- RIGHT()

SELECT
product_name,
RIGHT(product_name,5) AS last_five
FROM products;

---------------------------------------------------------------

-- SUBSTRING()

SELECT
product_name,
SUBSTRING(product_name,1,4) AS sub_text
FROM products;

---------------------------------------------------------------

-- REPLACE()

SELECT
product_name,
REPLACE(product_name,'Phone','Mobile') AS replaced_name
FROM products;

---------------------------------------------------------------

-- TRIM()

SELECT
TRIM('    SQL Learning    ') AS trim_text;

---------------------------------------------------------------

-- REVERSE()

SELECT
product_name,
REVERSE(product_name)
FROM products;

-- ===========================================================
-- NUMERIC FUNCTIONS
-- ===========================================================

-- ROUND()

SELECT
ROUND(12345.6789,2);

---------------------------------------------------------------

-- CEIL()

SELECT
CEIL(123.45);

---------------------------------------------------------------

-- FLOOR()

SELECT
FLOOR(123.99);

---------------------------------------------------------------

-- ABS()

SELECT
ABS(-250);

---------------------------------------------------------------

-- MOD()

SELECT
MOD(25,4);

---------------------------------------------------------------

-- POWER()

SELECT
POWER(2,5);

---------------------------------------------------------------

-- SQRT()

SELECT
SQRT(144);

---------------------------------------------------------------

-- RAND()

SELECT
RAND();

-- ===========================================================
-- DATE FUNCTIONS
-- ===========================================================

-- NOW()

SELECT NOW();

---------------------------------------------------------------

-- CURDATE()

SELECT CURDATE();

---------------------------------------------------------------

-- CURTIME()

SELECT CURTIME();

---------------------------------------------------------------

-- YEAR()

SELECT
joining_date,
YEAR(joining_date)
FROM employees;

---------------------------------------------------------------

-- MONTH()

SELECT
joining_date,
MONTH(joining_date)
FROM employees;

---------------------------------------------------------------

-- DAY()

SELECT
joining_date,
DAY(joining_date)
FROM employees;

---------------------------------------------------------------

-- DATE_FORMAT()

SELECT
joining_date,
DATE_FORMAT(joining_date,'%d-%m-%Y')
FROM employees;

---------------------------------------------------------------

-- DATEDIFF()

SELECT
DATEDIFF(CURDATE(),joining_date)
FROM employees;

-- ===========================================================
-- AGGREGATE FUNCTIONS
-- ===========================================================

-- COUNT()

SELECT
COUNT(*) AS total_products
FROM products;

---------------------------------------------------------------

-- SUM()

SELECT
SUM(unit_price) AS total_price
FROM products;

---------------------------------------------------------------

-- AVG()

SELECT
AVG(unit_price) AS average_price
FROM products;

---------------------------------------------------------------

-- MIN()

SELECT
MIN(unit_price) AS minimum_price
FROM products;

---------------------------------------------------------------

-- MAX()

SELECT
MAX(unit_price) AS maximum_price
FROM products;

-- ===========================================================
-- COMBINED EXAMPLES
-- ===========================================================

SELECT
COUNT(*) AS Total_Products,
SUM(unit_price) AS Total_Value,
AVG(unit_price) AS Average_Price,
MIN(unit_price) AS Cheapest_Product,
MAX(unit_price) AS Costliest_Product
FROM products;