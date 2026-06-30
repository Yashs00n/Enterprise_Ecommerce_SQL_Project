/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 13_CTE.sql
* MODULE   : Common Table Expressions (CTE)
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Demonstrates Common Table Expressions (CTE).
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- 1. Basic CTE
-- ===========================================================

WITH ProductList AS
(
    SELECT
        product_id,
        product_name,
        unit_price
    FROM products
)

SELECT *
FROM ProductList;

-- ===========================================================
-- 2. Products Above Average Price
-- ===========================================================

WITH AvgPrice AS
(
    SELECT AVG(unit_price) AS average_price
    FROM products
)

SELECT
    product_name,
    unit_price
FROM products
WHERE unit_price >
(
    SELECT average_price
    FROM AvgPrice
);

-- ===========================================================
-- 3. Customer Order Summary
-- ===========================================================

WITH CustomerOrders AS
(
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    co.total_orders,
    co.total_sales
FROM CustomerOrders co
INNER JOIN customers c
ON co.customer_id = c.customer_id;

-- ===========================================================
-- 4. Employee Sales Summary
-- ===========================================================

WITH EmployeeSales AS
(
    SELECT
        employee_id,
        COUNT(order_id) AS total_orders,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)

SELECT
    e.employee_name,
    es.total_orders,
    es.total_sales
FROM EmployeeSales es
INNER JOIN employees e
ON es.employee_id = e.employee_id;

-- ===========================================================
-- 5. Category Wise Stock
-- ===========================================================

WITH CategoryStock AS
(
    SELECT
        category_id,
        SUM(stock_quantity) AS total_stock
    FROM products
    GROUP BY category_id
)

SELECT
    c.category_name,
    cs.total_stock
FROM CategoryStock cs
INNER JOIN categories c
ON cs.category_id = c.category_id;

-- ===========================================================
-- 6. Delivered Orders
-- ===========================================================

WITH DeliveredOrders AS
(
    SELECT *
    FROM orders
    WHERE order_status='Delivered'
)

SELECT *
FROM DeliveredOrders;

-- ===========================================================
-- 7. High Value Orders
-- ===========================================================

WITH HighValueOrders AS
(
    SELECT *
    FROM orders
    WHERE total_amount > 50000
)

SELECT *
FROM HighValueOrders;

-- ===========================================================
-- 8. Product Revenue
-- ===========================================================

WITH ProductRevenue AS
(
    SELECT
        product_id,
        SUM(line_total) AS revenue
    FROM order_items
    GROUP BY product_id
)

SELECT
    p.product_name,
    pr.revenue
FROM ProductRevenue pr
INNER JOIN products p
ON pr.product_id = p.product_id
ORDER BY pr.revenue DESC;

-- ===========================================================
-- 9. Pending Payments
-- ===========================================================

WITH PendingPayments AS
(
    SELECT *
    FROM payments
    WHERE payment_status='Pending'
)

SELECT *
FROM PendingPayments;

-- ===========================================================
-- 10. Multiple CTE
-- ===========================================================

WITH

CustomerOrders AS
(
    SELECT
        customer_id,
        COUNT(*) total_orders
    FROM orders
    GROUP BY customer_id
),

CustomerPayments AS
(
    SELECT
        o.customer_id,
        SUM(p.amount) total_payment
    FROM orders o
    INNER JOIN payments p
    ON o.order_id=p.order_id
    GROUP BY o.customer_id
)

SELECT

c.customer_id,

CONCAT(c.first_name,' ',c.last_name) customer_name,

co.total_orders,

cp.total_payment

FROM customers c

LEFT JOIN CustomerOrders co
ON c.customer_id=co.customer_id

LEFT JOIN CustomerPayments cp
ON c.customer_id=cp.customer_id;