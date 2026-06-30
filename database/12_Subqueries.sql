/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 12_Subqueries.sql
* MODULE   : Subqueries
* AUTHOR   : Yash
* VERSION  : 1.0
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- 1. Scalar Subquery
-- Product Above Average Price
-- ===========================================================

SELECT
    product_id,
    product_name,
    unit_price
FROM products
WHERE unit_price >
(
    SELECT AVG(unit_price)
    FROM products
);

-- ===========================================================
-- 2. Highest Paid Employee
-- ===========================================================

SELECT
    employee_name,
    salary
FROM employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
);

-- ===========================================================
-- 3. Cheapest Product
-- ===========================================================

SELECT
    product_name,
    unit_price
FROM products
WHERE unit_price =
(
    SELECT MIN(unit_price)
    FROM products
);

-- ===========================================================
-- 4. Customers Who Placed Orders
-- IN Subquery
-- ===========================================================

SELECT
    customer_id,
    first_name,
    last_name
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
);

-- ===========================================================
-- 5. Customers Who Never Ordered
-- NOT IN Subquery
-- ===========================================================

SELECT
    customer_id,
    first_name,
    last_name
FROM customers
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM orders
);

-- ===========================================================
-- 6. EXISTS
-- ===========================================================

SELECT
    customer_id,
    first_name
FROM customers c
WHERE EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- ===========================================================
-- 7. NOT EXISTS
-- ===========================================================

SELECT
    customer_id,
    first_name
FROM customers c
WHERE NOT EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- ===========================================================
-- 8. Correlated Subquery
-- Employee Handling Orders
-- ===========================================================

SELECT
    employee_name
FROM employees e
WHERE EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.employee_id = e.employee_id
);

-- ===========================================================
-- 9. Product More Expensive Than Category Average
-- Correlated Subquery
-- ===========================================================

SELECT
    product_name,
    category_id,
    unit_price
FROM products p
WHERE unit_price >
(
    SELECT AVG(unit_price)
    FROM products
    WHERE category_id = p.category_id
);

-- ===========================================================
-- 10. Orders Above Overall Average
-- ===========================================================

SELECT
    order_id,
    total_amount
FROM orders
WHERE total_amount >
(
    SELECT AVG(total_amount)
    FROM orders
);

-- ===========================================================
-- 11. ANY
-- ===========================================================

SELECT
    product_name,
    unit_price
FROM products
WHERE unit_price > ANY
(
    SELECT unit_price
    FROM products
    WHERE category_id = 4
);

-- ===========================================================
-- 12. ALL
-- ===========================================================

SELECT
    product_name,
    unit_price
FROM products
WHERE unit_price > ALL
(
    SELECT unit_price
    FROM products
    WHERE category_id = 4
);

-- ===========================================================
-- 13. Nested Subquery
-- ===========================================================

SELECT
    customer_id,
    first_name
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
    WHERE employee_id =
    (
        SELECT employee_id
        FROM employees
        WHERE salary =
        (
            SELECT MAX(salary)
            FROM employees
        )
    )
);