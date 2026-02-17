USE AmazonAnalytics;
GO

-- Each category's % share of total reviews
SELECT
    LEFT(category, CHARINDEX('|', category + '|') - 1)  AS main_category,
    SUM(rating_count_clean)                               AS category_reviews,
    SUM(SUM(rating_count_clean)) OVER ()                  AS grand_total_reviews,
    ROUND(
        100.0 * SUM(rating_count_clean)
        / SUM(SUM(rating_count_clean)) OVER ()
    , 2)                                                   AS review_share_pct
FROM amazon_sales
WHERE rating_count_clean IS NOT NULL
GROUP BY LEFT(category, CHARINDEX('|', category + '|') - 1)
ORDER BY review_share_pct DESC;

-- Each category's % share of total products
SELECT
    LEFT(category, CHARINDEX('|', category + '|') - 1)  AS main_category,
    COUNT(*)                                              AS category_products,
    SUM(COUNT(*)) OVER ()                                 AS total_products,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2)   AS product_share_pct
FROM amazon_sales
GROUP BY LEFT(category, CHARINDEX('|', category + '|') - 1)
ORDER BY product_share_pct DESC;

-- Price segment share of total reviews
SELECT
    CASE
        WHEN discounted_price_clean <  200   THEN 'Budget'
        WHEN discounted_price_clean <  1000  THEN 'Mid-Range'
        WHEN discounted_price_clean <  5000  THEN 'Premium'
        WHEN discounted_price_clean <  20000 THEN 'High-End'
        ELSE                                      'Luxury'
    END                                                   AS price_segment,
    SUM(rating_count_clean)                               AS segment_reviews,
    ROUND(
        100.0 * SUM(rating_count_clean)
        / SUM(SUM(rating_count_clean)) OVER ()
    , 2)                                                   AS review_share_pct,
    COUNT(*)                                              AS product_count,
    ROUND(
        100.0 * COUNT(*)
        / SUM(COUNT(*)) OVER ()
    , 2)                                                   AS product_share_pct
FROM amazon_sales
WHERE discounted_price_clean IS NOT NULL
  AND rating_count_clean IS NOT NULL
GROUP BY
    CASE
        WHEN discounted_price_clean <  200   THEN 'Budget'
        WHEN discounted_price_clean <  1000  THEN 'Mid-Range'
        WHEN discounted_price_clean <  5000  THEN 'Premium'
        WHEN discounted_price_clean <  20000 THEN 'High-End'
        ELSE                                      'Luxury'
    END
ORDER BY review_share_pct DESC;