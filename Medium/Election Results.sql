-- https://platform.stratascratch.com/coding/2099-election-results?code_type=1

WITH CTE AS(
    SELECT voter, COUNT(candidate)
    FROM voting_results
    GROUP BY voter
    HAVING COUNT(candidate) <> 0
)

SELECT candidate FROM (
    SELECT candidate, ROUND(SUM(1.0/count), 3) AS votes
    FROM voting_results
    JOIN CTE
    USING(voter)
    GROUP BY candidate
    ORDER BY votes DESC
)
LIMIT 1