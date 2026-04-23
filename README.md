🛒 Amazon Sales Analytics — Business Analyst Project (SQL + Dashboard)

End-to-end Business Analyst project demonstrating how raw e-commerce data can be transformed into actionable insights, strategic recommendations, and decision-support tools using SQL and Excel.

📌 Business Problem

E-commerce platforms operate with large volumes of product data, but key business decisions—such as pricing strategy, discount optimization, and category investment—are often not fully data-driven.

This creates challenges such as:

Over-reliance on discounting without understanding impact
Poor visibility into category-level performance
Missed opportunities in underperforming segments
Lack of clarity on what drives customer engagement
🎯 Objective

This project simulates the role of a Business Analyst by:

Analyzing product-level data to identify key performance drivers
Evaluating relationships between price, discount, and customer ratings
Identifying high-impact opportunities across categories
Building a dashboard for decision-making support
🧠 Solution Overview

The solution follows a structured analytics approach:

1. Data Preparation
Cleaned raw dataset using SQL
Standardized pricing, discount, and rating fields
Ensured data quality for analysis
2. Exploratory Analysis
Analyzed product distribution across categories
Built baseline KPIs (price, rating, discount, reviews)
3. Advanced Analytics
Segmented products by:
Price ranges
Discount levels
Rating bands
Applied window functions for:
Trend analysis
Market concentration
Contribution analysis
4. Visualization
Built an interactive Excel dashboard
Translated SQL insights into business-friendly visuals
Enabled filtering and comparison across segments
📊 Key Business Insights
1. Market Concentration Risk
~88% of total customer engagement is driven by just 2 categories
Remaining categories contribute minimal activity

👉 Impact:
High dependency on limited categories increases risk and limits growth diversification

2. Price Does Not Indicate Quality
Ratings remain stable across all price ranges (~4.0–4.2)

👉 Impact:
Premium pricing alone is not a reliable differentiator

3. Optimal Discount Range Identified
50–70% discount range drives the highest engagement
Discounts beyond 70% reduce perceived product quality

👉 Impact:
Helps optimize pricing and promotional strategies

4. Mid-Range Products Drive Engagement
₹200–₹1,000 segment generates nearly 50% of all reviews

👉 Impact:
Represents the most critical segment for growth and product launches

5. Underutilized Category Opportunity
Home & Kitchen has strong product count but low engagement

👉 Impact:
High potential for growth through improved visibility and marketing

6. “Good” Products Dominate Market Behavior
4.0–4.5 rating range accounts for:
Majority of products
Majority of customer engagement

👉 Impact:
Improving products above 4.0 rating threshold is more impactful than chasing perfection

📈 Business Impact

This project enables:

Pricing Teams → Optimize discount strategies
Category Managers → Identify high-growth segments
Product Teams → Improve positioning and performance
Leadership → Make data-driven strategic decisions
📊 Dashboard (Excel)

An interactive Excel dashboard was developed to:

Track key KPIs (rating, discount, product count)
Compare category performance
Analyze pricing and discount patterns
Identify underperforming segments

👉 The dashboard acts as a decision-support tool, not just a visualization.

🗂️ Project Structure
sql-amazon-sales-analytics/
│
├── datasets/
│   └── amazon_sales.csv
│
├── scripts/
│   ├── 00_create_db_and_tables.sql
│   ├── 01_database_exploration.sql
│   ├── 02_measures_and_metrics.sql
│   ├── 03_product_performance.sql
│   ├── 04_sales_trends.sql
│   ├── 05_cumulative_analytics.sql
│   ├── 06_segmentation.sql
│   └── 07_part_to_whole.sql
│
├── dashboard/
│   └── Amazon_Dashboard.xlsx
│
├── docs/
│   └── data_dictionary.md
│
└── README.md
🛠️ Technical Skills Demonstrated
SQL (T-SQL)
Data Cleaning & Transformation
Aggregations & KPI Development
Window Functions
Segmentation & Trend Analysis
Business Insight Generation
Excel Dashboarding
📁 Dataset
Source: Kaggle — Amazon Sales Dataset
Size: 1,465 products
Categories: 9
Currency: Indian Rupees (₹)
👤 Author

Ravi Kumar
Business Analyst
