/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 07_CRUD.sql
* MODULE   : CRUD Operations
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Demonstrates Create, Read, Update and Delete operations.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- CREATE (INSERT)
-- ===========================================================

-- Insert New Category

INSERT INTO categories
(category_name,description)
VALUES
('Books','Educational and Story Books');

-- Insert New Product

INSERT INTO products
(product_name,category_id,unit_price,stock_quantity)
VALUES
('Java Programming Book',6,599.00,100);

-- Insert New Customer

INSERT INTO customers
(first_name,last_name,email,phone,city)
VALUES
('Yash','Sharma','yash@gmail.com','9999999999','Delhi');

-- ===========================================================
-- READ (SELECT)
-- ===========================================================

-- Show All Categories

SELECT *
FROM categories;

-- Show All Products

SELECT *
FROM products;

-- Show All Customers

SELECT *
FROM customers;

-- Show All Orders

SELECT *
FROM orders;

-- Show Specific Columns

SELECT
product_name,
unit_price,
stock_quantity
FROM products;

-- ===========================================================
-- UPDATE
-- ===========================================================

-- Update Product Price

UPDATE products
SET unit_price = 649.00
WHERE product_id = 13;

-- Update Customer City

UPDATE customers
SET city = 'Noida'
WHERE customer_id = 11;

-- Increase Product Stock

UPDATE products
SET stock_quantity = stock_quantity + 50
WHERE product_id = 13;

-- ===========================================================
-- DELETE
-- ===========================================================

-- Delete Product

DELETE FROM products
WHERE product_id = 13;

-- Delete Customer

DELETE FROM customers
WHERE customer_id = 11;

-- ===========================================================
-- VERIFY
-- ===========================================================

SELECT * FROM products;

SELECT * FROM customers;