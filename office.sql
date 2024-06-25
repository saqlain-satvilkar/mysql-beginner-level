-- create database office;
-- use office;
-- create table employees(etc int, etc varchar(20));
-- select * from employees
-- alter table employees
-- add column Contact int
-- after Last_Name;
-- rename table employees to emp;
-- alter table emp
-- rename column Contact to phone;
-- alter table emp
-- modify column mail varchar(50);
-- alter table emp
-- drop column address;
-- alter table emp
-- add column hire_date date;

-- alter table emp
-- modify column hourly_pay decimal (5,2);
-- insert into emp values(51,'Rishi','Kapoor',90.99,'rishi.kapoor@gmail.com','1965-7-25');
-- insert into emp values(51,'Shakti','Kapoor',20.55,'shakti.kapoor@gmail.com','1977-2-19');
-- insert into emp values(59,'Anil','Kapoor',120.50,'anil.kapoor@gmail.com','1985-12-31');
-- insert into emp values(68,'Kareena','Kapoor',157.99,'kareena.kapoor@gmail.com','1990-2-28');
-- insert into emp values(72,'Sonam','Kapoor',200.00,'sonam.kapoor@gmail.com','2009-5-17');

-- INSERT MULTIPLE ROWS  USE COMMON SENSE AND BRACKETS  insert into emp values (73,'Ranbir','Kapoor',800.00,'ranbir.kapoor@gmail.com','2008-8-16'),
-- (79,'Arjun','Kapoor',50.00,'arjun.kapoor@gmail.com','2008-10-03'),
-- (85,'Jhanvi','Kapoor',500.00,'jhanvi.kapoor@gmail.com','2020-6-21');

-- add data to column but omit some rows
-- insert into emp(id,name,surname) values (127,'Shahid','Kapoor');



-- SELECTIVE SELECT select name,surname from emp;
-- WITH WHERE CLAUSE
-- select id,name, surname from emp where id=85 or id=79 or id=51;
-- ACTORS WHO GET PAID MORE THAN 100$ select * from emp where hourly_pay>100.00;

-- select * from emp where hire_date > '1980-1-1' and hire_date <'2000-1-1';
-- select * from emp where mail is null;
-- WHO IS NOT GETTING PAID YET select name from emp where hourly_pay is null;

-- Select database which you wanna use after each login.   use office;

-- updating rows! need to use UPDATE, SET, WHERE clause
-- IF SET UPDATE ERROR OCCURS THEN  >> SET SQL_SAFE_UPDATES = 0;
-- update emp
-- set mail='shahidji.kapoor@gmail.com', hire_date='2012-01-07'
-- where id=127;
-- IF REMOVE WHERE CLAUSE THE WHOLE COLUMN VALUE CHANGES

-- DELETING A ROW!!!   >> delete from emp
-- where id=79;

-- set autocommit = off; TO ENABLE SAVEPOINTS
-- commit;   SAFEPOINT MARK
-- rollback; TO GO BACK TO SAFEPOINT

-- set autocommit = off;

-- commit;

-- delete from emp;

-- rollback;

-- select*from emp;

-- Playing with date and time and knowing it's importance!

-- create table test( mydate date , mytime time , mydatetime datetime);
-- select*from test;

-- insert into test values(current_date()+7,NULL,NULL);

-- set autocommit = on;

-- create unique constraint before making a table

-- create table products(
-- product_id int, product_name varchar(25) unique , price decimal(4,2)		
-- );


-- create unique constraint after making a table
-- alter table products
-- add constraint
-- unique(product_id);

-- Unique constraints test
-- insert into products values (100,'Ham Burger',3.99),
-- (101,'Fries',1.89),
-- (102,'Soda',1.00),
-- (103,'Ice Cream',1.49);

-- not null constraint

-- alter table products
-- modify product_id int not null;

-- insert into products values (0,'Chips',0.50);

/* alter table emp
add constraint chk_hr_pay check 
(hourly_pay >=10);

select*from emp;

insert into emp values (6,'Sheldon','Plankton',69.00,'sheldon@niggamail.com','2023-01-07');

-- To drop check 

alter table emp
drop check chk_hr_pay;

insert into emp values (116,'Arjun','Kapoor',2.00,'arjun.kamchor@gmail.com','2010-10-10');

select * from emp; */

-- select * from emp;
-- alter table emp
-- add constraint surname varchar(20) 



use office;
select * from products;
-- default method 

insert into products values (104,'Straw',0.00),
(105,'Napkin',0.00),
(106,'Fork',0.00),
(107,'Spoon',0.00);

delete from products where product_id>=104;
select*from products;

-- recreating table using DEFAULT constraint
-- state after a column DEFAULT and then put a value so if you don't enter a value there you will be having your default value there


