/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 02_Master_Tables.sql
* MODULE   : Master Tables
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Creates all master tables required for the project.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- Drop Existing Tables (Development Only)
-- ===========================================================

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS categories;

-- ===========================================================
-- Table : Categories
-- Description : Stores product categories.
-- ===========================================================

CREATE TABLE categories
(
    category_id INT AUTO_INCREMENT PRIMARY KEY,

    category_name VARCHAR(100) NOT NULL,

    description VARCHAR(255),

    is_active BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================================
-- Table : Products
-- Description : Stores product information.
-- Foreign Keys will be added in 03_Constraints.sql
-- ===========================================================

CREATE TABLE products
(
    product_id INT AUTO_INCREMENT PRIMARY KEY,

    product_name VARCHAR(150) NOT NULL,

    category_id INT NOT NULL,

    unit_price DECIMAL(10,2) NOT NULL,

    stock_quantity INT DEFAULT 0,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================================
-- Table : Customers
-- Description : Stores customer information.
-- ===========================================================

CREATE TABLE customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,

    first_name VARCHAR(100) NOT NULL,

    last_name VARCHAR(100),

    email VARCHAR(150),

    phone VARCHAR(20),

    city VARCHAR(100),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================================
-- Table : Employees
-- Description : Stores employee information.
-- ===========================================================

CREATE TABLE employees
(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,

    employee_name VARCHAR(150) NOT NULL,

    email VARCHAR(150),

    designation VARCHAR(100),

    salary DECIMAL(10,2),

    joining_date DATE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================================
-- Verify Tables
-- ===========================================================

SHOW TABLES;

-- ===========================================================
-- Verify Structure
-- ===========================================================

DESC categories;

DESC products;

DESC customers;

DESC employees;