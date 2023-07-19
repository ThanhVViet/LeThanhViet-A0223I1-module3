use QuanLyBanHang;

insert into customer(c_name, c_age)
value ('Minh Quan', '2013-12-12');

insert into customer(c_name, c_age)
value ('Ngoc Oanh', '2003-12-12');

insert into customer(c_name, c_age)
value ('Hong Ha', '1973-12-12');

select * from customer;

insert into c_order (c_id, o_date) value(1, '2006-03-21');
insert into c_order (c_id, o_date) value(2, '2006-03-23');
insert into c_order (c_id, o_date) value(1, '2006-03-21');


insert into product (p_name, p_price) value('May Giat', 3);
insert into product (p_name, p_price) value('Tu Lanh', 5);
insert into product (p_name, p_price) value('Dieu Hoa', 7);
insert into product (p_name, p_price) value('Quat', 1);
insert into product (p_name, p_price) value('Bep Dien', 2);


insert into order_detail (order_id, p_id, order_quanity) value(1,1,3);
insert into order_detail (order_id, p_id, order_quanity) value(1,3,7);
insert into order_detail (order_id, p_id, order_quanity) value(1,4,2);
insert into order_detail (order_id, p_id, order_quanity) value(2,1,1);
insert into order_detail (order_id, p_id, order_quanity) value(3,1,8);
insert into order_detail (order_id, p_id, order_quanity) value(2,5,4);
insert into order_detail (order_id, p_id, order_quanity) value(2,3,3);

select * from c_order; 

select customer.c_name, customer.c_age, product.p_name from customer 
join c_order co on co.c_id = customer.id
join order_detail od on od.order_id = co.id
join product on product.id = od.p_id;



select *
from customer
left join c_order on customer.id = c_order.c_id
where c_order.id is null;
# CACH 2
select *
from customer
where id not in (SELECT c_id from c_order);

select co.id, co.o_date, sum(p.p_price * od.order_quanity)
from c_order co
join order_detail od on co.id = od.order_id
join product p on od.p_id = p.id
group by co.id;



