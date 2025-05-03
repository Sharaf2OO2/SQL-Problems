-- https://leetcode.com/problems/tree-node/description/?envType=problem-list-v2&envId=m8baczxh

SELECT id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id NOT IN (SELECT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END type
FROM Tree