Create database ORG;
use ORG;

Create table Worker (
worker_id int not null primary key auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int(15),
joining_date datetime,
department varchar(25));
 
 
Insert into Worker (worker_id,first_name,last_name,salary,joining_date,department) values
(001,'Monika','Arora',100000,'14-02-20 09.00.00','HR'),
(002,'Niharika','Verma',80000,'14-06-11 09.00.00','Admin'),
(003,'Vishal','Singhal',300000,'14-02-20 09.00.00','HR'),
(004,'Amitabh','Singh',500000,'14-02-20 09.00.00','Admin'),
(005,'Vivek','Bhati',500000,'14-06-11 09.00.00','Admin'),
(006,'Vipul','Diwan',200000,'14-06-11 09.00.00','Account'),
(007,'Satish','Kumar',75000,'14-01-20 09.00.00','Account'),
(008,'Geetika','Chauhan',90000,'14-04-11 09.00.00','Admin');

select * from Worker;

Create table Bonus (
worker_ref_id int,
bonus_amount int(10),
bonus_date datetime,
foreign key(worker_ref_id) references Worker(worker_id) on delete cascade);

Insert into Bonus (worker_ref_id,bonus_amount,bonus_date) values
(001,5000,'16-02-20'),
(002,3000,'16-06-11'),
(003,4000,'16-02-20'),
(001,4500,'16-02-20'),
(002,3500,'16-06-11');

select * from Bonus;

Create table Title (
worker_ref_id int,
worker_title varchar(25),
affected_from datetime,
foreign key(worker_ref_id) References Worker(worker_id) on delete cascade);

Insert into Title (worker_ref_id,worker_title,affected_from) values
(001,'Manager','2016-02-20 00.00.00'),
(002,'Executive','2016-06-11 00.00.00'),
(008,'Executive','2016-06-11 00.00.00'),
(005,'Manager','2016-06-11 00.00.00'),
(004,'Asst.Manager','2016-06-11 00.00.00'),
(007,'Executive','2016-06-11 00.00.00'),
(006,'Lead','2016-06-11 00.00.00'),
(003,'Lead','2016-06-11 00.00.00');

Select * from Title;

-- Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>--

SELECT first_name as worker_name from worker ;

-- Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case--

select upper(first_name) from Worker;

-- Write an SQL query to fetch unique values of DEPARTMENT from the Worker table --

select distinct department from Worker;

-- Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table --

select left(first_name,3) from Worker;
select substring(first_name,1,3) from Worker;

-- Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table--

select instr(first_name,binary'a') from Worker where first_name='Amitabh';

-- Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side--

select rtrim(first_name) from Worker;

-- Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side --

select ltrim(department) from Worker;

-- Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length --

select distinct length(department) from Worker;

-- Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’ --

select replace(first_name,'a','A') from Worker;

-- Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them --

select concat(first_name,' ',last_name) as complete_name from Worker;

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending --

select * from Worker order by first_name;

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending --

select * from Worker order by first_name asc,department desc;

-- Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table --

select * from Worker where first_name in ('Vipul','Satish');

-- Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table --

select * from Worker where first_name not in ('Vipul','Satish');

-- Write an SQL query to print details of Workers with DEPARTMENT name as “Admin” --

select * from Worker where department='Admin';
select * from Worker where department like 'Admin%';

-- Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a --

select * from Worker where first_name like '%a%';

-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’ --

select * from Worker where first_name like '%a';

-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets --

select * from Worker where first_name like '_____h';

-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000 --

select * from Worker where salary between 100000 and 500000 ;

-- Write an SQL query to print details of the Workers who joined in Feb’2014 --

select * from Worker where year(joining_date)=2014 and month(joining_date)=2;

-- Write an SQL query to fetch the count of employees working in the department ‘Admin’ --

select count(*) from Worker where department='Admin';

-- Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000 --

select concat(first_name,' ',last_name) as worker_name,salary from Worker 
where worker_id in
(select worker_id from Worker  
where salary between 50000 and 100000 );

-- Write an SQL query to fetch the no. of workers for each department in descending order --

