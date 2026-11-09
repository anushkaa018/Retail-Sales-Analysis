use retail_sales_db;
SELECT * FROM retail_sales;
-- =====================================
-- BASIC SQL QUERIES
-- =====================================
-- 1. SELECT: Retrieve specific columns
SELECT Order_ID, Sales, Profit
FROM retail_sales;
-- 2. WHERE: Filter records based on conditions
SELECT Order_ID, Sales, Profit
FROM retail_sales
WHERE Sales > 500;
-- 3. ORDER BY: Sorting records
SELECT Order_ID, Sales, Profit
FROM retail_sales
ORDER BY Sales DESC;
-- 4. Find the top 10 records with the highest sales
SELECT Order_ID, Sales, Profit
FROM retail_sales
ORDER BY Sales DESC limit 10;
-- 5. AGGREGATE FUNCTIONS: COUNT, SUM, AVG, MIN, MAX
-- Count total records in the table
SELECT COUNT(*)
FROM retail_sales;
-- Calculate total sales
SELECT SUM(Sales)
FROM retail_sales;
-- Calculate average sales
SELECT AVG(Sales)
FROM retail_sales;
-- Find the lowest sales value
SELECT MIN(Sales)
FROM retail_sales;
-- Find the highest sales value
SELECT MAX(Sales)
FROM retail_sales;
-- 6. GROUP BY: Group and summarise data
SELECT Category, SUM(Sales)
FROM retail_sales
GROUP BY Category;
-- Calculate total profit for each category
SELECT Category, SUM(profit)
FROM retail_sales
GROUP BY Category;
-- Calculate total sales for each region
SELECT Region, SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Region;
-- Compare total sales and profit by region
SELECT Region, SUM(Sales) AS Total_Sales,
sum(profit) as total_profit
FROM retail_sales
GROUP BY Region;
-- 7. MONTHLY SALES ANALYSIS
-- Calculate total sales by month
select year(order_date) as sales_year,
 month(order_date)
 as sales_month from retail_sales;
SELECT
    YEAR(Order_Date) AS Sales_Year,
    MONTH(Order_Date) AS Sales_Month,
    SUM(Sales) AS Total_Sales
FROM retail_sales group by 
YEAR(Order_Date),MONTH(Order_Date);
-- 8. TOP 10 PRODUCTS ANALYSIS
-- Find the top 10 products by total sales
SELECT
    Product_Name,
    SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;
-- 9. DISTINCT ORDERS & CUSTOMERS ANALYSIS
-- Count unique orders and unique customers
select count( distinct customer_id) as Total_Customers,
 count( distinct order_id) as Total_order from retail_sales ;
-- 10. CATEGORY SALES CONTRIBUTION
-- Calculate each category's percentage contribution to total sales
SELECT
    Category,
    SUM(Sales) AS Category_Sales,
    ROUND(
        SUM(Sales) * 100.0 /
        (SELECT SUM(Sales) FROM retail_sales),
        2
    ) AS Sales_Percentage
FROM retail_sales
GROUP BY Category;
-- 11. CASE: Conditional Categorisation
-- Classify sales into High, Medium and Low categories
SELECT
    Order_ID,
    Sales,
    CASE
        WHEN Sales > 500 THEN 'High'
        WHEN Sales BETWEEN 100 AND 500 THEN 'Medium'
        ELSE 'Low'
    END AS Sales_Category
FROM retail_sales;
-- 12. SUBQUERIES AND CTEs
-- Find products with sales higher than average sales
SELECT Product_Name, Sales
FROM retail_sales
WHERE Sales > (
    SELECT AVG(Sales)
    FROM retail_sales
);
-- 13. CTEs: COMMON TABLE EXPRESSIONS
-- Calculate average sales using a CTE
WITH Average_Sales AS (
    SELECT AVG(Sales) AS Avg_Sales
    FROM retail_sales
)
SELECT *
FROM Average_Sales;
-- Find the top 5 categories by total sales using a CTE
WITH Total_Sales AS (
    SELECT
        Category,
        SUM(Sales) AS Total_Sales
    FROM retail_sales
    GROUP BY Category
)
SELECT *
FROM Total_Sales
ORDER BY Total_Sales DESC
LIMIT 5;
-- 14. WINDOW FUNCTIONS
-- Rank products based on total sales
WITH Product_Sales AS (
    SELECT
        Product_Name,
        SUM(Sales) AS Total_Sales
    FROM retail_sales
    GROUP BY Product_Name
)
SELECT
    Product_Name,
    Total_Sales,
    RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Ranking
FROM Product_Sales;

