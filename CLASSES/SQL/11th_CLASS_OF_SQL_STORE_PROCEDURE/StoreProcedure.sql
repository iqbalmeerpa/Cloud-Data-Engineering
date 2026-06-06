CREATE PROCEDURE procedure_name
AS
BEGIN
	Query
END

----BASIC STORE PROCEDURE SYNTAX-------

CREATE PROCEDURE product_list
AS
BEGIN
	SELECT 
		product_name,
		list_price
	FROM
		production.products
	ORDER BY
		product_name;
END;

EXECUTE product_list;




-----------------------------------

CREATE PROCEDURE product_list_by_pricing(
@min_list_price as decimal = 0,
@max_list_price as decimal = 10000000000,
@name as varchar)
AS
BEGIN
	SELECT 
		product_name,
		list_price
	FROM
		production.products
	WHERE
		list_price >= @min_list_price
		and list_price <= @max_list_price
		and product_name like @name%
	ORDER BY
		product_name;
END;

--EXECUTE product_list_by_pricing 800,1000;

EXECUTE product_list_by_pricing 
@name = 'Trek';



------------------------VARIABLES IN STORE PROCEDURE-----------------------------------

--DECLARE VARIABLE

DECLARE @model_year SMALLINT;
SET @model_year = 2018;


SELECT
	product_name,
	model_year,
	list_price
FROM
	production.products
WHERE
	model_year = @model_year
ORDER BY
	product_name;


------------------------

declare @product_count int;
set @product_count = 
	(select count(*) from production.products)

Select @product_count as product_count;




----------------------------------

CREATE PROC uspGETPRODUCTLIST(
	@model_year SMALLINT
) AS
BEGIN
	DECLARE @product_list VARCHAR(MAX)

	SET @product_list = '';

	SELECT
		@product_list = @product_list + product_name
							+ CHAR(10)
	FROM
		production.products

	WHERE
		




--------------------IF ELSE CONDITION----------------------------------------------

BEGIN
    DECLARE @sales INT;

    SELECT 
        @sales = SUM(list_price * quantity)
    FROM
        sales.order_items i
        INNER JOIN sales.orders o ON o.order_id = i.order_id
    WHERE
        YEAR(order_date) = 2018;

    SELECT @sales;

    IF @sales > 1000000
    BEGIN
        PRINT 'Great! The sales amount in 2018 is greater than 1,000,000';
    END
END


--------------------------------WHILE LOOP--------------------------------

DECLARE @counter INT = 1;

WHILE @counter <= 5
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END


-------------------BREAK------------------------

DECLARE @counter INT = 0;

WHILE @counter <= 5
BEGIN
    SET @counter = @counter + 1;
    IF @counter = 4
        BREAK;
    PRINT @counter;
END


--------------------CONTINUE------------------------


DECLARE @counter INT = 0;

WHILE @counter < 5
BEGIN
    SET @counter = @counter + 1;
    IF @counter = 3
        CONTINUE;	
    PRINT @counter;
END

