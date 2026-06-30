/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 24_Optimization.sql
* MODULE   : Query Optimization
* AUTHOR   : Yash
* VERSION  : 1.0
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- 1. EXPLAIN BASIC QUERY
-- ===========================================================

EXPLAIN
SELECT *
FROM products
WHERE product_name = 'iPhone 16';

-- ===========================================================
-- 2. EXPLAIN WITH INDEX CHECK
-- ===========================================================

EXPLAIN
SELECT *
FROM customers
WHERE email = 'test@gmail.com';

-- ===========================================================
-- 3. Avoid SELECT *
-- ===========================================================

-- ❌ BAD PRACTICE
SELECT *
FROM orders;

-- ✅ GOOD PRACTICE
SELECT
    order_id,
    customer_id,
    total_amount
FROM orders;

-- ===========================================================
-- 4. Using Index Efficiently
-- ===========================================================

CREATE INDEX idx_orders_customer
ON orders(customer_id);

EXPLAIN
SELECT
    order_id,
    total_amount
FROM orders
WHERE customer_id = 1;

-- ===========================================================
-- 5. Covering Index Example
-- ===========================================================

CREATE INDEX idx_product_covering
ON products(product_id, product_name, unit_price);

EXPLAIN
SELECT
    product_id,
    product_name,
    unit_price
FROM products
WHERE product_id = 1;

-- ===========================================================
-- 6. Slow Query Optimization Example
-- ===========================================================

-- ❌ Slow Query
SELECT *
FROM orders
WHERE YEAR(order_date) = 2025;

-- ✅ Optimized Query (Index Friendly)
SELECT *
FROM orders
WHERE order_date >= '2025-01-01'
AND order_date < '2026-01-01';

-- ===========================================================
-- 7. Composite Index Optimization
-- ===========================================================

CREATE INDEX idx_orders_customer_status
ON orders(customer_id, order_status);

EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 1
AND order_status = 'Delivered';

-- ===========================================================
-- 8. Avoid Functions in WHERE Clause
-- ===========================================================

-- ❌ BAD
SELECT *
FROM products
WHERE UPPER(product_name) = 'IPHONE 16';

-- ✅ GOOD
SELECT *
FROM products
WHERE product_name = 'iPhone 16';

-- ===========================================================
-- 9. LIMIT for Performance
-- ===========================================================

SELECT *
FROM products
ORDER BY unit_price DESC
LIMIT 10;

-- ===========================================================
-- 10. Join Optimization
-- ===========================================================

EXPLAIN
SELECT
    o.order_id,
    c.first_name,
    o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- ===========================================================
-- 11. Index Usage Check
-- ===========================================================

SHOW INDEX FROM orders;

SHOW INDEX FROM products;

-- ===========================================================
-- 12. Remove Unused Index
-- ===========================================================

DROP INDEX idx_product_covering
ON products;