-- https://platform.stratascratch.com/coding/514-marketing-campaign-success-advanced?code_type=1

WITH CTE AS (
    SELECT user_id, MIN(created_at) AS first_day
    FROM marketing_campaign
    GROUP BY user_id
)
SELECT COUNT(DISTINCT user_id) AS user_count
FROM marketing_campaign
WHERE (user_id, product_id) NOT IN (
    SELECT m.user_id, m.product_id
    FROM marketing_campaign m
    JOIN CTE c ON m.user_id = c.user_id AND m.created_at = c.first_day
)