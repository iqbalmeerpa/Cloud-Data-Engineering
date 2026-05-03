
---------JOINS LECTURE BELOW -----------------------------------


create schema hr;
go


create table hr.candidates(
	id int primary key identity,
	fullname varchar(100) not null);

create table hr.employees(
	id int primary key identity,
	fullname varchar(100) not null);

insert into
	hr.candidates(fullname)
values
	('Owais'),('Tauseef'),('Abbas'),('Iqbal')

insert into
	hr.candidates(fullname)
values
	('Adnan'),('Mehboob'),('Asad'),('Jawad')


---------------------------------------------------------------

select prod.product_name,prod.list_price,prod.category_id,cat.category_name 
	from production.products as prod
	inner join production.categories as cat
		on cat.category_id = prod.category_id
	order by product_name desc;


----------------------------------------------------------------

select first_name + ' ' + last_name AS full_name ,ord.order_status,ord.order_date
from sales.customers as cust
inner join sales.orders as ord
on ord.customer_id=cust.customer_id
order by ord.order_date desc