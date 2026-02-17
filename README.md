# 🛒 Amazon Sales Analytics — SQL Project

> An end-to-end SQL analytics project analyzing **1,465 Amazon India product listings** across 9 categories — uncovering pricing strategy, discount behavior, customer engagement patterns, and market segmentation using T-SQL and window functions.

---

## 📌 Business Context

This project simulates the workflow of a **Business Analyst at an e-commerce company** tasked with understanding product performance and pricing strategy from raw sales data. Each script answers a specific business question that a stakeholder or manager would ask.

**Core questions this project answers:**
- Which categories drive the most customer engagement — and by how much?
- Does aggressive discounting actually improve customer satisfaction?
- Is there a price-quality "sweet spot" that attracts the most buyers?
- How concentrated is review activity across the product catalogue?
- Which products offer the best value — high quality at the deepest discount?

---

## 📊 Key Results At a Glance

| Metric | Value |
|---|---|
| Total Products | 1,465 |
| Total Categories | 9 |
| Total Customer Reviews | 26,766,377 |
| Avg Original Price | ₹5,445 |
| Avg Sale Price | ₹3,125 |
| Avg Customer Savings | ₹2,320 **(48% off)** |
| Avg Customer Rating | 4.1 / 5.0 |
| Cheapest Product | ₹39 |
| Most Expensive Product | ₹77,990 |
| Max Discount Offered | 94% |

---

## 🧠 L5 Business Analyst — Analysis Notes

> The following numbered insights go beyond surface-level observations. Each finding is backed by query results, cross-validated across multiple scripts, and framed with a business recommendation — the way a senior analyst would present to a leadership team.

---

### 1. Market Concentration Risk — Two Categories Dominate Everything

**Finding:**
Electronics (58.95%) + Computers&Accessories (28.87%) = **87.8% of all 26,766,377 reviews** from just 2 of 9 categories. Adding Home&Kitchen (11.17%) brings the total to **98.9%** — meaning the remaining 6 categories collectively account for only **1.1%** of all customer engagement.

**Data:**
| Category | Reviews | Share |
|---|---|---|
| Electronics | 15,778,848 | 58.95% |
| Computers&Accessories | 7,728,689 | 28.87% |
| Home&Kitchen | 2,991,069 | 11.17% |
| All other 6 categories | 167,871 | 1.01% |

**BA Insight:**
This is a classic long-tail concentration problem. While Electronics dominance is expected, the near-total absence of engagement in 6 of 9 categories (MusicalInstruments: 0.33%, Toys&Games: 0.06%, HomeImprovement: 0.03%, Health&PersonalCare: 0.01%) suggests either very low inventory depth or poor discoverability in those categories — not necessarily low demand.

**Recommendation:**
Diversification investment in underrepresented categories carries low risk given their current near-zero baseline. A 10x improvement in Toys&Games review volume would still represent less than 1% of total — showing the scale of opportunity available.

---

### 2. Price Is Not a Quality Signal — Rating Is Flat Across All Tiers

**Finding:**
Customer ratings barely move across a ₹39 to ₹77,990 price range — a span of over 2,000x in price produces only a **0.17-point difference in average rating**.

**Data:**
| Price Range | Products | Avg Rating | Avg Discount |
|---|---|---|---|
| Under ₹500 | 576 | 4.07 | 56% |
| ₹500–₹1,000 | 252 | 4.12 | 46% |
| ₹1,000–₹5,000 | 430 | 4.08 | 45% |
| ₹5,000–₹20,000 | 155 | 4.15 | 34% |
| Above ₹20,000 | 51 | 4.24 | 31% |

**BA Insight:**
In a traditional market, premium pricing signals premium quality. This data challenges that assumption for Amazon India. The running average rating (Script 05) further confirms this — it stays remarkably stable at 4.07 → 4.13 as price increases. Two explanations: (a) Amazon's review system averages out quality across price tiers, or (b) budget products in India are genuinely competitive in quality. Either way, **premium pricing alone is not a sustainable differentiation strategy** in this catalogue.

**Recommendation:**
Sellers in the premium and luxury tier cannot rely on price as a quality proxy. They must invest in review volume, verified purchases, and detailed product descriptions to signal quality — because rating scores won't do it for them.

