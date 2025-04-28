-- https://platform.stratascratch.com/coding/9663-find-the-most-profitable-company-in-the-financial-sector-of-the-entire-world-along-with-its-continent?code_type=1

WITH CTE AS (
    SELECT company, continent, MAX(profits) AS max_profit
    FROM forbes_global_2010_2014
    WHERE sector = 'Financials'
    GROUP BY company, continent
    ORDER BY max_profit DESC
    LIMIT 1
    )
SELECT company, continent
FROM CTE