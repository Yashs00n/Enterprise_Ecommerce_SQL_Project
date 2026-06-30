/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 03_Constraints.sql
* MODULE   : Constraints
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Adds Foreign Keys, UNIQUE Constraints and CHECK Constraints.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- PRODUCTS → CATEGORIES
-- ===========================================================

ALTER TABLE products
ADD CONSTRAINT fk_products_category
FOREIGN KEY (category_id)
REFERENCES categories(category_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- ===========================================================
-- UNIQUE CONSTRAINTS
-- ===========================================================

ALTER TABLE customers
ADD CONSTRAINT uk_customers_email
UNIQUE(email);

ALTER TABLE employees
ADD CONSTRAINT uk_employees_email
UNIQUE(email);

-- ===========================================================
-- CHECK CONSTRAINTS
-- ===========================================================

ALTER TABLE products
ADD CONSTRAINT chk_product_price
CHECK (unit_price >= 0);

ALTER TABLE products
ADD CONSTRAINT chk_stock_quantity
CHECK (stock_quantity >= 0);

ALTER TABLE employees
ADD CONSTRAINT chk_employee_salary
CHECK (salary >= 0);

-- ===========================================================
-- Verify Constraints
-- ===========================================================

SHOW CREATE TABLE products;

SHOW CREATE TABLE customers;

SHOW CREATE TABLE employees;