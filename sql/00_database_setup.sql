create database retail_sales_db;
use retail_sales_db;
SELECT DATABASE();
CREATE TABLE retail_sales (
    Row_ID INT PRIMARY KEY,
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country_Region VARCHAR(50),
    City VARCHAR(100),
    State_Province VARCHAR(100),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(30),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,3),
    Quantity INT,
    Discount DECIMAL(4,2),
    Profit DECIMAL(10,4)
);
select * from retail_sales;
describe retail_sales;

