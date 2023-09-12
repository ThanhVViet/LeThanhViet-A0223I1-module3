drop database if exists atagvn;
create database atagvn;
use atagvn;

create table product
(
    ProductID       varchar(20)   not null primary key unique,
    CategoryID      varchar(20)   not null,
    ProductName     nvarchar(255) not null,
    ProductPrice    float         not null,
    QuantityInStock int           not null,
    Image           varchar(255)  not null,
    Status          bit           not null,
    Description     text          not null
);

create table category
(
    CategoryID   varchar(20)   not null primary key unique,
    CategoryName nvarchar(255) not null
);

alter table product
    add foreign key (CategoryID) references category (CategoryID)
        on update cascade;

create table account
(
    AccountID     varchar(20)   not null primary key unique,
    AccountName   nvarchar(255) not null,
    LoginName     varchar(50)   not null,
    Password      varchar(50)   not null,
    AccountAccess varchar(10)   not null,
    Address       varchar(255)  not null,
    PhoneNumber   varchar(255)  not null,
    Gender        bit,
    Status        bit
);

create table orders
(
    OrderID     varchar(20) not null primary key unique,
    AccountID   varchar(20) not null,
    OrderDate   datetime        not null default now(),
    Receiver    nvarchar(255),
    Address     nvarchar(255),
    Email       varchar(50),
    PhoneNumber varchar(20),
    Status      bit default 1
);

alter table orders
    add foreign key (AccountID) references account (AccountID)
        on update cascade;

create table order_product
(
    OrderID   varchar(20) not null,
    ProductID varchar(20) not null,
    Quantity  int         not null,
    PriceEach float,
    AccountID varchar(20) not null,
    primary key (OrderID, ProductID)
);

alter table order_product
    add foreign key (OrderID) references orders (OrderID) on update cascade,
    add foreign key (ProductID) references product (ProductID) on update cascade;

insert into category
values ('0593XQ', 'Samsung');
insert into category
values ('AAPL', 'Apple');

