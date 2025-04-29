-- https://leetcode.com/problems/combine-two-tables/description/?envType=problem-list-v2&envId=m8baczxh

SELECT firstName, lastName, city, state
FROM Person
LEFT JOIN Address USING(personId)