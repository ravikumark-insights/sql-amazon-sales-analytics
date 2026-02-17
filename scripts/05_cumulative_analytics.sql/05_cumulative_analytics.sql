USE AmazonAnalytics;
GO

-- Running total of reviews by category
SELECT
    LEFT(category, CHARINDEX('|', category + '|') - 1)         AS main_category,
    SUM(rating_count_clean)                                      AS category_reviews,
    SUM(SUM(rating_count_clean))
        OVER (ORDER BY SUM(rating_count_clean) DESC
              ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)  AS cumulative_reviews
FROM amazon_sales
WHERE rating_count_clean IS NOT NULL
GROUP BY LEFT(category, CHARINDEX('|', category + '|') - 1)
ORDER BY category_reviews DESC;

-- Running average rating across price buckets
SELECT
    price_range,
    product_count,
    avg_rating,
    ROUND(
        AVG(avg_rating) OVER (
            ORDER BY price_range
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ), 2
    ) AS running_avg_rating
FROM (
    SELECT
        CASE
            WHEN discounted_price_clean <  500   THEN '1. Under 500'
            WHEN discounted_price_clean <  1000  THEN '2. 500-1,000'
            WHEN discounted_price_clean <  5000  THEN '3. 1,000-5,000'
            WHEN discounted_price_clean <  20000 THEN '4. 5,000-20,000'
            ELSE                                      '5. Above 20,000'
        END                              AS price_range,
        COUNT(*)                         AS product_count,
        ROUND(AVG(rating_clean), 2)      AS avg_rating
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
) AS price_buckets
ORDER BY price_range;

-- Rank products within each category by reviews
SELECT
    product_name,
    LEFT(category, CHARINDEX('|', category + '|') - 1)   AS main_category,
    rating_clean,
    rating_count_clean                                     AS total_reviews,
    RANK() OVER (
        PARTITION BY LEFT(category, CHARINDEX('|', category + '|') - 1)
        ORDER BY rating_count_clean DESC
    )                                                      AS rank_in_category
FROM amazon_sales
WHERE rating_count_clean IS NOT NULL
ORDER BY main_category, rank_in_category;