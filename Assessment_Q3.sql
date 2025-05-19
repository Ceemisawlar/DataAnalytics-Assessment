-- 3. Active Accounts with No Inflow Transactions in the Last 12 Months

SELECT 
    p.id AS plan_id,
    p.owner_id,
    p.type
FROM plans_plan p
WHERE NOT EXISTS (
    SELECT 1
    FROM savings_savingsaccount t
    WHERE t.plan_id = p.id
      AND t.transaction_type = 'inflow'
      AND t.created_at >= NOW() - INTERVAL '12 months'
);