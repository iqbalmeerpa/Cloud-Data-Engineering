-- ============================================================
--   ASSIGNMENT 03 — GROUP BY, HAVING & SUBQUERIES
--   Database  : BikeStores
--   Topics    : GROUP BY · Aggregate Functions · HAVING
--               Subqueries · JOINs with GROUP BY
-- ============================================================


-- ============================================================
--  SECTION A — GROUP BY & AGGREGATE FUNCTIONS
-- ============================================================

-- Q1.
-- Count the total number of orders placed by each customer.
-- Show customer_id and order_count.
-- Sort by order_count descending.

	
	select customer_id,count(order_id) as order_count
	from sales.orders
	group by customer_id
	order by order_count desc

-- Q2.
-- For each store, find the total number of orders placed.
-- Show store_id and total_orders.
	
	select store_id,count(order_id) as total_orders
	from sales.orders
	group by store_id


-- Q3.
-- Calculate the net revenue per order.
-- Net revenue formula: SUM( quantity * list_price * (1 - discount) )
-- Show order_id and net_revenue, sorted by net_revenue descending.
-- (Hint: use sales.order_items)
	
	Select order_id ,SUM(quantity * list_price * (1 - discount)) as net_revenue from sales.order_items
	Group by order_id
	Order By net_revenue desc
	

-- Q4.
-- Find the average list price of products in each category.
-- Show category_id and avg_price (rounded to 2 decimal places).
-- (Hint: use ROUND())

	Select ROUND(AVG(list_price),2) as avg_price,category_id from production.products
	Group by category_id


-- Q5.
-- Find the total number of orders placed in each year.
-- Show order_year and total_orders, sorted by order_year.
-- (Hint: use YEAR(order_date))

	Select Year(order_date) as order_year,count(order_id) as total_orders
	from sales.orders
	Group by Year(order_date)

-- ============================================================
--  SECTION B — HAVING CLAUSE
-- ============================================================

-- Q6.
-- Find customers who have placed MORE than 5 orders in total.
-- Show customer_id and order_count.
	
	Select count(order_id) as order_count,customer_id
	from sales.orders
	Group by customer_id
	Having count(order_id) > 5


-- Q7.
-- Find categories where the AVERAGE list price is greater than $1,500.
-- Show category_id and avg_price.

	Select
		category_id,
		avg(list_price) as avg_price
	From production.products
	Group by category_id
	Having avg(list_price) > 1500

-- Q8.
-- Find customers who placed at least 2 orders in the year 2017.
-- Show customer_id, order_year, and order_count.

	Select 
		customer_id,
		Year(order_date) as order_year,
		count(order_id) as order_count
	From sales.orders
	where Year(order_date) = 2017
	Group by customer_id,Year(order_date)
	Having count(order_id) >= 2

-- ============================================================
--  SECTION C — SUBQUERIES
-- ============================================================

-- Q9.
-- Find all orders placed by customers who live in 'Houston'.
-- Use a subquery to get the customer_ids first.
-- Show all columns from sales.orders.

	Select * from sales.orders as ord
	Where customer_id IN (Select 
							customer_id
						From
							sales.customers
						where city = 'Houston')

-- Q10.
-- Find all products whose list_price is greater than the
-- AVERAGE list_price of ALL products.
-- Show product_name and list_price.

	Select product_name,list_price
	From production.products
	where list_price > (Select avg(list_price)
						From
						production.products)


-- Q11.
-- Find all products that belong to the category 'Mountain Bikes'
-- or 'Road Bikes'. Use a subquery on production.categories.
-- Show product_name and list_price.

	Select product_name,list_price
	From production.products
	Where category_id IN (Select category_id 
						  From production.categories
						  where category_name IN ('Mountain Bikes','Road Bikes'))

-- Q12.
-- Find all customers who have NEVER placed an order.
-- Show customer_id, first_name, and last_name.
-- (Hint: use NOT IN with a subquery on sales.orders)

	Select 
		customer_id,
		first_name,
		last_name
	From
	sales.customers
	Where customer_id NOT IN (Select customer_id
							From sales.orders
						)


-- ============================================================
--  SECTION D — JOINs WITH GROUP BY
-- ============================================================

-- Q13.
-- Find the total number of orders per city (customer's city).
-- Join sales.orders with sales.customers.
-- Show city and total_orders, sorted by total_orders descending.
	
	Select 
		count(ord.order_id) as total_orders,
		cust.city
	From sales.orders as ord
	Inner join sales.customers as cust
	On cust.customer_id=ord.customer_id
	Group By cust.city
	Order By total_orders Desc


-- Q14.
-- For each staff member, count how many orders they handled.
-- Join sales.orders with sales.staffs.
-- Show staff full name (first_name + ' ' + last_name) as staff_name
-- and order_count, sorted by order_count descending.
	
	Select 
		st.first_name + ' ' + st.last_name as staff_name,
		count(ord.order_id) as order_count
	From
		sales.staffs as st
	Inner join sales.orders as ord
	on ord.staff_id=st.staff_id
	Group By st.first_name, st.last_name
	Order By order_count Desc

	


-- Q15. (BONUS — Multi-concept)
-- Find customers who have spent more than $10,000 in total.
-- Join sales.customers → sales.orders → sales.order_items.
-- Show customer full name as customer_name and total_spent.
-- Sort by total_spent descending.
-- (Hint: JOIN + GROUP BY + HAVING)

	Select 
		cust.first_name + ' ' + cust.last_name as customer_name,
		SUM(ordIt.list_price) as total_spent
	From
	sales.customers as cust
	Inner join sales.orders as ord
	On ord.customer_id = cust.customer_id
	Inner join sales.order_items as ordIt
	On ordIt.order_id = ord.order_id
	Group By cust.first_name,cust.last_name
	Having SUM(ordIt.list_price) > 10000
	Order By total_spent Desc

-- ============================================================
--  END OF ASSIGNMENT 03
-- ============================================================
