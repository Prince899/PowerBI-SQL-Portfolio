-- Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS order_day,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

-- Monthly Trend for Orders
SELECT DATENAME(MONTH, order_date) AS month_name,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY total_orders DESC;

-- % Sales by Pizza Category
SELECT pizza_category,
       CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS pct_sales
FROM pizza_sales
GROUP BY pizza_category;

-- % Sales by Pizza Size
SELECT pizza_size,
       CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS pct_sales
FROM pizza_sales
GROUP BY pizza_size;

-- Total Pizzas Sold by Category (Funnel Chart)
SELECT pizza_category,
       SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_pizzas_sold DESC;

-- Top 5 Pizzas by Revenue
SELECT pizza_name,
       SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- Bottom 5 Pizzas by Revenue
SELECT pizza_name,
       SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- Top 5 Pizzas by Quantity
SELECT pizza_name,
       SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- Bottom 5 Pizzas by Quantity
SELECT pizza_name,
       SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold ASC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- Top 5 Pizzas by Total Orders
SELECT pizza_name,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- Bottom 5 Pizzas by Total Orders
SELECT pizza_name,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
