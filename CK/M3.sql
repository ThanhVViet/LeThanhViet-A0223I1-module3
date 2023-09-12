create schema test;
use test;

create table category(
id int primary key AUTO_INCREMENT,
category_name varchar(255)
);
CREATE TABLE product (
    id INT NOT NULL auto_increment,
    product_name VARCHAR(255),
    product_price double,
    product_quantity int,
    product_color VARCHAR(255),
    product_des VARCHAR(255),
    category_id INT,
    foreign key (category_id) references category(id),
    PRIMARY KEY (id)
);

DELIMITER //
CREATE PROCEDURE update_product(
  IN p_productID INT,
  IN p_productName varchar(255),
  IN p_productPrice DOUBLE,
  IN p_productQuantity INT,
  IN p_productColor VARCHAR(255),
  IN p_productDes VARCHAR(255),
  IN p_categoryId INT
)
BEGIN
  UPDATE product
  SET
    product_name = p_productName,
    product_price = p_productPrice,
    product_quantity = p_productQuantity,
    product_color = p_productColor,
    product_des = p_productDes,
    category_id = p_categoryId
  WHERE id = p_productID;
END //
DELIMITER ;

delimiter $$
create procedure get_product_by_id(
    in pid int
)
begin
    select * from product where id = pid;
end$$
delimiter ;

delimiter $$
create procedure delete_product(
in pid int
)
begin
    delete from product where id = pid;
end$$
delimiter ;

delimiter $$
create procedure create_product(
in name varchar(50),
in price double,
in quantity int,
in color varchar(255),
in des varchar(255),
in categoryID int
)
begin
    insert into product(product_name, product_price, product_quantity, product_color, product_des, category_id) 
    values (name,price,quantity,color,des,categoryID);

end$$
delimiter ;
