-- https://platform.stratascratch.com/coding/9633-city-with-most-amenities?code_type=1

SELECT city
FROM airbnb_search_details
GROUP BY city
ORDER BY SUM(LENGTH(amenities)) DESC
LIMIT 1