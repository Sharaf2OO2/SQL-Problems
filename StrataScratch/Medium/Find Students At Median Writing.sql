-- https://platform.stratascratch.com/coding/9610-find-students-with-a-median-writing-score?code_type=1

WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER(ORDER BY sat_writing) rn
    FROM sat_scores
)
SELECT student_id
FROM sat_scores
WHERE sat_writing = (
    SELECT sat_writing
    FROM CTE
    WHERE rn = (
        SELECT CEIL(COUNT(*)/2.0) FROM sat_scores)
    )