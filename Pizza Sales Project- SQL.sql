select * from orders;
Select * from orders_details;
select * from pizza_type;
select * from pizzas;

--1.Retrieve the total number of orders placed.
select count(order_id) as total_orders from orders;

--2.Calculate the total revenue generated from pizza sales.
select sum(orders_details.quantity * pizzas.price) as Total_revenue_generated from orders_details 
join pizzas on 
pizzas.pizza_id = orders_details.pizza_id;

--3.Identify the highest-priced pizza.
Select pizza_type.name , pizzas.price from pizza_type 
join pizzas on 
pizza_type.pizza_type_id = pizzas.pizza_type_id
order by price DESC LIMIT 5;

--4.dentify the most common pizza size ordered.
select pizzas.size ,count(orders_details.order_id) as pizza_size_order from pizzas 
Join orders_details on pizzas.pizza_id = orders_details.pizza_id
group by pizzas.size
order by pizza_size_order desc;

--5.List the top 5 most ordered pizza types along with their quantities.
select SUM(orders_details.quantity) as quantity, pizza_type.name 
as pizza_name from orders_details
Join pizzas on pizzas.pizza_id = orders_details.pizza_id
Join pizza_type on pizza_type.pizza_type_id = pizzas.pizza_type_id
group by pizza_name
order by quantity desc;

--6.Join the necessary tables to find the total quantity of each pizza category ordered.
select SUM(orders_details.quantity) as quantity , pizza_type.category as category from orders_details
join pizzas on orders_details.pizza_id = pizzas.pizza_id
join pizza_type on pizzas.pizza_type_id = pizza_type.pizza_type_id
group by category
order by quantity desc;

--7.Determine the distribution of orders by hour of the day.
select extract(hour from time) as order_hours, count(order_id) from orders
group by order_hours
order by order_hours desc;

--8.Join relevant tables to find the category-wise distribution of pizzas.
select category , count(category) from pizza_type group by category;

--9.Group the orders by date and calculate the average number of pizzas ordered per day.
select round(avg(order_count),0) as avg_pizza_order_per_day from 
(select orders.date as date, sum(orders_details.quantity) order_count from orders join orders_details on 
orders.order_id = orders_details.order_id 
group by date) as order_quantity;

--10.Determine the top 3 most ordered pizza types based on revenue.
select pizza_type.name as name, 
sum(orders_details.quantity * pizzas.price) as revenue 
from pizza_type join pizzas 
on pizzas.pizza_type_id = pizza_type.pizza_type_id
join orders_details 
on orders_details.pizza_id = pizzas.pizza_id
group by name
order by revenue desc limit 3;

--11.Calculate the percentage contribution of each pizza type to total revenue.
select pizza_type.category as category, 
round((sum(orders_details.quantity * pizzas.price)/ (select sum(orders_details.quantity * pizzas.price) as Total_revenue_generated from orders_details 
join pizzas on 
pizzas.pizza_id = orders_details.pizza_id))*100,2) as revenue_percentage
from pizza_type join pizzas 
on pizzas.pizza_type_id = pizza_type.pizza_type_id
join orders_details 
on orders_details.pizza_id = pizzas.pizza_id
group by category;

--12.Analyze the cumulative revenue generated over time.
select date , sum(revenue) over(order by date) as cum_revenue from
(select orders.date, sum(orders_details.quantity * pizzas.price) as revenue from orders
join orders_details on orders.order_id = orders_details.order_id
join pizzas on pizzas.pizza_id = orders_details.pizza_id
group by date
order by date) as revenue_per_day;

--13.Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select name, Total_revenue_generated,category from 
(select category ,name , Total_revenue_generated, rank() over(partition by category order by Total_revenue_generated desc) as rn from 
(select pizza_type.category , pizza_type.name , sum(orders_details.quantity * pizzas.price) as Total_revenue_generated from
orders_details join pizzas on pizzas.pizza_id = orders_details.pizza_id
join pizza_type on pizza_type.pizza_type_id = pizzas.pizza_type_id
 group by pizza_type.category , pizza_type.name) as a) as b
 where rn <=3;








