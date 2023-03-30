SELECT
    *
FROM
    user_tables;

SELECT
    *
FROM
    user_objects;

SELECT
    *
FROM
    user_cons_columns
WHERE
    table_name = 'EMP28'; -- case sensitive

desc emp29;

SELECT emailid, hiredate from emp29;

select distinct hiredate from emp29;

select empname, salary as "Monthly Salary", salary * 12 Annual_Salary
from emp29; -- new 

-- new || concat operator
select empname || 'is an employee' from emp29;

select empname || '-' ||emailid from emp29;

select empname || ' hired with salary ' || salary from emp29;

select * from dept28
where department_id = 33;

select * from emp29
where salary > 30000;

select * from emp29
where hiredate='01-Mar-22';

select * from emp29
where salary between 25000 and 40000; -- range limit are INCLUSIVE

select * from emp29
where hiredate BETWEEN '01-APR-22' and '01-JUN-22';

select * from emp29
where department_id in(11, 33); -- behaves like OR


select * from emp29
where empname like 'K%'; -- '%' zero or more char (case-sensitive)

select * from emp29
where empname like '_ar%'; -- use of '_' for single char

select * from emp29
where empname like 'R%a%';

select * from emp29
;

select * from emp29
where department_id is null;


select * from emp29;

select * from emp29
where salary > 35000
and 
department_id in (11, 33);


select empid, empname, salary, hiredate
from emp29
where department_id = 11
order by salary, hiredate;


select * from emp29
order by salary, hiredate, department_id;


select * from emp29
order by 6; -- BAD PRACTICE new 


select * from emp29;