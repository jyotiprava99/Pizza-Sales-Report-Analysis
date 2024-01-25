
CREATE TABLE pizza_sales
(
pizza_id int8 primary key,
 order_id int8 ,
pizza_name_id varchar(50),
quantity int8,
order_date date ,
order_time time,
unit_price float(10),
total_price float(10),
pizza_size char(4),
pizza_category varchar(50),
pizza_ingredients varchar(100),
pizza_name varchar(50)
)

select * from pizza_sales;
copy pizza_sales(pizza_id,order_id,pizza_name_id,quantity,order_date,order_time,unit_price,
				 total_price,pizza_size,pizza_category,pizza_ingredients,pizza_name)
				 from 'F:\pizza_sales.csv'
				 delimiter ','
				 csv header;
--Total Revenue:				 
select sum(total_price) as Total_revenue from pizza_sales;				 

--average order_value
select sum(total_price)/count( distinct order_id) as avg_order_value from pizza_sales;

--total pizza sold
select sum(quantity) as total_pizza_sold from pizza_sales

--total orders placed
select count(distinct order_id) as total_order from pizza_sales

---Average pizzas per order
select cast((sum(quantity)/
(count(distinct order_id)))as decimal(10,2)) as avg_pizza_order from pizza_sales
				 
---	daily trend of order
select date(order_date)as order_day , count(distinct order_id)as total_orderd
from pizza_sales
group by date(order_date)
				 
---percentage of sales by pizza category
select pizza_size,cast(sum(total_price)as decimal(10,2))as 
total_sales,cast(sum(total_price)*100 /(select sum(total_price))as decimal(10,2))from pizza_sales
group by pizza_size

---top 5 best sellers by revenue , Total Quantity and Total Orders
select pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc
limit 5

---top 5 bottom pizzas
select pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue
limit 5				 
				 
select pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc
limit 5				 


select pizza_name, count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders desc
limit 5

select pizza_name, count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders
limit 5

				