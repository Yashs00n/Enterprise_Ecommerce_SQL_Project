/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 04_Transaction_Tables.sql
* MODULE   : Transaction Tables
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Creates transaction tables for the E-Commerce project.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- Drop Existing Tables (Development Only)
-- ===========================================================

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;

-- ===========================================================
-- Table : Orders
-- Description : Stores customer orders.
-- ===========================================================

CREATE TABLE orders
(
    order_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,

    employee_id INT,

    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    order_status ENUM
    (
        'Pending',
        'Confirmed',
        'Shipped',
        'Delivered',
        'Cancelled'
    ) DEFAULT 'Pending',

    total_amount DECIMAL(10,2) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_orders_customer
        FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_orders_employee
        FOREIGN KEY(employee_id)
        REFERENCES employees(employee_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    CONSTRAINT chk_order_total
        CHECK(total_amount >= 0)
);

-- ===========================================================
-- Table : Order Items
-- Description : Stores products inside each order.
-- ===========================================================

CREATE TABLE order_items
(
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,

    order_id INT NOT NULL,

    product_id INT NOT NULL,

    quantity INT NOT NULL,

    unit_price DECIMAL(10,2) NOT NULL,

    line_total DECIMAL(10,2) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_orderitems_order
        FOREIGN KEY(order_id)
        REFERENCES orders(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_orderitems_product
        FOREIGN KEY(product_id)
        REFERENCES products(product_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_quantity
        CHECK(quantity > 0),

    CONSTRAINT chk_unit_price
        CHECK(unit_price >= 0),

    CONSTRAINT chk_line_total
        CHECK(line_total >= 0)
);

-- ===========================================================
-- Table : Payments
-- Description : Stores payment details.
-- ===========================================================

CREATE TABLE payments
(
    payment_id INT AUTO_INCREMENT PRIMARY KEY,

    order_id INT NOT NULL,

    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    payment_method ENUM
    (
        'Cash',
        'Credit Card',
        'Debit Card',
        'UPI',
        'Net Banking'
    ) NOT NULL,

    payment_status ENUM
    (
        'Pending',
        'Success',
        'Failed',
        'Refunded'
    ) DEFAULT 'Pending',

    amount DECIMAL(10,2) NOT NULL,

    transaction_reference VARCHAR(100),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_payments_order
        FOREIGN KEY(order_id)
        REFERENCES orders(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT chk_payment_amount
        CHECK(amount >= 0)
);

-- ===========================================================
-- Verify Tables
-- ===========================================================

SHOW TABLES;

-- ===========================================================
-- Verify Structure
-- ===========================================================

DESC orders;

DESC order_items;

DESC payments;