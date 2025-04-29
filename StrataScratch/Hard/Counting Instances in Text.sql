-- https://platform.stratascratch.com/coding/9814-counting-instances-in-text?code_type=1

WITH TEMP AS (
    SELECT REGEXP_REPLACE(contents, '[[:punct:]]', ' ', 'g') AS contents
    FROM google_file_store
),
UNNEST AS (
    SELECT UNNEST(STRING_TO_ARRAY(contents, ' ')) AS words
    FROM TEMP
)
SELECT words, COUNT(*) AS nentry
FROM UNNEST
WHERE words IN ('bull', 'bear')
GROUP BY words