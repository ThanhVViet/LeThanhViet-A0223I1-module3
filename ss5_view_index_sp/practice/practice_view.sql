use classicmodels;

CREATE VIEW customer_views AS

SELECT customerNumber, customerName, phone

FROM  customers;

select * from customer_views;

-- cap nhat view 

-- CREATE OR REPLACE VIEW view_name AS

-- SELECT column1, column2, ...

-- FROM table_name

CREATE OR REPLACE VIEW customer_views AS

SELECT customerNumber, customerName, contactFirstName, contactLastName, phone

FROM customers

WHERE city = 'Nantes';


DROP VIEW customer_views;