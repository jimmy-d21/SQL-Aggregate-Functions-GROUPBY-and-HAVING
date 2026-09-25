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