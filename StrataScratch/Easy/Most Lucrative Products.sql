-- https://platform.stratascratch.com/coding/2119-most-lucrative-products?code_type=1

SELECT product_id, SUM((cost_in_dollars * units_sold)) AS revenue
FROM online_orders
WHERE date_sold BETWEEN '2022-01-01' AND '2022-06-30'
GROUP BY 1
ORDER BY revenue DESC
LIMIT 5