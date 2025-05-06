-- https://leetcode.com/problems/rank-scores/?envType=problem-list-v2&envId=m8baczxh

SELECT score, DENSE_RANK() OVER(ORDER BY score DESC) rank
FROM Scores