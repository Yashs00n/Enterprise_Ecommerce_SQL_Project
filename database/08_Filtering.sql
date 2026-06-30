/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 08_Filtering.sql
* MODULE   : Data Filtering
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Demonstrates SQL filtering techniques.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- 1. Show All Products
-- ===========================================================

SELECT *
FROM products;

-- ===========================================================
-- 2. Products Price Greater Than 5000
-- ===========================================================

SELECT *
FROM products
WHERE unit_price > 5000;

-- ===========================================================
-- 3. Products Between 5000 and 30000
-- ===========================================================

SELECT *
FROM products
WHERE unit_price BETWEEN 5000 AND 30000;

-- ===========================================================
-- 4. Products From Category 1
-- ===========================================================

SELECT *
FROM products
WHERE category_id = 1;

-- ===========================================================
-- 5. Products Category 1 OR 2
-- ===========================================================

SELECT *
FROM products
WHERE category_id IN (1,2);

-- ===========================================================
-- 6. Products NOT in Category 1
-- ===========================================================

SELECT *
FROM products
WHERE category_id NOT IN (1);

-- ===========================================================
-- 7. Products Starting With 'S'
-- ===========================================================

SELECT *
FROM products
WHERE product_name LIKE 'S%';

-- ===========================================================
-- 8. Products Ending With 'e'
-- ===========================================================

SELECT *
FROM products
WHERE product_name LIKE '%e';

-- ===========================================================
-- 9. Products Containing 'Phone'
-- ===========================================================

SELECT *
FROM products
WHERE product_name LIKE '%Phone%';

-- ===========================================================
-- 10. Products Second Letter = 'e'
-- ===========================================================

SELECT *
FROM products
WHERE product_name LIKE '_e%';

-- ===========================================================
-- 11. Customers From Delhi
-- ===========================================================

SELECT *
FROM customers
WHERE city='Delhi';

-- ===========================================================
-- 12. Customers Delhi OR Mumbai
-- ===========================================================

SELECT *
FROM customers
WHERE city='Delhi'
OR city='Mumbai';

-- ===========================================================
-- 13. Salary Greater Than 40000
-- ===========================================================

SELECT *
FROM employees
WHERE salary > 40000;

-- ===========================================================
-- 14. Salary Between 30000 and 50000
-- ===========================================================

SELECT *
FROM employees
WHERE salary BETWEEN 30000 AND 50000;

-- ===========================================================
-- 15. Employees Joined After 2023
-- ===========================================================

SELECT *
FROM employees
WHERE joining_date > '2023-01-01';

-- ===========================================================
-- 16. Orders Delivered
-- ===========================================================

SELECT *
FROM orders
WHERE order_status='Delivered';

-- ===========================================================
-- 17. Orders Pending
-- ===========================================================

SELECT *
FROM orders
WHERE order_status='Pending';

-- ===========================================================
-- 18. Multiple Conditions
-- ===========================================================

SELECT *
FROM products
WHERE category_id=1
AND unit_price > 70000;

-- ===========================================================
-- 19. ORDER BY Price ASC
-- ===========================================================

SELECT *
FROM products
ORDER BY unit_price ASC;

-- ===========================================================
-- 20. ORDER BY Price DESC
-- ===========================================================

SELECT *
FROM products
ORDER BY unit_price DESC;

-- ===========================================================
-- 21. Top 5 Expensive Products
-- ===========================================================

SELECT *
FROM products
ORDER BY unit_price DESC
LIMIT 5;

-- ===========================================================
-- 22. Distinct Cities
-- ===========================================================

SELECT DISTINCT city
FROM customers;

-- ===========================================================
-- 23. NULL Example
-- ===========================================================

SELECT *
FROM employees
WHERE email IS NULL;

-- ===========================================================
-- 24. NOT NULL Example
-- ===========================================================

SELECT *
FROM employees
WHERE email IS NOT NULL;