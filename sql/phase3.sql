WITH customer_defaults AS (
    SELECT
        c.customer_id,
        c.full_name,
        c.phone_number,
        c.email_address,
        c.cibil_score,
        COUNT(l.loan_id) AS total_loans,
        SUM(CASE WHEN l.loan_status = 'Defaulted' THEN 1 ELSE 0 END) AS default_count,
        ROUND(SUM(CASE WHEN l.loan_status = 'Defaulted' THEN CAST(l.loan_amount AS DECIMAL) ELSE 0 END) / 100000.0, 2) AS default_amount,
        ROUND(SUM(CASE WHEN l.loan_status = 'Defaulted' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS default_rate,
        CASE 
            WHEN c.cibil_score >= 750 THEN 0.5
            WHEN c.cibil_score >= 700 THEN 0.6
            WHEN c.cibil_score >= 650 THEN 0.7
            WHEN c.cibil_score >= 550 THEN 0.85
            ELSE 1.0
        END AS cibil_risk_multiplier
    FROM customers c
    INNER JOIN loans l
        ON c.customer_id = l.customer_id
    GROUP BY
        c.customer_id,
        c.full_name,
        c.phone_number,
        c.email_address,
        c.cibil_score
),
scored AS (
    SELECT
        *,
        ROUND(
            (default_amount * default_rate / 100.0) +
            (default_count * 2.5) +
            (cibil_risk_multiplier * 5),
            2
        ) AS priority_score
    FROM customer_defaults
),
segmented AS (
    SELECT
        *,
        CASE 
            WHEN priority_score >= 25 THEN 'Critical'
            WHEN priority_score >= 18 THEN 'High'
            WHEN priority_score >= 10 THEN 'Medium'
            ELSE 'Low'
        END AS risk_segment,
        CASE 
            WHEN priority_score >= 25 THEN 'Escalate to Recovery Agency + Legal'
            WHEN priority_score >= 18 THEN 'Aggressive Collections Calls + Payment Plan'
            WHEN priority_score >= 10 THEN 'Standard Collections Calls'
            ELSE 'SMS + Email Reminder'
        END AS recommended_action
    FROM scored
)
SELECT
    customer_id AS `Customer ID`,
    full_name AS `Name`,
    phone_number AS `Contact`,
    email_address AS `Email`,
    CONCAT(default_amount, ' L') AS `Defaulted Amount`,
    default_count AS `Default Count`,
    CONCAT(default_rate, '%') AS `Default Rate (%)`,
    cibil_score AS `CIBIL Score`,
    priority_score AS `Priority Score`,
    risk_segment AS `Risk Segment`,
    recommended_action AS `Recommend Action`
FROM segmented
ORDER BY priority_score DESC
LIMIT 50;