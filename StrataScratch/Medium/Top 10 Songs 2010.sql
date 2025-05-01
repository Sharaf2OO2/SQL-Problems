-- https://platform.stratascratch.com/coding/9650-find-the-top-10-ranked-songs-in-2010?code_type=1

WITH CTE AS (
    SELECT year_rank, group_name, song_name
    FROM billboard_top_100_year_end
    WHERE year = 2010
)
SELECT DISTINCT *
FROM CTE
ORDER BY year_rank
LIMIT 10