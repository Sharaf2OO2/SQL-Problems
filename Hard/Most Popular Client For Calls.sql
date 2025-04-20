-- https://platform.stratascratch.com/coding/2029-the-most-popular-client_id-among-users-using-video-and-voice-calls?code_type=1

WITH CTE AS (
    SELECT user_id, AVG(CASE WHEN event_type IN ('video call received', 'video call sent', 'voice call received', 'voice call sent') THEN 1 ELSE 0 END) * 100 AS avg
    FROM fact_events
    GROUP BY user_id
)
SELECT client_id
FROM (
    SELECT client_id, COUNT(DISTINCT user_id) cnt
    FROM fact_events
    JOIN CTE USING(user_id)
    WHERE avg >= 50
    GROUP BY client_id
    ORDER BY cnt DESC
    LIMIT 1
)