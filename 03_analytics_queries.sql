-- 1. Macro Analysis: Inflation Rate Range

SELECT min(inflation_rate), max(inflation_rate)
FROM financial_performance;

-- 2. Sector Performance: High-Revenue IT Companies in 2022

SELECT category, year, revenue, net_income
FROM financial_performance AS f 
JOIN company AS c 
ON c.company_id = f.company_id
WHERE category = 'IT' AND year = 2022 
AND  revenue > 100000
ORDER BY net_income DESC;

-- 3. Profitability Metrics: Net Profit Margin (%) 

SELECT c.Company_name, f.Year, f.Revenue, f.EBITDA, f.Net_Income,
ROUND((f.Net_Income / f.Revenue) * 100, 2) AS Net_Profit_Margin_Percent
FROM Financial_Performance AS f
JOIN Company AS c ON f.Company_id = c.Company_id
ORDER BY c.Company_name, f.Year;

-- 4. Returns Comparison: ROE & ROA Analysis (2022)

SELECT c.Company_name, f.Year, f.ROE, f.ROA 
FROM Financial_Performance AS f
JOIN Company c ON f.Company_id = c.Company_id
WHERE f.Year = 2022 
ORDER BY ROE DESC;

-- 5. Enterprise Scale: Large-Cap Companies (>500M Avg Market Cap)

SELECT company_name, AVG(market_cap),
sum(number_of_employees) AS total_employees
FROM financial_performance AS f
JOIN company AS c 
ON c.company_id = f.company_id
GROUP BY company_name
HAVING AVG(market_cap) >500;

-- 6. Ranking: Top Companies by Market Cap per Category (Window Function)

SELECT c.category, c.company_name, f.year, f.market_cap,
DENSE_RANK() OVER (PARTITION BY c.category ORDER BY f.market_cap DESC) AS category_rank
FROM financial_performance AS f
JOIN company AS c ON f.company_id = c.company_id
WHERE f.year = 2022;

-- 7. Sector Revenue Aggregation

SELECT UPPER(TRIM(category)) as cleaned_category, sum(revenue) as Total_revenue
FROM financial_performance as f
JOIN company as c
ON f.Company_id = c.Company_id
GROUP BY cleaned_category
ORDER BY total_revenue DESC;

-- 8. Time-Series Analysis: Apple (AAPL) YoY Revenue Progression

SELECT c.company_name , f.revenue, f.year , 
lag(f.revenue) over( order by f.year) as previous_year,
sum(f.revenue) over(order by f.year ) as total_revenue
from financial_performance as f 
join company as c 
on f.Company_id = c.company_id
WHERE company_name = 'AAPL';

-- 9. Solvency Risk Profiling (CASE Logic)

SELECT c.company_name, f.year, f.debt_equity_ratio, f.current_ratio,
CASE 
	WHEN f.debt_equity_ratio > 2.0 AND f.current_ratio < 1.0 THEN 'High Financial Risk'
	WHEN f.debt_equity_ratio BETWEEN 1.0 AND 2.0 THEN 'Moderate Risk'
	ELSE 'Low Financial Risk / Solvent'
END AS financial_health_status
FROM financial_performance AS f
JOIN company AS c ON f.company_id = c.company_id;


