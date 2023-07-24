create schema demo;

use demo;

create table products(
id int primary key auto_increment,
p_code varchar(55),
p_price double,
p_name varchar(55),
p_amount int,
p_status int,
p_description varchar(255)
);

insert into products (p_code,p_price,p_name,p_amount,p_status,p_description) values
('p1',100,'viet',1,0,'Nam'),
('p2',100,'Na',2,0,'Cam'),
('p3',100,'Da',8,0,'Da');

-- INDEX

select * from products where p_code = 'p1';

explain select * from products where p_code = 'p1';

alter table products add index idx_product_code(p_code);

create unique index idx_unique_product_code on products (p_code);

create index idx_composite_product_name_product_price on products (p_name, p_price);

explain select * from products where p_name = 'viet' and p_price = 100;

--- VIEW

create view view_products(code,name,price,status) as
select p_code,p_name,p_price,p_status from products;

select * from view_products
order by p_code;

create or replace view view_products AS

select p_code

from products;

drop view view_products;

-- STORE PROCEDURE

delimiter //
create procedure find_all()
begin
	select * 
    from products;
end //
delimiter ;

 call find_all();
 
 
 delimiter //
create procedure add_products(pcode varchar(55), price double, pname varchar(55), amount int, pstatus int, pdescription varchar (255))
begin
	insert into products (p_code,p_price,p_name,p_amount,p_status,p_description) values 
    (pcode, price, pname, amount, pstatus, pdescription);
end //
delimiter ;

call add_products('p4', 200, 'viet2', 3, 1, 'nana');

delimiter //
create procedure edit(pid int,pcode varchar(55), price double, pname varchar(55), amount int, pstatus int, pdescription varchar (255))
begin
    update products
	set  p_code = pcode, p_price = price, p_name = pname,
    p_amount = amount, p_status = pstatus, p_description = pdescription
    where id =pid;
end //
delimiter ;

drop procedure edit;

call edit(1, 'p5', 200, 'ei', 99,1 ,'nammm');

delimiter //
create procedure delete_function(del_id int)
begin
	delete from products where id = del_id;
end //
delimiter ;

 call delete_function(1);



