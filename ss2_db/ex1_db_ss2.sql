create schema ex_ss2;
create table phieu_xuat(
id int primary key auto_increment,
sopx int,
ngay_xuat date
);

create table vat_tu(
id int primary key auto_increment,
mavtu int,
tenvtu varchar(55)
);

create table phieu_nhap(
id int primary key auto_increment,
so_phieu_nhap int,
ngay_nhap date
);

create table don_dh(
id int primary key auto_increment,
id_ncc int,
so_don_hang int,
ngay_dh date,
foreign key(id_ncc) references nhacc(id)
);

create table so_dien_thoai(
id int primary key auto_increment,
so_dien_thoai varchar(55)
);

create table nhacc(
id int primary key auto_increment,
id_so_dien_thoai int,
mancc int,
ten_ncc varchar(55),
dia_chi varchar(225),
foreign key (id_so_dien_thoai) references so_dien_thoai(id)
);

create table chi_tiet_phieu_xuat(
id_phieu_xuat int,
id_vat_tu int,
sl_xuat int,
don_gia_xuat varchar(55),
primary key(id_phieu_xuat, id_vat_tu),
foreign key (id_phieu_xuat)references phieu_xuat(id),
foreign key(id_vat_tu)references vat_tu(id)
);

create table chi_tiet_phieu_nhap(
id_phieu_nhap int,
id_vat_tu int,
sl_nhap int,
don_gia_nhap varchar(55),
primary key(id_phieu_nhap, id_vat_tu),
foreign key (id_phieu_nhap)references phieu_nhap(id),
foreign key(id_vat_tu)references vat_tu(id)
);

create table chi_tiet_don_dat_hang(
id_don_dat_hang int,
id_vat_tu int,
primary key(id_don_dat_hang, id_vat_tu),
foreign key (id_don_dat_hang)references don_dh(id),
foreign key(id_vat_tu)references vat_tu(id)
);