select count(*) from Worker order by department desc;
select department, count(worker_id) no_of_worker from Worker group by department order by no_of_worker desc;

-- Write an SQL query to print details of the Workers who are also Managers--

select distinct w.first_name, t.worker_title from worker w inner join title t on w.worker_id=t.worker_ref_id and t.worker_title in ('Manager');

-- Write an SQL query to fetch duplicate records having matching data in some fields of a table --

select worker_title, affected_from, count(*) from Title group by worker_title,affected_from having count(*) >1;

-- Write an SQL query to show only odd rows from a table--

select * from Worker where mod(worker_id,2) <>0;

-- Write an SQL query to show only even rows from a table --

select * from Worker where mod(worker_id,2) =0;

-- Write an SQL query to clone a new table from another table --
-- The general query to clone a table with data is:
select * into Workerclone from Worker;

-- An alternate way to clone a table (for MySQL) without data is:
CREATE TABLE WorkerClone LIKE Worker;


-- Write an SQL query to fetch intersecting records of two tables --

(select * from Worker) intersect (select * from Workerclone) ;

-- Write an SQL query to show records from one table that another table does not have --

select * from Worker minus select * from Title ;

-- Write an SQL query to show the current date and time --
-- The following MySQL query returns the current date:
select current_date();  
-- Query returns the current time:
select current_time();
-- Query retunrs the current date and time:
select now();


-- Write an SQL query to show the top n (say 10) records of a table --

select * from Worker order by salary desc limit 10;

-- Write an SQL query to determine the nth (say n=5) highest salary from a table --

select salary from Worker order by salary desc limit 5;


-- Write an SQL query to determine the 5th highest salary without using the TOP or limit method --
-- The following query is using the correlated subquery to return the 5th highest salary:

SELECT Salary FROM Worker W1 WHERE 4 = (SELECT COUNT( DISTINCT ( W2.Salary ) ) FROM Worker W2 WHERE W2.Salary>= W1.Salary);


-- Write an SQL query to fetch the list of employees with the same salary --

select distinct w.worker_id,w.first_name,w.salary from Worker w, Worker w1 where w.salary=w1.salary and w.worker_id;

-- Write an SQL query to show the second-highest salary from a table --

select max(salary) as second_highest_salary from Worker;
select max(salary) from Worker where salary not in (select max(salary) from Worker);


-- Write an SQL query to show one row twice in the results from a table --

select first_name,department from Worker w where w.department='HR'
union all
select first_name,department from Worker w1 where w1.department='HR';


-- Write an SQL query to fetch intersecting records of two tables --

(select * from Worker)
intersect
(select * from Workerclone);

-- Write an SQL query to fetch the first 50% of records from a table --

SELECT * FROM WORKER WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);


-- Write an SQL query to fetch the departments that have less than five people in them --

select department ,count(worker_id) as 'no of worker' from Worker group by department having count(worker_id) < 5;


-- Write an SQL query to show all departments along with the number of people in there --

select department, count(department) as 'no. of worker' from Worker group by department;


-- Write an SQL query to show the last record from a table --

select * from Worker where worker_id=(select max(worker_id) from Worker);


-- Write an SQL query to fetch the first row of a table --

select * from Worker where worker_id= (select min(worker_id) from Worker);


-- Write an SQL query to fetch the last five records from a table --

select * from Worker where worker_id <=5;
SELECT * FROM Worker WHERE WORKER_ID <=5 UNION
SELECT * FROM (SELECT * FROM Worker W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5;


-- Write an SQL query to fetch three max salaries from a table --

select distinct salary from Worker a where 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary<= b.Salary) order by a.Salary desc;


--  Write an SQL query to fetch three min salaries from a table --

select distinct salary from Worker a where 3>= (select count(distinct salary) from Worker b where a.salary>=b.salary) order by a.salary desc;

-- Write an SQL query to fetch nth max salaries from a table --

select distinct salary from Worker a where n >= (select count(distinct salary) from Worker b where a.salary<=b.salary) order by a.salary desc;



