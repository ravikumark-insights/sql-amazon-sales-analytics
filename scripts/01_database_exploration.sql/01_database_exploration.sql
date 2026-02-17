USE AmazonAnalytics;
GO

-- How many products do we have?
SELECT COUNT(*) AS total_products
FROM amazon_sales;

-- What are the 9 categories and how many products each?
SELECT
    LEFT(category, CHARINDEX('|', category + '|') - 1) AS main_category,
    COUNT(*)                                             AS product_count
FROM amazon_sales
GROUP BY LEFT(category, CHARINDEX('|', category + '|') - 1)
ORDER BY product_count DESC;

-- Price range overview
SELECT
    MIN(discounted_price_clean)           AS cheapest_product,
    MAX(discounted_price_clean)           AS most_expensive_product,
    ROUND(AVG(discounted_price_clean), 0) AS average_price
FROM amazon_sales
WHERE discounted_price_clean IS NOT NULL;

-- Discount overview
SELECT
    MIN(discount_pct_clean)           AS min_discount,
    MAX(discount_pct_clean)           AS max_discount,
    ROUND(AVG(discount_pct_clean), 0) AS avg_discount
FROM amazon_sales
WHERE discount_pct_clean IS NOT NULL;