# 📊 COMPANY FINANCIAL DATA WAREHOUSE & ANALYTICS

## 📌 PROJECT OVERVIEW

Organizations require structured relational schemas to track multi-year financial performance, evaluate sector trends, and measure solvency risks. 

This project transforms raw, unnormalized financial data into a clean relational star schema in **MySQL**. It separates company metadata from multi-year performance facts, enabling efficient analysis of Year-over-Year (YoY) revenue progression, profitability margins, sector rankings, and capital structure risk.

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


