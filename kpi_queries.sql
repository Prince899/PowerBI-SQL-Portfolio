-- 1. Total Revenue
SELECT SUM(total_price) AS total_revenue
FROM pizza_sales;

-- 2. Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value
FROM pizza_sales;

-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS total_pizzas_sold
FROM pizza_sales;

-- 4. Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;

-- 5. Average Pizzas per Order
SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
       AS avg_pizzas_per_order
FROM pizza_sales;
