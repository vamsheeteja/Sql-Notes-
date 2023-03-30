-- JOINS and TCL commands DAY-3

SELECT
    *
FROM
    department;

SELECT
    *
FROM
    employee;

SELECT
    *
FROM
    location_dtls;


-- inner join

SELECT
    employeeid,
    firstname,
    lastname,
    manager_id,
    salary,
    job_id,
    department_name
FROM
    employee,
    department
WHERE
    employee.department_id = department.department_id;

SELECT
    department_name,
    city
FROM
    department    d,
    location_dtls l
WHERE
    d.locationid = l.locationid;


-- use of table alias

SELECT
    e.employeeid,
    e.firstname,
    e.lastname,
    e.manager_id,
    e.salary,
    e.job_id,
    d.department_name
FROM
    employee   e,
    department d
WHERE
        e.department_id = d.department_id
    AND d.department_id = 10;


-- can join more than 2 tables

SELECT
    e.employeeid,
    e.firstname,
    e.lastname,
    e.manager_id,
    e.salary,
    e.job_id,
    d.department_name,
    l.city
FROM
    employee      e,
    department    d,
    location_dtls l
WHERE
        e.department_id = d.department_id
    AND d.locationid = l.locationid
    AND l.city = 'GOA'; -- case sensitive


-- ANSI STANDARD (join - on keywords)

SELECT
    e.employeeid,
    e.firstname,
    e.lastname,
    e.manager_id,
    e.salary,
    e.job_id,
    d.department_name
FROM
         employee e
    JOIN department d ON e.department_id = d.department_id
WHERE
    d.department_name = 'HR1';


-- Nested in-join

SELECT
    e.employeeid,
    e.firstname,
    e.lastname,
    e.manager_id,
    e.salary,
    e.job_id,
    d.department_name,
    l.city
FROM
         employee e
    JOIN department    d ON e.department_id = d.department_id
    JOIN location_dtls l ON d.locationid = l.locationid;

-- INNER == NATURAL == SIMPLE == BASIC JOINS

-- Cartesian Product Cross JOIN

select e.Employeeid, e.firstname, e.lastname, e.manager_id, e.salary, e.job_id, d.department_name
from employee e, department d; -- havent specified WHERE CLAUSE so it performed CROSS JOIN

select * from employee;
SELECT * FROM department;
select e.Employeeid, e.firstname, e.lastname, e.manager_id, e.salary, e.job_id, d.department_name
from employee e cross join department d; 


-- Natural join (inner join only)

select 
employeeid, firstname, lastname, manager_id, salary, job_id, department_name
from employee e natural join department d;
 
-- In Natural JOIN
    -- if there is any common column then automatically inner join is performed on those tables common column.
    -- if there is no common column between 2 tables then Caretesian product is applied.
    
select 
employeeid, firstname, lastname, manager_id, salary, job_id
from employee e natural join location_dtls l;


-- LEFT OUTER JOIN  -each record from LHS side table displayed + matched records

select 
employeeid, firstname, lastname, manager_id, salary, job_id, d.department_name
from employee e LEFT OUTER JOIN department d
ON e.department_id = d.department_id;

-- RIGHT OUTER JOIN  - each record from RHS side table + matched

select 
employeeid, firstname, lastname, manager_id, salary, job_id, d.department_name
from employee e RIGHT OUTER JOIN department d
ON e.department_id = d.department_id;


-- FULL OUTER JOIN

select
employeeid, firstname, lastname, manager_id, salary, job_id, d.department_name
from employee e FULL OUTER JOIN department d
ON e.department_id = d.department_id;

-- SELF JOIN (inner join with itself)

select
emp.employeeid, emp.firstname, emp.lastname, emp.salary, emp.job_id, mgr.employeeid as manager_id, mgr.firstname as manager_name
from employee emp JOIN employee mgr
ON emp.manager_id = mgr.employeeid;


----------------------CHECK again interesting-----------------
--select a.*
--from employee a, employee b
--where a.job_id = b.job_id
--order by a.firstname;

select a.*,a.job_id, b.job_id
from employee a, employee b
order by a.firstname;


-- Use of Set operators. COMBINE the OUTPUT on multiple Queries
-- whereas JOINs : display together data from multiple tables.
-- 


select empid, salary from emp;
select employeeid, salary from employee;


create table emp (
    empid number(6,0),
    empname varchar2(20),
    email_id varchar2(25),
    gender varchar2(1),
    phone_number varchar2(20),
    hire_date date,
    dept_id number(4),
    salary number(8,2)
);


Insert all
    into emp values (10, 'Yamini', 'yamini@gmail.com',null,940000342, '01-JAN-19', 60, 20000)
    into emp values (10, 'Kamini', 'kamini@gmail.com',null,8899653410, '01-JAN-19', 60, 50000)
    into emp values (11, 'Yash', 'yash@gmail.com', null, 9213456778, '02-JAN-21', 70, 30000)
    into emp values (12, 'Vipul', 'yipul@gmail.com', null, 941122342, '10-JUN-20', 80, 40000)
    into emp values (13, 'Mayur', 'mayur@gmail.com', null, 9411223542, null, 70, null)
select * from dual;


select * from emp;
select * from employee;
SELECT * FROM department;


-- UNION 
-- OUTPUT is sorted and excluded duplicated
select empid, salary from emp
union
select employeeid, salary from employee;

-- UNION ALL
-- OUTPUT is not sorted and duplicates included
select empid, salary from emp
union all
select employeeid, salary from employee;

-- INTERSECT
-- only common records get displayed
select empid, salary from emp
intersect 
select employeeid, salary from employee;

-- recodes selected by first query and not in second query

select empid, salary from emp
minus
select employeeid, salary from employee;

select empid from emp
minus
select employeeid from employee;

-- TCL and DCL --------------------------------------------------

-- ddl commands are autocommit
-- dml are not


create table customer29 (
    cust_id number(3) primary key,
    cust_name varchar2(20) not null
);


savepoint s1;

insert into customer29 values(1, 'Rahul');
insert into customer29 values(2, 'Satish');

select * from customer29;

update customer29
set cust_name='Ranjana'
where cust_id=2;

--rollback to s1;

savepoint s2;

insert into customer29 values(3, 'Rutuja');

select * from customer29;

--POINT TO BE NOTED : so Here we are using a DDL command and the transaction session ends here so the savepoint s2 is no longer valid in this new session
-- you can only rollback to a savepoint defined in the current transaction, you cannot rollback to the savepoint after issuing DDL statements.
create table products (
    product_id number(4) primary key,
    product_name varchar2(10)
);


insert into products values(1, 'Nike');
insert into products values(2, 'Puma');
insert into products values(3, 'Reebok');

select * from products;

savepoint s3;

delete from customer29
where cust_id = 1;

select * from customer29;

rollback to s1;
rollback to s3;
select * from customer29;
select * from products;

--drop table products;
--drop table customer29;

commit;

-- go thru theory

-- DCL 

-- GRANT and REVOKE system admin will have these controls.

-- CHECK DB_USER1-0.SQL FILE

-- note:  1. STARTS AT DB_USER1-0.SQL

-- 2. GIVING EMP29 GRANT TO DB_USER1 USER
GRANT SELECT ON DEV_USER.LOCATION_DTLS TO DB_USER1;

SELECT * FROM EMP29;

-- 5. 
SELECT * FROM DB_USER1.STUDENT1;

select * from user_tab_privs_made;
