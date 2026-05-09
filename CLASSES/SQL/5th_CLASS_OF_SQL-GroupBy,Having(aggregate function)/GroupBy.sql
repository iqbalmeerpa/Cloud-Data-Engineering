---------------GROUP BY---------------------------------------
select customer_id,
year(order_date) as order_year
from sales.orders
where
	customer_id in (1,2)

group by 
	customer_id,
	year(order_date);

---------------------------------2nd QUERY OF GROUP BY--------------------------------

select
	customer_id,
	count(order_id) as order_count,
	year(order_date) as order_year
from sales.orders
	where customer_id in (1,2,115)
group by
	customer_id,
	year(order_date)

---------------------------3rd QUERY OF GROUP BY----------------------------

select 
	count(customer_id) as customer_total_count,
	city
from sales.customers
where city in ('Orchard Park','Campbell')
group by 
	city

	----------------------MAX AND MIN VALUE IN EVERY CATEGORY-------------------



select 
	category_id,
	max(list_price) as maximum_price_category,
	min(list_price) as minimum_price_cateogory
from production.products
group by 
	category_id

--------------------LIST DOWN THE ORDER NET VALUE----------------------------------

select 
	order_id,
	sum(
		quantity * list_price * (1-discount)
		) as net_value
	from sales.order_items
	group by order_id






--         --          --          --             --    -------------  ----      --           -- 
--         --        --   --        --           --     -------------  ------    --          -- -- 
--         --       --     --        --         --           ---       --  --    --         --   --
-------------       --     --         --       --            ---       --   --   --        --
-------------       ---------          --     --             ---       --    --  --       --     --------
--         --       ---------           --   --              ---       --     -- --        --     --  ---
--         --       --     --            -- --          -------------  --      ----         --    --   --
--         --       --     --             --            -------------  --       ---           ------   -- 

select category_id,
	max(list_price) as max_price,
	min(list_price) as min_price
	from production.products
group by
	category_id
having
	avg(list_price) >1000


-- AVG PRiCE FOR EVERY CATEGORY (500 - 1000)
select 
	category_id,
	avg(list_price) as avg_price
from production.products
group by
	category_id
having
	avg(list_price) between 500 and 1000




