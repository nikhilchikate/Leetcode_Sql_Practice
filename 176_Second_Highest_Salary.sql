-- Table: Employee
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains information about the salary of an employee.
-- Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).
-- The result format is in the following example.
-- Example 1:
-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+
-- Example 2:
-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | null                |
-- +---------------------+
--
--Solution
WITH
    q AS (
        SELECT
            salary,
            DENSE_RANK() OVER (
                ORDER BY
                    salary DESC
            ) AS rk
        FROM
            Employee
    )
SELECT
    (
        SELECT DISTINCT
            salary
        FROM
            q
        WHERE
            rk = 2
    ) AS SecondHighestSalary;