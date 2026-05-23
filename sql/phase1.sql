SELECT 
    COUNT(*) AS `Total Loans`,
    COUNT(CASE WHEN loan_status = 'Active' THEN 1 END) AS `Active Loans`,
    CONCAT(ROUND(COUNT(CASE WHEN loan_status = 'Active' THEN 1 END) * 100.0 / COUNT(*), 1), '%') AS `Active Loan %`,
    CONCAT(ROUND(SUM(CASE WHEN loan_status = 'Active' THEN loan_amount END) / 10000000.0, 2), ' Cr') AS `Active Portfolio Value`,
    COUNT(CASE WHEN loan_status = 'Closed' THEN 1 END) AS `Closed Loans`,
    CONCAT(ROUND(COUNT(CASE WHEN loan_status = 'Closed' THEN 1 END) * 100.0 / COUNT(*), 1), '%') AS `Closed Loan %`,
    CONCAT(ROUND(SUM(CASE WHEN loan_status = 'Closed' THEN loan_amount END) / 10000000.0, 2), ' Cr') AS `Closed Portfolio Value`,
    COUNT(CASE WHEN loan_status = 'Defaulted' THEN 1 END) AS `Defaulted Loans`,
    CONCAT(ROUND(COUNT(CASE WHEN loan_status = 'Defaulted' THEN 1 END) * 100.0 / COUNT(*), 1), '%') AS `Defaulted Loan %`,
    CONCAT(ROUND(SUM(CASE WHEN loan_status = 'Defaulted' THEN loan_amount END) / 10000000.0, 2), ' Cr') AS `Defaulted Portfolio Value`,
    COUNT(CASE WHEN loan_status = 'Overdue' THEN 1 END) AS `Overdue Loans`,
    CONCAT(ROUND(COUNT(CASE WHEN loan_status = 'Overdue' THEN 1 END) * 100.0 / COUNT(*), 1), '%') AS `Overdue Loan %`,
    CONCAT(ROUND(SUM(CASE WHEN loan_status = 'Overdue' THEN loan_amount END) / 10000000.0, 2), ' Cr') AS `Overdue Portfolio Value`,
    COUNT(DISTINCT customer_id) AS `Total Customers`,
    CONCAT(ROUND(SUM(loan_amount) / 10000000.0, 2), ' Cr') AS `Total Portfolio Value`,
    CONCAT(ROUND(AVG(loan_amount) / 100000.0, 2), ' L') AS `Average Loan Amount`,
    CONCAT(
        ROUND(
            COUNT(CASE WHEN loan_status IN ('Defaulted', 'Overdue') THEN 1 END) * 100.0 / COUNT(*),
            2
        ),
        '%'
    ) AS `Portfolio at Risk %`,
    CONCAT(
        ROUND(
            SUM(CASE WHEN loan_status IN ('Defaulted', 'Overdue') THEN loan_amount END) / 10000000.0,
            2
        ),
        ' Cr'
    ) AS `Total at Risk Value`,
    CASE 
        WHEN ROUND(COUNT(CASE WHEN loan_status = 'Defaulted' THEN 1 END) * 100.0 / COUNT(*), 2) <= 5.00 THEN 'HEALTHY'
        WHEN ROUND(COUNT(CASE WHEN loan_status = 'Defaulted' THEN 1 END) * 100.0 / COUNT(*), 2) <= 10.00 THEN 'MODERATE RISK'
        WHEN ROUND(COUNT(CASE WHEN loan_status = 'Defaulted' THEN 1 END) * 100.0 / COUNT(*), 2) <= 15.00 THEN 'HIGH RISK'
        ELSE 'CRITICAL'
    END AS `Portfolio Health Status`,
    CASE 
        WHEN ROUND(COUNT(CASE WHEN loan_status = 'Defaulted' THEN 1 END) * 100.0 / COUNT(*), 2) > 12.00
            THEN 'Crisis team + external recovery agencies'
        WHEN ROUND(COUNT(CASE WHEN loan_status = 'Defaulted' THEN 1 END) * 100.0 / COUNT(*), 2) > 10.00 
            THEN 'Enhanced collection + review underwriting'
        WHEN ROUND(COUNT(CASE WHEN loan_status = 'Defaulted' THEN 1 END) * 100.0 / COUNT(*), 2) > 5.00 
            THEN 'Enhanced monitoring required'
        ELSE 'Standard monitoring protocols'
    END AS `Recommend Board Action`
FROM loans;