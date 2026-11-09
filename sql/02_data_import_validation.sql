-- Data Import and Validation
-- Loads the cleaned CSV into MySQL.
-- Checks imported records, column types and summary totals.
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/superstore_cleaned.csv'
INTO TABLE retail_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode,
    Customer_ID, Customer_Name, Segment, Country_Region,
    City, State_Province, Postal_Code, Region, Product_ID,
    Category, Sub_Category, Product_Name, Sales, Quantity,
    Discount, Profit
);
SHOW WARNINGS LIMIT 10;
TRUNCATE TABLE retail_sales;
ALTER TABLE retail_sales
MODIFY COLUMN Sales DECIMAL(12,4),
MODIFY COLUMN Profit DECIMAL(12,4);
SELECT Sales, Profit
FROM retail_sales
LIMIT 5;
SELECT
    COLUMN_NAME,
    COLUMN_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'retail_sales'
AND TABLE_SCHEMA = 'retail_sales_db';
SHOW WARNINGS LIMIT 5;
SELECT COUNT(*) FROM retail_sales;
SELECT Row_ID, Sales, Profit
FROM retail_sales
ORDER BY Row_ID
LIMIT 5;
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM retail_sales;