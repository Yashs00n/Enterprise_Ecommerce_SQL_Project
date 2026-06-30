/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 06_Insert_Transaction_Data.sql
* MODULE   : Transaction Data
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Inserts sample transaction data.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- Orders
-- ===========================================================

INSERT INTO orders
(customer_id, employee_id, order_date, order_status, total_amount)
VALUES
(1,1,'2026-01-05','Delivered',97998.00),
(2,2,'2026-01-06','Delivered',58999.00),
(3,1,'2026-01-08','Shipped',9999.00),
(4,3,'2026-01-10','Pending',4999.00),
(5,2,'2026-01-12','Confirmed',25999.00),
(6,4,'2026-01-14','Delivered',14999.00),
(7,1,'2026-01-16','Delivered',79999.00),
(8,5,'2026-01-18','Cancelled',3499.00),
(9,2,'2026-01-20','Delivered',799.00),
(10,3,'2026-01-22','Pending',62999.00);

-- ===========================================================
-- Order Items
-- ===========================================================

INSERT INTO order_items
(order_id, product_id, quantity, unit_price, line_total)
VALUES
(1,1,1,89999.00,89999.00),
(1,7,1,7999.00,7999.00),

(2,4,1,58999.00,58999.00),

(3,7,1,9999.00,9999.00),

(4,10,1,4999.00,4999.00),

(5,11,1,25999.00,25999.00),

(6,12,1,14999.00,14999.00),

(7,2,1,79999.00,79999.00),

(8,8,1,3499.00,3499.00),

(9,9,1,799.00,799.00),

(10,5,1,62999.00,62999.00);

-- ===========================================================
-- Payments
-- ===========================================================

INSERT INTO payments
(order_id,payment_method,payment_status,amount,transaction_reference)
VALUES
(1,'UPI','Success',97998.00,'TXN100001'),
(2,'Credit Card','Success',58999.00,'TXN100002'),
(3,'Debit Card','Success',9999.00,'TXN100003'),
(4,'Cash','Pending',4999.00,'TXN100004'),
(5,'UPI','Success',25999.00,'TXN100005'),
(6,'Net Banking','Success',14999.00,'TXN100006'),
(7,'Credit Card','Success',79999.00,'TXN100007'),
(8,'UPI','Refunded',3499.00,'TXN100008'),
(9,'Cash','Success',799.00,'TXN100009'),
(10,'Debit Card','Pending',62999.00,'TXN100010');

-- ===========================================================
-- Verify Data
-- ===========================================================

SELECT * FROM orders;

SELECT * FROM order_items;

SELECT * FROM payments;