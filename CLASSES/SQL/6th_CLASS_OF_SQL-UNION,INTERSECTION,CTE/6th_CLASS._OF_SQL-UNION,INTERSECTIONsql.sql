-----------------UNION & UNION ALL QUERIES DOWN BELOW---------------------------
select first_name,last_name
from sales.staffs
UNION
select first_name,last_name
from sales.customers

select first_name,last_name
from sales.staffs
UNION ALL
select first_name,last_name
from sales.customers


select first_name,last_name,count(*) as occurence
from 
(Select first_name,last_name
from sales.staffs
UNION ALL
Select first_name,last_name
from sales.customers
) as people
Group by first_name,last_name
Having count(*)>1





-----------------INTERSECTION QUERIES DOWN BELOW-----------------------------------

select city
from sales.stores
INTERSECT
Select city
from sales.customers

-----------------EXCEPT QUERIES (DO AS ASSIGNMENT) DOWN BELOW-----------------------------------


