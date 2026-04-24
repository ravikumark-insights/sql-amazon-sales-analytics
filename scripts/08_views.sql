USE AmazonAnalytics;
GO

-- KPI
CREATE OR ALTER VIEW vw_kpi_summary AS
SELECT
    COUNT(*) AS total_products,
    SUM(rating_count_clean) AS total_reviews,
    AVG(rating_clean) AS avg_rating,
    AVG(discount_pct_clean) AS avg_discount
FROM dbo.amazon_sales_clean;
GO

-- Category
CREATE OR ALTER VIEW vw_category_performance AS
SELECT
    main_category,
    COUNT(*) AS total_products,
    SUM(rating_count_clean) AS total_reviews,
    AVG(rating_clean) AS avg_rating
FROM dbo.amazon_sales_clean
GROUP BY main_category;
GO

-- Price Segment
CREATE OR ALTER VIEW vw_price_segment AS
SELECT
    CASE
        WHEN discounted_price_clean < 200 THEN 'Budget'
        WHEN discounted_price_clean < 1000 THEN 'Mid-Range'
        WHEN discounted_price_clean < 5000 THEN 'Premium'
        WHEN discounted_price_clean < 20000 THEN 'High-End'
        ELSE 'Luxury'
    END AS price_segment,
    COUNT(*) AS total_products,
    AVG(rating_clean) AS avg_rating
FROM dbo.amazon_sales_clean
GROUP BY
    CASE
        WHEN discounted_price_clean < 200 THEN 'Budget'
        WHEN discounted_price_clean < 1000 THEN 'Mid-Range'
        WHEN discounted_price_clean < 5000 THEN 'Premium'
        WHEN discounted_price_clean < 20000 THEN 'High-End'
        ELSE 'Luxury'
    END;
GO

-- Top Products
CREATE OR ALTER VIEW vw_top_products AS
SELECT TOP 50
    product_name,
    main_category,
    discounted_price_clean,
    rating_clean,
    rating_count_clean
FROM dbo.amazon_sales_clean
ORDER BY rating_count_clean DESC;
GO

-- Discount Analysis
CREATE OR ALTER VIEW vw_discount_analysis AS
SELECT
    discount_pct_clean,
    AVG(rating_clean) AS avg_rating,
    COUNT(*) AS product_count
FROM dbo.amazon_sales_clean
GROUP BY discount_pct_clean;
GO