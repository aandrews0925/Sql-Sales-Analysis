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