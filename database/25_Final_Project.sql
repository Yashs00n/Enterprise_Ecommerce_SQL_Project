/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 25_Final_Project.sql
* MODULE   : Final Integration
* AUTHOR   : Yash
* VERSION  : 1.0
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- 1. FULL CUSTOMER ORDER FLOW
-- ===========================================================

START TRANSACTION;

-- Step 1: Insert Order
INSERT INTO orders
(
    customer_id,
    employee_id,
    order_date,
    order_status,
    total_amount
)
VALUES
(
    1,
    1,
    NOW(),
    'Pending',
    50000
);

-- Step 2: Reduce Stock
UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;

-- Step 3: Insert Payment
INSERT INTO payments
(
    order_id,
    payment_method,
    amount,
    payment_status
)
VALUES
(
    LAST_INSERT_ID(),
    'Card',
    50000,
    'Success'
);

COMMIT;

-- ===========================================================
-- 2. COMPLETE BUSINESS VIEW
-- ===========================================================

CREATE OR REPLACE VIEW vw_complete_order_details AS

SELECT

    o.order_id,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    e.employee_name,
    p.product_name,
    oi.quantity,
    oi.line_total,
    pay.payment_method,
    pay.payment_status,
    o.order_status,
    o.order_date

FROM orders o

INNER JOIN customers c
ON o.customer_id = c.customer_id

INNER JOIN employees e
ON o.employee_id = e.employee_id

INNER JOIN order_items oi
ON o.order_id = oi.order_id

INNER JOIN products p
ON oi.product_id = p.product_id

INNER JOIN payments pay
ON o.order_id = pay.order_id;

-- ===========================================================
-- 3. FINAL SALES REPORT
-- ===========================================================

SELECT

    SUM(total_amount) AS total_revenue,
    COUNT(order_id) AS total_orders,
    AVG(total_amount) AS average_order_value,
    MAX(total_amount) AS highest_order,
    MIN(total_amount) AS lowest_order

FROM orders;

-- ===========================================================
-- 4. TOP CUSTOMER ANALYSIS
-- ===========================================================

SELECT

    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(o.total_amount) AS total_spent

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

GROUP BY c.customer_id

ORDER BY total_spent DESC;

-- ===========================================================
-- 5. PRODUCT PERFORMANCE ANALYSIS
-- ===========================================================

SELECT

    p.product_name,
    SUM(oi.quantity) AS total_sold,
    SUM(oi.line_total) AS revenue

FROM products p

INNER JOIN order_items oi
ON p.product_id = oi.product_id

GROUP BY p.product_name

ORDER BY revenue DESC;

-- ===========================================================
-- 6. INVENTORY STATUS FINAL CHECK
-- ===========================================================

SELECT

    product_name,
    stock_quantity,

    CASE

        WHEN stock_quantity = 0 THEN 'OUT OF STOCK'
        WHEN stock_quantity < 10 THEN 'CRITICAL'
        WHEN stock_quantity < 20 THEN 'LOW'
        ELSE 'OK'

    END AS stock_status

FROM products;

-- ===========================================================
-- 7. EMPLOYEE PERFORMANCE FINAL REPORT
-- ===========================================================

SELECT

    e.employee_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_sales

FROM employees e

LEFT JOIN orders o
ON e.employee_id = o.employee_id

GROUP BY e.employee_name

ORDER BY total_sales DESC;

-- ===========================================================
-- 8. AUDIT LOG FINAL CHECK
-- ===========================================================

SELECT *

FROM audit_log

ORDER BY action_time DESC;

-- ===========================================================
-- 9. SYSTEM HEALTH CHECK
-- ===========================================================

SELECT

    (SELECT COUNT(*) FROM customers) AS customers,
    (SELECT COUNT(*) FROM products) AS products,
    (SELECT COUNT(*) FROM orders) AS orders,
    (SELECT COUNT(*) FROM payments) AS payments,
    (SELECT COUNT(*) FROM employees) AS employees;

-- ===========================================================
-- 10. FINAL DASHBOARD OUTPUT
-- ===========================================================

SELECT

    (SELECT SUM(total_amount) FROM orders) AS total_revenue,

    (SELECT COUNT(*) FROM orders) AS total_orders,

    (SELECT COUNT(*) FROM customers) AS total_customers,

    (SELECT COUNT(*) FROM products) AS total_products,

    (SELECT AVG(total_amount) FROM orders) AS avg_order_value;