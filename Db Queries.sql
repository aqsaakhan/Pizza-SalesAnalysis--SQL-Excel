select * from pizza_sales

select SUM(total_price) as total_revenue
from pizza_sales

select SUM(total_price) / count(distinct order_id) as avg_order_value
from pizza_sales

select SUM(quantity) as total_pizza_sold
from pizza_sales

select COUNT(distinct(order_id)) as total_orders
from pizza_sales

select SUM(quantity) / COUNT(distinct(order_id)) as avg_pizza_
from pizza_sales

select cast(cast(SUM(quantity) as decimal(10,2)) / 
cast(COUNT(distinct order_id) as decimal(10,2)) as decimal(10,2)) as avg_pizza_per_order
from pizza_sales

--Dailty trend
select DATENAME (DW, order_date) as order_day, count(distinct order_id) as total_orders
from pizza_sales
group by DATENAME (DW, order_date)

--Hourly Trend
select DATEPART(hour, order_time) as order_hours, count(distinct order_id) as total_orders
from pizza_sales
group by DATEPART(hour, order_time)
order by DATEPART(hour, order_time)

select pizza_category, sum(total_price) as total_sales, sum(total_price) * 100 / (select sum(total_price)
from pizza_sales where month(order_date) =1) as pct_sales_per_category
from pizza_sales
where month(order_date) =1
group by pizza_category

select pizza_size, sum(total_price) as total_sales, cast(sum(total_price) * 100 / (select sum(total_price)
from pizza_sales where datepart (quarter, order_date) =1) as decimal (10,2)) as pct
from pizza_sales
where datepart (quarter, order_date) =1
group by pizza_size
order by pct

select pizza_category, sum(quantity) as total_pizzas_sold
from pizza_sales
group by pizza_category

select top 5 pizza_name, sum(quantity) as total_pizzas_sold
from pizza_sales
group by pizza_name
order by total_pizzas_sold desc

select top 5 pizza_name, sum(quantity) as total_pizzas_sold
from pizza_sales
group by pizza_name
order by total_pizzas_sold

