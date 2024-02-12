select count(order_id) as Total_Orders,
count(distinct(country)) as Toatl_Countries,
count(distinct(product_name)) as Toatl_Products,
count(distinct(category)) as Total_Categories,
count(distinct(sub_category)) as Total_Subcategories,
count(distinct(year)) as Total_Years,
sum(sales) as Total_Sales,
sum(quantity) as Total_Quantity,
avg(profit) as AVG_Profit,
avg(discount) as AVG_Discount
from superstoreorders;

-- sales performance analysis--

select product_name, category, sum(sales), sum(quantity) from superstoreorders group by product_name, category order by sum(sales) desc limit 10;

-- sales years --

select year, sum(sales) from superstoreorders group by year order by year desc;


-- purchasing behaviour
 
 select segment, count(distinct(customer_name)) as Total_customers, sum(sales) from superstoreorders group by segment order by sum(sales) desc;

-- shipping modes--
select ship_mode, avg(shipping_cost) as AVG_Shp_cost, avg(profit) as AVG_profit from superstoreorders group by ship_mode order by avg(profit) desc;

-- time analysis-- 

select ship_mode, avg(timestampdiff(day, str_to_date(order_date,'%d-%m-%Y'), str_to_date(ship_date,'%d-%m-%Y'))) as avgship_time from superstoreorders group by ship_mode order by avgship_time desc;

-- profitablity

select product_name, category, sub_category, avg(profit), avg(discount) from superstoreorders group by product_name, category, sub_category order by avg(profit) desc limit 10;

-- gloabal saleas

 select country,sum(quantity), sum(sales) from superstoreorders group by country order by sum(sales) desc limit 10;
 
 select state, count(category) from superstoreorders group by state order by count(category) desc limit 10;
 
 select region, sum(sales) from superstoreorders group by region order by sum(sales) desc limit 10;





