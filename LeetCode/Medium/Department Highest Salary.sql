-- https://leetcode.com/problems/department-highest-salary/?envType=problem-list-v2&envId=m8baczxh

WITH TEMP AS (
    SELECT D.name Department, 
    E.name Employee, 
    salary, 
    DENSE_RANK() OVER(PARTITION BY D.name ORDER BY salary DESC) rank
    FROM Employee E
    JOIN Department D ON E.departmentId = D.id
)
SELECT Department, Employee, salary
FROM TEMP
WHERE rank = 1