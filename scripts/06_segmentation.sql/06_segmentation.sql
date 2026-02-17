USE AmazonAnalytics;
GO

-- Segment by PRICE RANGE
SELECT
    CASE
        WHEN discounted_price_clean <  200   THEN '1. Budget    (Under 200)'
        WHEN discounted_price_clean <  1000  THEN '2. Mid-Range (200-1,000)'
        WHEN discounted_price_clean <  5000  THEN '3. Premium   (1,000-5,000)'
        WHEN discounted_price_clean <  20000 THEN '4. High-End  (5,000-20,000)'
        ELSE                                      '5. Luxury    (Above 20,000)'
    END                                       AS price_segment,
    COUNT(*)                                  AS total_products,
    ROUND(AVG(rating_clean), 2)               AS avg_rating,
    ROUND(AVG(discount_pct_clean), 0)         AS avg_discount_pct,
    SUM(rating_count_clean)                   AS total_reviews
FROM amazon_sales
WHERE discounted_price_clean IS NOT NULL
GROUP BY
    CASE
        WHEN discounted_price_clean <  200   THEN '1. Budget    (Under 200)'
        WHEN discounted_price_clean <  1000  THEN '2. Mid-Range (200-1,000)'
        WHEN discounted_price_clean <  5000  THEN '3. Premium   (1,000-5,000)'
        WHEN discounted_price_clean <  20000 THEN '4. High-End  (5,000-20,000)'
        ELSE                                      '5. Luxury    (Above 20,000)'
    END
ORDER BY price_segment;

-- Segment by RATING QUALITY
SELECT
    CASE
        WHEN rating_clean >= 4.5 THEN '1. Excellent (4.5-5.0)'
        WHEN rating_clean >= 4.0 THEN '2. Good      (4.0-4.5)'
        WHEN rating_clean >= 3.0 THEN '3. Average   (3.0-4.0)'
        ELSE                          '4. Poor      (Below 3.0)'
    END                                        AS rating_segment,
    COUNT(*)                                   AS product_count,
    ROUND(AVG(discounted_price_clean), 0)      AS avg_sale_price,
    ROUND(AVG(discount_pct_clean), 0)          AS avg_discount_pct,
    SUM(rating_count_clean)                    AS total_reviews
FROM amazon_sales
WHERE rating_clean IS NOT NULL
GROUP BY
    CASE
        WHEN rating_clean >= 4.5 THEN '1. Excellent (4.5-5.0)'
        WHEN rating_clean >= 4.0 THEN '2. Good      (4.0-4.5)'
        WHEN rating_clean >= 3.0 THEN '3. Average   (3.0-4.0)'
        ELSE                          '4. Poor      (Below 3.0)'
    END
ORDER BY rating_segment;

-- Segment by DISCOUNT LEVEL
SELECT
    CASE
        WHEN discount_pct_clean >= 70 THEN '1. Mega Deal  (70%+ off)'
        WHEN discount_pct_clean >= 50 THEN '2. Great Deal (50-70% off)'
        WHEN discount_pct_clean >= 30 THEN '3. Good Deal  (30-50% off)'
        WHEN discount_pct_clean >= 10 THEN '4. Small Deal (10-30% off)'
        ELSE                               '5. No Deal    (Under 10%)'
    END                                    AS discount_segment,
    COUNT(*)                               AS product_count,
    ROUND(AVG(rating_clean), 2)            AS avg_rating,
    ROUND(AVG(discounted_price_clean), 0)  AS avg_sale_price,
    SUM(rating_count_clean)                AS total_reviews
FROM amazon_sales
WHERE discount_pct_clean IS NOT NULL
GROUP BY
    CASE
        WHEN discount_pct_clean >= 70 THEN '1. Mega Deal  (70%+ off)'
        WHEN discount_pct_clean >= 50 THEN '2. Great Deal (50-70% off)'
        WHEN discount_pct_clean >= 30 THEN '3. Good Deal  (30-50% off)'
        WHEN discount_pct_clean >= 10 THEN '4. Small Deal (10-30% off)'
        ELSE                               '5. No Deal    (Under 10%)'
    END
ORDER BY discount_segment;

-- Combined: Price + Rating matrix
SELECT
    CASE
        WHEN discounted_price_clean < 1000 THEN 'Affordable'
        WHEN discounted_price_clean < 5000 THEN 'Mid-Range'
        ELSE                                    'Expensive'
    END                               AS price_group,
    CASE
        WHEN rating_clean >= 4.0 THEN 'High Rated'
        ELSE                          'Low Rated'
    END                               AS rating_group,
    COUNT(*)                          AS product_count,
    ROUND(AVG(discount_pct_clean), 0) AS avg_discount,
    SUM(rating_count_clean)           AS total_reviews
FROM amazon_sales
WHERE discounted_price_clean IS NOT NULL
  AND rating_clean IS NOT NULL
GROUP BY
    CASE
        WHEN discounted_price_clean < 1000 THEN 'Affordable'
        WHEN discounted_price_clean < 5000 THEN 'Mid-Range'
        ELSE                                    'Expensive'
    END,
    CASE
        WHEN rating_clean >= 4.0 THEN 'High Rated'
        ELSE                          'Low Rated'
    END
ORDER BY price_group, rating_group;