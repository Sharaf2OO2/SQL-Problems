-- https://leetcode.com/problems/consecutive-numbers/description/?envType=problem-list-v2&envId=m8baczxh

WITH CTE AS (
    SELECT num, LAG(num) OVER(), LEAD(num) OVER()
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM CTE
WHERE num = lag AND num = lead