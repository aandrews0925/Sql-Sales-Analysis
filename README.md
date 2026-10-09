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
 
[View the dataset](_Office_sales__202610072006.csv)


QUERY

select os."Region", sum(os."TotalPrice") as "Total_Price"  
from "Office_sales" os   
group by os."Region"  
order by "Total_Price" desc;  

[Query](<Sales By Region.sql>) 

- Compared regional sales and sorted in descending order which shows South being at the bottom in sales dollars.

RESULT 

![Sales By Region Result](<Region Sales Results.png>)

QUERY  

select   
case   
	when os."TotalPrice" < 1999.99 then 'small'  
	when os."TotalPrice" between 2000 and 5000 then 'medium'  
	else  'large'  
end as "Salesize",   
Count (*) as "num_of_sales", os."Region"  
from "Office_sales" os  
group by "Salesize", os."Region"  
order by "Salesize";  

  [Query](<Salesize by Region.sql>)

  -Uses CASE statement to categorize sale sizes and the amount of them per region. In this dataset, it shows that the Southern region falls short on the number of large sales which could explain the lack in sales dollars.

  RESULTS

  ![Salesize by Region Result](<Region Salesize Results.png>)


QUERY  

with "Salesperson_sales"  as (  
select os."Salesperson", sum(os."TotalPrice") as "TotalSales", os."Region"  
from "Office_sales" os  
group by os."Salesperson", os."Region"  
),  
  
 "Ranked_sales" as (  
select "Salesperson", "Region", "TotalSales", row_number() over(partition by "Region" order by "TotalSales" desc) as "Ranking" from "Salesperson_sales")  
  
select "Region","Salesperson","TotalSales", "Ranking"  
from "Ranked_sales"  
where "Ranking" <=3  




