USE AmazonAnalytics;
GO

DROP TABLE IF EXISTS dbo.amazon_sales_clean;
GO

SELECT
    product_id,
    product_name,
    category,
    LEFT(category, CHARINDEX('|', category + '|') - 1) AS main_category,

    discounted_price,
    actual_price,
    discount_percentage,
    rating,
    rating_count,

    TRY_CAST(REPLACE(REPLACE(REPLACE(discounted_price, '₹', ''), ',', ''), ' ', '') AS FLOAT) AS discounted_price_clean,
    TRY_CAST(REPLACE(REPLACE(REPLACE(actual_price, '₹', ''), ',', ''), ' ', '') AS FLOAT) AS actual_price_clean,
    TRY_CAST(REPLACE(discount_percentage, '%', '') AS FLOAT) AS discount_pct_clean,
    TRY_CAST(rating AS FLOAT) AS rating_clean,
    TRY_CAST(REPLACE(rating_count, ',', '') AS INT) AS rating_count_clean,

    about_product,
    user_id,
    user_name,
    review_id,
    review_title,
    review_content,
    img_link,
    product_link

INTO dbo.amazon_sales_clean
FROM dbo.amazon_sales;
GO