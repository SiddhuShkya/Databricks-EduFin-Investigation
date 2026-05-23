WITH city_metrics AS (
    SELECT 
        dc.city_name AS City,
        COUNT(*) AS `Loans`,
        COUNT(DISTINCT c.customer_id) AS `Customers`,
        SUM(l.loan_amount) AS total_portfolio,
        SUM(CASE 
            WHEN l.loan_status = 'Defaulted' 
            THEN l.loan_amount * 1.0 
            ELSE 0 
        END) AS default_exposure,
        ROUND(SUM(CASE 
            WHEN l.loan_status = 'Defaulted' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*), 2) AS default_rate
    FROM loans l
    INNER JOIN customers c ON l.customer_id = c.customer_id
    INNER JOIN dim_city dc ON c.city_id = dc.city_id
    GROUP BY dc.city_name
    HAVING COUNT(*) >= 100
)
SELECT 
    City,
    Loans,
    Customers,
    CONCAT(ROUND(total_portfolio / 10000000.0, 2), ' Cr') AS `Portfolio Value`,
    CASE
        WHEN default_exposure > 10000000 
        THEN CONCAT(ROUND(default_exposure / 10000000.0, 2), ' Cr')
        ELSE CONCAT(ROUND(default_exposure / 100000.0, 2), ' L')
    END AS `Defaulted Value`,
    CONCAT(ROUND(default_rate, 2), '%') AS `Default Rates (%)`,
    ROUND((default_exposure / 10000000.0) * default_rate, 2) AS `Exposure Score`,
    RANK() OVER (
        ORDER BY (default_exposure / 10000000.0) * default_rate DESC
    ) AS `Exposure Rank`,
    CASE NTILE(4) OVER (ORDER BY default_exposure DESC)
        WHEN 1 THEN 'Critical'
        WHEN 2 THEN 'High'
        WHEN 3 THEN 'Moderate'
        ELSE 'Low'
    END AS `Risk Quartile`
FROM city_metrics
ORDER BY default_exposure DESC
LIMIT 15;