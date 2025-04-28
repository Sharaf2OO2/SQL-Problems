-- https://platform.stratascratch.com/coding/2097-premium-acounts?code_type=1

WITH CTE1 AS (
    SELECT account_id, entry_date
    FROM premium_accounts_by_day
    WHERE final_price <> 0 AND entry_date IN (
        SELECT DISTINCT entry_date FROM premium_accounts_by_day ORDER BY entry_date LIMIT 7
        )
),
CTE2 AS (
    SELECT account_id, entry_date
    FROM premium_accounts_by_day
    WHERE final_price <> 0 AND entry_date IN (
        SELECT DISTINCT entry_date FROM premium_accounts_by_day ORDER BY entry_date OFFSET 7
        )
)
SELECT c1.entry_date, COUNT(c1.entry_date) AS premium_paid_accounts, COUNT(c2.entry_date) AS premium_paid_accounts_after_7d
FROM CTE1 c1
LEFT JOIN CTE2 c2
ON c1.account_id = c2.account_id AND c1.entry_date + 7 = c2.entry_date
GROUP BY c1.entry_date