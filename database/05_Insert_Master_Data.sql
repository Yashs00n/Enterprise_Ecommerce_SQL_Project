/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 05_Insert_Master_Data.sql
* MODULE   : Master Data
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Inserts sample master data.
*
******************************************************************************/

USE enterprise_ecommerce_db;

-- ===========================================================
-- Categories
-- ===========================================================

INSERT INTO categories
(category_name, description)
VALUES
('Mobile','Smartphones and Accessories'),
('Laptop','Laptops and Notebooks'),
('Electronics','Electronic Gadgets'),
('Fashion','Clothing and Apparel'),
('Home Appliances','Home Products');

-- ===========================================================
-- Products
-- ===========================================================

INSERT INTO products
(product_name, category_id, unit_price, stock_quantity)
VALUES
('iPhone 16',1,89999,50),
('Samsung Galaxy S25',1,79999,40),
('OnePlus 13',1,64999,35),
('Dell Inspiron',2,58999,20),
('HP Pavilion',2,62999,18),
('Lenovo ThinkPad',2,75999,15),
('Sony Headphones',3,9999,100),
('Boat Speaker',3,3499,150),
('Men T-Shirt',4,799,200),
('Nike Shoes',4,4999,80),
('Washing Machine',5,25999,12),
('Microwave Oven',5,14999,18);

-- ===========================================================
-- Customers
-- ===========================================================

INSERT INTO customers
(first_name,last_name,email,phone,city)
VALUES
('Rahul','Sharma','rahul@gmail.com','9876543210','Delhi'),
('Amit','Verma','amit@gmail.com','9876543211','Mumbai'),
('Priya','Singh','priya@gmail.com','9876543212','Lucknow'),
('Neha','Gupta','neha@gmail.com','9876543213','Jaipur'),
('Rohit','Yadav','rohit@gmail.com','9876543214','Pune'),
('Anjali','Kapoor','anjali@gmail.com','9876543215','Delhi'),
('Karan','Malhotra','karan@gmail.com','9876543216','Noida'),
('Sneha','Patel','sneha@gmail.com','9876543217','Ahmedabad'),
('Vikas','Mehta','vikas@gmail.com','9876543218','Indore'),
('Pooja','Jain','pooja@gmail.com','9876543219','Bhopal');

-- ===========================================================
-- Employees
-- ===========================================================

INSERT INTO employees
(employee_name,email,designation,salary,joining_date)
VALUES
('Raj Kumar','raj@company.com','Sales Executive',35000,'2023-01-15'),
('Ankit Singh','ankit@company.com','Store Manager',55000,'2022-08-10'),
('Ravi Sharma','ravi@company.com','Sales Executive',36000,'2024-02-20'),
('Meena Gupta','meena@company.com','Accountant',48000,'2021-12-01'),
('Suresh Patel','suresh@company.com','Warehouse Executive',30000,'2023-09-05');

-- ===========================================================
-- Verify Data
-- ===========================================================

SELECT * FROM categories;

SELECT * FROM products;

SELECT * FROM customers;

SELECT * FROM employees;