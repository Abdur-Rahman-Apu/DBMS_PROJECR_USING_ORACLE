--RENAME COLUMN NAME OF EMPLOYEE
alter table Employee rename column employee_id to emp_id;
desc Employee;
alter table Employee rename column employee_name to emp_name;
desc Employee;

--MODIFY COLUMN NAME
alter table Employee modify salary number(15);
describe Employee;



--ADD AND DELETE COLUMN

alter table Supplier add salary number(10);
desc Supplier;
alter table Supplier drop column salary;
desc Supplier;



/*  -------------------EMPLOYEE  TABLE----------------------- 
    (1)SELECT,WHERE STATEMENT
    (2)WORK ON A COLUMN
    (3) ARITHMETIC OPERATOR (>,<)
    (4) LOGICAL OPERATOR (AND,OR,NOT),
    (5) between, not between,
    (6)in, not in
    ----------------------------------------------------------
*/
select emp_name,salary from Employee;
select emp_name, (salary/2) as update_salary from Employee;
select emp_name,salary from Employee where job_title='Manager';
select emp_name,salary from Employee where job_title='Security Guard';


select emp_name,salary from Employee where salary>8000 or salary<15000;
select emp_name,salary from Employee where salary between 8000 and 15000;
select emp_name,salary from Employee where salary not between 8000 and 15000;

select emp_name,salary from Employee where salary in (8000,40000);

select emp_name,salary from Employee where salary not in (8000,40000);

--AGGREGIATE FUNCTIONS
select count(emp_id) from Employee;
select max(salary) from Employee;
select min(salary) from Employee;
select sum(salary) from Employee;
select avg(salary) from Employee;

select emp_name,salary from Employee;

--UPDATE STATEMENT
update Employee set salary=15000 where job_title='Worker';

select emp_name,salary from Employee;


--ORDER BY ASCENDING AND DESCENDING
select emp_name,salary from Employee order by salary;
select emp_name,salary from Employee;
select emp_name,salary from Employee order by salary desc;
select emp_name,salary from Employee;
select emp_name,salary from Employee order by emp_name desc,salary asc;
select emp_name,salary from Employee order by salary asc,emp_name desc;


--LIKE STATEMENT
desc Customer;
select * from Customer where customer_id='C-121';
select customer_name,address from Customer where gender='Male';
select customer_name,address from Customer where gender='Male' and address like '%Jatrabari%';
select customer_name,address from Customer where gender='Male' and address like '%Dhaka';
select customer_name,address from Customer where gender='Male' and address like '698/1%';

--NOT OPERATOR
desc Product;
select product_name,price from Product where not price>60;

--COUNT(*) AND COUNT(DISTINCT COLUMN NAME)
desc Bill_payment;
select * from Bill_payment where payment_method='Cash';
select count(*) from Bill_payment;
select count(distinct customer_id) from Bill_payment;


--GROUP BY AND HAVING
select customer_id,sum(amount) from Bill_payment group by customer_id;
select customer_id,sum(amount) from Bill_payment group by customer_id having sum(amount)>1000;
select customer_id,sum(amount) from Bill_payment group by customer_id having sum(amount)<1000;

--NESTED QUERY
select customer_name from Customer where customer_id in (select customer_id from Bill_payment);
select product_name,price from Product where not product_id in (select  product_id from Stock);
select supplier_name from Supplier where supplier_id in (select supplier_id from Product);
select company_name from Company where company_id in (select company_id from Supplier where supplier_id in (select supplier_id from Product));
select company_name from Company where company_id in (select company_id from Supplier where supplier_id in (select supplier_id from Product where price>100));

--SET OPERATIONS
select customer_id from Customer union select customer_id from Bill_payment;
select customer_id from Customer intersect select customer_id from Bill_payment;
select customer_id from Customer minus select customer_id from Bill_payment;


/*  ...........................................JOIN...................................................*/


--CONDITION LIKE THETHA JOIN
select c.customer_name,c.gender,b.buy_date,b.amount from Customer c,Bill_payment b where c.customer_id=b.customer_id;

--THETA JOIN
select c.customer_name,d.payment_method from Customer c join Bill_payment d on c.customer_id=d.customer_id;

select c.customer_name,d.payment_method from Customer c join Bill_payment d using(customer_id);

--NATURAL JOIN
select c.customer_name,d.payment_method from Customer c natural join Bill_payment d;


--CROSS JOIN
select * from Stock cross join Product;

select * from Stock s cross join Product p where s.product_id=p.product_id;

--FULL OUTER JOIN
select p.product_name,s.quantity from Stock s full outer join product p on s.product_id=p.product_id;

--LEFT OUTER JOIN
select  p.product_name,s.quantity from  product p left outer join Stock s on s.product_id=p.product_id;

--RIGHT OUTER JOIN
select s.quantity,p.product_name from Stock s right outer join product p on s.product_id=p.product_id;

