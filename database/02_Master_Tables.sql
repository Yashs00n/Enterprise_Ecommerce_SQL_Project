/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 02_Master_Tables.sql
* MODULE   : Master Tables
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Creates all master tables.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- =====================================================
-- 1. CATEGORIES
-- =====================================================

CREATE TABLE IF NOT EXISTS categories
(
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    category_description VARCHAR(500),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
               ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- 2. BRANDS
-- =====================================================

CREATE TABLE IF NOT EXISTS brands
(
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL UNIQUE,
    brand_description VARCHAR(500),
    country_of_origin VARCHAR(100),
    website VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
               ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- 3. SUPPLIERS
-- =====================================================

CREATE TABLE IF NOT EXISTS suppliers
(
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
               ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- 4. ROLES
-- =====================================================

CREATE TABLE IF NOT EXISTS roles
(
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL UNIQUE,
    role_description VARCHAR(300),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- 5. EMPLOYEES
-- =====================================================

CREATE TABLE IF NOT EXISTS employees
(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    gender ENUM('Male','Female','Other'),
    email VARCHAR(100),
    phone VARCHAR(20),
    hire_date DATE,
    salary DECIMAL(10,2),
    role_id INT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
               ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- 6. CUSTOMERS
-- =====================================================

CREATE TABLE IF NOT EXISTS customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender ENUM('Male','Female','Other'),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
               ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- 7. WAREHOUSES
-- =====================================================

CREATE TABLE IF NOT EXISTS warehouses
(
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    manager_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
               ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- 8. PRODUCTS
-- =====================================================

CREATE TABLE IF NOT EXISTS products
(
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,

    category_id INT,
    brand_id INT,
    supplier_id INT,

    sku VARCHAR(50) UNIQUE,
    barcode VARCHAR(100),

    unit_price DECIMAL(10,2),
    cost_price DECIMAL(10,2),

    stock_quantity INT DEFAULT 0,

    reorder_level INT DEFAULT 10,

    product_description TEXT,

    is_active BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
               ON UPDATE CURRENT_TIMESTAMP
);