---

### 3. The Discount Sweet Spot Is 50–70% — Beyond That, Quality Perception Drops

**Finding:**
Products with 50–70% discounts generate the highest review volume (10,370,048) — but pushing past 70% discount causes both rating AND average price to fall sharply.

**Data:**
| Discount Level | Products | Avg Rating | Avg Sale Price | Total Reviews |
|---|---|---|---|---|
| Low (0–10%) | 74 | **4.21** | ₹2,565 | 921,586 |
| Moderate (10–30%) | 258 | 4.15 | ₹6,041 | 5,200,151 |
| Medium (30–50%) | 382 | 4.10 | ₹5,060 | 6,627,182 |
| High (50–70%) | 504 | 4.08 | ₹1,386 | **10,370,048** |
| Very High (70%+) | 247 | **4.03** | **₹804** | 3,647,410 |

**BA Insight:**
The inverse relationship between discount depth and product quality is clear and consistent. "Mega Deal" products (70%+ off) average only ₹804 in sale price — they are fundamentally cheap products, not premium products on sale. A customer buying a 70%+ discounted product is not getting a ₹10,000 item for ₹3,000; they are getting an ₹800 item. Presenting these as "deals" can damage brand perception if the product quality doesn't meet expectations set by the discount framing.

**Recommendation:**
Cap promotional discounts at 70% for quality-tier products. Use 50–70% as the "deal zone" — it maximizes engagement without signalling low quality. Reserve 70%+ discounting for clearance or commodity items only.

---

### 4. Mid-Range Is the Market's Center of Gravity

**Finding:**
The ₹200–₹1,000 price band contains 629 products (43% of catalogue) and generates 13,056,438 reviews — nearly **49% of all customer engagement** — making it by far the most active segment.

**Data:**
| Price Segment | Products | Avg Rating | Avg Discount | Total Reviews |
|---|---|---|---|---|
| Budget (< ₹200) | 199 | 4.04 | 58% | 2,061,720 |
| **Mid-Range (₹200–₹1,000)** | **629** | **4.10** | **51%** | **13,056,438** |
| Premium (₹1,000–₹5,000) | 431 | 4.08 | 45% | 7,868,838 |
| High-End (₹5,000–₹20,000) | 155 | 4.15 | 34% | 3,195,824 |
| Luxury (> ₹20,000) | 51 | 4.24 | 31% | 583,557 |

**BA Insight:**
Mid-Range products hit the optimal intersection of accessibility (price), quality (4.10 avg rating), and promotional aggressiveness (51% avg discount). This is where Indian e-commerce customers are most active and most trusting. The ₹200–₹1,000 band likely represents the everyday consumer electronics and accessories market — USB cables, earphones, phone accessories — which are high-frequency, low-consideration purchases.

**Recommendation:**
New product launches should target the ₹200–₹1,000 price band for maximum organic reach and review velocity. Pricing new products into Premium (₹1,000–₹5,000) without an established brand reduces initial engagement by ~40% compared to Mid-Range.

---

### 5. Home&Kitchen Has a Hidden Engagement Problem

**Finding:**
Home&Kitchen has nearly the same number of products as Electronics (448 vs. 526) but generates only **2,991,069 reviews vs. 15,778,848** — a 5.3x gap in engagement despite near-equal product count.

**Data:**
| Category | Products | Product Share | Reviews | Review Share | Gap |
|---|---|---|---|---|---|
| Electronics | 526 | 35.90% | 15,778,848 | 58.95% | **+23.05%** |
| Computers&Accessories | 453 | 30.92% | 7,728,689 | 28.87% | **−2.05%** |
| Home&Kitchen | 448 | 30.58% | 2,991,069 | 11.17% | **−19.41%** |

**BA Insight:**
Home&Kitchen "punches well below its weight." Each Electronics product averages ~30,000 reviews; each Home&Kitchen product averages ~6,680 reviews. This could indicate: (a) lower purchase frequency for kitchen products vs. electronics accessories, (b) lower review conversion rate in this category, or (c) product listing quality issues (poor images, descriptions, pricing) reducing conversion. Notably, Home&Kitchen has the **highest average product rating** in the catalogue — the quality is there, but the visibility and engagement are not.

