-- Day 4 Subqueries and Other database objects

select * from employee 
where job_id = (select job_id from employee where firstname='robin');

-- Single Row subquery
        -- Inner row returns only one value then comoparision
        -- single row operators = > 
    
-- emp details whose salary is more than highest salary paid to dept 20;


select * from department;

select * from employee 
where salary > (select max(salary) from employee where department_id = 20);

-- Multiple line

        -- Inner query returns more than one row


-- display al the emp whose sal is same as min sal in each dept

select * from employee 
where salary = (select department_id, min(salary) 
from employee
group by department_id); -- error too many values

select * from employee 
where salary = (select min(salary) 
from employee
group by department_id); -- single-row subquery returns more than one row 01427. 00000 -  "single-row subquery returns more than one row"

select * from employee 
where salary IN (select min(salary) 
from employee
group by department_id);

-- display all employee who works at pune


select * from employee
where department_id IN
(select department_id 
from department
where locationid = (select locationid from location_dtls
where city = 'Pune'));

-- display all employee whose salary is greater than any of the emp in dept_id 20

select * from employee
where salary > ANY (
select salary from employee
where department_id = 20) ;

select * from employee
where salary > ALL (
select salary from employee
where department_id = 20) ;

-- is similar to 

select * from employee
where salary > (
select max(salary) from employee
where department_id = 20
);


-- subquery in FROM clause
    -- INLINE view / virtual table
    
select groupnumber, count(*) 
from 
(select employeeid, job_id, department_id,
case
when department_id = 10 then 'Group1'
when department_id = 20 then 'Group2'
else 'group3'
end as groupnumber
from employee) -- virtual table
group by groupnumber;


-- display all employees along with their corresponding departments avg sal

select e.employeeid, e.firstname, d.avg_salary
from employee e, (
select department_id, avg(salary) as avg_salary
from employee
group by department_id) D -- vitural table
where e.department_id = d.department_id;


-- Correlated Queries


-- display all emp details whose salary is min salary in their department

select * from employee emp
where emp.salary=( select min(salary) from  employee m 
where emp.department_id = m.department_id);

-- display the department whose emp are null or don't have employee in the department
-- correlated








-- use of subquery in INSERT statement

create table dept_new(
    department_id number(2) primary key,
    department_name varchar2(20)
);

-- INSERT without values keyword
insert into dept_new(department_id, department_name)
select department_id, department_name
from department
where locationid=1;
select * from dept_new;


-- Modify (with subquery) the location 

select * from department;
select * from employee;
select * from location_dtls;


-- subquery with CREATE table

create table emp_details_table1 as
select employeeid, firstname, salary, job_id, manager_id, e.department_id,
department_name
from employee e join department d
on e.department_id = d.department_id
and d.department_id in (10, 20);


desc emp_details_table1;

select * from emp_details_table1;



-- Views
-- virtual table/ 
-- snapshot of the table. like a window thru which we can see the data in the table
-- wont contain any physical data.




-- create a view to get employee name, department name, city


create or replace view emp_dept_loc_view as
select e.firstname, d.department_name, l.city
from employee e join department d
on e.department_id = d.department_id
join location_dtls l
on d.locationid = l.locationid;

select * from employee;
select * from emp_dept_loc_view;

-- Sequence Generator

select * from all_users;



