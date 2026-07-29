-- Populate Dimension Table: company

INSERT INTO company (company_name, category)
SELECT DISTINCT 
TRIM(company) AS company_name, 
UPPER(TRIM(category)) AS category
FROM target_staging_data; 

-- Populate Fact Table: financial_performance

INSERT INTO Financial_Performance (
    Company_id, Year, Market_Cap, Revenue, Gross_Profit, Net_Income, 
    Earning_Per_Share, EBITDA, Share_Holder_Equity, Cash_Flow_Operating, 
    Cash_Flow_Investing, Cash_Flow_Financial_Activities, Current_Ratio, Debt_Equity_Ratio, 
    ROE, ROA, ROI, Net_Profit_Margin, Free_Cash_Flow_per_share, Number_of_Employees, Inflation_Rate
)
SELECT 
    c.Company_id, s.Year, s.Market_Cap, s.Revenue, s.Gross_Profit, s.Net_Income, 
    s.Earning_Per_Share, s.EBITDA, s.Share_Holder_Equity, s.Cash_Flow_Operating, 
    s.Cash_Flow_Investing, s.Cash_Flow_Financial_Activities, s.Current_Ratio, s.Debt_Equity_Ratio, 
    s.ROE, s.ROA, s.ROI, s.Net_Profit_Margin, s.Free_Cash_Flow_per_share, s.Number_of_Employees, s.Inflation_Rate
FROM Target_Staging_Data AS s
JOIN Company AS c ON s.Company = c.Company_name;
