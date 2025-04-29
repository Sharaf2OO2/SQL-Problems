-- https://leetcode.com/problems/department-top-three-salaries/description/?envType=problem-list-v2&envId=m8baczxh

WITH CTE AS (
    SELECT d.name Department, e.name Employee, e.salary Salary, DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) rank
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
)
SELECT Department, Employee, Salary
FROM CTE 
WHERE rank <= 3