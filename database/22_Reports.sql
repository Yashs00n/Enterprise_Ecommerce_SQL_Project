/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 22_Reports.sql
* MODULE   : Business Reports
* AUTHOR   : Yash
* VERSION  : 1.0
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- 1. Customer Report
-- ===========================================================

SELECT
    customer_id,
    CONCAT(first_name,' ',last_name) AS customer_name,
    city,
    email
FROM customers
ORDER BY customer_name;

-- ===========================================================
-- 2. Product Report
-- ===========================================================

SELECT
    product_id,
    product_name,
    unit_price,
    stock_quantity
FROM products
ORDER BY unit_price DESC;

-- ===========================================================
-- 3. Category Wise Product Count
-- ===========================================================

SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM categories c
LEFT JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_name;

-- ===========================================================
-- 4. Employee Sales Report
-- ===========================================================

SELECT
    e.employee_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_sales
FROM employees e
LEFT JOIN orders o
ON e.employee_id = o.employee_id
GROUP BY e.employee_name;

-- ===========================================================
-- 5. Order Summary Report
-- ===========================================================

SELECT
    order_status,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_sales
FROM orders
GROUP BY order_status;

-- ===========================================================
-- 6. Payment Report
-- ===========================================================

SELECT
    payment_method,
    payment_status,
    COUNT(*) AS total_payments,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method,payment_status;

-- ===========================================================
-- 7. Customer Order Report
-- ===========================================================

SELECT
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- ===========================================================
-- 8. Top 5 Expensive Products
-- ===========================================================

SELECT
    product_name,
    unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 5;

-- ===========================================================
-- 9. Low Stock Report
-- ===========================================================

SELECT
    product_name,
    stock_quantity,
    reorder_level
FROM products
WHERE stock_quantity <= reorder_level;

-- ===========================================================
-- 10. Revenue Report
-- ===========================================================

SELECT
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_order,
    MAX(total_amount) AS highest_order,
    MIN(total_amount) AS lowest_order
FROM orders;

-- ===========================================================
-- 11. Monthly Sales Report
-- ===========================================================

SELECT
    MONTH(order_date) AS month_number,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month_number;

-- ===========================================================
-- 12. Category Revenue Report
-- ===========================================================

SELECT
    c.category_name,
    SUM(oi.line_total) AS revenue
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id
INNER JOIN categories c
ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY revenue DESC;

-- ===========================================================
-- 13. Best Selling Products
-- ===========================================================

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

-- ===========================================================
-- 14. Dashboard Summary
-- ===========================================================

SELECT

(
    SELECT COUNT(*)
    FROM customers
) AS total_customers,

(
    SELECT COUNT(*)
    FROM products
) AS total_products,

(
    SELECT COUNT(*)
    FROM orders
) AS total_orders,

(
    SELECT SUM(total_amount)
    FROM orders
) AS total_sales;

-- ===========================================================
-- 15. Complete Business Report
-- ===========================================================

SELECT

    o.order_id,

    CONCAT(c.first_name,' ',c.last_name) AS customer,

    p.product_name,

    oi.quantity,

    oi.line_total,

    pay.payment_method,

    pay.payment_status,

    e.employee_name

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
ON o.order_id = pay.order_id

ORDER BY o.order_id;