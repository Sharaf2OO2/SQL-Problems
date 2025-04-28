-- https://platform.stratascratch.com/coding/2089-cookbook-recipes?code_type=1

WITH L AS (
    SELECT *
    FROM cookbook_titles
    WHERE page_number % 2 = 0
),
R AS (
    SELECT *
    FROM cookbook_titles
    WHERE page_number % 2 <> 0
),
LEFT_P_NUM AS (
    SELECT DISTINCT CASE WHEN page_number % 2 = 0 THEN page_number ELSE page_number - 1 END AS left_page_number
    FROM (
        SELECT GENERATE_SERIES (0, (SELECT MAX(page_number) FROM cookbook_titles)) AS page_number
    )
)
SELECT left_page_number, L.title AS left_title, R.title AS right_title
FROM LEFT_P_NUM lp
LEFT JOIN L ON lp.left_page_number = L.page_number
LEFT JOIN R ON lp.left_page_number = R.page_number - 1
ORDER BY left_page_number