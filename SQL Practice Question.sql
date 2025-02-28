create database sample_db;
use sample_db;

create table users(
ID int auto_increment primary key,
name varchar(100),
email_id varchar(100) unique not null);

insert into users (name,email_id) values 
('John Doe','john@example.com'),
('Jane Smith','jane@example.com');

select * from users;
drop table users;

create table product(
ID int auto_increment primary key,
name varchar(255) not null,
price decimal (10,2) not null,
stock int default 0,
created_at timestamp default current_timestamp);


insert into product (name,price,stock) values
('Laptop',688.88,10),
('Smartphone',976.00,10);

select * from product;

create table orders (
id int auto_increment primary key,
user_id int,
product_id int,
quantity int default 1,
order_date timestamp default current_timestamp,
foreign key (user_id) references users(ID),
foreign key (product_id) references product(ID));

insert into orders (user_id, product_id, quantity) values
(1,2,1),
(2,1,2);

select * from orders;
drop table orders;

create table employee1 (
id int auto_increment primary key,
name varchar(100) not null,
role enum ('Manager', 'Developer', 'Designer') not null,
salary decimal (10,2) not null,
hire_date date not null);

insert into employee1 (name,role,salary,hire_date) values
('Alice Brown','Manager',75000.00,'2022-01-15'),
('Bob Green','Developer',65000.00,'2023-05-22');

select * from employee1;

create table customers1 (
id int auto_increment primary key,
name varchar(100) not null,
age int check (age >= 18),
email varchar(100) unique not null,
balance decimal(10,2) default 0.00);

insert into customers1 (name, age, email, balance) values
('Mike Johnson',30,'Mike@example.com',120.50),
('Emma White',25,'emma@example.com',200.75);

select * from customers1;

create table dept (
dept_no int primary key,
dept_name varchar(50) not null,
loc varchar(50) not null);

insert into dept values 
(10,'Accounting','New york'),
(20,'Research','Dallas'),
(30,'Sales','Chicago'),
(40,'Operations','Boston');

select * from dept;

create table emp1 (
emp_no int primary key,
emp_name varchar(50) not null,
job varchar(50) not null,
mgr int,
hiredate date not null,
sal decimal (10,2) not null,
comm decimal (10,2),
dept_no int,
foreign key (dept_no ) references dept(dept_no));

drop table emp1;

insert into emp1 (emp_no, emp_name, job, mgr, hiredate, sal, comm, dept_no ) values
(7369, 'Smith', 'Cleck', 7902, '1980-12-17', 800.00, NULL, 20),
(7499, 'Allen', 'Salesman', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'Ward', 'Salesman', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'Jones', 'Manager', 7839, '1981-04-02', 2975.00, NULL, 20),
(7698, 'Blake', 'Manager', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'Clark', 'Manager', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'Scott', 'Analyst', 7566, '1987-07-13', 3000.00, NULL, 20),
(7839, 'King', 'President', 7589, '1981-11-17', 5000.00, NULL, 10),
(7902, 'Ford', 'Analyst', 7566, '1981-12-05', 3000.00, NULL, 20),
(7934, 'Miller', 'Clerk', 7782, '1982-01-21', 1300.00, NULL, 10);

select * from emp1;

select max(sal) as highest_salary from emp1;

select max(sal) as second_highest_salary from emp1;

select * from emp1 where dept_no=30;

select * from emp1 order by emp_name;

select * from emp1 where emp_name like '____';

select * from emp1;
select emp_no,emp_name,job from emp1;
select emp_no as 'Employee_ID',emp_name,job from emp1;
select * from emp1 where job='Salesman';
select * from emp1 where job='Salesman' or job='Clerk';
select * from emp1 where job in ('Salesman','Clerk');
select distinct dept_no from emp1;
select dept_no from emp1;
select * from emp1 where sal>=3000;
select * from emp1 where emp_name like '_a%';

select count(*) from emp1 group by dept_no;

-- Count employee from all dept-- 
select count(*) ,dept_no from emp1 group by dept_no;

select sum(sal) ,dept_no from emp1 group by dept_no;

select avg(sal) ,dept_no from emp1 group by dept_no;
select max(sal)from emp1;
select min(sal)from emp1;

select * from emp1,dept;

select e.emp_name,e.sal,d.dept_no from emp1 e,dept d;
select e.emp_name, e.sal,d.dept_no from emp1 e,dept d where e.dept_no=d.dept_no;
select e.emp_name, e.sal,d.dept_no ,d.dept_name from emp1 e,dept d where e.dept_no=d.dept_no;

select e.emp_name, e.sal, d.dept_no, d.dept_name from emp1 e inner join dept d on  e.dept_no=d.dept_no;

select * from emp1 where sal=5000;

select * from emp1 where sal=(select max(sal) from emp1);

-- Maximum employee work in feild--
select count(*) ,dept_no from emp1 group by dept_no;

-- Show details of employee who works in the same dept as Adams works--
select dept_no from emp1 where emp_name='King';

select * from emp1 where dept_no =(select dept_no from emp1 where emp_name='King');

--
select sal from emp1 where emp_name='Ford';

select * from emp1 where sal>= ( select sal where emp_name='Ford');

-- Show all emplyees having sal< average sal of that dept--
select avg(sal) from emp1;

select * from emp1 where sal <(select avg(sal) from emp1);

-- Show all employeea details who works in Smith or Ward dept--
select dept_no from emp1 where emp_name='Smith' or emp_name='Ward';

select * from emp1 where dept_no in (select dept_no from emp1 where emp_name='Smith' or emp_name='Ward');

select min(sal)from emp1 group by dept_no;
select * from emp1 where sal in (select min(sal)from emp1 group by dept_no);

select left(emp_name,3) from emp1;
select hiredate from emp1;
select year(hiredate) from emp1;
select year(hiredate), month(hiredate) from emp1;
select * from emp1 where year(hiredate)=1981 and month(hiredate)=2;

select concat(emp_name,job) from emp1;
select concat(emp_name, ' ',job) from emp1;

select bin(10);

-- To show length of employee name-- 
select length(emp_name) from emp1;
select length(emp_name), emp_name from emp1;

-- Create a view--
Create view Myview as
Select e.emp_no,e.emp_name,d.dept_no,d.dept_name from emp1 e ,dept d where e.dept_no=d.dept_no;

select * from emp1 where dept_no=(select dept_no from dept where dept_name='Sales') and sal>=2000;

-- create a view--
Create view salesemps1 as 
select e.emp_name,e.emp_no,d.dept_no,d.dept_name from emp1 e ,dept d where e.dept_no=d.dept_no and sal >1000; 

select * from salesemps1;

-- create a stored procedure--
call myproc1;

-- create a view--
Create view salesemps4 as 
select e.emp_name,e.emp_no,d.dept_no,d.dept_name from emp1 e ,dept d
 where e.dept_no=(select dept_no from dept where dept_name='Sales') and sal>1000;
 
 select * from salesemps4;
 
 --- Create User, Grant, Privileges, Revoke--
 
 Create user 'john'@'localhost' identified by 'john1234';

Show grants for 'john'@'localhost';

Grant all privileges on * .* to 'john'@'localhost';

-- Grant Select, Insert, Update on table sample to student;--

-- Grant select,insert,update on *.* to 'test user'@'localhost';--

Revoke insert on *.* from 'john'@'localhost';

Revoke update, insert on mystudentdb.* from Shamal@localhost;