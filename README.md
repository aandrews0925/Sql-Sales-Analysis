# Sql-Sales-Analysis
SQL analysis of sample office sales data using CTEs, Aggregations, and ROW_Number() to rank top salespeople within each region. 

PROJECT OVERVIEW
Using SQL and Tableau to analyze sample office sales data by using various functions to determine underlying issues.

SQL SKILLS DEMONSTRATED

Common Table Expressions (CTE)
Aggregate Functions (COUNT), (SUM), GROUP BY 
ROW_NUMBER () window functions
PARTITION BY to rank salespeople independent of regions

OBJECTIVE
Identify potential shortcomings of regions and top salespeople within each region based on sales totals as well as sale sizes to determine where and why certain regions are underperforming.

TOOLS 
PostgreSQL 
DBeaver
Tableau

DATASET 
[View the dataset]
(_Office_sales__202610072006.csv)


QUERY

select os."Region", sum(os."TotalPrice") as "Total_Price"
from "Office_sales" os 
group by os."Region"
order by "Total_Price" desc;

- Compared regional sales and sorted them in descending order

RESULT



