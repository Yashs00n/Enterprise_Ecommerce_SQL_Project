/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 15_Views.sql
* MODULE   : Views
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Demonstrates SQL Views.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- 1. Customer View
-- ===========================================================

CREATE OR REPLACE VIEW vw_customers AS

SELECT
    customer_id,
    CONCAT(first_name,' ',last_name) AS customer_name,
    email,
    city
FROM customers;

-- ===========================================================
-- 2. Product View
-- ===========================================================

CREATE OR REPLACE VIEW vw_products AS

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.unit_price,
    p.stock_quantity

FROM products p

INNER JOIN categories c
ON p.category_id = c.category_id;

-- ===========================================================
-- 3. Order Summary View
-- ===========================================================

CREATE OR REPLACE VIEW vw_orders AS

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
-- 4. Payment View
-- ===========================================================

CREATE OR REPLACE VIEW vw_payments AS

SELECT

    p.payment_id,

    o.order_id,

    p.payment_method,

    p.payment_status,

    p.amount

FROM payments p

INNER JOIN orders o
ON p.order_id = o.order_id;

-- ===========================================================
-- 5. Employee Sales View
-- ===========================================================

CREATE OR REPLACE VIEW vw_employee_sales AS

SELECT

    e.employee_name,

    COUNT(o.order_id) AS total_orders,

    SUM(o.total_amount) AS total_sales

FROM employees e

LEFT JOIN orders o
ON e.employee_id = o.employee_id

GROUP BY e.employee_name;

-- ===========================================================
-- 6. Category Summary View
-- ===========================================================

CREATE OR REPLACE VIEW vw_category_summary AS

SELECT

    c.category_name,

    COUNT(p.product_id) AS total_products,

    SUM(p.stock_quantity) AS total_stock,

    AVG(p.unit_price) AS average_price

FROM categories c

LEFT JOIN products p
ON c.category_id = p.category_id

GROUP BY c.category_name;

-- ===========================================================
-- Verify Views
-- ===========================================================

SHOW FULL TABLES
WHERE TABLE_TYPE='VIEW';

-- ===========================================================
-- Test Views
-- ===========================================================

SELECT * FROM vw_customers;

SELECT * FROM vw_products;

SELECT * FROM vw_orders;

SELECT * FROM vw_payments;

SELECT * FROM vw_employee_sales;

SELECT * FROM vw_category_summary;