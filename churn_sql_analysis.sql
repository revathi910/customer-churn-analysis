-- ============================================================
--  TELCO CUSTOMER CHURN — SQL ANALYSIS
--  Run in: MySQL / PostgreSQL / SQLite / DB Browser
-- ============================================================

-- Assume table name: customers
-- Churn_Binary = 1 (churned), 0 (retained)

-- ─────────────────────────────────────────
-- Q1: Overall churn rate
-- ─────────────────────────────────────────
SELECT 
    COUNT(*)                              AS total_customers,
    SUM(Churn_Binary)                     AS churned,
    COUNT(*) - SUM(Churn_Binary)          AS retained,
    ROUND(AVG(Churn_Binary) * 100, 2)     AS churn_rate_pct
FROM customers;


-- ─────────────────────────────────────────
-- Q2: Churn rate by Contract type
-- ─────────────────────────────────────────
SELECT 
    Contract,
    COUNT(*)                              AS total_customers,
    SUM(Churn_Binary)                     AS churned,
    ROUND(AVG(Churn_Binary) * 100, 2)     AS churn_rate_pct
FROM customers
GROUP BY Contract
ORDER BY churn_rate_pct DESC;


-- ─────────────────────────────────────────
-- Q3: Revenue lost due to churn (monthly + total)
-- ─────────────────────────────────────────
SELECT 
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END)                        AS customers_lost,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN MonthlyCharges ELSE 0 END), 2) AS monthly_revenue_lost,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN TotalCharges  ELSE 0 END), 2) AS total_revenue_lost
FROM customers;


-- ─────────────────────────────────────────
-- Q4: Churn rate by Internet Service
-- ─────────────────────────────────────────
SELECT 
    InternetService,
    COUNT(*)                              AS total,
    SUM(Churn_Binary)                     AS churned,
    ROUND(AVG(Churn_Binary) * 100, 2)     AS churn_rate_pct
FROM customers
GROUP BY InternetService
ORDER BY churn_rate_pct DESC;


-- ─────────────────────────────────────────
-- Q5: Churn by Payment Method
-- ─────────────────────────────────────────
SELECT 
    PaymentMethod,
    COUNT(*)                              AS total,
    ROUND(AVG(Churn_Binary) * 100, 2)     AS churn_rate_pct
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate_pct DESC;


-- ─────────────────────────────────────────
-- Q6: Churn by Tenure Group
-- ─────────────────────────────────────────
SELECT 
    CASE 
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END                                   AS tenure_group,
    COUNT(*)                              AS total,
    ROUND(AVG(Churn_Binary) * 100, 2)     AS churn_rate_pct,
    ROUND(AVG(MonthlyCharges), 2)         AS avg_monthly_charge
FROM customers
GROUP BY tenure_group
ORDER BY churn_rate_pct DESC;


-- ─────────────────────────────────────────
-- Q7: High-risk customers (active, likely to churn)
-- ─────────────────────────────────────────
SELECT 
    customerID,
    tenure,
    MonthlyCharges,
    Contract,
    InternetService,
    PaymentMethod
FROM customers
WHERE Churn = 'No'
  AND Contract = 'Month-to-month'
  AND InternetService = 'Fiber optic'
  AND tenure < 12
ORDER BY MonthlyCharges DESC
LIMIT 20;


-- ─────────────────────────────────────────
-- Q8: Average charges — churned vs retained
-- ─────────────────────────────────────────
SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges), 2)   AS avg_monthly_charge,
    ROUND(AVG(TotalCharges), 2)     AS avg_total_charge,
    ROUND(AVG(tenure), 1)           AS avg_tenure_months,
    COUNT(*)                        AS customer_count
FROM customers
GROUP BY Churn;


-- ─────────────────────────────────────────
-- Q9: Top churn combination (Internet + Contract + Payment)
-- ─────────────────────────────────────────
SELECT 
    InternetService,
    Contract,
    PaymentMethod,
    COUNT(*)                              AS total,
    ROUND(AVG(Churn_Binary) * 100, 2)     AS churn_rate_pct
FROM customers
GROUP BY InternetService, Contract, PaymentMethod
HAVING COUNT(*) > 50
ORDER BY churn_rate_pct DESC
LIMIT 10;


-- ─────────────────────────────────────────
-- Q10: Senior citizens churn analysis
-- ─────────────────────────────────────────
SELECT 
    CASE WHEN SeniorCitizen = 1 THEN 'Senior' ELSE 'Non-Senior' END AS segment,
    COUNT(*)                              AS total,
    ROUND(AVG(Churn_Binary) * 100, 2)     AS churn_rate_pct,
    ROUND(AVG(MonthlyCharges), 2)         AS avg_monthly_charge
FROM customers
GROUP BY SeniorCitizen;
