-- https://platform.stratascratch.com/coding/2024-unique-users-per-client-per-month?code_type=1

SELECT client_id, EXTRACT(MONTH FROM time_id) AS month, COUNT(DISTINCT(user_id)) AS user_num
FROM fact_events
GROUP BY client_id, month