# Retail Sales & Business Performance Dashboard

## 1. Dashboard Overview
An interactive Power BI dashboard developed to analyze retail sales, profitability, order volume, and business performance.

## 2. Key Performance Indicators (KPIs)

| KPI | Calculation |
|---|---|
| Total Sales | SUM(Sales) |
| Total Profit | SUM(Profit) |
| Total Orders | DISTINCTCOUNT(Order ID) |
| Total Quantity | SUM(Quantity) |

## 3. Dashboard Visualizations
- **Yearly Sales Trend:** Shows sales performance over time.
- **Monthly Sales Trend:** Shows monthly sales patterns.
- **Sales and Profit by Category:** Compares performance across product categories.
- **Sales and Profit by Region:** Compares performance across geographical regions.

## 4. Interactive Filters
- Order Date
- Category
- Region

These slicers allow users to filter dashboard results dynamically.

## 5. Data Validation
Dashboard KPI totals were cross-checked against MySQL query results.

- Total Sales: 2,326,534.35
- Total Profit: 292,296.81
- Total Orders: 5,111
- Total Quantity: 38,654

All four KPI totals matched.

## 6. Limitations
- Monthly sales represent total sales per month, not daily averages.
- The dashboard describes historical performance and does not establish causes for changes in sales or profit.
- Results depend on the selected slicer filters.

## 7. Tools Used
Power BI Desktop, MySQL, Python, and pandas.