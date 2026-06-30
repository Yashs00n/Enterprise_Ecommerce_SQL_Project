/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 19_Functions_UDF.sql
* MODULE   : User Defined Functions
* AUTHOR   : Yash
* VERSION  : 1.0
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- Function 1 : Add GST (18%)
-- ===========================================================

DROP FUNCTION IF EXISTS fn_add_gst;

DELIMITER $$

CREATE FUNCTION fn_add_gst(price DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC

BEGIN

    RETURN price + (price * 0.18);

END $$

DELIMITER ;

SELECT
    product_name,
    unit_price,
    fn_add_gst(unit_price) AS price_with_gst
FROM products;

-- ===========================================================
-- Function 2 : Full Customer Name
-- ===========================================================

DROP FUNCTION IF EXISTS fn_full_name;

DELIMITER $$

CREATE FUNCTION fn_full_name
(
    first VARCHAR(50),
    last VARCHAR(50)
)

RETURNS VARCHAR(100)

DETERMINISTIC

BEGIN

    RETURN CONCAT(first,' ',last);

END $$

DELIMITER ;

SELECT
    customer_id,
    fn_full_name(first_name,last_name) AS customer_name
FROM customers;

-- ===========================================================
-- Function 3 : Discount Price
-- ===========================================================

DROP FUNCTION IF EXISTS fn_discount_price;

DELIMITER $$

CREATE FUNCTION fn_discount_price
(
    price DECIMAL(10,2),
    discount DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

    RETURN price - (price * discount / 100);

END $$

DELIMITER ;

SELECT
    product_name,
    unit_price,
    fn_discount_price(unit_price,10) AS discounted_price
FROM products;

-- ===========================================================
-- Function 4 : Annual Salary
-- ===========================================================

DROP FUNCTION IF EXISTS fn_annual_salary;

DELIMITER $$

CREATE FUNCTION fn_annual_salary
(
    monthly_salary DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

    RETURN monthly_salary * 12;

END $$

DELIMITER ;

SELECT
    employee_name,
    salary,
    fn_annual_salary(salary) AS annual_salary
FROM employees;

-- ===========================================================
-- Function 5 : Stock Status
-- ===========================================================

DROP FUNCTION IF EXISTS fn_stock_status;

DELIMITER $$

CREATE FUNCTION fn_stock_status
(
    qty INT
)

RETURNS VARCHAR(20)

DETERMINISTIC

BEGIN

    IF qty = 0 THEN
        RETURN 'Out Of Stock';

    ELSEIF qty < 20 THEN
        RETURN 'Low Stock';

    ELSE
        RETURN 'Available';

    END IF;

END $$

DELIMITER ;

SELECT
    product_name,
    stock_quantity,
    fn_stock_status(stock_quantity) AS stock_status
FROM products;

-- ===========================================================
-- Function 6 : Order Category
-- ===========================================================

DROP FUNCTION IF EXISTS fn_order_category;

DELIMITER $$

CREATE FUNCTION fn_order_category
(
    amount DECIMAL(10,2)
)

RETURNS VARCHAR(20)

DETERMINISTIC

BEGIN

    IF amount >= 50000 THEN
        RETURN 'Premium';

    ELSEIF amount >= 20000 THEN
        RETURN 'Standard';

    ELSE
        RETURN 'Basic';

    END IF;

END $$

DELIMITER ;

SELECT
    order_id,
    total_amount,
    fn_order_category(total_amount) AS order_category
FROM orders;