**Recommendation:**
Home&Kitchen is the highest-upside category. It has proven product quality (best avg ratings) but underdeveloped engagement. Targeted investment in listing optimization, sponsored ads, and review solicitation campaigns in Home&Kitchen could yield disproportionate returns given the existing quality foundation.

---

### 6. The "Good" Rating Band Owns the Market — Excellent Is Rare

**Finding:**
"Good" rated products (4.0–4.5 stars) represent **68.7% of all products** and **82% of all reviews** — the vast majority of market activity happens in this band, not at the top.

**Data:**
| Rating Segment | Products | % of Total | Avg Price | Total Reviews | % of Reviews |
|---|---|---|---|---|---|
| Excellent (4.5–5.0) | 104 | 7.1% | ₹2,511 | 1,589,088 | 5.9% |
| **Good (4.0–4.5)** | **1,006** | **68.7%** | **₹3,695** | **21,933,312** | **82.0%** |
| Average (3.0–4.0) | 348 | 23.8% | ₹1,711 | 3,242,591 | 12.1% |
| Poor (< 3.0) | 6 | 0.4% | ₹518 | 394 | 0.0% |

**BA Insight:**
The market does not reward "excellent" products disproportionately — they are rarer AND generate fewer reviews per product on average. The "Good" band is where trust and purchase decisions happen at scale. This suggests Amazon India customers are pragmatic buyers who find 4.0–4.5 stars "good enough" and do not hold out for perfect ratings. Poor products (< 3.0) are near-extinct with only 6 products — the marketplace self-selects for minimum quality.

**Recommendation:**
For product strategy, optimizing from 3.5 stars to 4.0+ is far more valuable than optimizing from 4.5 to 5.0. The "Good" band captures 82% of all reviews — crossing the 4.0 threshold is the critical quality milestone.

---

### 7. Electronics Saves Customers the Most Money — In Absolute Terms

**Finding:**
Electronics products save customers an average of **₹4,161 per product** — more than double Home&Kitchen (₹1,831) and nearly 5x Computers&Accessories (₹841).

**Data:**
| Category | Products | Avg Original | Avg Sale | Avg ₹ Saved | Avg Discount % |
|---|---|---|---|---|---|
| Electronics | 526 | ₹10,127 | ₹5,966 | **₹4,161** | 51% |
| Home&Kitchen | 448 | ₹4,162 | ₹2,331 | ₹1,831 | 40% |
| Car&Motorbike | 1 | ₹4,000 | ₹2,339 | ₹1,661 | 42% |
| Computers&Accessories | 453 | ₹1,684 | ₹843 | ₹841 | 54% |

**BA Insight:**
Computers&Accessories has a *higher average discount percentage* (54%) than Electronics (51%), yet saves customers less in absolute rupees (₹841 vs. ₹4,161) — because the base prices are lower. This distinction matters for marketing: "54% off" sounds better than "51% off" but ₹841 saved feels less impactful than ₹4,161 saved. When promoting Electronics deals, lead with the absolute savings figure. When promoting Computers&Accessories, lead with the percentage.

**Recommendation:**
Tailor deal messaging by category: use **₹ saved** for Electronics (high absolute value), use **% discount** for Computers&Accessories (high relative value). This maximizes perceived value for each category's price point.

---

## 🗂️ Project Structure

```
sql-amazon-sales-analytics/
│
├── datasets/
│   └── amazon.csv                        # Raw source data (Kaggle)
│
├── scripts/
│   ├── 00_create_db_and_tables.sql       # Database & schema setup
│   ├── 01_database_exploration.sql       # Data profiling & shape
│   ├── 02_measures_and_metrics.sql       # Core KPIs & business snapshot
│   ├── 03_product_performance.sql        # Product & category rankings
│   ├── 04_sales_trends.sql               # Price & discount trend analysis
│   ├── 05_cumulative_analytics.sql       # Running totals & window functions
│   ├── 06_segmentation.sql               # Multi-dimensional segmentation
│   └── 07_part_to_whole.sql              # Market share analysis
│
├── docs/
│   └── data_dictionary.md
│
└── README.md
```

---

## 📋 Full Results Summary

### Script 01 — Database Exploration

