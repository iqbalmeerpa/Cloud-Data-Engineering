------- ROW NUMBER FUNCTION IN WINDOW FUNCTION-----------------
--------CONCEPT OF PARTITIONING INVOLVE IN ROW NUMBER FUNCTION-------------

--- without partition by------------

SELECT
	ROW_NUMBER() OVER(
	ORDER BY first_name
	) row_num,
	first_name,
	last_name,
	city
FROM
	sales.customers


--- with partition by------------

WITH CTE_ROW_NUMBER
AS
(
SELECT
	customer_id,
	ROW_NUMBER() OVER(
	partition by first_name
	ORDER BY first_name
	) row_num,
	first_name,
	last_name,
	city
FROM
	sales.customers
)


select * from CTE_ROW_NUMBER
where row_num > 1;



delete from sales.customers
where customer_id = (SELECT 
						customer_id 
					from 
						CTE_ROW_NUMBER 
					where 
						row_num > 1
					);



------------------------RAND & DENSE_RANK ---------------------------


SELECT
	product_id,
	product_name,
	list_price,
	RANK() OVER (
		ORDER BY list_price DESC
	) price_rank
FROM
	production.products

-------------------------DENSE RANK EXAMPLE----------------------------

SELECT
	product_id,
	product_name,
	list_price,
	DENSE_RANK() OVER (
		ORDER BY list_price DESC
	) price_rank
FROM
	production.products

---------------------------LAG AND LEAD -------------------------------------

CREATE VIEW sales.vw_netsales_brands
AS
	SELECT 
		c.brand_name, 
		MONTH(o.order_date) month, 
		YEAR(o.order_date) year, 
		CONVERT(DEC(10, 0), SUM((i.list_price * i.quantity) * (1 - i.discount))) AS net_sales
	FROM sales.orders AS o
		INNER JOIN sales.order_items AS i ON i.order_id = o.order_id
		INNER JOIN production.products AS p ON p.product_id = i.product_id
		INNER JOIN production.brands AS c ON c.brand_id = p.brand_id
	GROUP BY c.brand_name, 
			MONTH(o.order_date), 
			YEAR(o.order_date);


SELECT month,
net_sales,
LAG(net_sales,1) OVER(
Order by month
) previous_months_sale
FROM
sales.vw_netsales_brands


-------------------LEAD SALES EXAMPLE--------------------------------


SELECT month,
net_sales,
LEAD(net_sales,1) OVER( -- this 1 is offset
Order by month
) previous_months_sale
FROM
sales.vw_netsales_brands