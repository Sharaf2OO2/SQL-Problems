-- https://leetcode.com/problems/nth-highest-salary/description/?envType=problem-list-v2&envId=m8baczxh

CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
    IF N < 1 THEN
        N := (SELECT COUNT(*) FROM Employee) + 1;
    END IF;
    RETURN QUERY (
    SELECT DISTINCT e.salary
    FROM Employee e
    ORDER BY e.salary DESC
    OFFSET N-1
    LIMIT 1
  );
END;
$$ LANGUAGE plpgsql;