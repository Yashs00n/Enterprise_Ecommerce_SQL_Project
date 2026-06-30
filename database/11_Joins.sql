/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 11_Joins.sql
* MODULE   : JOINS
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Demonstrates SQL Joins with real business examples.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- 1. INNER JOIN
-- Customer Order Report
-- ===========================================================

SELECT
    o.order_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    o.order_date,
    o.order_status,
    o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- ===========================================================
-- 2. INNER JOIN
-- Product Details
-- ===========================================================

SELECT
    p.product_name,
    c.category_name,
    p.unit_price,
    p.stock_quantity
FROM products p
INNER JOIN categories c
ON p.category_id = c.category_id;

-- ===========================================================
-- 3. Three Table JOIN
-- Order Details
-- ===========================================================

SELECT
    o.order_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    o.order_status,
    o.total_amount,
    e.employee_name
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN employees e
ON o.employee_id = e.employee_id;

-- ===========================================================
-- 4. Four Table JOIN
-- Order Product Report
-- ===========================================================

SELECT
    o.order_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    p.product_name,
    oi.quantity,
    oi.line_total
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN order_items oi
ON o.order_id = oi.order_id
INNER JOIN products p
ON oi.product_id = p.product_id;

-- ===========================================================
-- 5. LEFT JOIN
-- All Customers
-- ===========================================================

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id;

-- ===========================================================
-- 6. RIGHT JOIN
-- All Orders
-- ===========================================================

SELECT
    c.first_name,
    o.order_id,
    o.total_amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id=o.customer_id;

-- ===========================================================
-- 7. Employee Order Report
-- ===========================================================

SELECT
    e.employee_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_sales
FROM employees e
LEFT JOIN orders o
ON e.employee_id=o.employee_id
GROUP BY e.employee_name;

-- ===========================================================
-- 8. Payment Report
-- ===========================================================

SELECT
    o.order_id,
    p.payment_method,
    p.payment_status,
    p.amount
FROM orders o
INNER JOIN payments p
ON o.order_id=p.order_id;

-- ===========================================================
-- 9. Complete Business Report
-- ===========================================================

SELECT
    o.order_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    p.product_name,
    oi.quantity,
    oi.line_total,
    pay.payment_method,
    pay.payment_status,
    e.employee_name
FROM orders o

INNER JOIN customers c
ON o.customer_id=c.customer_id

INNER JOIN order_items oi
ON o.order_id=oi.order_id

INNER JOIN products p
ON oi.product_id=p.product_id

INNER JOIN payments pay
ON o.order_id=pay.order_id

INNER JOIN employees e
ON o.employee_id=e.employee_id;

-- ===========================================================
-- 10. Category Wise Products
-- ===========================================================

SELECT
    c.category_name,
    p.product_name,
    p.unit_price
FROM categories c
LEFT JOIN products p
ON c.category_id=p.category_id;