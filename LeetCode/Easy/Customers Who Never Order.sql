-- https://leetcode.com/problems/customers-who-never-order/description/?envType=problem-list-v2&envId=m8baczxh

SELECT name Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL