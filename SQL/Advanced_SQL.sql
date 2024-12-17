show databases;
create database netflix;
use netflix;
create table users(
user_id INT PRIMARY KEY,
name VARCHAR(100),
age INT,
location VARCHAR(50)
);

CREATE TABLE Subscription(
subscription_id int primary key,
user_id int,
plan_name varchar(100),
start_date date,
end_date date,
price decimal(10,2),
foreign key(user_id) REFERENCES users(user_id)
);

CREATE TABLE Shows(
show_id INT primary key,
title varchar(100),
genre varchar(50),
rating decimal(3,2)
);

create table WatchHistory(
watch_id int primary key,
user_id int,
show_id int,
watch_date date,
foreign key(user_id) REFERENCES users(user_id),
foreign key(show_id) REFERENCES Shows(show_id)
);

-- changed the table name from users to Users. 
alter table users rename to Users;
show tables;

insert into users (user_id, name, age, location) values
(1, "Ram", 75, "Pakistan"),
(2, "Sara", 72, "India"),
(3, "Ashish", 85, "Nepal"),
(4, "Saranya", 26, "Afghanistan"),
(5, "Gagan", 43, "Bangladesh");
select * from Users;

insert into Subscription (subscription_id, user_id, plan_name, start_date, end_date, price) values
(101, 1, 'Basics', '2024-01-01', '2024-12-12', 1000),
(102, 2, 'Premium', '2024-05-01', '2025-05-01', 1000),
(103, 3, 'Basics', '2024-12-12', '2025-12-12', 1000),
(104, 4, 'Basics', '2024-01-01', '2025-01-01', 1000),
(105, 5, 'Premium', '2024-08-15', '2025-08-15', 1000);
select * from Subscription;

insert into Shows(show_id, title, genre, rating) values
(201, 'Jab We Met', 'Comedy', 8.0),
(202, 'RRR', 'Action', 9.0),
(203, 'Wanted', 'Action Comedy', 8.0),
(204, 'Inceptions', 'Suspense', 9.0),
(205, 'Pushpa', 'Comedy', 9.5);
select * from Shows;

insert into WatchHistory (watch_id, user_id, show_id, watch_date) values
(301, 1, 201, '2024-12-17'),
(302, 2, 202, '2024-11-20'),
(303, 3, 203, '2024-10-21'),
(304, 4, 204, '2024-07-29'),
(305, 5, 205, '2024-03-13');
select * from WatchHistory;