alter table products
alter price set default 0;

select*from products;

insert into products(product_id,product_name) values (104,'Straw'),
(105,'Napkin'),
(106,'Fork'),
(107,'Spoon');


create table transactions(
transaction_id int,
amount decimal(5,2),
transaction_datetime datetime default now()

);

select*from transactions;

insert into transactions(transaction_id,amount) values (3,8.37);

alter table transactions
rename column amount to amount_usd;

select*from transactions;


-- PRIMARY KEY CONSTRAINT
-- UNIQUE AND NOT NULL 

create table trans(
trans_id int primary key,
amount decimal(5,2)
);

select*from trans;

-- add primary key to already created table
alter table trans add constraint primary key(trans_id);

alter table emp add constraint primary key(id);

select*from emp;

update emp
set id=52
where name='Rishi';

SET SQL_SAFE_UPDATES = 0;

select*from emp;

alter table emp
add constraint primary key(id);

-- Refund a customer!! by transaction ID

insert into trans values(1003,4.99);
select amount from trans where trans_id = 1003;


drop table trans;

create table trans (
trans_id int primary key auto_increment,
amount decimal(5,2)
);

select*from trans;

insert into trans(amount) values (4.99);

-- SET AUTO INCREMENT VALUES TO START FROM A CUSTOM DATE
alter table trans
auto_increment = 1000;

delete from trans;
insert into trans(amount) values (3.39);
select*from trans;

use office;

-- use foreign key to link two tables

create table customers(
customer_id int primary key auto_increment,
first_name varchar(20),
last_name varchar(20));

insert into customers(first_name,last_name) values ("Mohd","Shami"),
("Rohit","Sharma"),("Virat","Kohli");

select*from customers;

drop table trans;

create table trans(
transaction_id int primary key auto_increment,
amount decimal(5,2), 
customer_id int,
foreign key(customer_id) references customers(customer_id));

select*from trans;

alter table trans
drop foreign key trans_ibfk_1;

-- Add foreign key to existing table!  use Alter table and add
-- foreign key constraint
alter table trans
add constraint fk_customer_id
foreign key(customer_id) references customers(customer_id);

select*from trans;

delete from trans;
select*from trans;

alter table trans
auto_increment =1000;


insert into trans(amount,customer_id) values(4.99,3),
(2.89,2),
(3.38,3),
(4.99,1);

select*from trans;


-- inter related so you cannot delete
delete from customers 
where customer_id =3;

use office;

select*from trans;

insert into trans(amount,customer_id) values (1.00,null);

insert into customers(first_name,last_name) values ('Mohd','Siraj');
select*from customers;

-- inner join SELECT MATCHING IDS
select*from trans inner join customers 
on trans.customer_id = customers.customer_id;

select transaction_id, amount, first_name, last_name
from trans inner join customers
on trans.customer_id = customers.customer_id;

select *
from trans right join customers
on trans.customer_id = customers.customer_id;

select count(amount) as "Today's Transactions"
from trans;

select max(amount) as "Largest order"
from trans;

select min(amount) as "Smallest order"
from trans;

select avg(amount) as "Average order ($)"
from trans;

select sum(amount) as "Sum of all transactions"
from trans;

select concat(name," ",surname) as "full name"
from emp;

alter table emp
add column job varchar(25) after hourly_pay;
select*from emp;

update emp
set job = "Over Actor"
where id = 116;
select*from emp;

select * 
from emp 
where hire_date between '1990-01-01' and '2015-01-01';

select *
from emp
where job in ("Nepotism","Over Actor");


-- WILD CARD CHARACTERS  (%) (_)

select *
from emp
where name like "S%";

select *
from emp
where name like "%R";

select *
from emp
where name like "SH%";

-- (_) is used to add blank letters
select *
from emp
where name like "___un";

select *
from emp
where hire_date like "____-02-__";

select *
from emp
where job like "_c%";

-- Order by clause put ASC or DESC 
select * 
from emp
order by name desc;

select * 
from emp
order by hourly_pay desc;

select * 
from emp
order by hire_date;

select *
from trans
order by amount asc, customer_id desc;


use office;

-- LIMIT CLAUSE just adds limit to display

select*from customers
order by last_name
limit 2;
-- useful with orderby clause.

select * from customers
limit 3,1;
-- start from and the offset means increment by 


-- UNION Operator

create table income(
	income_name varchar(50),
    amount decimal(10,2)
);

select * from income;

insert into income values ("Orders",1000000.00),
("Merchandise",500000.00),
("Services",1250000.00);

create table expenses(
	expense_name varchar(50),
    amount decimal(10,2)

);

