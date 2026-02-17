-- ============================================================
-- File: 00_create_db_and_tables.sql
-- Purpose: Create database and base table for Amazon Sales project
-- ============================================================

-- Create database (run once)
CREATE DATABASE AmazonAnalytics;
GO

-- Use the database
USE AmazonAnalytics;
GO

-- Create base table (raw import)
CREATE TABLE amazon_sales (
    product_id        NVARCHAR(50),
    product_name      NVARCHAR(MAX),
    category          NVARCHAR(MAX),
    discounted_price  NVARCHAR(50),
    actual_price      NVARCHAR(50),
    discount_percentage NVARCHAR(50),
    rating            NVARCHAR(50),
    rating_count      NVARCHAR(50),
    about_product     NVARCHAR(MAX),
    user_id           NVARCHAR(MAX),
    user_name         NVARCHAR(MAX),
    review_id         NVARCHAR(MAX),
    review_title      NVARCHAR(MAX),
    review_content    NVARCHAR(MAX),
    img_link          NVARCHAR(500),
    product_link      NVARCHAR(500)
);
