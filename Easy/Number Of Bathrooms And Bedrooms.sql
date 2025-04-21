-- https://platform.stratascratch.com/coding/9622-number-of-bathrooms-and-bedrooms?code_type=1

SELECT city, property_type, AVG(bathrooms) AS n_bathrooms_avg, AVG(bedrooms) AS n_bedrooms_avg
FROM airbnb_search_details
GROUP BY 1, 2