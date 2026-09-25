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


-- Example 7 — Finding Maximum Values with MAX()
-- GOAL: Find the highest total amount spent on a single order.
SELECT MAX(total_amount) AS highest_order_amount
FROM orders;

-- Result:
-- highest_order_amount
-- 30.00


-- Example 8 — Comparing COUNT(*), COUNT(column), and COUNT(DISTINCT)
-- GOAL: Demonstrate how COUNT(*), COUNT(stock), and COUNT(DISTINCT stock) behave on columns with NULLs and duplicates.
SELECT 
    COUNT(*) AS total_rows,
    COUNT(stock) AS non_null_stock_count,
    COUNT(DISTINCT stock) AS unique_stock_values
FROM products;

-- Result:
-- total_rows | non_null_stock_count | unique_stock_values
-- 8          | 7                    | 7


-- Example 9 — Demonstrating AVG() Handling of NULL Values
-- GOAL: Show how AVG() ignores NULL rather than treating it as 0.
SELECT 
    SUM(stock) AS total_items,
    COUNT(stock) AS counted_rows,
    AVG(stock) AS average_stock
FROM products;

-- Result:
-- total_items | counted_rows | average_stock
-- 320         | 7            | 45.7142857142857143


-- Example 10 — Combining Multiple Aggregate Functions
-- GOAL: Generate a single summary row for product inventory metrics.
SELECT 
    COUNT(*) AS total_products,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price,
    SUM(stock) AS total_stock
FROM products;

-- Result:
-- total_products | min_price | max_price | avg_price          | total_stock
-- 8              | 3.00      | 15.00     | 9.2500000000000000 | 320


-- Part 2 — COUNT() in Practice (Examples 11–15)
-- Example 11 — Count All Customers
-- GOAL: Count total customer entries.
SELECT COUNT(*) AS total_registered_customers
FROM customers;

-- Result:
-- total_registered_customers
-- 5


-- Example 12 — Count All Products
-- GOAL: Find the size of your product menu.
SELECT COUNT(*) AS total_products
FROM products;

-- Result:
-- total_products
-- 8


-- Example 13 — Count Products in a Category with WHERE
-- GOAL: Count how many items are in the 'Burger' category.
SELECT COUNT(*) AS burger_count
FROM products
WHERE category = 'Burger';

-- Result:
-- burger_count
-- 3


-- Example 14 — Count Orders with a Specific Status
-- GOAL: Count how many orders are currently marked as 'completed'.
SELECT COUNT(*) AS completed_orders
FROM orders
WHERE status = 'completed';

-- Result:
-- completed_orders
-- 3


-- Example 15 — Count Distinct Customer IDs in Orders
-- GOAL: Determine how many unique customers have placed at least one order.
SELECT COUNT(DISTINCT customer_id) AS active_customers
FROM orders;

-- Result:
-- active_customers
-- 4


-- Part 3 — SUM() (Examples 16–20)
-- Example 16 — Total Product Prices
-- GOAL: Calculate the combined sum of listing prices for all menu items.
SELECT SUM(price) AS sum_of_all_prices
FROM products;

-- Result:
-- sum_of_all_prices
-- 74.00