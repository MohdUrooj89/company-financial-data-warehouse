# 📊 COMPANY FINANCIAL DATA WAREHOUSE & ANALYTICS

## 📌 PROJECT OVERVIEW

Organizations require structured relational schemas to track multi-year financial performance, evaluate sector trends, and measure solvency risks. 

This project transforms raw, unnormalized financial data into a clean relational star schema in **MySQL**. It separates company metadata from multi-year performance facts, enabling efficient analysis of Year-over-Year (YoY) revenue progression, profitability margins, sector rankings, and capital structure risk, and The interactive dashboard provides a high-level corporate financial analysis of major public companies across various industry sectors. It evaluates key financial health indicators, profitability metrics, operational efficiency, and capital structure dynamics (leveraging data spanning from approximately 2008 to 2022+).

---

## 🏗 DATABASE ARCHITECTURE

The data model transitions from a single flat staging table to a normalized dimensional architecture:

# 1. target_staging_data
* Temporary staging table used for batch file ingestion (CSV/JSON).

# 2. company (Dimension Table)
* Stores unique company metadata (`company_id`, `company_name`, `category`).

# 3. financial_performance (Fact Table)
* Stores multi-year quantitative financial metrics linked to the company dimension via `company_id` foreign key.

---

## 🚀 KEY SQL SKILLS DEMONSTRATED

# Data Modeling & Schema Design
* Primary keys, surrogate keys, auto-increment, and foreign key constraints.

# ETL Pipeline & Data Cleaning
* String sanitization using `TRIM()` and `UPPER()`, data type casting, and deduplication.

# Advanced Window Functions
* `LAG()` for prior-period comparisons and multi-year time-series analysis.
* `DENSE_RANK()` with `PARTITION BY` for localized sector rankings.
* Running total aggregations with `SUM() OVER()`.

# Business Logic & Risk Profiling
* Conditional risk categorization using `CASE` evaluation on liquidity (`current_ratio`) and leverage (`debt_equity_ratio`).

---

## 💡 KEY BUSINESS QUESTIONS ANSWERED

# 1. Sector Profitability Analysis
* High-performing IT companies exceeding $100M revenue threshold in 2022.

# 2. Margin Calculation
* Computed Net Profit Margin percentages using `ROUND()` and `NULLIF()` for zero-division safety.

# 3. Scale Classification
* Filtering large-cap enterprises averaging > $500M market capitalization using `GROUP BY ... HAVING`.

# 4. Industry Rankings
* Identifying top companies by market cap within each industry category using `DENSE_RANK()`.

# 5. Time-Series Progression
* Multi-year revenue progression and running cumulative totals for Apple (`AAPL`).

# 6. Solvency & Financial Health Profiling
* Automated categorization of corporate balance sheet health (`High Financial Risk`, `Moderate Risk`, `Solvent`).


📈 Power BI Dashboard Analytics
The Power BI dashboard connects directly to MySQL to deliver interactive, executive-level insights:

# 1. Executive KPI Panel: Displays aggregate Total Revenue ($12.21M), Total EBITDA ($3.25M), EBITDA Margin % (0.27), and overall Solvency Status (Stable).

# 2. Return Metrics Breakdown: Multi-metric bar chart evaluating Average ROE %, Average ROI %, and Average ROA % across evaluated companies (AAPL, MSFT, INTC, NVDA, GOOG,        etc.).

# 3. Market Capitalization Sector Allocation: Donut chart showcasing market cap distribution across sectors, highlighting IT as the dominant category (~68.02%).

# 4. Net Profit Margin Trajectory: Line chart illustrating profit margin progression across entities ranging from high performers (MSFT, GOOG) to distressed entities            (SHLDQ).

# 5. Solvency & Risk Timeline: Multi-year dual-axis chart tracking Average Current Ratio vs. Average Debt-to-Equity Ratio over time.

# 6. Interactive Slicers: Multi-company filter sidebar allowing dynamic visual slicing by company_name.


