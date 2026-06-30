/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 17_Transactions.sql
* MODULE   : Transactions
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Demonstrates SQL Transactions.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- 1. START TRANSACTION
-- ===========================================================

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;

UPDATE orders
SET order_status = 'Confirmed'
WHERE order_id = 1;

COMMIT;

-- ===========================================================
-- 2. ROLLBACK Example
-- ===========================================================

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 5
WHERE product_id = 2;

ROLLBACK;

SELECT
    product_id,
    product_name,
    stock_quantity
FROM products
WHERE product_id = 2;

-- ===========================================================
-- 3. SAVEPOINT Example
-- ===========================================================

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 3;

SAVEPOINT sp_product;

UPDATE orders
SET order_status = 'Delivered'
WHERE order_id = 3;

ROLLBACK TO sp_product;

COMMIT;

-- ===========================================================
-- 4. Customer Update
-- ===========================================================

START TRANSACTION;

UPDATE customers
SET city='Gurgaon'
WHERE customer_id=1;

COMMIT;

-- ===========================================================
-- 5. Employee Salary Update
-- ===========================================================

START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 1;

COMMIT;

-- ===========================================================
-- 6. Multiple Operations
-- ===========================================================

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 3
WHERE product_id = 4;

UPDATE orders
SET order_status='Shipped'
WHERE order_id=4;

UPDATE payments
SET payment_status='Success'
WHERE payment_id=4;

COMMIT;

-- ===========================================================
-- 7. Verify Data
-- ===========================================================

SELECT * FROM products;

SELECT * FROM orders;

SELECT * FROM payments;