insert into product (ProductID, CategoryID, ProductName, ProductPrice, QuantityInStock, Image, Status, Description)
values ('SSGA11', '0593XQ', 'Galaxy A11', 3690000, 50, 'img/product/Galaxy-A11.PNG', 1,
        '<p>Màn hình Infinity-O siêu tràn viền 6.4 inch<br>
        Vì là smartphone giá rẻ, Galaxy A11 không dùng màn hình AMOLED<br>
        thường thấy của Samsung, thay vào đó là màn hình PLS TFT độ phân giải HD+.<br>
        Điểm cộng cho màn hình của máy là kích thước đến 6.4 inch rộng rãi, <br>
        phù hợp nhiều nhu cầu sử dụng khác nhau.</p>'),
       ('SSGA31', '0593XQ', 'Galaxy A31', 6490000, 20, 'img/product/Galaxy-A31.PNG', 1,
        '<p>Thiết kế đặc trưng của dòng Galaxy A 2020<br>
        Tổng thể thiết kế của Galaxy A31 mang nhiều nét tương đồng<br>
        với hai người anh em Galaxy A31 và A71. Mặt lưng của thiết bị<br>
        vẫn được tạo điểm nhấn với cụm camera lớn và các vân kim cương đẹp mắt.</p>'),
       ('SSGAF', '0593XQ', 'Galaxy Fold', 50000000, 30, 'img/product/Galaxy-Fold.PNG', 1,
        '<p>Thiết kế 2 màn hình, màn hình uốn dẻo<br>
        Samsung Galaxy Fold không chỉ sở hữu một màn hình<br>
        có thể uốn dẻo mà còn có một màn hình riêng,<br>
        để có thể sử dụng độc lập khi gập máy lại.</p>'),
       ('SSGAZF', '0593XQ', 'Galaxy Z Flip', 36000000, 10, 'img/product/Galaxy-Z-Flip.PNG', 1,
        '<p>Đột phá với thiết kế màn hình gập<br>
        Samsung Galaxy Z Flip được thiết kế với kiểu dáng màn hình gập<br>
        lấy ý tưởng từ dòng sản phẩm Galaxy Fold từng gây nhiều tiếng vang trong năm 2019.</p>'),
       ('SSGAS2U', '0593XQ', 'Galaxy S20 Ultra', 29990000, 40, 'img/product/Galaxy-S20-Ultra.PNG', 1,
        '<p>Đột phá màn hình siêu tràn viền kích thước lớn<br>
        Galaxy S20 Ultra được trang bị một màn hình kích thước 6.9 inch<br>
        sử dụng tấm nền Dynamic AMOLED 2X<br>
        cho chất lượng hiển thị hình ảnh trung thực, sắc nét đến từng chi tiết.</p>'),
       ('SSGAN1P', '0593XQ', 'Galaxy Note 10+', 26990000, 25, 'img/product/Galaxy-Note-10+.PNG', 1,
        '<p>Camera đứng đầu thế giới<br>
        DxOMark là chuyên trang đánh giá camera uy tín thế giới mới đây đã khẳng định,<br>
        Galaxy Note 10+ là chiếc smartphone có camera tốt nhất hiện nay.</p>'),
       ('SSGAS2P', '0593XQ', 'Galaxy S20+', 23990000, 50, 'img/product/Galaxy-S20+.PNG', 1,
        '<p>Thiết kế màn hình tràn viền, siêu mượt 120 Hz<br>
        Thiết kế của chiếc điện thoại Samsung Galaxy S20 Plus<br>
        là kính kết hợp độc đáo giữa với khung kim loại cùng mặt lưng<br>
        kính cường lực Gorilla Glass 6 thế hệ mới nhất<br>
        cho khả năng chống chịu trầy xước và va đập tốt.</p>'),
       ('SSGAA8', '0593XQ', 'Galaxy A80', 14990000, 20, 'img/product/Galaxy-A80.PNG', 1,
        '<p>Camera vừa trượt vừa xoay đầu tiên trên thế giới
        Thực tế thì xu hướng màn hình tràn viền đã bắt đầu<br>
        cách đây khá lâu nhưng có rất ít các hãng có thể mang<br>
        một màn hình tràn viền đúng nghĩa lên chiếc smartphone của mình.</p>'),
       ('SSGAN1L', '0593XQ', 'Galaxy Note 10 Lite', 12490000, 35, 'img/product/Galaxy-Note-10-Lite.PNG', 1,
        '<p>Ngoại hình mới mẻ theo xu thế<br>
        Samsung Galaxy Note 10 Lite nhìn chung vẫn sở hữu thiết kế quen thuộc<br>
        của dòng Note 10 series ở mặt trước với rất ít viền xung quanh,<br>
        các góc được bo tròn, một camera selfie nằm trong lỗ đục chính giữa.</p>'),
       ('IP1164', 'AAPL', 'Iphone 11 64GB', 21690000, 50, 'img/product/Iphone-11-64GB.PNG', 1,
        '<p>Nâng cấp mạnh mẽ về camera<br>
        Nói về nâng cấp thì camera chính là điểm<br>
        có nhiều cải tiến nhất trên thế hệ iPhone mới.</p>'),
       ('IP11PM5', 'AAPL', 'Iphone 11 Pro Max 512GB', 41990000, 20, 'img/product/Iphone-11-Pro-Max-512GB.PNG', 1,
        '<p>Pro về camera sau<br>
        Camera là một trong những điểm nâng cấp mạnh mẽ nhất<br>
        năm nay Apple mang đến cho chiếc iPhone 11 Pro Max.</p>'),
       ('IP11PM2', 'AAPL', 'Iphone 11 Pro Max 256GB', 37990000, 30, 'img/product/Iphone-11-Pro-Max-256GB.PNG', 1,
        '<p>Pro về camera sau<br>
        Camera là một trong những điểm nâng cấp mạnh mẽ nhất<br>
        năm nay Apple mang đến cho chiếc iPhone 11 Pro Max.</p>'),
       ('IP11PM6', 'AAPL', 'Iphone 11 Pro Max 64GB', 33990000, 30, 'img/product/Iphone-11-Pro-Max-64GB.PNG', 1,
        '<p>Camera được cải tiến mạnh mẽ<br>
        Chắc chắn lý do lớn nhất mà bạn muốn nâng cấp lên iPhone 11 Pro Max<br>
        chính là cụm camera mới được Apple nâng cấp rất nhiều.</p>'),
       ('IPXSM2', 'AAPL', 'Iphone Xs Max 256GB', 33990000, 25, 'img/product/Iphone-Xs-Max-256GB.PNG', 1,
        '<p>Hiệu năng đỉnh cao cùng chip Apple A12<br>
        iPhone Xs Max được Apple trang bị cho con chip mới toanh<br>
        hàng đầu của hãng mang tên Apple A12.</p>'),
       ('IP11P6', 'AAPL', 'Iphone 11 Pro 64GB', 30190000, 40, 'img/product/Iphone-11-Pro-64GB.PNG', 1,
        '<p>Camera được cải tiến mạnh mẽ<br>
        Chắc chắn lý do lớn nhất mà bạn muốn nâng cấp lên iPhone 11 Pro Max<br>
        chính là cụm camera mới được Apple nâng cấp rất nhiều.</p>'),
       ('IPXM6', 'AAPL', 'Iphone Xs Max 64GB', 25990000, 50, 'img/product/Iphone-Xs-Max-64GB.PNG', 1,
        '<p>Thiết kế cao cấp với viền thép không gỉ và mặt kính cường lực<br>
        Điện thoại iPhone Xs Max sở hữu lối thiết kế vô cùng đẹp mắt<br>
        với những đường cong mềm mại được thừa hưởng từ chiếc iPhone đời trước đó.</p>'),
       ('IP112', 'AAPL', 'Iphone 11 256GB', 25690000, 20, 'img/product/Iphone-11-256GB.PNG', 1,
        '<p>Pro về camera sau<br>
        Camera là một trong những điểm nâng cấp mạnh mẽ nhất năm nay<br>
        Apple mang đến cho chiếc iPhone 11 Pro Max.</p>'),
       ('IP8P6', 'AAPL', 'Iphone 8 Plus 64GB', 14990000, 10, 'img/product/Iphone-8-Plus-64GB.PNG', 1,
        '<p>Thừa hưởng những thiết kế đã đạt đến độ chuẩn mực,<br>
        thế hệ iPhone 8 Plus thay đổi phong cách bóng bẩy hơn<br>
        và bổ sung hàng loạt tính năng cao cấp cho trải nghiệm sử dụng vô cùng tuyệt vời.'),
       ('IP73', 'AAPL', 'Iphone 7 32 GB', 12990000, 5, 'img/product/Iphone-7-32-GB.PNG', 1,
        '<p>Mặc dù giữ nguyên vẻ bề ngoài so với dòng điện thoại iPhone đời trước,<br>
        bù lại iPhone 7 Plus 32GB lại được trang bị nhiều nâng cấp<br>
        đáng giá như camera kép đầu tiên cũng như cấu hình mạnh mẽ.</p>');

insert into account (AccountID, AccountName, LoginName, Password, AccountAccess, Address, PhoneNumber, Gender, Status)
values ('AD1', 'Thinh Bui', 'mrthinh2502', 'thinhba', 1, 'Moon City', '0969357766', 1, 1),
       ('CT1', 'Linh Hoang', 'linhhm', 'linh123', 0, '111 Van Cao', '0913026630', 0, 1),
       ('AD2', 'admin', 'admin', 'admin', 1, '111 Van Cao', '0913026630', 0, 1),
       ('CT2', 'Binh Nguyen', 'binh491', 'binh123', 0, '50 Pham Hung', '0969358899', 1, 1),
       ('CT3', 'Huynh Bui', 'huynhhuynh', 'huynhbui123', 0, 'Royal City', '0966351299', 0, 0);

insert into orders (OrderID, AccountID, OrderDate)
values ('OD300401', 'CT1', '2020-03-11'),
       ('OD300402', 'CT3', '2020-03-12'),
       ('OD010501', 'CT2', '2020-03-13'),
       ('OD050501', 'CT3', '2020-03-14'),
       ('OD100501', 'CT1', '2020-03-15');

insert into order_product (OrderID, ProductID, Quantity, PriceEach, AccountID)
values ('OD300401', 'SSGAF', 1, 50000000,'CT1'),
       ( 'OD300402', 'IP73', 3, 12990000,'CT3'),
       ( 'OD300402', 'IP1164', 1, 30190000,'CT3'),
       ( 'OD010501', 'SSGA11', 2, 3690000,'CT2'),
       ( 'OD050501', 'SSGAS2P', 1, 23990000,'CT3'),
       ( 'OD100501', 'IP11PM2', 1, 37990000,'CT1');


delimiter //
create procedure reportByNameAndTime (in name varchar(255),in startDate datetime,in endDate datetime)
begin
    select order_product.OrderID, orderDate,AccountName,ProductName,Quantity,PriceEach
    from order_product
             join orders o on order_product.OrderID = o.OrderID
             join product p on order_product.ProductID = p.ProductID
             join account a on o.AccountID = a.AccountID
    where AccountName like name and OrderDate between startDate and endDate;
end //
delimiter ;

delimiter //
create procedure reportByOrderStatus (in status bit)
begin
    select OrderID,OrderDate, AccountName
    from orders
             join account a on orders.AccountID = a.AccountID
    where orders.Status = status;
end //
delimiter ;

delimiter //
create procedure reportRevenue (in startDate datetime,in endDate datetime)
begin
    select orders.OrderID,orders.OrderDate,(Quantity * PriceEach) as total from orders
    join order_product on orders.OrderID = order_product.OrderID
    where OrderDate between startDate and endDate;
end //
delimiter ;

