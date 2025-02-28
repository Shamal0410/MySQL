create database OC;
use OC;

create table Customers (
customer_id int primary key,
customer_name varchar(100));

insert into Customers values
(1,'John'),
(2,'Riya'),
(3,'Rama'),
(4,'Shiv');

drop table customers;
select *from Customers;


create table Order (
order_id int primary key,
customer_id int,
foreign key (customer_id) references customers(customer_id));

insert into order values

create table Authors (
author_id int primary key,
author_name varchar(100));

insert

create table Books (
book_id int primary key,
title varchar(100),
author_id int,
foreign key(author_id) references Authors(author_id));





