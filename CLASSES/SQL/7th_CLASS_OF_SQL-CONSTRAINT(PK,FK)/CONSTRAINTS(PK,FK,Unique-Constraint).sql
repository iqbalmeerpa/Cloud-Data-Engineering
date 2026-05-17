-- Constraints

-- Primary Key
-- Foreign Key
-- Not Null Constraint
-- Check Constraint
-- Unique Constraint

create table order_items(
	order_id int,
	item_id int,
	quantity int,
	Primary Key (order_id,item_id) -- This is the concept of composite key when we do not have unique key in table
)

-- ALTER COMMAND KEY DOWN BELOW
alter table order_items_2
add primary key (order_id,item_id)

-- Foregin Keys
create table vendor_group(
	group_id int primary key,
	group_name varchar(255)
)

create table vendors(
	vendor_id int primary key,
	vendor_name varchar(100),
	group_id int,
	constraint fk_group Foreign key (group_id)
	references vendor_group (group_id)
	-- on update cascade (this line will be added for using foreign key constraint other options are given on line number 53-56)
)

-- insert into vendor_group(group_id,group_name) Values (1,'Habib Group'),(2,'Lucky Group'),(3,'Kebabjees')

-- insert into vendors(vendor_id,vendor_name,group_id) Values 
-- (1,'Bank AL Habib',1),
-- (2,'Habib Oil',1),
-- (3,'Habib Bikes',1),
-- (4,'Lucky Cement',2),
-- (5,'Lucky One',2),
-- (6,'KFC',3),
-- (7,'Kebabjee Express',3),
-- (8,'Kebabjee Bakers',3)


-- referential integreties
-- on delete
-- on update


-- on update no action
-- on update cascade
-- on update set null
-- on update set default



-- on delete no action
-- on delete cascade
-- on delete set null
-- on delete set default

-- 3rd Constraint
-- NOT NULL

-- create table vendor_group(
	-- group_id int primary key,
	-- group_name varchar(255) NOT NULL -- this line added for not null constraint
-- )

-- create table vendors(
	-- vendor_id int primary key,
	-- vendor_name varchar(100),
	-- group_id int,
	-- constraint fk_group Foreign key (group_id)
	-- references vendor_group (group_id)
	-- on update cascade (this line will be added for using foreign key constraint other options are given on line number 53-56)
-- )


--------------UNIQUE CONSTRAINT---------------------

create table vendor_group_unique_constraint(
	 group_id int unique,
	 group_name varchar(255) NOT NULL -- this line added for not null constraint
)


-- insert into vendor_group_unique_constraint(group_id,group_name) values (Null,'Iqbal duplicate'),(2,'Abbas')

---------------------CHECK CONSTRAINT-------------------------------------

create table dummy_products(
	product_id int primary key,
	product_name varchar(255) not null Unique,
	unit_price int check(unit_price > 0)
)

insert into dummy_products(product_id,product_name,unit_price)
values (123,'bike',1000)

insert into dummy_products(product_id,product_name,unit_price)
values (12,'bike_2',0)

insert into dummy_products(product_id,product_name,unit_price)
values (12,'bike',20)




---------------------------------------------------------------------------
------------------CASE EXPRESSION-----------------------------

Select
	case order_status
		when 1 then 'Pending'
		when 2 then 'Processing'
		when 3 then 'Rejected'
		when 4 then 'Completed'
	else
		'unknown'
	END as Order_status,
	count(order_id) as order_count
from sales.orders
group by 
	order_status


-- order_id,order_value(sum(quantity * list_price)) , order_priority
-- order_priority less than 1000 "Low"
-- order_priority greater than 1000 and less than 5000 "Medium"
-- order_priority greater than 5000 "High"


select 
	order_id,
	sum(quantity * list_price) as order_values,
	case 
		when sum(quantity * list_price) <= 1000 
			then 'Low'
		when sum(quantity * list_price) > 1000  AND sum(quantity * list_price) <= 5000
			then 'Medium'
		when sum(quantity * list_price) > 5000 
			then 'High'
	END as order_priority
from sales.order_items
group by
	order_id
order by order_values desc



