CREATE DATABASE product_management;

use product_management;

CREATE TABLE customer (
	id int PRIMARY KEY AUTO_INCREMENT,
	name_customer VARCHAR(50),
	age DATE
);

CREATE TABLE c_order (
	id int PRIMARY KEY AUTO_INCREMENT,
	customer_id int,
	orderDate datetime,
	total_price double,
	FOREIGN KEY (customer_id) REFERENCES customer (id)
);

CREATE TABLE product (
	id int PRIMARY KEY AUTO_INCREMENT,
	p_name VARCHAR(50),
	price double
);

CREATE TABLE order_detail (
	order_id int,
	product_id int,
	quantity INT,
	PRIMARY KEY (order_id, product_id),
	FOREIGN KEY (order_id) REFERENCES c_order (id),
	FOREIGN KEY (product_id) REFERENCES product (id)
);