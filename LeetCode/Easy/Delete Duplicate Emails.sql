-- https://leetcode.com/problems/delete-duplicate-emails/description/?envType=problem-list-v2&envId=m8baczxh

DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
)