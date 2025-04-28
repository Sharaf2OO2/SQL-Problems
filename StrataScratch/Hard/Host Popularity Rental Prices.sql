-- https://platform.stratascratch.com/coding/9632-host-popularity-rental-prices?code_type=1

WITH host AS (
    SELECT DISTINCT CONCAT(price, room_type, host_since, zipcode, number_of_reviews) AS host_id, price, number_of_reviews
    FROM airbnb_host_searches
),
rev AS (
    SELECT host_id, SUM(number_of_reviews) AS total_reviews
    FROM host
    GROUP BY host_id
),
pop AS (
    SELECT *,  
    CASE
        WHEN total_reviews = 0 THEN 'New'
        WHEN total_reviews BETWEEN 1 AND 5 THEN 'Rising'
        WHEN total_reviews BETWEEN 6 AND 15 THEN 'Trending Up'
        WHEN total_reviews BETWEEN 16 AND 40 THEN 'Popular'
        ELSE 'Hot'
    END AS host_popularity
    FROM rev
)
SELECT host_popularity, MIN(price) AS min_price, AVG(price) AS avg_price, MAX(price) AS max_price
FROM host
JOIN pop USING(host_id)
GROUP BY host_popularity
ORDER BY min_price