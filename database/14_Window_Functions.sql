/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 14_Window_Functions.sql
* MODULE   : Window Functions
* AUTHOR   : Yash
* VERSION  : 1.0
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- 1. ROW_NUMBER()
-- ===========================================================

SELECT
    product_id,
    product_name,
    unit_price,
    ROW_NUMBER() OVER(ORDER BY unit_price DESC) AS row_no
FROM products;

-- ===========================================================
-- 2. RANK()
-- ===========================================================

SELECT
    employee_name,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees;

-- ===========================================================
-- 3. DENSE_RANK()
-- ===========================================================

SELECT
    employee_name,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank
FROM employees;

-- ===========================================================
-- 4. ROW_NUMBER() Partition By Category
-- ===========================================================

SELECT
    category_id,
    product_name,
    unit_price,
    ROW_NUMBER() OVER
    (
        PARTITION BY category_id
        ORDER BY unit_price DESC
    ) AS category_rank
FROM products;

-- ===========================================================
-- 5. RANK() Partition By Category
-- ===========================================================

SELECT
    category_id,
    product_name,
    unit_price,
    RANK() OVER
    (
        PARTITION BY category_id
        ORDER BY unit_price DESC
    ) AS product_rank
FROM products;

-- ===========================================================
-- 6. Running Total
-- ===========================================================

SELECT
    order_id,
    total_amount,
    SUM(total_amount)
    OVER
    (
        ORDER BY order_id
    ) AS running_total
FROM orders;

-- ===========================================================
-- 7. Moving Average
-- ===========================================================

SELECT
    order_id,
    total_amount,

    AVG(total_amount)
    OVER
    (
        ORDER BY order_id
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average

FROM orders;

-- ===========================================================
-- 8. LAG()
-- ===========================================================

SELECT
    order_id,
    total_amount,

    LAG(total_amount,1)
    OVER
    (
        ORDER BY order_id
    ) AS previous_order

FROM orders;

-- ===========================================================
-- 9. LEAD()
-- ===========================================================

SELECT
    order_id,
    total_amount,

    LEAD(total_amount,1)
    OVER
    (
        ORDER BY order_id
    ) AS next_order

FROM orders;

-- ===========================================================
-- 10. FIRST_VALUE()
-- ===========================================================

SELECT
    product_name,
    unit_price,

    FIRST_VALUE(product_name)
    OVER
    (
        ORDER BY unit_price DESC
    ) AS highest_price_product

FROM products;

-- ===========================================================
-- 11. LAST_VALUE()
-- ===========================================================

SELECT
    product_name,
    unit_price,

    LAST_VALUE(product_name)
    OVER
    (
        ORDER BY unit_price DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS cheapest_product

FROM products;

-- ===========================================================
-- 12. NTILE()
-- ===========================================================

SELECT
    product_name,
    unit_price,

    NTILE(4)
    OVER
    (
        ORDER BY unit_price DESC
    ) AS quartile

FROM products;

-- ===========================================================
-- 13. CUME_DIST()
-- ===========================================================

SELECT
    product_name,
    unit_price,

    CUME_DIST()
    OVER
    (
        ORDER BY unit_price
    ) AS cumulative_distribution

FROM products;

-- ===========================================================
-- 14. PERCENT_RANK()
-- ===========================================================

SELECT
    product_name,
    unit_price,

    PERCENT_RANK()
    OVER
    (
        ORDER BY unit_price
    ) AS percent_rank

FROM products;

-- ===========================================================
-- 15. Employee Salary Report
-- ===========================================================

SELECT

    employee_name,

    salary,

    RANK()
    OVER
    (
        ORDER BY salary DESC
    ) salary_rank,

    SUM(salary)
    OVER() total_salary,

    AVG(salary)
    OVER() average_salary

FROM employees;