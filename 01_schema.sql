CREATE DATABASE company_finance;
USE company_finance;

CREATE TABLE target_staging_data(
Year INT ,
Company VARCHAR(100),
Category VARCHAR(50),
Market_Cap DECIMAL(18,2),
Revenue DECIMAL(18,2),
Gross_Profit DECIMAL(18,2),
Net_Income DECIMAL(18,2),
Earning_Per_Share DECIMAL(18,2),
EBITDA DECIMAL(18,2),
Share_Holder_Equity DECIMAL(18,2),
Cash_Flow_Operating DECIMAL(18,2),
Cash_Flow_Investing DECIMAL(18,2),
Cash_Flow_Financial_Activities DECIMAL(18,2),
Current_Ratio DECIMAL(18,2),
Debt_Equity_Ratio DECIMAL(18,2),
ROE DECIMAL(18,2),
ROA DECIMAL(18,2),
ROI DECIMAL(18,2),
Net_Profit_Margin DECIMAL(18,2),
Free_Cash_Flow_per_Share DECIMAL(18,2),
Return_Tangible_Equity DECIMAL(18,2),
Number_of_Employees DECIMAL(18,2),
Inflation_Rate DECIMAL(18,2)
);

CREATE TABLE company(
company_id INT AUTO_INCREMENT PRIMARY KEY,
company_name VARCHAR(150),
Category VARCHAR(50)
);

CREATE TABLE Financial_Performance (
    Performance_id INT AUTO_INCREMENT PRIMARY KEY,
    Company_id INT,
    Year INT,
    Market_Cap DECIMAL(18, 2),
    Revenue DECIMAL(18, 2),
    Gross_Profit DECIMAL(18, 2),
    Net_Income DECIMAL(18, 2),
    Earning_Per_Share DECIMAL(10, 2),
    EBITDA DECIMAL(18, 2),
    Share_Holder_Equity DECIMAL(18, 2),
    Cash_Flow_Operating DECIMAL(18, 2),
    Cash_Flow_Investing DECIMAL(18, 2),
    Cash_Flow_Financial_Activities DECIMAL(18, 2),
    Current_Ratio DECIMAL(18, 2),
    Debt_Equity_Ratio DECIMAL(18, 2),
    ROE DECIMAL(18, 2),
    ROA DECIMAL(18, 2),
    ROI DECIMAL(18, 2),
    Net_Profit_Margin DECIMAL(18, 2),
    Free_Cash_Flow_per_Share DECIMAL(18, 2),
    Number_of_Employees INT,
    Inflation_Rate DECIMAL(18, 2),
    FOREIGN KEY (Company_id) REFERENCES Company(Company_id)
);
