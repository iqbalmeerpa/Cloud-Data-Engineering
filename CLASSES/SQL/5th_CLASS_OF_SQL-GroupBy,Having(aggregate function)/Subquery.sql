--SUBQUERY
-- AIK MAIN QUERY MA 32 SUBQUERIES LIKH SAKTE HA MAXIMUM

select * from sales.orders
	where sales.orders.customer_id IN (select customer_id from sales.customers where city = 'New York')


--productname,list_price form products

---list_price greater than 


select prd.product_name,prd.list_price
	from production.products as prd
where list_price > (select avg(list_price) as list_price from production.products
					where prd.brand_id IN (select brand_id from production.brands where brand_name IN ('Electra','Trek')))



select product_name,product_id 
	from production.products
	where category_id IN (select category_id from production.categories where category_name IN ('Comfort Bicycles','Electric Bikes'))




select product_name,product_id from production.products
	where product_id IN (select product_id from production.stocks where quantity > 10)