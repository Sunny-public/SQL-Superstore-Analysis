-- =========================================
-- SQL DATA ANALYSIS PROJECT - SUPERSTORE
-- =========================================

-- Create and use database
CREATE DATABASE IF NOT EXISTS task3;
USE task3;

-- =========================================
-- VIEW SAMPLE DATA
-- =========================================
SELECT * FROM superstore LIMIT 10;

-- =========================================
-- TOP 10 HIGHEST SALES
-- =========================================
SELECT `Order ID`, Sales
FROM superstore
ORDER BY Sales DESC
LIMIT 10;

-- =========================================
-- FILTER DATA (WEST REGION)
-- =========================================
SELECT `Order ID`, Region, Sales
FROM superstore
WHERE Region = 'West';

-- =========================================
-- TOTAL SALES BY CATEGORY (GROUP BY)
-- =========================================
SELECT Category, SUM(Sales) AS total_sales
FROM superstore
GROUP BY Category
ORDER BY total_sales DESC;

-- =========================================
-- PROFIT ANALYSIS BY SUB-CATEGORY
-- =========================================
SELECT `Sub-Category`, SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY total_profit DESC;

-- =========================================
-- SALES BY REGION AND CATEGORY
-- =========================================
SELECT Region, Category, SUM(Sales) AS total_sales
FROM superstore
GROUP BY Region, Category
ORDER BY Region;

-- =========================================
-- SUBQUERY (ABOVE AVERAGE SALES)
-- =========================================
SELECT `Product Name`, Sales
FROM superstore
WHERE Sales > (SELECT AVG(Sales) FROM superstore);

-- =========================================
-- AVERAGE SALES AND PROFIT
-- =========================================
SELECT 
    AVG(Sales) AS avg_sales, 
    AVG(Profit) AS avg_profit
FROM superstore;

-- =========================================
-- MONTHLY SALES TREND
-- =========================================
SELECT 
    MONTH(`Order Date`) AS month, 
    SUM(Sales) AS total_sales
FROM superstore
GROUP BY month
ORDER BY month;

-- =========================================
-- TOP 5 CUSTOMERS BY SALES
-- =========================================
SELECT `Customer Name`, SUM(Sales) AS total_spent
FROM superstore
GROUP BY `Customer Name`
ORDER BY total_spent DESC
LIMIT 5;

-- =========================================
-- CREATE VIEW (CATEGORY SALES SUMMARY)
-- =========================================
CREATE VIEW category_sales AS
SELECT Category, SUM(Sales) AS total_sales
FROM superstore
GROUP BY Category;

-- =========================================
-- USE VIEW
-- =========================================
SELECT * FROM category_sales;

-- =========================================
-- INDEX FOR OPTIMIZATION
-- =========================================
CREATE INDEX idx_order_date ON superstore(`Order Date`);