/******************************************************************************
*
* PROJECT  : Enterprise E-Commerce SQL Project
* FILE     : 01_Database_Setup.sql
* MODULE   : Database Setup
* AUTHOR   : Yash
* VERSION  : 1.0
*
* DESCRIPTION:
* Creates the Enterprise E-Commerce Database.
*
******************************************************************************/

-- ===========================================================
-- Delete Existing Database (Development Only)
-- ===========================================================

DROP DATABASE IF EXISTS enterprise_ecommerce_db;

-- ===========================================================
-- Create Database
-- ===========================================================

CREATE DATABASE enterprise_ecommerce_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- ===========================================================
-- Select Database
-- ===========================================================

USE enterprise_ecommerce_db;

-- ===========================================================
-- Verify Database
-- ===========================================================

SELECT DATABASE() AS current_database;

SHOW DATABASES;