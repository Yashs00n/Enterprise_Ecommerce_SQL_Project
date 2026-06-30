/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 03_Constraints.sql
* MODULE   : Constraints
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Adds Foreign Keys, CHECK Constraints and additional UNIQUE Constraints.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- PRODUCTS → CATEGORIES
-- ===========================================================

ALTER TABLE products
ADD CONSTRAINT fk_products_category
FOREIGN KEY (category_id)
REFERENCES categories(category_id);

-- ===========================================================
-- PRODUCTS → BRANDS
-- ===========================================================

ALTER TABLE products
ADD CONSTRAINT fk_products_brand
FOREIGN KEY (brand_id)
REFERENCES brands(brand_id);

-- ===========================================================
-- PRODUCTS → SUPPLIERS
-- ===========================================================

ALTER TABLE products
ADD CONSTRAINT fk_products_supplier
FOREIGN KEY (supplier_id)
REFERENCES suppliers(supplier_id);

-- ===========================================================
-- EMPLOYEES → ROLES
-- ===========================================================

ALTER TABLE employees
ADD CONSTRAINT fk_employee_role
FOREIGN KEY (role_id)
REFERENCES roles(role_id);

-- ===========================================================
-- UNIQUE CONSTRAINTS
-- ===========================================================

ALTER TABLE customers
ADD CONSTRAINT uk_customer_email
UNIQUE(email);

ALTER TABLE employees
ADD CONSTRAINT uk_employee_email
UNIQUE(email);

ALTER TABLE suppliers
ADD CONSTRAINT uk_supplier_email
UNIQUE(email);

-- ===========================================================
-- CHECK CONSTRAINTS
-- ===========================================================

ALTER TABLE employees
ADD CONSTRAINT chk_employee_salary
CHECK (salary >= 0);

ALTER TABLE products
ADD CONSTRAINT chk_product_price
CHECK (unit_price >= 0);

ALTER TABLE products
ADD CONSTRAINT chk_cost_price
CHECK (cost_price >= 0);

ALTER TABLE products
ADD CONSTRAINT chk_stock
CHECK (stock_quantity >= 0);

ALTER TABLE products
ADD CONSTRAINT chk_reorder
CHECK (reorder_level >= 0);
