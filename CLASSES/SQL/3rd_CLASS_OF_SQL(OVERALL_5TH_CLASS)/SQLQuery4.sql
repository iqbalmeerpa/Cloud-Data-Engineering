---- RETRIEVE VALUES THAT HAVE 'A' IN LAST
select customer_id,first_name,last_name from sales.customers
where first_name like '%A';

---- RETRIEVE VALUES THAT HAVE 'A' IN START
select customer_id,first_name,last_name from sales.customers
where first_name like 'A%';

---- RETRIEVE VALUES THAT HAVE 'A' ANYWHERE
select customer_id,first_name,last_name from sales.customers
where first_name like '%A%';


---- RETRIEVE VALUES THAT HAVE START WITH 'T' AND END WITH 'S'
select customer_id,first_name,last_name from sales.customers
where first_name like 'T%s';

---- RETRIEVE VALUES WHOSE SECOND CHARACTER IS 'T'
select customer_id,first_name,last_name from sales.customers
where first_name like '_T%';

---- RETRIEVE VALUES THAT DOES NOT START WITH 'A'
select customer_id,first_name,last_name from sales.customers
where first_name NOT like 'A%';

