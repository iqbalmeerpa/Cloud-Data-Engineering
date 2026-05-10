-- ============================================================
--  ASSIGNMENT 02 — Joins
--  Database : BikeStores
-- ============================================================


-- ============================================================
--  Question 1
--  Retrieve the product_name, list_price, and category_name
--  for every product.
--  Use production.products and production.categories.
--  Sort the results by product_name ascending.
-- ============================================================

-- Write your query below:

	select pr.product_name,cat.category_name,pr.list_price
	from production.products as pr
	join production.categories as cat
	on pr.category_id=cat.category_id
	order by pr.product_name ASC



-- ============================================================
--  Question 2
--  Show the customer full name (as full_name), order_id,
--  and order_date for all customers who have placed an order.
--  Use sales.customers and sales.orders.
--  Sort by order_date descending.
-- ============================================================

-- Write your query below:

	select 
	cust.first_name + ' ' + cust.last_name as full_name,
	ord.order_id,ord.order_date
	from sales.customers as cust
	join sales.orders as ord
	on ord.customer_id = cust.customer_id
	order by ord.order_date desc


-- ============================================================
--  Question 3
--  Retrieve product_name, list_price, category_name, and
--  brand_name for every product.
--  Use production.products, production.categories,
--  and production.brands.
--  Sort by brand_name then product_name (both ascending).
-- ============================================================

-- Write your query below:
	select pr.product_name,cat.category_name,pr.list_price,br.brand_name
	from production.products as pr
	join production.categories as cat
	on pr.category_id=cat.category_id
	join production.brands as br
	on br.brand_id=pr.brand_id
	order by br.brand_name,pr.product_name ASC



-- ============================================================
--  Question 4
--  List all products along with their order_id and item_id.
--  Make sure products that have NEVER been ordered also appear
--  in the result (those rows will have NULL for order_id
--  and item_id).
--  Use production.products and sales.order_items.
--  Sort by order_id ascending.
-- ============================================================

-- Write your query below:
	select prd.product_id,prd.product_name,ordIt.order_id,ordIt.item_id from production.products as prd
	left join sales.order_items as ordIt
	on ordIt.product_id=prd.product_id
	order by ordIt.order_id asc



-- ============================================================
--  Question 5
--  Using your answer from Question 4 as a base, filter the
--  results to show ONLY the products that have never been
--  ordered.
--  Display only product_id and product_name.
-- ============================================================

-- Write your query below:
	select prd.product_id,prd.product_name from production.products as prd
	left join sales.order_items as ordIt
	on ordIt.product_id=prd.product_id
	where ordIt.order_id is NULL
	order by ordIt.order_id asc



-- ============================================================
--  Question 6
--  Show all stores along with any orders placed at each store.
--  Display store_name, store_id (from stores), order_id,
--  and order_date.
--  Every store must appear in the result, even if it has
--  no orders yet.
--  Use sales.orders and sales.stores.
-- ============================================================

-- Write your query below:

	select st.store_id,st.store_name,ord.order_id,ord.order_date 
	from sales.stores as st
	left join sales.orders as ord
	on st.store_id=ord.store_id



-- ============================================================
--  Question 7
--  List every staff member alongside their manager's name.
--  Display:
--    • staff full name   (as staff_name)
--    • manager full name (as manager_name)
--  Use only the sales.staffs table.
--  Staff who have no manager should NOT appear in the result.
-- ============================================================

-- Write your query below:

	select
		emp.first_name + ' ' + emp.last_name as emp_full_name,
		man.first_name + ' ' + man.last_name as man_full_name
	from sales.staffs as emp
	inner join sales.staffs as man
	on emp.manager_id=man.staff_id



-- ============================================================
--  Question 8
--  Generate every possible combination of store name and
--  brand name.
--  Display store_name and brand_name.
--  Use sales.stores and production.brands.
--  How many total rows do you expect?
--  Write the expected count as a comment next to your query.
-- ============================================================

-- Write your query below:

	Select st.store_name,br.brand_name from production.brands as br
	cross join sales.stores as st -- 27 rows expected after the query

-- ============================================================
--  Question 9
--  Retrieve the customer full name (as full_name), order_id,
--  order_date, product_name, and list_price for every order
--  that has been placed.
--  Use sales.customers, sales.orders, sales.order_items,
--  and production.products.
--  Sort by order_date ascending, then full_name ascending.
-- ============================================================

-- Write your query below:
	Select 
	cust.first_name + ' ' + cust.last_name as full_name,
	ord.order_id,ord.order_date,prd.product_name,prd.list_price from  sales.customers as cust
	inner join sales.orders as ord
	on ord.customer_id=cust.customer_id
	inner join sales.order_items as ordIt
	on ordIt.order_id=ord.order_id
	inner join production.products as prd
	on prd.product_id=ordIt.product_id
	order by ord.order_date,full_name asc