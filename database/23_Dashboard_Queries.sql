/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 23_Dashboard_Queries.sql
* MODULE   : Dashboard Queries
* AUTHOR   : Yash
* VERSION  : 1.0
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- 1. Dashboard KPI
-- ===========================================================

SELECT

    (SELECT COUNT(*) FROM customers) AS total_customers,

    (SELECT COUNT(*) FROM products) AS total_products,

    (SELECT COUNT(*) FROM orders) AS total_orders,

    (SELECT COUNT(*) FROM employees) AS total_employees,

    (SELECT SUM(total_amount) FROM orders) AS total_revenue;

-- ===========================================================
-- 2. Monthly Sales Dashboard
-- ===========================================================

SELECT

    MONTH(order_date) AS month_no,

    MONTHNAME(order_date) AS month_name,

    COUNT(order_id) AS total_orders,

    SUM(total_amount) AS monthly_sales

FROM orders

GROUP BY MONTH(order_date),MONTHNAME(order_date)

ORDER BY month_no;

-- ===========================================================
-- 3. Top 10 Customers
-- ===========================================================

SELECT

    c.customer_id,

    CONCAT(c.first_name,' ',c.last_name) AS customer_name,

    COUNT(o.order_id) AS total_orders,

    SUM(o.total_amount) AS total_spent

FROM customers c

LEFT JOIN orders o

ON c.customer_id=o.customer_id

GROUP BY c.customer_id

ORDER BY total_spent DESC

LIMIT 10;

-- ===========================================================
-- 4. Top Selling Products
-- ===========================================================

SELECT

    p.product_name,

    SUM(oi.quantity) AS total_quantity,

    SUM(oi.line_total) AS revenue

FROM products p

INNER JOIN order_items oi

ON p.product_id=oi.product_id

GROUP BY p.product_name

ORDER BY revenue DESC;

-- ===========================================================
-- 5. Category Wise Sales
-- ===========================================================

SELECT

    c.category_name,

    SUM(oi.line_total) AS total_sales

FROM categories c

INNER JOIN products p

ON c.category_id=p.category_id

INNER JOIN order_items oi

ON p.product_id=oi.product_id

GROUP BY c.category_name

ORDER BY total_sales DESC;

-- ===========================================================
-- 6. Employee Performance Dashboard
-- ===========================================================

SELECT

    e.employee_name,

    COUNT(o.order_id) total_orders,

    SUM(o.total_amount) total_sales

FROM employees e

LEFT JOIN orders o

ON e.employee_id=o.employee_id

GROUP BY e.employee_name

ORDER BY total_sales DESC;

-- ===========================================================
-- 7. Payment Dashboard
-- ===========================================================

SELECT

    payment_method,

    COUNT(*) total_transactions,

    SUM(amount) total_amount

FROM payments

GROUP BY payment_method;

-- ===========================================================
-- 8. Inventory Dashboard
-- ===========================================================

SELECT

    product_name,

    stock_quantity,

    reorder_level,

    CASE

        WHEN stock_quantity=0 THEN 'Out Of Stock'

        WHEN stock_quantity<=reorder_level THEN 'Low Stock'

        ELSE 'Available'

    END AS stock_status

FROM products

ORDER BY stock_quantity;

-- ===========================================================
-- 9. Order Status Dashboard
-- ===========================================================

SELECT

    order_status,

    COUNT(*) total_orders,

    SUM(total_amount) total_sales

FROM orders

GROUP BY order_status;

-- ===========================================================
-- 10. Revenue Dashboard
-- ===========================================================

SELECT

    SUM(total_amount) total_revenue,

    AVG(total_amount) average_order,

    MAX(total_amount) highest_order,

    MIN(total_amount) lowest_order

FROM orders;

-- ===========================================================
-- 11. Daily Sales Dashboard
-- ===========================================================

SELECT

    order_date,

    COUNT(*) total_orders,

    SUM(total_amount) daily_sales

FROM orders

GROUP BY order_date

ORDER BY order_date;

-- ===========================================================
-- 12. Customer City Dashboard
-- ===========================================================

SELECT

    city,

    COUNT(*) total_customers

FROM customers

GROUP BY city

ORDER BY total_customers DESC;

-- ===========================================================
-- 13. Product Price Dashboard
-- ===========================================================

SELECT

    product_name,

    unit_price,

    cost_price,

    (unit_price-cost_price) profit

FROM products

ORDER BY profit DESC;

-- ===========================================================
-- 14. Dashboard Summary
-- ===========================================================

SELECT

    COUNT(*) total_products,

    SUM(stock_quantity) total_stock,

    AVG(unit_price) average_price,

    MAX(unit_price) highest_price,

    MIN(unit_price) lowest_price

FROM products;

-- ===========================================================
-- 15. Complete Dashboard Report
-- ===========================================================

SELECT

    o.order_id,

    CONCAT(c.first_name,' ',c.last_name) customer_name,

    p.product_name,

    oi.quantity,

    oi.line_total,

    pay.payment_method,

    pay.payment_status,

    e.employee_name

FROM orders o

INNER JOIN customers c

ON o.customer_id=c.customer_id

INNER JOIN employees e

ON o.employee_id=e.employee_id

INNER JOIN order_items oi

ON o.order_id=oi.order_id

INNER JOIN products p

ON oi.product_id=p.product_id

INNER JOIN payments pay

ON o.order_id=pay.order_id

ORDER BY o.order_date DESC;