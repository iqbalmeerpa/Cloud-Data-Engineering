-- One page maximum capacity is 8 KB
-- Data stored in DB in pages

-----------------------------CLUSTERED INDEX----------------------------------------

CREATE TABLE production.parts(
    part_id   INT NOT NULL, 
    part_name VARCHAR(100)
);

ALTER TABLE production.parts
ADD PRIMARY KEY (part_id);

DROP TABLE production.parts;

INSERT INTO 
    production.parts(part_id, part_name)
VALUES
    (1,'Frame'),
    (2,'Head Tube'),
    (3,'Handlebar Grip'),
    (4,'Shock Absorber'),
    (5,'Fork');


INSERT INTO production.parts(part_id, part_name)
SELECT TOP (10000000)
    ROW_NUMBER() OVER (ORDER BY (SELECT NULL)),
    CONCAT('Part ', ROW_NUMBER() OVER (ORDER BY (SELECT NULL)))
FROM sys.all_objects a
CROSS JOIN sys.all_objects b
CROSS JOIN sys.all_objects c
CROSS JOIN sys.all_objects d;



SELECT 
    part_id, 
    part_name
FROM 
    production.parts
WHERE 
    part_id = 5;


CREATE CLUSTERED INDEX ix_parts_id
ON production.parts(part_id);

CREATE CLUSTERED INDEX ix_parts_name
ON production.parts(part_name);-- this query will not run as ix_parts_id clustered is already there


-- NOTE ==>> CLUSTERED INDEX CAN ONLY BE CREATED BY ONCE .....YOU WILL HAVE TO DROP THE EXISTING CLUSTERED INDEX FIRST TO CREATE ANOTHER CLUSTERED INDEX

SELECT * from sales.orders
where order_id = 6


select * from production.parts where part_id = 9999999;



------------------------------NON-CLUSTERED INDEX-----------------------------

CREATE INDEX ix_customers_id
ON sales.orders(customer_id);


SELECT * from sales.orders
where customer_id = 259