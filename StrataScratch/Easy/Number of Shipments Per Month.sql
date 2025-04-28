-- https://platform.stratascratch.com/coding/2056-number-of-shipments-per-month?code_type=1

SELECT TO_CHAR(shipment_date, 'YYYY-MM') AS year_month, COUNT(DISTINCT(shipment_id, sub_id)) AS count
FROM amazon_shipment
GROUP BY year_month