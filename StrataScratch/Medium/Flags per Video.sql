-- https://platform.stratascratch.com/coding/2102-flags-per-video?code_type=1

SELECT video_id, COUNT(DISTINCT CONCAT(user_firstname,user_lastname)) AS num_unique_users
FROM user_flags
WHERE flag_id IS NOT NULL
GROUP BY video_id