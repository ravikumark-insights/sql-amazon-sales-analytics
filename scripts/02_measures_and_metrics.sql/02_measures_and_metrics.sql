USE AmazonAnalytics;
GO

-- Full business snapshot
SELECT
    COUNT(*)                                     AS total_products,
    ROUND(AVG(actual_price_clean),    0)         AS avg_original_price,
    ROUND(AVG(discounted_price_clean),0)         AS avg_sale_price,
    ROUND(AVG(discount_pct_clean),    0)         AS avg_discount_percent,
    ROUND(AVG(rating_clean),          2)         AS avg_customer_rating,
    SUM(rating_count_clean)                      AS total_customer_reviews
FROM amazon_sales;

-- How much money do customers save on average?
SELECT
    ROUND(AVG(actual_price_clean - discounted_price_clean), 0) AS avg_savings_rupees,
    ROUND(AVG(discount_pct_clean), 0)                          AS avg_savings_percent
FROM amazon_sales
WHERE actual_price_clean IS NOT NULL
  AND discounted_price_clean IS NOT NULL;

-- Top 10 products with BIGGEST price drops (best deals!)
SELECT TOP 10
    product_name,
    actual_price_clean                                AS original_price,
    discounted_price_clean                            AS sale_price,
    (actual_price_clean - discounted_price_clean)     AS you_save,
    discount_pct_clean                                AS discount_pct
FROM amazon_sales
WHERE actual_price_clean IS NOT NULL
ORDER BY (actual_price_clean - discounted_price_clean) DESC;