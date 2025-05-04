-- https://leetcode.com/problems/employees-earning-more-than-their-managers/description/?envType=problem-list-v2&envId=m8baczxh

SELECT e.name Employee
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE e.salary > m.salary