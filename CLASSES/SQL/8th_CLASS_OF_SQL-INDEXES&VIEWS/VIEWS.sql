CREATE VIEW production.vw_product_info
AS
SELECT
	product_name,
	brand_name,
	list_price
FROM 
	production.products as pr
INNER JOIN production.brands as br
ON br.brand_id = pr.brand_id;


SELECT * FROM production.vw_product_info



select * from production.products

select * from sales.orders

select * from sales.order_items

CREATE VIEW sales.vw_product_sales_info
AS
SELECT 
	YEAR(ord.order_date) as Year,
	MONTH(ord.order_date) as m,
	DAY(ord.order_date) as d,
	pr.product_id,
	pr.product_name,
	ordIt.quantity * ordIt.list_price as sales
FROM
	production.products as pr
INNER JOIN sales.order_items as ordIt
ON ordIt.product_id = pr.product_id
INNER JOIN sales.orders as ord
ON ord.order_id = ordIt.order_id

SELECT * FROM sales.vw_product_sales_info




-----------------------------COALLESCE------------------------------------

select
	coalesce(NULL,'NULL','Hello',NULL);


select * from vw_product_sales_info



