/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 16_Indexes.sql
* MODULE   : Indexes
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Demonstrates SQL Indexes.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- Show Existing Indexes
-- ===========================================================

SHOW INDEX FROM customers;

SHOW INDEX FROM products;

SHOW INDEX FROM orders;

-- ===========================================================
-- Create Index on Customer Email
-- ===========================================================

CREATE INDEX idx_customer_email
ON customers(email);

-- ===========================================================
-- Create Index on Product Name
-- ===========================================================

CREATE INDEX idx_product_name
ON products(product_name);

-- ===========================================================
-- Create Index on Product Price
-- ===========================================================

CREATE INDEX idx_product_price
ON products(unit_price);

-- ===========================================================
-- Create Composite Index
-- ===========================================================

CREATE INDEX idx_product_category_price
ON products(category_id, unit_price);

-- ===========================================================
-- Create Index on Orders
-- ===========================================================

CREATE INDEX idx_order_date
ON orders(order_date);

-- ===========================================================
-- Create Composite Index
-- ===========================================================

CREATE INDEX idx_order_customer_status
ON orders(customer_id, order_status);

-- ===========================================================
-- Create Payment Index
-- ===========================================================

CREATE INDEX idx_payment_status
ON payments(payment_status);

-- ===========================================================
-- Verify Indexes
-- ===========================================================

SHOW INDEX FROM customers;

SHOW INDEX FROM products;

SHOW INDEX FROM orders;

SHOW INDEX FROM payments;

-- ===========================================================
-- Query Using Index
-- ===========================================================

SELECT *
FROM customers
WHERE email='rahul@gmail.com';

SELECT *
FROM products
WHERE product_name='iPhone 16';

SELECT *
FROM products
WHERE category_id=1
AND unit_price>50000;

-- ===========================================================
-- Explain Query
-- ===========================================================

EXPLAIN
SELECT *
FROM products
WHERE product_name='iPhone 16';

EXPLAIN
SELECT *
FROM orders
WHERE customer_id=1
AND order_status='Delivered';

-- ===========================================================
-- Drop Index
-- ===========================================================

DROP INDEX idx_payment_status
ON payments;

-- ===========================================================
-- Verify Again
-- ===========================================================

SHOW INDEX FROM payments;