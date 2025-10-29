**🍕 Pizza Sales Analysis Using SQL**

_📖 Project Overview_
This project analyzes pizza sales data using SQL to uncover business insights like total revenue, popular pizzas, and sales trends by time and category.
It’s designed to practice real-world SQL skills and demonstrate data analysis capabilities for business decision-making.

**🧱 Database Structure**
_The database contains four tables:_
Table Name	              Description
orders	                  order_id, date, time
orders_details	          order_detail_id, order_id, pizza_id, quantity
pizza_type	              pizza_type_id, name, category, ingredients
pizzas  	                pizza_id, pizza_type_id, size, price


**❓ Business Questions Answered**
_Basic:_
Retrieve the total number of orders placed.
Calculate the total revenue generated from pizza sales.
Identify the highest-priced pizza.
Identify the most common pizza size ordered.
List the top 5 most ordered pizza types along with their quantities.

_Intermediate:_
Join the necessary tables to find the total quantity of each pizza category ordered.
Determine the distribution of orders by hour of the day.
Join relevant tables to find the category-wise distribution of pizzas.
Group the orders by date and calculate the average number of pizzas ordered per day.
Determine the top 3 most ordered pizza types based on revenue.

_Advanced:_
Calculate the percentage contribution of each pizza type to total revenue.
Analyze the cumulative revenue generated over time.
Determine the top 3 most ordered pizza types based on revenue for each pizza category.

**⚙️ Tools & Technologies Used**
SQL
PostgreSQL
Window Functions
Aggregate Functions (SUM, COUNT, AVG)
JOINS and GROUP BY Clauses

**🧠 Key Insights**
💰 The restaurant generated significant total revenue.
🍕 Large-size pizzas were most frequently ordered.
🕒 Orders peaked during mid-day hours.
🍽️ Chicken pizzas contributed most to sales.
