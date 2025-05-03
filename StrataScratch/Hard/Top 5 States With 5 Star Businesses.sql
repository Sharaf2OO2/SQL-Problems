-- https://platform.stratascratch.com/coding/10046-top-5-states-with-5-star-businesses?code_type=1

WITH TEMP AS (
    SELECT state, COUNT(1) AS n_businesses, DENSE_RANK() OVER(ORDER BY COUNT(1) DESC) rnk
    FROM yelp_business
    WHERE stars = 5
    GROUP BY state
)
SELECT state, n_businesses
FROM TEMP
WHERE rnk <= 5