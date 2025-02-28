create database student;
use student;

create table stud_info (
roll_no int primary key,
name varchar(20),
address varchar(30));

insert into stud_info values
(1,'Abhay','Nashik'),
(2,'Sarika','Pune'),
(3,'Riya','Nashik'),
(4,'Sachin','Manmad');

select * from stud_info;

Create table stud_marks (
roll_no int primary key,
Dbms int,
Toc bigint);
DROP TABLE stud_marks;
insert into stud_marks values
(1,50,45),
(2,67,65),
(3,76,55),
(5,70,50);

select * from stud_marks;

-- Inner Join--
select stud_info.roll_no,name,Dbms,Toc from stud_info inner join stud_marks on stud_info.roll_no=stud_marks.roll_no;

select stud_info.roll_no,name,Dbms,Toc from stud_info,stud_marks where stud_info.roll_no=stud_marks.roll_no;

-- Left Join--

select stud_info.roll_no,name,Dbms,Toc from stud_info LEFT JOIN stud_marks on stud_info.roll_no=stud_marks.roll_no;

 -- Right join
 
select stud_info.roll_no,name,Dbms,Toc from stud_info RIGHT JOIN stud_marks on stud_info.roll_no=stud_marks.roll_no;

create table emp (
emp_id int primary key,
ename varchar(20),
city varchar(30),
post varchar(20),
sal INT not null);

INSERT INTO emp values 
(1,'John','Nashik','Clerk',5000),
(2,'Seema','Aurangabad','Developer',20000),
(3,'Amita','Nagar','Manager',70000),
(4,'Rakesh','Pune','Analyst',50000),
(5,'Samata','Nashik','Tester',35000),
(6,'Ankita','Chandwad','Developer',30000),
(7,'Bhavika','Pune','Team-LR',50000),
(8,'Deepa','Mumbai','CEO',90000),
(9,'Nitin','Nagpur','Clerk',8000),
(10,'Pooja','Pune', 'Analyst',45000);

select * from emp;

-- Display the information of employees, paid more than ‘pooja' from emp table --

select sal from emp where ename='pooja';
select * from emp where sal > (select sal from emp where ename='pooja');

-- List the name of the employees, who live in the same city as of ‘Rakesh’ --alter

select City from emp where ename='Rakesh';
select * from emp where city=(select City from emp where ename='Rakesh');

-- Display the information of employees, paid less salary than average salary throughout the company --

select avg(sal) from emp;
select * from emp where sal < (select avg(sal) from emp);

-- Display the information of employees having maximum salary in company --

select max(sal) from emp;
select * from emp where sal= (select max(sal) from emp);


-- Table emp1 --
create table emp1 (
emp_id int primary key,
ename varchar(20),
city varchar(30),
post varchar(20),
sal INT not null,
dept_no int);

INSERT INTO emp1 values 
(1,'John','Nashik','Clerk',5000,10),
(2,'Seema','Aurangabad','Developer',20000,20),
(3,'Amita','Nagar','Manager',70000,20),
(4,'Rakesh','Pune','Analyst',50000,10),
(5,'Samata','Nashik','Tester',35000,10),
(6,'Ankita','Chandwad','Developer',30000,30),
(7,'Bhavika','Pune','Team-LR',50000,30),
(8,'Deepa','Mumbai','CEO',90000,10),
(9,'Nitin','Nagpur','Clerk',8000,30),
(10,'Pooja','Pune', 'Analyst',45000,20);

select * from emp1;

-- Display the employee name ,salary and department no of those employees whose salary is the minimum salary of that department --

select min(sal) from emp1 group by dept_no;
select ename,sal,dept_no from emp1 where sal in (select min(sal) from emp1 group by dept_no);

-- Display the employee name, salary and department no of those employees whose salary is higher than all developers salary--

select sal from emp1 where post='Developer';
select ename,sal,dept_no from emp1 where sal< all(select sal from emp1 where post='Developer');

-- Display the employee name, salary and department no of those employees whose salary is higher than salary of any developers salary--

select sal from emp1 where post='Developer';
select ename,sal,dept_no from emp1 where sal > any(select sal from emp1 where post='Developer');

-- Display the employee name, salary and department no of those employees whose salary is less than salary of developers salary--

select sal from emp1 where post='Developer';
select ename,sal,dept_no from emp1 where sal < any(select sal from emp1 where post='Developer');

-- Assignment--

Create table Cust_Info (
C_id int primary key,
Cname varchar(50),
City varchar(50));

insert into Cust_Info Values
(1,'John','Nashik'),
(2,'Seema','Aurangabad'),
(3,'Amita','Nagar'),
(4,'Rakesh','Pune'),
(5,'Samata','Nashik'),
(6,'Ankita','Chandwad'),
(7,'Bhavika','Pune'),
(8,'Deepa','Mumbai'),
(9,'Nitin','Nagpur'),
(10,'Pooja','Pune');

Select * from Cust_Info;

Create table Acc_Info (
Acc_type varchar(50),
Amount int,
C_id int primary key,
foreign key(C_id) references Cust_Info(C_id));
 
 Drop Table Acc_Info;
 
insert into Acc_info values
('Current',5000),
('Saving',20000),
('Saving',70000),
('Saving',50000),
('Current',35000),
('Loan',30000),
('Saving',50000),
('Saving',90000),
('Loan',8000),
('Current',45000);

Select * from Acc_info;

-- Display the information of customers living in the same city as of ‘pooja’--

Select City from Cust_Info where Cname='pooja';
Select * from Cust_Info where City=(Select City from Cust_Info where Cname='pooja');


