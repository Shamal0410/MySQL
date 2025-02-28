SELECT * FROM sample_db.emp1;
select distinct dept_no from emp1;
select emp_name,ifnull(comm,0) from emp1;

select now();
select Year(now());
select year(now())-2001 as 'Age';
select current_user();
select current_date();
select current_time();
select current_timestamp();

select 35.23*sal from emp1;
select floor(35.23*sal) from emp1;
select ceil(35.23*sal) from emp1;

-- String Function --

select upper(emp_name) from emp1;
select lower(emp_name) from emp1;
select lower(sal) from emp1;

select * from dept;
select emp_no,emp_name,job,sal from emp1 inner join dept on emp1.dept_no=dept.dept_no;