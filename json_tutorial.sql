
--##########################
--# 13.11.2018 by baruch@wix.com
--# JSON on MySQL 8.1
--############



-- lets create table with users 
use test;
drop table users;
CREATE TABLE users (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userdata JSON NOT NULL
);

insert into users(userdata) values ('
{
  "first_name": "Jeanette",
  "last_name": "Penddreth",
  "email": "jpenddreth0@census.gov",
  "gender": "Female",
  "ip_address": "26.58.193.2"
}
'),
(
'
{
  "first_name": "Giavani",
  "last_name": "Frediani",
  "email": "gfrediani1@senate.gov",
  "gender": "Male",
  "ip_address": "229.179.4.212"
}
'),
('
{
  "first_name": "Noell",
  "last_name": "Bea",
  "email": "nbea2@imageshack.us",
  "gender": "Female",
  "ip_address": "180.66.162.255"
} '),
('
{
  "first_name": "Willard",
  "last_name": "Valek",
  "email": "wvalek3@vk.com",
  "gender": "Male",
  "ip_address": "67.76.188.26"
}'),
('
{
  "first_name": "Bob",
  "last_name": "yard",
  "email": "boby@google.com",
  "gender": "Male",
  "ip_address": "67.76.200.10"
}');


select * from users;

EXPLAIN FORMAT='json' select * from users WHERE userdata ->'$.gender' = 'Female';
-- lets create index on virtual column
-- alter table users drop COLUMN gender;
ALTER TABLE users ADD COLUMN gender varchar(10) AS (json_extract(userdata,_utf8mb4'$.gender')) ;
-- 
ALTER TABLE users ADD KEY (gender);

EXPLAIN FORMAT='json' select * from users WHERE gender = "Female";


show create table users\G