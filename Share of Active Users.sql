-- https://platform.stratascratch.com/coding/2005-share-of-active-users?code_type=1

SELECT COUNT(1)::FLOAT / (SELECT COUNT(*) FROM fb_active_users)::FLOAT * 100.0 AS us_active_share
FROM fb_active_users
WHERE country = 'USA' AND status = 'open'