-- https://platform.stratascratch.com/coding/2053-retention-rate?code_type=1

WITH max_date AS (
    SELECT user_id, account_id, MAX(record_date) max_date
    FROM sf_events
    GROUP BY user_id, account_id
),
dec AS (
    SELECT DISTINCT user_id
    FROM sf_events
    WHERE TO_CHAR(record_date, 'YYYY-MM') = '2020-12'
),
jan AS (
    SELECT DISTINCT user_id
    FROM sf_events
    WHERE TO_CHAR(record_date, 'YYYY-MM') = '2021-01'
),
r_dec AS (
    SELECT account_id, AVG(CASE WHEN max_date >= '2021-01-01' THEN 1 ELSE 0 END) AS dec
    FROM dec
    JOIN max_date USING(user_id)
    GROUP BY account_id
),
r_jan AS (
    SELECT account_id, AVG(CASE WHEN max_date >= '2021-02-01' THEN 1 ELSE 0 END) AS jan
    FROM jan
    JOIN max_date USING(user_id)
    GROUP BY account_id
)
SELECT account_id, CASE WHEN dec = 0 THEN 0 ELSE jan/dec END AS retention
FROM r_jan
JOIN r_dec USING(account_id)