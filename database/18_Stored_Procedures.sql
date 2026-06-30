/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 18_Stored_Procedures.sql
* MODULE   : Stored Procedures
* AUTHOR   : Yash
* VERSION  : 1.0
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- Procedure 1 : Show All Customers
-- ===========================================================

DROP PROCEDURE IF EXISTS sp_get_all_customers;

DELIMITER $$

CREATE PROCEDURE sp_get_all_customers()
BEGIN

    SELECT *
    FROM customers;

END $$

DELIMITER ;

CALL sp_get_all_customers();

-- ===========================================================
-- Procedure 2 : Product By Category
-- ===========================================================

DROP PROCEDURE IF EXISTS sp_products_by_category;

DELIMITER $$

CREATE PROCEDURE sp_products_by_category
(
    IN p_category_id INT
)

BEGIN

    SELECT
        product_id,
        product_name,
        unit_price,
        stock_quantity
    FROM products
    WHERE category_id = p_category_id;

END $$

DELIMITER ;

CALL sp_products_by_category(1);

-- ===========================================================
-- Procedure 3 : Customer By City
-- ===========================================================

DROP PROCEDURE IF EXISTS sp_customer_by_city;

DELIMITER $$

CREATE PROCEDURE sp_customer_by_city
(
    IN p_city VARCHAR(50)
)

BEGIN

    SELECT *
    FROM customers
    WHERE city = p_city;

END $$

DELIMITER ;

CALL sp_customer_by_city('Delhi');

-- ===========================================================
-- Procedure 4 : Increase Product Price
-- ===========================================================

DROP PROCEDURE IF EXISTS sp_increase_price;

DELIMITER $$

CREATE PROCEDURE sp_increase_price
(
    IN p_product_id INT,
    IN p_amount DECIMAL(10,2)
)

BEGIN

    UPDATE products

    SET unit_price = unit_price + p_amount

    WHERE product_id = p_product_id;

END $$

DELIMITER ;

CALL sp_increase_price(1,1000);

-- ===========================================================
-- Procedure 5 : Total Customers
-- ===========================================================

DROP PROCEDURE IF EXISTS sp_total_customers;

DELIMITER $$

CREATE PROCEDURE sp_total_customers
(
    OUT total INT
)

BEGIN

    SELECT COUNT(*)

    INTO total

    FROM customers;

END $$

DELIMITER ;

CALL sp_total_customers(@total);

SELECT @total;

-- ===========================================================
-- Procedure 6 : Total Product Stock
-- ===========================================================

DROP PROCEDURE IF EXISTS sp_total_stock;

DELIMITER $$

CREATE PROCEDURE sp_total_stock
(
    OUT stock INT
)

BEGIN

    SELECT SUM(stock_quantity)

    INTO stock

    FROM products;

END $$

DELIMITER ;

CALL sp_total_stock(@stock);

SELECT @stock;

-- ===========================================================
-- Procedure 7 : Employee Salary
-- ===========================================================

DROP PROCEDURE IF EXISTS sp_employee_salary;

DELIMITER $$

CREATE PROCEDURE sp_employee_salary
(
    IN emp_id INT
)

BEGIN

    SELECT
        employee_name,
        salary
    FROM employees
    WHERE employee_id = emp_id;

END $$

DELIMITER ;

CALL sp_employee_salary(1);

-- ===========================================================
-- Procedure 8 : Order Summary
-- ===========================================================

DROP PROCEDURE IF EXISTS sp_order_summary;

DELIMITER $$

CREATE PROCEDURE sp_order_summary()
BEGIN

    SELECT

        COUNT(*) total_orders,

        SUM(total_amount) total_sales,

        AVG(total_amount) average_order

    FROM orders;

END $$

DELIMITER ;

CALL sp_order_summary();
