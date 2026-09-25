-- Example 1 — Count All Rows with COUNT(*)
-- GOAL: Example 1 — Count All Rows with COUNT(*)
SELECT COUNT(*) AS total_customers
FROM customers;

-- Result:
-- total_customers
-- 5


-- Example 2 — Count Non-Null Values with COUNT(column)
-- GOAL: Count how many customers have provided an email address.
SELECT COUNT(email) AS customers_with_email
FROM customers;

-- Result:
-- customers_with_email
-- 4


-- Example 3 — Count Unique Values with COUNT(DISTINCT column)
-- GOAL: Count how many unique product categories exist in the products table.
SELECT COUNT(DISTINCT category) AS unique_categories
FROM products;

-- Result:
-- unique_categories
-- 4


-- Example 4 — Summing Numerical Values with SUM()
-- GOAL: Calculate the total revenue generated across all recorded orders.
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- Result:
-- total_revenue
-- 99.00


-- Example 5 — Calculating Averages with AVG()
-- GOAL: Calculate the average price of all products offered on the menu.
SELECT AVG(price) AS average_product_price
FROM products;

-- Result:
-- average_product_price
-- 9.2500000000000000


-- Example 6 — Finding Minimum Values with MIN()
-- GOAL: Find the lowest product price in the menu.
SELECT MIN(price) AS cheapest_price
FROM products;

-- Result:
-- cheapest_price
-- 3.00