-- https://leetcode.com/problems/game-play-analysis-i/description/?envType=problem-list-v2&envId=m8baczxh

SELECT player_id, MIN(event_date) first_login
FROM Activity
GROUP BY player_id