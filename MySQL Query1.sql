create database college;
use college;

create table student2(
roll_no int unique,
name varchar(20));

desc student2;


insert into student2 values (101,"Shamal Kumbhar");
insert into student2 values (102,'Kavita Patil');

insert into student2 values (101,'Mamata');

select * from student2;

create table student3(
roll_no int not null,
name varchar(20));

insert into student3 values (101,'Shamal');
insert into student3 (name) values ('Shiv');

drop table student3;

create table student3(
roll_no int primary key,
name varchar(20));

insert into student3 (name) values ('Shamal');

insert into student3 values (1,'Shamal');

insert into student3 values (101,'Shamal'),(102,'Shiv'),(103,'Rama');

select * from student3;

create table employee(
empID int primary key,
empname varchar(20),
city varchar(30) default 'Pune');

insert into employee (empID,empname) values (101,'Shamal');

select * from employee;

create table sample(
roll int ,
name varchar(20),
age int,
check (age >=18));

insert into sample values (1,'Shamal',23);

insert into sample values (2,'Riya',15);

insert into sample values (3,'Rama',10);

select * from sample;

---- ALTER TABLE ----
-- Add a new Column--

-- syntax : ALTER TABLE tablename ADD (columnname datatype);
ALTER TABLE student2 ADD(address varchar(30));
ALTER TABLE student2 ADD COLUMN(mobile varchar(10));

-- Delete any column--
-- ALTER TABLE tablename DROP COLUMN colname;
ALTER TABLE student2 DROP COLUMN address;

-- Rename the column--
-- ALTER TABLE tablename RENAME COLUMN oldcolname to newcolname;
ALTER TABLE student2 RENAME COLUMN mobile to phone;

-- Change the data type--
-- ALTER TABLE tablename MODIFY COLUMN colname newdatatype;
 ALTER TABLE student2 MODIFY COLUMN phone varchar(14);

-- DROP existing primary key--
-- ALTER TABLE tablename DROP PRIMARY KEY;
ALTER TABLE student2 DROP PRIMARY KEY;


-- ADD PRIMARY KEY--
-- ALTER TABLE tablename ADD PRIMARY KEY(colname);
ALTER TABLE student2 ADD PRIMARY KEY(roll);


create table category (
category_id int primary key,
category_name varchar(20));
 
 insert into category values
 (1,'Electronics'),
 (2,'Hosiery'),
 (3,'Home appliance'),
 (4,'Grocery');
 
 select * from category;

create table product (
product_id int primary key,
product_name varchar(20),
category_id int,
FOREIGN KEY(category_id) REFERENCES  category(category_id));

drop table product;

insert into product(product_id, product_name) values 
(1,'Tv'),
(2,'Mobile'),
(3,'Tshirt'),
(4,'Sugar'),
(5,'Soap'),
(6,'Laptop');

select * from product;



