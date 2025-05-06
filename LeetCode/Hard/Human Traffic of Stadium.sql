-- https://leetcode.com/problems/human-traffic-of-stadium/?envType=problem-list-v2&envId=m8baczxh

WITH above100 AS (
    SELECT *, 
    ROW_NUMBER() OVER(ORDER BY id), 
    id - ROW_NUMBER() OVER(ORDER BY id)  grp
    FROM Stadium
    WHERE people >= 100
),
TEMP AS (
    SELECT grp, COUNT(grp)
    FROM above100
    GROUP BY grp
    HAVING COUNT(grp) >= 3
)
SELECT id, visit_date, people
FROM above100
JOIN TEMP USING(grp)
ORDER BY visit_date