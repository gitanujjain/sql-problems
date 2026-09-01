-- 183. Customers Who Never Order
-- Table: Customers
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID and name of a customer.
-- Table: Orders

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | customerId  | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- customerId is a foreign key (reference columns) of the ID from the Customers table.
-- Each row of this table indicates the ID of an order and the ID of the customer who ordered it.

-- create table If Not Exists Customers_183 (id int, name varchar(255));
-- create table If Not Exists Orders_183 (id int, customerId int);
-- Truncate table Customers_183;
-- insert into Customers_183 (id, name) values ('1', 'Joe');
-- insert into Customers_183 (id, name) values ('2', 'Henry');
-- insert into Customers_183 (id, name) values ('3', 'Sam');
-- insert into Customers_183 (id, name) values ('4', 'Max');
-- Truncate table Orders_183;
-- insert into Orders_183 (id, customerId) values ('1', '3');
-- insert into Orders_183 (id, customerId) values ('2', '1');

select name
from Customers_183
where id not in (select customerId from Orders_183) 

