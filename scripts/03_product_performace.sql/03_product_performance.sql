USE AmazonAnalytics;
GO

-- Top 10 most reviewed products (most popular)
SELECT TOP 10
    product_name,
    LEFT(category, CHARINDEX('|', category + '|') - 1) AS main_category,
    rating_clean                                         AS rating,
    rating_count_clean                                   AS total_reviews,
    discounted_price_clean                               AS sale_price
FROM amazon_sales
WHERE rating_count_clean IS NOT NULL
ORDER BY rating_count_clean DESC;

-- Top 10 highest rated (minimum 500 reviews)
SELECT TOP 10
    product_name,
    LEFT(category, CHARINDEX('|', category + '|') - 1) AS main_category,
    rating_clean                                         AS rating,
    rating_count_clean                                   AS total_reviews,
    discounted_price_clean                               AS sale_price
FROM amazon_sales
WHERE rating_count_clean >= 500
  AND rating_clean IS NOT NULL
ORDER BY rating_clean DESC;

-- Category performance comparison
SELECT
    LEFT(category, CHARINDEX('|', category + '|') - 1) AS main_category,
    COUNT(*)                                             AS total_products,
    ROUND(AVG(rating_clean), 2)                          AS avg_rating,
    ROUND(AVG(discount_pct_clean), 0)                    AS avg_discount_pct,
    SUM(rating_count_clean)                              AS total_reviews,
    ROUND(AVG(discounted_price_clean), 0)                AS avg_sale_price
FROM amazon_sales
WHERE rating_clean IS NOT NULL
GROUP BY LEFT(category, CHARINDEX('|', category + '|') - 1)
ORDER BY total_reviews DESC;

-- Best value: high rating + high discount
SELECT TOP 10
    product_name,
    LEFT(category, CHARINDEX('|', category + '|') - 1) AS main_category,
    rating_clean                                         AS rating,
    discount_pct_clean                                   AS discount_pct,
    actual_price_clean                                   AS original_price,
    discounted_price_clean                               AS sale_price
FROM amazon_sales
WHERE rating_clean       >= 4.0
  AND discount_pct_clean >= 50
ORDER BY discount_pct_clean DESC;