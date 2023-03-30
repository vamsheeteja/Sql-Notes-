select * from categories;
select * from shippers;
select * from customers;
select * from employees;
select * from suppliers;
select * from products;
select * from orders;
select * from Order_details;

-- Assignment 4-
-- 1. Select CategoryName and Description from the Categories table sorted by CategoryName. 
SELECT categoryname, description from categories
order by categoryname;

-- 2. Create a report showing employees' first and last names and hire dates sorted from newest to oldest employee. 
SELECT firstname, lastname, hiredate
from employees
order by hiredate desc;

-- 3.Create a report showing orders sorted by Freight from most expensive to cheapest. Show OrderID, OrderDate, ShippedDate, CustomerID, and Freight. 
select orderid, orderdate, shippeddate, customerid, freight
from orders
order by freight desc;

-- 4. Select CompanyName, Fax, Phone, HomePage and Country from the Suppliers table sorted by Country in descending order and then by CompanyName in ascending order. 
select CompanyName, Fax, Phone, HomePage, Country
from suppliers
ORDER by country DESC, companyname;

-- 5. Create a report showing the title and the first and last name of all sales representatives.
SELECT title, firstname, lastname
from employees
where title = 'Sales Representative';

-- 6. Create a report showing all the company names and contact names of customers in Buenos Aires. 
select companyname, contactname, city
from customers
where city = 'Buenos Aires';

-- 7. Create a report showing the product name, unit price and quantity per unit of all products that are out of stock. (**DOUBT)
select productname, unitprice, quantityperunit
from products
where unitsinstock = 0;

-- 8. Create a report showing the order date, shipped date, customer id, and freight of all orders placed on May 19, 1997.
select orderdate, shippeddate, customerid, freight 
from orders
where orderdate = (select TO_DATE('May 19, 1997', 'mon dd, yyyy') from dual);

--select to_date('May 19, 1997','mon dd, yyyy') from dual;

-- 9. Create a report showing the first name, last name, and country of all employees not in the United States.
select firstname, lastname, country
from employees
where country not in ('USA');

select * from employees;

-- 10. Create a report showing the title of courtesy and the first and last name of all employees whose title of courtesy is "Mrs." or "Ms.".
-- Display the full name of the employee.

select titleofcourtesy, firstname, lastname, titleofcourtesy || ' ' || firstname || ' ' || lastname as fullname
from employees
where titleofcourtesy in ('Mrs.', 'Ms.');


-- --------END of Assi-4 ----------------




-- Assignment - 5

-- 1. Find the Total Number of Units Ordered of Product ID 3.
select count(*) 
from order_details
where productid = 3;

-- 2. Find the Earliest and Latest Dates of Hire.
select max(hiredate) as LatestHire, min(hiredate) as EarliestHire
from employees;

-- 3. Retrieve the number of employees in each city.
select city, count(*) as NoOfEmployees
from employees
group by city;

-- 4. Find the number of sales representatives in each city that contains at least 2 sales representatives. 
-- Order by the number of employees.
select city, count(*) as NoOfSalesRep
from employees
where title = 'Sales Representative'
group by city
having count(*) >= 2
order  by NoOfSalesRep;

-- 5. Write a query to display Employee name, birth date, hire date, city and country of every Employee hired in 2011. 
-- Display birth date of every employee in the format ‘2nd August 2016’.
select firstname || ' ' || lastname, to_char(to_date(birthdate), 'ddth-Mon-yyyy') as birthdate, hiredate, city, country
from employees
where to_char(to_date(hiredate), 'YYYY') = 2011;

-- 6. Create a report that shows the total number of orders by Customer since December 31, 1996. 
-- The report should only return rows for which the NumOrders is greater than 15. 
select customerid, count(*) as NumOrders
from orders
where orderdate >= to_date('December 31, 1996', 'Month dd, yyyy')
group by customerid
having count(*) > 15;

--select to_date('December 31, 1996', 'Month dd, yyyy') from dual;

--select customerid, orderdate
--from orders
--where orderdate >= to_date('December 31, 1996', 'Month dd, yyyy');

-- 7. Create a report that shows the total quantity of products (from the Order_Details table) ordered. 
-- Only show records for products for which the quantity ordered is fewer than 200.

select productid, sum(quantity) as TotalQuantity
from order_details
group by productid
having sum(quantity) < 200;


select * from order_details;


select * from employees;
