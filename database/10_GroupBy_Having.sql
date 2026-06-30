/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 10_GroupBy_Having.sql
* MODULE   : GROUP BY & HAVING
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Demonstrates GROUP BY and HAVING Clause.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- GROUP BY
-- ===========================================================

-- 1. Total Customers City Wise

SELECT
    city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- ===========================================================
-- 2. Product Count Category Wise
-- ===========================================================

SELECT
    category_id,
    COUNT(*) AS total_products
FROM products
GROUP BY category_id;

-- ===========================================================
-- 3. Average Product Price Category Wise
-- ===========================================================

SELECT
    category_id,
    AVG(unit_price) AS average_price
FROM products
GROUP BY category_id;

-- ===========================================================
-- 4. Total Stock Category Wise
-- ===========================================================

SELECT
    category_id,
    SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category_id;

-- ===========================================================
-- 5. Employee Wise Total Salary
-- ===========================================================

SELECT
    designation,
    SUM(salary) AS total_salary
FROM employees
GROUP BY designation;

-- ===========================================================
-- 6. Employee Count Designation Wise
-- ===========================================================

SELECT
    designation,
    COUNT(*) AS total_employees
FROM employees
GROUP BY designation;

-- ===========================================================
-- 7. Order Count Status Wise
-- ===========================================================

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- ===========================================================
-- 8. Payment Status Wise Count
-- ===========================================================

SELECT
    payment_status,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_status;

-- ===========================================================
-- HAVING
-- ===========================================================

-- 9. Categories Having More Than 2 Products

SELECT
    category_id,
    COUNT(*) AS total_products
FROM products
GROUP BY category_id
HAVING COUNT(*) > 2;

-- ===========================================================
-- 10. Cities Having More Than One Customer
-- ===========================================================

SELECT
    city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 1;

-- ===========================================================
-- 11. Designations Having Salary Greater Than 50000
-- ===========================================================

SELECT
    designation,
    SUM(salary) AS total_salary
FROM employees
GROUP BY designation
HAVING SUM(salary) > 50000;

-- ===========================================================
-- 12. Categories Having Average Price Greater Than 30000
-- ===========================================================

SELECT
    category_id,
    AVG(unit_price) AS average_price
FROM products
GROUP BY category_id
HAVING AVG(unit_price) > 30000;

-- ===========================================================
-- 13. Payment Status Having More Than One Payment
-- ===========================================================

SELECT
    payment_status,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_status
HAVING COUNT(*) > 1;

-- ===========================================================
-- 14. Order Status Having More Than One Order
-- ===========================================================

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
HAVING COUNT(*) > 1;

-- ===========================================================
-- 15. Combined Example
-- ===========================================================

SELECT
    category_id,
    COUNT(*) AS total_products,
    SUM(stock_quantity) AS total_stock,
    AVG(unit_price) AS average_price,
    MIN(unit_price) AS minimum_price,
    MAX(unit_price) AS maximum_price
FROM products
GROUP BY category_id
ORDER BY category_id;