WITH institution_summary AS (
    SELECT 
        i.institution_id,
        i.institution_name,
        i.institution_type,
        COUNT(*) AS loan_count,
        COUNT(DISTINCT l.customer_id) AS customers,
        SUM(CASE WHEN l.loan_status = 'Defaulted' THEN 1 ELSE 0 END) AS default_count,
        ROUND(SUM(CASE WHEN l.loan_status = 'Defaulted' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS default_rate,
        ROUND(SUM(CASE WHEN l.loan_status = 'Defaulted' THEN l.loan_amount * 1.0 ELSE 0 END) / 10000000.0, 2) AS default_amount
    FROM institutions i
    INNER JOIN loans l
        ON i.institution_id = l.institution_id
    GROUP BY i.institution_id, i.institution_name, i.institution_type
    HAVING COUNT(l.loan_id) >= 50
),
multiplier_data AS (
    SELECT 
        *,
        CASE
            WHEN loan_count >= 200 THEN 1.5
            WHEN loan_count >= 50 THEN 1.0
            ELSE 0.5
        END AS volume_multiplier
    FROM institution_summary
)
SELECT
    institution_id AS `Institution ID`,
    institution_name AS `Institution Name`,
    institution_type AS `Institution Type`,
    loan_count AS `Loans`,
    customers AS `Customers`,
    CONCAT(default_amount, ' Cr') AS `Default Amount`,
    CONCAT(default_rate, '%') AS `Default Rate (%)`,
    ROUND((1 - default_rate / 100) * volume_multiplier * 100, 2) AS `Health Score`,
    CASE 
        WHEN default_rate > 15 THEN 'Blacklist'
        WHEN default_rate > 8 THEN 'Monitor'
        ELSE 'Expand'
    END AS `Partner Flag`
FROM multiplier_data
ORDER BY default_rate DESC;