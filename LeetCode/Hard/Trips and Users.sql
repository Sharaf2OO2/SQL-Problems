-- https://leetcode.com/problems/trips-and-users/description/?envType=problem-list-v2&envId=m8baczxh

WITH unnbaned_users AS (
    SELECT *
    FROM Users
    WHERE banned = 'No'
)
SELECT request_at "Day", ROUND(AVG(
    CASE
        WHEN status LIKE 'cancelled%' THEN 1
        ELSE 0
    END
), 2) "Cancellation Rate"
FROM Trips t
JOIN unnbaned_users c ON t.client_id = c.users_id
JOIN unnbaned_users d ON t.driver_id = d.users_id
WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at