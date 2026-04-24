# Amazon Sales Analytics — Business Analyst Project

**SQL + Excel Dashboard | Decision-Driven Analytics**

## Overview

This project simulates a real-world Business Analyst scenario where large-scale e-commerce product data is analyzed to drive strategic business decisions around pricing, discounting, and category performance.

The solution combines SQL-based data transformation and analysis with an Excel dashboard, enabling stakeholders to monitor KPIs, identify inefficiencies, and make data-driven decisions.

## Problem Statement

In large e-commerce environments, decision-making is often reactive due to:

- Lack of visibility into drivers of customer engagement
- Over-reliance on discounting without understanding impact
- Poor identification of high-growth vs underperforming categories
- Difficulty translating raw data into actionable insights

The core problem is not lack of data, but lack of structured decision-making frameworks built on data.

## Objectives

- Identify key drivers of product performance and engagement
- Analyze relationships between price, discount, and customer perception
- Detect inefficiencies and growth opportunities
- Build a scalable decision-support system using SQL and dashboards

## Analytical Approach

### 1. Data Preparation

- Cleaned and standardized raw product data using SQL
- Converted pricing, discount, and rating fields into usable formats
- Created derived fields such as price segments, discount tiers, and rating bands

### 2. KPI Development

- Average price
- Average discount percentage
- Average rating
- Total reviews as an engagement proxy
- Category-level performance metrics

### 3. Segmentation and Analysis

Products were segmented by:

- Price segment
- Discount tier
- Rating band
- Category

Advanced SQL techniques used:

- Window functions
- Ranking
- Percentile analysis
- Pareto analysis
- Category performance analysis

### 4. Insight Generation

The analysis focused on:

- Identifying performance patterns
- Understanding root causes
- Translating findings into business implications

### 5. Decision Layer

Each insight was converted into:

- Business implication
- Recommended action
- Decision-support value

### 6. Dashboard Development

An Excel dashboard was built to:

- Track key KPIs
- Compare categories and segments
- Highlight performance gaps
- Support faster business decisions

## Key Insights

### 1. Market Concentration Risk

A majority of engagement is concentrated in a small number of categories.

**Business Risk:**  
Over-dependence on limited categories can reduce growth diversification.

**Recommended Action:**  
Improve visibility and investment in underperforming categories through better positioning and discoverability.

### 2. Price Does Not Drive Perceived Quality

Customer ratings remain stable across price ranges.

**Business Implication:**  
Customers evaluate products based on value and experience, not price alone.

**Recommended Action:**  
Focus on product quality, review quality, product content, and listing optimization.

### 3. Discount Strategy Inefficiency

Discounts between 50% and 70% drive strong engagement, while discounts above 70% may reduce perceived quality.

**Business Implication:**  
Excessive discounting may create negative customer perception.

**Recommended Action:**  
Optimize discounting within the most effective range and avoid unnecessary deep discounting.

### 4. Mid-Range Segment Dominance

Mid-range products generate the highest engagement.

**Business Implication:**  
This segment balances affordability and perceived quality.

**Recommended Action:**  
Prioritize this segment for product launches, inventory planning, and marketing.

### 5. Underutilized Category Opportunity

Some categories have strong supply but low engagement.

**Business Implication:**  
Low engagement may be caused by weak discoverability, poor listing quality, or low conversion.

**Recommended Action:**  
Improve listing content, product images, descriptions, and promotional visibility.

## Business Impact

This project supports:

- Pricing optimization
- Category strategy improvement
- Customer engagement analysis
- Product positioning decisions
- Leadership visibility through structured reporting
- Data-driven decision-making

## Dashboard

The Excel dashboard provides an interactive view of:

- KPI summary
- Category performance
- Price segment performance
- Discount tier analysis
- Rating and engagement trends
- Performance gaps

## Tech Stack

- SQL Server
- SSMS
- Microsoft Excel
- Power Query
- Pivot Tables
- Dashboard visualizations

## Skills Demonstrated

- SQL data cleaning
- SQL transformation
- Advanced SQL analysis
- Window functions
- KPI development
- Data segmentation
- Business analysis
- Dashboard development
- Insight generation
- Recommendation building

## Repository Structure

```text
sql-amazon-sales-analytics/
│
├── scripts/
│   ├── 00_create_db_and_tables.sql
│   ├── 01_data_cleaning.sql
│   ├── 02_kpi_summary.sql
│   ├── 03_category_performance.sql
│   ├── 04_price_segment_analysis.sql
│   ├── 05_advanced_window_functions.sql
│   ├── 06_discount_analysis.sql
│   ├── 07_part_to_whole.sql
│   └── 08_excel_views.sql
│
├── dashboard/
│   └── Excel_Dashboard.xlsx
│
├── docs/
│   └── Amazon_Sales_Analytics_Project_Documentation.docx
│
└── README.md
