with "Salesperson_sales"  as (
select os."Salesperson", sum(os."TotalPrice") as "TotalSales", os."Region"
from "Office_sales" os
group by os."Salesperson", os."Region"
),

 "Ranked_sales" as (
select "Salesperson", "Region", "TotalSales", row_number() over(partition by "Region" order by "TotalSales" desc) as "Ranking"
from "Salesperson_sales")

select "Region","Salesperson","TotalSales", "Ranking"
from "Ranked_sales"
where "Ranking" <=3

