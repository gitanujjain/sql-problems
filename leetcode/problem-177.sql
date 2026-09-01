-- 177. Nth Highest Salary
-- Table: Employee
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains information about the salary of an employee. 
-- Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

Create table If Not Exists Employee_177 (Id int, Salary int);
Truncate table Employee_177;
insert into Employee_177 (id, salary) values ('1', '100');
insert into Employee_177 (id, salary) values ('2', '200');
insert into Employee_177 (id, salary) values ('3', '300');
insert into Employee_177 (id, salary) values ('4', '100');
insert into Employee_177 (id, salary) values ('4', '200');

CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    select distinct emp.salary 
    from (select Employee_177.salary, DENSE_RANK() over( order by Employee_177.salary Desc) as rank from Employee_177) as emp
    where emp.rank = N
    
      
  );
END;
$$ LANGUAGE plpgsql;


SELECT * FROM NthHighestSalary(10);