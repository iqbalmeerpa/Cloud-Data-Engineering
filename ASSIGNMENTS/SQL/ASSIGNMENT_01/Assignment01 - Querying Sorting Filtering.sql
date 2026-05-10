select first_name,last_name,city,phone from sales.customers
where state='CA' and phone is not null;


select product_id,product_name,model_year,list_price from production.products
order by model_year desc,list_price asc;


select TOP 5 product_name,list_price from production.products; 

select TOP 5 PERCENT * from production.products;

SELECT *
FROM production.products
ORDER BY list_price DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;

select distinct state from sales.customers
order by state asc
;


SELECT DISTINCT state, city
FROM sales.customers
ORDER BY state ASC, city ASC;

select count(distinct model_year) from production.products;

select product_id,product_name,brand_id,category_id,list_price,model_year from production.products
where list_price between 500 and 1500
and model_year = 2019 OR  model_year = 2020;
