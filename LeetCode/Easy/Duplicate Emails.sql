-- https://leetcode.com/problems/duplicate-emails/description/?envType=problem-list-v2&envId=m8baczxh

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1