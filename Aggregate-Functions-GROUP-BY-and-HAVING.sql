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


-- Example 17 — Total Stock Quantity
-- GOAL: Find total item units available in stock across all products.
SELECT SUM(stock) AS total_inventory_units
FROM products;

-- Result:
-- total_inventory_units
-- 320


-- Example 18 — Total Order Amounts
-- GOAL: Find total sales volume recorded in orders.
SELECT SUM(total_amount) AS lifetime_sales
FROM orders;

-- Result:
-- lifetime_sales
-- 99.00


-- Example 19 — SUM() with WHERE Clause
-- GOAL: Calculate sales revenue from completed orders only.
SELECT SUM(total_amount) AS completed_sales
FROM orders
WHERE status = 'completed';

-- Result:
-- completed_sales
-- 47.00


-- Example 20 — SUM() with Numeric Range Conditions
-- GOAL: Find total stock of premium items (priced above $10.00).
SELECT SUM(stock) AS premium_item_stock
FROM products
WHERE price > 10.00;

-- Result:
-- premium_item_stock
-- 90


-- Part 4 — AVG(), MIN(), and MAX() (Examples 21–27)
-- Example 21 — Average Product Price
-- GOAL: Calculate the overall average price of menu products.
SELECT AVG(price) AS overall_avg_price
FROM products;

-- Result:
-- overall_avg_price
-- 9.2500000000000000


-- Example 22 — Average Order Amount
-- GOAL: Determine average order size across all orders.
SELECT AVG(total_amount) AS average_order_value
FROM orders;

-- Result:
-- average_order_value
-- 16.5000000000000000


-- Example 23 — Minimum Product Price
-- GOAL: Find the lowest item price on the menu.
SELECT MIN(price) AS min_price
FROM products;

-- Result:
-- min_price
-- 3.00


-- Example 24 — Maximum Product Price
-- GOAL: Find the highest single product price.
SELECT MAX(price) AS max_price
FROM products;

-- Result:
-- max_price
-- 15.00


-- Example 25 — Average Stock for In-Stock Items
-- GOAL: Find the average stock level, excluding items that are completely out of stock (stock = 0).
SELECT AVG(stock) AS avg_stock_in_stock_items
FROM products
WHERE stock > 0;

-- Result:
-- avg_stock_in_stock_items
-- 53.3333333333333333


-- Example 26 — MIN() with WHERE Filter
-- GOAL: Find the cheapest pizza on the menu.
SELECT MIN(price) AS cheapest_pizza
FROM products
WHERE category = 'Pizza';

-- Result:
-- cheapest_pizza
-- 13.00


-- Example 27 — MAX() with Date Conditions
-- GOAL: Find the highest completed order total.
SELECT MAX(total_amount) AS max_completed_order
FROM orders
WHERE status = 'completed';

-- Result:
-- max_completed_order
-- 25.00


-- Part 5 — GROUP BY (Examples 28–38)
-- Example 28 — What GROUP BY Means
-- GOAL: Group product records by category to see unique category names.
SELECT category
FROM products
GROUP BY category;

-- Result:
-- category
-- Burger
-- Pizza
-- Drinks
-- Dessert


-- Example 29 — Basic GROUP BY on One Column
-- GOAL: List all unique order statuses present in the database.
SELECT status
FROM orders
GROUP BY status;

-- Result:
-- status
-- completed
-- pending
-- cancelled


-- Example 30 — Grouping Products by Category
-- GOAL: Group products by category and display category names.
SELECT category
FROM products
GROUP BY category
ORDER BY category;

-- Result:
-- category
-- Burger
-- Dessert
-- Drinks
-- Pizza


-- Example 31 — COUNT() with GROUP BY
-- GOAL: Count the number of products in each category.
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

-- Result:
-- category | product_count
-- Burger   | 3
-- Pizza    | 2
-- Drinks   | 2
-- Dessert  | 1


-- Example 32 — SUM() with GROUP BY
-- GOAL: Calculate total inventory stock available per product category.
SELECT category, SUM(stock) AS total_category_stock
FROM products
GROUP BY category;

-- Result:
-- category | total_category_stock
-- Burger   | 90
-- Pizza    | 50
-- Drinks   | 180
-- Dessert  | NULL


-- Example 33 — AVG() with GROUP BY
-- GOAL: Calculate average product price per category.
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

-- Result:
-- category | avg_price
-- Burger   | 11.0000000000000000
-- Pizza    | 14.0000000000000000
-- Drinks   | 3.5000000000000000
-- Dessert  | 6.0000000000000000


-- Example 34 — MIN() with GROUP BY
-- GOAL: Find the cheapest item price in each category.
SELECT category, MIN(price) AS min_category_price
FROM products
GROUP BY category;

-- Result:
-- category | min_category_price
-- Burger   | 10.00
-- Pizza    | 13.00
-- Drinks   | 3.00
-- Dessert  | 6.00


-- Example 35 — MAX() with GROUP BY
-- GOAL: Find the most expensive product price in each category.
SELECT category, MAX(price) AS max_category_price
FROM products
GROUP BY category;

-- Result:
-- category | max_category_price
-- Burger   | 12.00
-- Pizza    | 15.00
-- Drinks   | 4.00
-- Dessert  | 6.00


-- Example 36 — GROUP BY Multiple Columns
-- GOAL: Group orders by created date and order status.
SELECT created_at, status, COUNT(*) AS order_count
FROM orders
GROUP BY created_at, status
ORDER BY created_at;

-- Result:
-- created_at | status    | order_count
-- 2026-03-01 | completed | 2
-- 2026-03-02 | pending   | 1
-- 2026-03-02 | cancelled | 1
-- 2026-03-03 | completed | 1
-- 2026-03-03 | pending   | 1


-- Example 37 — GROUP BY with WHERE Clause
-- GOAL: Count active products (stock > 0) grouped by category.
SELECT category, COUNT(*) AS in_stock_product_count
FROM products
WHERE stock > 0
GROUP BY category;

-- Result:
-- category | in_stock_product_count
-- Burger   | 2
-- Pizza    | 2
-- Drinks   | 2


-- Example 38 — Combining Multiple Aggregates with GROUP BY
-- GOAL: Generate a complete category metrics summary report.
SELECT 
    category,
    COUNT(*) AS total_items,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price
FROM products
GROUP BY category;

-- Result:
-- category | total_items | min_price | max_price | avg_price
-- Burger   | 3           | 10.00     | 12.00     | 11.0000000000000000
-- Pizza    | 2           | 13.00     | 15.00     | 14.0000000000000000
-- Drinks   | 2           | 3.00      | 4.00      | 3.5000000000000000
-- Dessert  | 1           | 6.00      | 6.00      | 6.0000000000000000


-- Part 6 — HAVING (Examples 39–45)
-- Example 39 — Understanding HAVING
-- GOAL: Find categories that contain more than 2 products.
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
HAVING COUNT(*) > 2;

-- Result:
-- category | product_count
-- Burger   | 3