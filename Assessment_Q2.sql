-- 2. Average Transactions per Customer per Month and Categorization

WITH transaction_summary AS (
    SELECT 
        s.user_id,
        COUNT(*) AS total_txns,
        DATE_TRUNC('month', MIN(s.created_at)) AS first_month,
        DATE_TRUNC('month', MAX(s.created_at)) AS last_month
    FROM savings_savingsaccount s
    GROUP BY s.user_id
), 
monthly_avg AS (
    SELECT 
        ts.user_id,
        ts.total_txns,
        GREATEST(DATE_PART('month', AGE(ts.last_month, ts.first_month)) + 1, 1) AS active_months,
        (ts.total_txns::decimal / GREATEST(DATE_PART('month', AGE(ts.last_month, ts.first_month)) + 1, 1)) AS avg_txn_per_month
    FROM transaction_summary ts
),
categorized AS (
    SELECT *,
        CASE 
            WHEN avg_txn_per_month < 1 THEN 'Low'
            WHEN avg_txn_per_month BETWEEN 1 AND 5 THEN 'Moderate'
            WHEN avg_txn_per_month > 5 THEN 'High'
        END AS frequency_category
    FROM monthly_avg
)
SELECT frequency_category, COUNT(*) AS customer_count
FROM categorized
GROUP BY frequency_category;