| Category | Products |
|---|---|
| Electronics | 526 |
| Computers&Accessories | 453 |
| Home&Kitchen | 448 |
| OfficeProducts | 31 |
| HomeImprovement | 2 |
| MusicalInstruments | 2 |
| Toys&Games | 1 |
| Car&Motorbike | 1 |
| Health&PersonalCare | 1 |

---

### Script 02 — Measures & Metrics

**Top 3 Biggest Deals (by ₹ saved):**

| Product | Original | Sale | You Save | Discount |
|---|---|---|---|---|
| Sony Bravia 65" 4K Smart LED TV | ₹1,39,900 | ₹77,990 | ₹61,910 | 44% |
| Coway Professional Air Purifier | ₹59,900 | ₹14,400 | ₹45,500 | 76% |
| Samsung Galaxy S20 FE 5G | ₹74,999 | ₹37,990 | ₹37,009 | 49% |

---

### Script 03 — Product Performance

**Most Reviewed:**

| Product | Rating | Reviews | Price |
|---|---|---|---|
| AmazonBasics Flexible Premium HDMI Cable | 4.4 | 426,973 | ₹219 |
| boAt Bassheads 100 In Ear Wired Earphones | 4.1 | 363,713 | ₹349 |
| Redmi 9 Activ (4GB/64GB) | 4.1 | 313,836 | ₹8,499 |

**Best Rated (min. 500 reviews):**

| Product | Category | Rating | Reviews |
|---|---|---|---|
| Swiffer Instant Electric Water Heater Faucet | Home&Kitchen | 4.8 | 53,803 |
| Instant Pot Air Fryer Vortex 2QT | Home&Kitchen | 4.8 | 3,964 |
| Sony Bravia 65" 4K Smart LED TV | Electronics | 4.7 | 5,935 |

---

### Script 05 — Cumulative Reviews

| Category | Category Reviews | Cumulative | Cumulative % |
|---|---|---|---|
| Electronics | 15,778,848 | 15,778,848 | 58.9% |
| Computers&Accessories | 7,728,689 | 23,507,537 | 87.8% |
| Home&Kitchen | 2,991,069 | 26,498,606 | 98.9% |
| All remaining 6 | 267,653 | 26,765,259 | 100% |

---

## 🛠️ Technical Skills Demonstrated

| Skill | Scripts |
|---|---|
| Database design & schema creation | 00 |
| Data ingestion strategy (NVARCHAR staging) | 00 |
| Unicode data cleaning — `TRY_CAST`, `REPLACE`, `NCHAR(8377)` | Data prep |
| String parsing — `LEFT`, `CHARINDEX` | 01–07 |
| Aggregate functions — `SUM`, `AVG`, `COUNT`, `MIN`, `MAX` | 01–07 |
| Conditional bucketing — `CASE WHEN` | 04–07 |
| `TOP N` with `ORDER BY` ranking | 02, 03 |
| Window functions — `SUM() OVER()`, `AVG() OVER()` | 05, 07 |
| Partitioned ranking — `RANK() OVER(PARTITION BY)` | 05 |
| Subqueries / derived tables | 05 |
| Part-to-whole % — `SUM(SUM()) OVER()` | 07 |
| NULL filtering & data quality handling | Throughout |

---

## 🚀 How to Run

1. Install [SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) (free) and [SSMS](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
2. Clone this repo:
   ```bash
   git clone https://github.com/ravikumark-insights/sql-amazon-sales-analytics.git
   ```
3. Run scripts **in order**: `00` → `01` → `02` → ... → `07`
4. Import `amazon.csv` from `datasets/` using the SSMS Import Wizard

> **Note:** Raw prices contain `₹` stored as Unicode `NCHAR(8377)`. The data cleaning script handles this using `TRY_CAST` + `REPLACE(col, NCHAR(8377), '')`.

---

## 📁 Dataset

**Source:** [Kaggle — Amazon Sales Dataset](https://www.kaggle.com/datasets/karkavelrajaj/amazon-sales-dataset)
**Size:** 1,465 products | 9 categories | Indian Rupees (₹)

---

## 👤 Author

**Ravikumar K** | Business Analyst
🔗 [GitHub](https://github.com/ravikumark-insights)

---

*MIT License*
