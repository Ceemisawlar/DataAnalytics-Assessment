-- 1. High-Value Customers with Funded Savings and Investment Accounts

SELECT 
    u.id AS customer_id,
    u.name,
    SUM(COALESCE(s.balance, 0)) + SUM(COALESCE(p.balance, 0)) AS total_deposits
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.user_id AND s.balance > 0
JOIN plans_plan p ON u.id = p.user_id AND p.balance > 0
GROUP BY u.id, u.name;