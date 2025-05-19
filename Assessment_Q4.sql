-- 4. Customer Lifetime Value (CLV) Calculation

WITH txn_summary AS (
    SELECT 
        u.id AS customer_id,
        u.name,
        u.date_joined,
        COUNT(s.id) AS total_txns,
        AVG(s.amount * 0.001) AS avg_profit_per_txn,
        DATE_PART('month', AGE(NOW(), u.date_joined)) AS tenure_months
    FROM users_customuser u
    JOIN savings_savingsaccount s ON u.id = s.user_id
    GROUP BY u.id, u.name, u.date_joined
)
SELECT 
    customer_id,
    name,
    total_txns,
    tenure_months,
    ROUND((total_txns::decimal / GREATEST(tenure_months, 1)) * 12 * avg_profit_per_txn, 2) AS CLV
FROM txn_summary;