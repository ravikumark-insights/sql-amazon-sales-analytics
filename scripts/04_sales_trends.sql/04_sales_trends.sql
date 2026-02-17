USE AmazonAnalytics;
GO

-- How does rating change as price increases?
SELECT
    CASE
        WHEN discounted_price_clean <  500   THEN '1. Under 500'
        WHEN discounted_price_clean <  1000  THEN '2. 500-1,000'
        WHEN discounted_price_clean <  5000  THEN '3. 1,000-5,000'
        WHEN discounted_price_clean <  20000 THEN '4. 5,000-20,000'
        ELSE                                      '5. Above 20,000'
    END                                       AS price_range,
    COUNT(*)                                  AS product_count,
    ROUND(AVG(rating_clean), 2)               AS avg_rating,
    ROUND(AVG(discount_pct_clean), 0)         AS avg_discount_pct,
    SUM(rating_count_clean)                   AS total_reviews
FROM amazon_sales
WHERE discounted_price_clean IS NOT NULL
  AND rating_clean IS NOT NULL
GROUP BY
    CASE
        WHEN discounted_price_clean <  500   THEN '1. Under 500'
        WHEN discounted_price_clean <  1000  THEN '2. 500-1,000'
        WHEN discounted_price_clean <  5000  THEN '3. 1,000-5,000'
        WHEN discounted_price_clean <  20000 THEN '4. 5,000-20,000'
        ELSE                                      '5. Above 20,000'
    END
ORDER BY price_range;

-- Do higher discounts lead to more reviews?
SELECT
    CASE
        WHEN discount_pct_clean < 10  THEN '1. Low     (0-10%)'
        WHEN discount_pct_clean < 30  THEN '2. Moderate(10-30%)'
        WHEN discount_pct_clean < 50  THEN '3. Medium  (30-50%)'
        WHEN discount_pct_clean < 70  THEN '4. High    (50-70%)'
        ELSE                               '5. Very High(70%+)'
    END                                    AS discount_level,
    COUNT(*)                               AS product_count,
    ROUND(AVG(rating_clean), 2)            AS avg_rating,
    ROUND(AVG(discounted_price_clean), 0)  AS avg_sale_price,
    SUM(rating_count_clean)                AS total_reviews
FROM amazon_sales
WHERE discount_pct_clean IS NOT NULL
GROUP BY
    CASE
        WHEN discount_pct_clean < 10  THEN '1. Low     (0-10%)'
        WHEN discount_pct_clean < 30  THEN '2. Moderate(10-30%)'
        WHEN discount_pct_clean < 50  THEN '3. Medium  (30-50%)'
        WHEN discount_pct_clean < 70  THEN '4. High    (50-70%)'
        ELSE                               '5. Very High(70%+)'
    END
ORDER BY discount_level;

-- Which categories give most savings?
SELECT
    LEFT(category, CHARINDEX('|', category + '|') - 1)   AS main_category,
    COUNT(*)                                               AS products,
    ROUND(AVG(actual_price_clean), 0)                     AS avg_original_price,
    ROUND(AVG(discounted_price_clean), 0)                 AS avg_sale_price,
    ROUND(AVG(actual_price_clean)
        - AVG(discounted_price_clean), 0)                 AS avg_rupees_saved,
    ROUND(AVG(discount_pct_clean), 0)                     AS avg_discount_pct
FROM amazon_sales
WHERE actual_price_clean IS NOT NULL
GROUP BY LEFT(category, CHARINDEX('|', category + '|') - 1)
ORDER BY avg_rupees_saved DESC;