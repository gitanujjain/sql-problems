-- 196. Delete Duplicate Emails
-- Table: Person
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | email       | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains an email. The emails will not contain uppercase letters.
 

-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

-- For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

Create table If Not Exists Person_196 (Id int, Email varchar(255));
Truncate table Person_196;
insert into Person_196 (id, email) values ('1', 'john@example.com');
insert into Person_196 (id, email) values ('2', 'bob@example.com');
insert into Person_196 (id, email) values ('3', 'john@example.com');

select id, email, dense_rank() over (partition by email order by id) as rank
from Person_196

with delete_cte as (ssss 	
	select id, 
			email, 
			dense_rank() over (partition by email order by id) as ran
	from Person_196)
delete FROM Person_196 where id in (select id from delete_cte  WHERE ran >1)