insert into expenses values ("wages",-250000.00),
("tax",-50000.00),("repairs",-15000.00);

select*from expenses;

-- Union combines the results of 2 or more select statements
select * from income
union
select * from expenses;

-- To join 2 cols the number need to be same!!
select name, surname from emp
union
select first_name, last_name from customers;

-- UNION ALL so then it shows duplicate values too!

-- SELF JOIN

alter table customers
add refferral_id int;
select*from customers;

update customers
set refferral_id =2
where customer_id =4;

set sql_safe_updates = 0;

select a.customer_id, a.first_name, a.last_name, 
concat(b.first_name," ",b.last_name ) as "Reffered by"
from customers as a
inner join customers as b
on a.refferral_id = b.customer_id;

use office;
select*from emp;


alter table emp
add supervisor_id int;

update emp
set supervisor_id=5
where id=51;


update emp
set supervisor_id=9
where id=59;

select*from emp;

select a.name,a.surname, concat(b.name," ",b.surname) as "Reports to" 
from emp as a
left join emp as b
on a.supervisor_id = b.id;

create table shop(id int, fn varchar(50), ln varchar(50));
select*from shop;

insert into shop values (1,"Saqlain","Satvilkar"),
						(2,"Saud","Pore") ,
                        (3,"Saba","Pore") ,
                        (4,"Safwan","Pore");
select*from shop;

alter table shop
rename column l_name to last_name;
select*from shop;

-- Not working auto increment works on KEY
alter table shop
modify column customer_id int key auto_increment;

alter table shop
add referral_id int;
select*from shop;

update shop
set referral_id=2
where customer_id=4;
select*from shop;

-- Creating a self join reffering to own coloumn.
select a.customer_id,a.first_name,b.last_name, concat(b.first_name," ",b.last_name) as "Referred By"
from shop as a
left join shop as b
on a.referral_id = b.customer_id;

select * from shop;

create table workplace(
	employee_id int key auto_increment,
    first_name varchar(25),
    last_name varchar(25),
    hourly_pay decimal (5,2),
    job varchar(20),
    hire_date date
);
select*from workplace;

insert into workplace(first_name,last_name,hourly_pay,job,hire_date) 
values ("Masood","Satvilkar",120.00,"Cashier","2018-05-01"),
("Shah Fahad","Satvilkar",150.00,"Manager","2018-01-01"),
("Shagufta","Pore",90.00,"Cook","2018-09-15"),
("Nafisa","Kazi",110.00,"Cook","2018-02-01"),
("Nisar","Kazi",100.00,"Asst. Manager","2019-01-01"),
("Saqlain","Satvilkar",50.00,"Janitor","2019-02-16");
select*from workplace;

alter table workplace
add column supervisor_id int;
select*from workplace;

update workplace
set supervisor_id=2
where employee_id=5;
select*from workplace;

select a.first_name,a.last_name, concat(b.first_name," ",b.last_name) as "Managed by"
from workplace as a
left join workplace as b
on a.supervisor_id = b.employee_id;

select a.first_name,a.last_name, concat(b.first_name," ",b.last_name) as "Managed by"
from workplace as a
inner join workplace as b
on a.supervisor_id = b.employee_id;

select*from emp;

-- Create view
create view contact as
select name,mail from emp;
select*from contact;

-- if you update anything on table or view the changes are applied to both
insert into emp values (5,'Pearl','crabs',null,null,'pearly@hotmail.com',null,null);
select*from contact;


-- Indexes in MySQL 
-- used because selection takes less time
-- Update takes longer time so need to be careful where to use this
-- this can be used to find values within specific column more quickly

-- To show pre-assigned indexes just type SHOW INDEXES FROM space tablename
show indexes from emp;

-- create an index
create index surname_idx
on emp(surname);
show indexes from emp;

select*from emp
where surname = "Kapoor";

-- create multi-columns index

create index full_name_idx
on emp(surname,name);
show indexes from emp;

-- delete an index
alter table emp
drop index surname_idx;
show indexes from emp;

-- How to write a subquery
-- subquery
-- a query within another query
-- query(subquey)

select name, surname, hourly_pay,(select avg(hourly_pay) from emp) as "Average Pay"
from emp;

select name, surname, hourly_pay
from emp
where hourly_pay> (select avg(hourly_pay) from emp);


select * from trans;

select first_name,last_name
from customers
where customer_id in
(select distinct customer_id 
from trans
where customer_id is not null);
use office;

-- GROUP BY clause
use office;

select*from trans;

alter table trans
add column order_date date;
select*from trans;


-- To update any specific value in a row just remember UPDATE SET WHERE USW USW
update trans
set order_date="2023-01-3"
where transaction_id=1005;
select*from trans;

