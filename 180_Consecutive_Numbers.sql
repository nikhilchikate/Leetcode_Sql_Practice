-- Table: Logs
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column starting from 1.
-- Find all numbers that appear at least three times consecutively.
-- Return the result table in any order.
-- The result format is in the following example.
-- Example 1:
-- Input: 
-- Logs table:
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+
-- Output: 
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+
-- Explanation: 1 is the only number that appears consecutively for at least three times.
--
--Solution
SELECT distinct
    n1.num as ConsecutiveNums
FROM
    logs n1,
    logs n2,
    logs n3
WHERE
    n1.id = n2.id + 1
    AND n2.id = n3.id + 1
    AND n1.num = n2.num
    AND n2.num = n3.num