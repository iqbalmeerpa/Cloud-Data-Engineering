-------------left join-------------------------------
select prod.product_name,ord_it.order_id from production.products as prod
left join sales.order_items as ord_it
on prod.product_id = ord_it.product_id;


select prod.product_name,ord_it.order_id,ord.order_date,ord_it.item_id from production.products as prod -- left join
left join sales.order_items as ord_it -- right join
on ord_it.product_id = prod.product_id
left join sales.orders as ord -- right join
on ord.order_id=ord_it.order_id

-------------right join-------------------------------
select prod.product_name,ord_it.order_id from  sales.order_items as ord_it -- left join
right join production.products as prod -- right join
on prod.product_id = ord_it.product_id;

select * from sales.staffs;
select * from sales.stores;

-----------------inner join -------------------------------

select first_name,sales.staffs.email,store_name,city from sales.staffs
full join sales.stores
on sales.stores.store_id = sales.staffs.store_id;

--------------inner join-------------------------

select c.id as candid_id,
	e.id as emp_id,
	c.fullname as candid_fullname,
	e.fullname as emp_fullname
from hr.candidates c
join hr.employees e
	on c.fullname=e.fullname


------------left join----------------------
select c.id as candid_id,
	e.id as emp_id,
	c.fullname as candid_fullname,
	e.fullname as emp_fullname
from hr.candidates c
left join hr.employees e
	on c.fullname=e.fullname

--------------right join-------------------

select c.id as candid_id,
	e.id as emp_id,
	c.fullname as candid_fullname,
	e.fullname as emp_fullname
from hr.candidates c
right join hr.employees e
	on c.fullname=e.fullname

--------------full join---------------------

select c.id as candid_id,
	e.id as emp_id,
	c.fullname as candid_fullname,
	e.fullname as emp_fullname
from hr.candidates c
full join hr.employees e
	on c.fullname=e.fullname


----------------cross join------------------------

select * from production.products

select * from sales.order_items

select * from production.products
cross join sales.order_items

-----------------self join-------------------------

select s1.first_name + ' ' + s1.last_name as staff_name,
s1.staff_id as staff_id,s2.staff_id as manager_id,
s2.first_name + ' ' + s2.last_name as manager_name
from sales.staffs s1
inner join sales.staffs s2
on s1.staff_id=s2.manager_id;



select 
	e.staff_id emp_staff_id,
	e.first_name + ' ' + e.last_name as staff_name,
	m.staff_id manager_staff_id,
	m.first_name + ' ' + m.last_name as manager_name
from
	sales.staffs e
inner join sales.staffs m
	on m.staff_id = e.manager_id;


select * from sales.staffs;


select * from sales.customers;

select	
	cust1.city as city_name,
	cust1.first_name + ' ' + cust1.last_name as cust1_fullname,
	cust2.first_name + ' ' + cust2.last_name as cust2_fullname
from
	sales.customers as cust1
inner join sales.customers as cust2
on cust2.customer_id > cust1.customer_id
and cust2.city = cust1.city
where cust1.city='Albany'