insert into trans values (1006,5.48,null,"2023-01-3");
select*from trans;

-- Manager says need to know total amount in a day
select sum(amount) as "Day's Total Collection",order_date
from trans
group by order_date;


-- sum out customer id and his total he has spend
select sum(amount) as "Sum", customer_id
from trans
group by customer_id;

select count(amount),customer_id
from trans
group by customer_id
-- instead of using WHERE CLAUSE we can use HAVING clause because GROUP BY clause does not go along with WHERE clause
HAVING count(amount)>1 and customer_id is not null;

-- ROLLUP CLAUSE
-- produces another row and shows grand total also known as super aggregate values
select sum(amount), order_date
from trans
group by order_date;

-- now using the rollup clause

select sum(amount), order_date
from trans
group by order_date with rollup;
-- in the end of the sum row we can see the grand total!


select count(transaction_id), order_date
from trans
group by order_date with rollup;

select* from workplace;
-- If all employees working today then total 
select sum(hourly_pay) as "Hourly Pay", employee_id
from workplace
group by employee_id with rollup;


-- Try deleting customer id primary key which is foreign key in trans table
-- We cannot delete coz of foreign key constraints
delete from customers
where customer_id = 3;

select*from trans;
show indexes in trans;

-- ON DELETE SET NULL: when fk is deleted replace fk with null
-- ON DELETE CASCADE: when fk is deleted delete the entire row!!

-- assume we are creating a new table then how to add this constraints
-- creating same table trans
create table trans(
transaction_id int primary key,
amount decimal (5,2),
customer_id int,
order_date date,
foreign key(customer_id) references customers(customer_id)
on delete set null);

-- To add the ON DELETE on existing table
-- First we need to drop the existing FK

alter table trans drop foreign key fk_customer_id;

-- then we alter the table to add the constraints

alter table trans
add constraint fk_customer_id
foreign key(customer_id) references customers(customer_id)
on delete set null;

select*from trans;

delete from customers
where customer_id=3;
select*from trans;

-- now we drop the whole row

-- remember to del existing foreign key to alter the new key

alter table trans drop foreign key fk_customer_id;

-- now we add the constraint

alter table trans
add constraint fk_customer_id foreign key(customer_id) references customers(customer_id)
on delete cascade;

select*from trans;


-- now you see the whole row will be gone if anyone deletes the foreign key
delete from customers
where customer_id=1;
select*from trans;

use office;

select*from shop;

-- creating a temporary delimiter as //
DELIMITER // 
create procedure shop_details()
begin
	select * from shop;
end // -- ending the code with delimiter which we have set

DELIMITER ; -- now changing the delimiter back to default


-- calling a stored procedure
call shop_details();



select*from emp;

-- to add parameters we first use [IN parameter_name datatype]
delimiter //
create procedure find_actor(in idnum int)
begin
	select*from emp
    where idnum = id;
end //
delimiter ;


call find_actor(72);
-- to drop a procedure we simple type procedure name  DROP PROCEDURE name;
drop procedure find_actor;


-- need to put exact varchar length matching with the original table!
delimiter //
create procedure find_emp(in fname varchar(20),in lname varchar(20))
begin
	select*from emp
    where name = fname and surname = lname; -- first original table names = given names
end //
delimiter ;

select*from customers;
call find_emp("Ranbir","Kapoor");


-- Triggers!!
-- specifically for INSERT UPDATE DELETE!!
alter table workplace
add column salary decimal(10,2)
after hourly_pay;
select*from workplace;

-- Trigger syntax CREATE-BEFORE/AFTER update/del/ins -FOR WHICH ROWS- SET - USE NEW. keyword
create trigger before_hourly_pay_update
before update on workplace
for each row
set new.salary = (new.hourly_pay*2080);

-- To drop a trigger
drop trigger before_hourly_pay_update;
select*from workplace;

-- remember this line!
SET SQL_SAFE_UPDATES = 0;

update workplace
set hourly_pay = 120
where employee_id =3;
select*from workplace;

-- checking if trigger works or not!
update workplace
set salary = hourly_pay*2080;
select*from workplace;

/* select a.first_name, b.first_name as "Managed by"
from workplace as a
left join workplace as b
on b.employee_id = a.supervisor_id; 
*/

-- creating the same trigger but before insertion

create trigger before_hourly_pay_insert
before insert on workplace
for each row
set new.salary = (new.hourly_pay*2080);


insert into workplace values (20,"Zahabia","Khan",200,null,"Owner",null,0);
select*from income;

create trigger before_amount_insert
before insert on income
for each row
set new.amount = new.amount*0.5;

insert into income values ("Workplace",50000);
select*from income;

-- triggers works fine
-- GG
-- MySQL basics complete!



