select os."Region", sum(os."TotalPrice") as "Total_Price"
from "Office_sales" os 
group by os."Region"
order by "Total_Price" desc;
