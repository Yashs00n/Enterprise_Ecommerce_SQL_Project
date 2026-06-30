/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 21_Events.sql
* MODULE   : Events
* AUTHOR   : Yash
* VERSION  : 1.0
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- Enable Event Scheduler
-- ===========================================================

SET GLOBAL event_scheduler = ON;

SHOW VARIABLES LIKE 'event_scheduler';

-- ===========================================================
-- Event 1 : Daily Stock Check
-- ===========================================================

DROP EVENT IF EXISTS ev_daily_stock_check;

DELIMITER $$

CREATE EVENT ev_daily_stock_check

ON SCHEDULE EVERY 1 DAY

STARTS CURRENT_TIMESTAMP

DO

BEGIN

    UPDATE products

    SET stock_status = 'Low Stock'

    WHERE stock_quantity < reorder_level;

END $$

DELIMITER ;

-- ===========================================================
-- Event 2 : Monthly Salary Increment
-- ===========================================================

DROP EVENT IF EXISTS ev_salary_increment;

DELIMITER $$

CREATE EVENT ev_salary_increment

ON SCHEDULE EVERY 1 MONTH

STARTS CURRENT_TIMESTAMP

DO

BEGIN

    UPDATE employees

    SET salary = salary + 1000;

END $$

DELIMITER ;

-- ===========================================================
-- Event 3 : Delete Old Audit Logs
-- ===========================================================

DROP EVENT IF EXISTS ev_delete_old_logs;

DELIMITER $$

CREATE EVENT ev_delete_old_logs

ON SCHEDULE EVERY 1 MONTH

STARTS CURRENT_TIMESTAMP

DO

BEGIN

    DELETE

    FROM audit_log

    WHERE action_time < DATE_SUB(NOW(),INTERVAL 6 MONTH);

END $$

DELIMITER ;

-- ===========================================================
-- Event 4 : Daily Order Report
-- ===========================================================

DROP EVENT IF EXISTS ev_daily_order_report;

DELIMITER $$

CREATE EVENT ev_daily_order_report

ON SCHEDULE EVERY 1 DAY

STARTS CURRENT_TIMESTAMP

DO

BEGIN

    INSERT INTO audit_log
    (
        action_type,
        table_name,
        description
    )

    VALUES
    (
        'REPORT',
        'orders',
        CONCAT('Daily Order Report Generated : ',NOW())
    );

END $$

DELIMITER ;

-- ===========================================================
-- Show Events
-- ===========================================================

SHOW EVENTS;

-- ===========================================================
-- Show Event Details
-- ===========================================================

SHOW CREATE EVENT ev_daily_stock_check;

-- ===========================================================
-- Drop Event Example
-- ===========================================================

-- DROP EVENT ev_salary_increment;