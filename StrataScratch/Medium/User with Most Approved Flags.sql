-- https://platform.stratascratch.com/coding/2104-user-with-most-approved-flags?code_type=1

WITH CTE1 AS (SELECT CONCAT(user_firstname, ' ', user_lastname) AS username, COUNT(DISTINCT video_id) AS CNT
FROM user_flags
JOIN flag_review
USING(flag_id)
WHERE reviewed_outcome = 'APPROVED'
GROUP BY username),
CTE2 AS (SELECT *, DENSE_RANK() OVER(ORDER BY CNT DESC) AS rank
FROM CTE1
)
SELECT username
FROM CTE2
WHERE rank = 1