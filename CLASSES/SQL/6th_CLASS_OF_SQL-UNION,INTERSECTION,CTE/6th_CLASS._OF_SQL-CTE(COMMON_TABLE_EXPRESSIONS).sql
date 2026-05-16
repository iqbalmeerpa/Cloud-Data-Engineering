-- CTE -- Common Table Expressions

-- it allows to store the temporary results

-- Syntax
-- with cte_name
-- as
--	(cte_query)



With cte_sales_by_staff(staff_id,staff_name,net_sales,year_order)
AS
	(
		select 
			ord.staff_id,
			st.first_name + ' ' + st.last_name as staff_name,
			sum(ordIt.quantity * ordIt.list_price * (1 - ordIt.discount)) as net_sales,
			YEAR(ord.order_date) as year_order
		from sales.staffs as st
		inner join sales.orders as ord
		on ord.staff_id = st.staff_id
		inner join sales.order_items as ordIt
		on ordIt.order_id = ord.order_id
		Group by 
		ord.staff_id,st.first_name,st.last_name,YEAR(ord.order_date)
	)
select * from cte_sales_by_staff
where year_order='2016'




-----------------------------------------------------------------
with sales_by_staff(staffID,orderCount)
as
(
	Select 
		ord.staff_id,
		count(*) as order_count
	From sales.orders ord
	Group by ord.staff_id
)
select avg(orderCount) as average_order_count from sales_by_staff


------------------------------------------------------------------
--- ORDER SALES BY CATEGORY
WITH CTE_SALES_BY_CATEGORY(category_id,category_name,product_count)
AS
(
	select 
		pr.category_id,
		category_name,
		count(product_id) as product_count
	from production.products pr
	inner join production.categories cat
	on cat.category_id=pr.category_id
	GROUP BY pr.category_id,category_name
),
-- NET REVENUE BY CATEGORY
REVENUE_BY_CATEGORY(category_id,net_revenue)
AS
(
	select 
		prd.category_id,
		sum(ordIt.quantity * ordIt.list_price * (1 - ordIt.discount)) as net_revenue
	from production.products prd
	inner join sales.order_items ordIt
	on ordIt.product_id = prd.product_id
	Group by prd.category_id
)

select * from CTE_SALES_BY_CATEGORY as cte_cat
inner join REVENUE_BY_CATEGORY as cte_rev
on cte_rev.category_id=cte_cat.category_id

---------------------HOMEWORK where order_status is completed 4---------------------------