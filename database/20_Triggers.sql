/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 20_Triggers.sql
* MODULE   : Triggers
* AUTHOR   : Yash
* VERSION  : 1.0
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- Create Audit Table
-- ===========================================================

CREATE TABLE IF NOT EXISTS audit_log
(
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(50),
    table_name VARCHAR(50),
    description VARCHAR(255),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================================
-- Trigger 1 : AFTER INSERT ON CUSTOMERS
-- ===========================================================

DROP TRIGGER IF EXISTS trg_customer_insert;

DELIMITER $$

CREATE TRIGGER trg_customer_insert

AFTER INSERT
ON customers

FOR EACH ROW

BEGIN

    INSERT INTO audit_log
    (
        action_type,
        table_name,
        description
    )

    VALUES
    (
        'INSERT',
        'customers',
        CONCAT('Customer Added : ', NEW.first_name,' ',NEW.last_name)
    );

END $$

DELIMITER ;

-- ===========================================================
-- Trigger 2 : AFTER UPDATE ON PRODUCTS
-- ===========================================================

DROP TRIGGER IF EXISTS trg_product_update;

DELIMITER $$

CREATE TRIGGER trg_product_update

AFTER UPDATE
ON products

FOR EACH ROW

BEGIN

    INSERT INTO audit_log
    (
        action_type,
        table_name,
        description
    )

    VALUES
    (
        'UPDATE',
        'products',
        CONCAT('Updated Product : ', NEW.product_name)
    );

END $$

DELIMITER ;

-- ===========================================================
-- Trigger 3 : AFTER DELETE ON CUSTOMERS
-- ===========================================================

DROP TRIGGER IF EXISTS trg_customer_delete;

DELIMITER $$

CREATE TRIGGER trg_customer_delete

AFTER DELETE
ON customers

FOR EACH ROW

BEGIN

    INSERT INTO audit_log
    (
        action_type,
        table_name,
        description
    )

    VALUES
    (
        'DELETE',
        'customers',
        CONCAT('Deleted Customer : ', OLD.first_name,' ',OLD.last_name)
    );

END $$

DELIMITER ;

-- ===========================================================
-- Trigger 4 : BEFORE INSERT ON PRODUCTS
-- Prevent Negative Price
-- ===========================================================

DROP TRIGGER IF EXISTS trg_product_price;

DELIMITER $$

CREATE TRIGGER trg_product_price

BEFORE INSERT
ON products

FOR EACH ROW

BEGIN

    IF NEW.unit_price < 0 THEN

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT='Product price cannot be negative';

    END IF;

END $$

DELIMITER ;

-- ===========================================================
-- Test INSERT Trigger
-- ===========================================================

INSERT INTO customers
(
    first_name,
    last_name,
    email,
    phone,
    city
)

VALUES
(
    'Demo',
    'User',
    'demo@test.com',
    '9999999999',
    'Delhi'
);

-- ===========================================================
-- Test UPDATE Trigger
-- ===========================================================

UPDATE products

SET unit_price = unit_price + 100

WHERE product_id = 1;

-- ===========================================================
-- Test DELETE Trigger
-- ===========================================================

DELETE FROM customers

WHERE email='demo@test.com';

-- ===========================================================
-- Verify Audit Log
-- ===========================================================

SELECT *

FROM audit_log;