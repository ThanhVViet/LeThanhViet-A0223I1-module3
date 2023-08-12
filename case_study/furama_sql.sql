
use furama;

create table vi_tri(
ma_vi_tri INT PRIMARY KEY auto_increment,
ten_vi_tri VARCHAR(55)
);

create table trinh_do(
ma_trinh_do INT PRIMARY KEY auto_increment,
ten_trinh_do VARCHAR(55)
);

create table bo_phan(
ma_bo_phan INT PRIMARY KEY auto_increment,
ten_bo_phan VARCHAR(55)
);

create table nhan_vien(
ma_nhan_vien INT PRIMARY KEY auto_increment,
ho_ten VARCHAR(55),
ngay_sinh DATE,
so_cmnd VARCHAR(55),
luong DOUBLE,
so_dien_thoai VARCHAR(55),
emai VARCHAR(55),
dia_chi VARCHAR(55),
ma_vi_tri INT,
ma_trinh_do INT,
ma_bo_phan INT,
FOREIGN KEY (ma_vi_tri)  REFERENCES vi_tri(ma_vi_tri),
FOREIGN KEY (ma_trinh_do)  REFERENCES trinh_do(ma_trinh_do),
FOREIGN KEY (ma_bo_phan)  REFERENCES bo_phan(ma_bo_phan)
);

create table loai_khach(
ma_loai_khach  INT PRIMARY KEY auto_increment,
ten_loai_khach VARCHAR(55)
);

create table khach_hang(
ma_khach_hang INT PRIMARY KEY auto_increment,
ma_loai_khach INT,
ho_ten VARCHAR(55),
ngay_sinh DATE,
gioi_tinh BIT(1),
so_cmnd VARCHAR(55),
so_dien_thoai VARCHAR(55),
emai VARCHAR(55),
dia_chi VARCHAR(55),
FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

create table kieu_thue (
ma_kieu_thue INT PRIMARY KEY auto_increment,
ten_kieu_thue VARCHAR(55)
);

create table loai_dich_vu (
ma_loai_dich_vu INT PRIMARY KEY auto_increment,
ten_loai_dich_vu VARCHAR(55)
);

create table dich_vu (
ma_dich_vu INT PRIMARY KEY auto_increment,
ten_dich_vu VARCHAR(55),
dien_tich INT,
chi_phi_thue DOUBLE,
so_nguoi_toi_da INT,
ma_kieu_thue INT,
ma_loai_dich_vu INT,
tieu_chuan_phong VARCHAR(55),
mo_ta_tien_nghi_khac VARCHAR(55),
dien_tich_ho_boi DOUBLE,
so_tang INT,
FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

create table hop_dong(
ma_hop_dong INT PRIMARY KEY auto_increment,
ngay_lam_hop_dong DATETIME,
ngay_het_hop_dong DATETIME,
tien_dat_coc DOUBLE,
ma_nhan_vien INT,
ma_khach_hang INT,
ma_dich_vu INT,
FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

create table dich_vu_di_kem (
ma_dich_vu_di_kem INT PRIMARY KEY auto_increment,
ten_dich_vu_di_kem VARCHAR(55),
gia DOUBLE,
don_vi VARCHAR(10),
trang_thai VARCHAR(55)
);

create table hop_dong_chi_tiet (
ma_hop_dong_chi_tiet INT PRIMARY KEY auto_increment,
ma_hop_dong INT,
ma_dich_vu_di_kem INT,
so_luong INT,
FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);


INSERT INTO vi_tri (ma_vi_tri, ten_vi_tri)
VALUE(1, 'Quản Lý'),
	 (2, 'Nhân Viên');
     
INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do)
VALUE(1, 'Trung Cấp'),
     (2, 'Cao Đẳng'),
     (3, 'Đại Học'),
     (4, 'Sau Đại Học');
     
INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan)
VALUE(1, 'Tiếp thị'),
	 (2, 'Nhân sự'),
     (3, 'Kỹ thuật'),
     (4, 'Quản lý');
     
INSERT INTO nhan_vien
VALUE(1, 'Lê Thanh Việt', '2003-03-02',	'749645283',7700000, '0328382701', 'vietle@gmail.com', '131 Đỗ Thúc Tịnh, Đà Nẵng',	1, 3, 1),
     (2, 'Trần Kim Tiến', '1003-12-09', '984673272', 7000000, '0748473928', 'kimtien@gmail.com', '33 Lê Đại Hành, Đà Nẵng', 1, 2, 2),
     (3, 'Hữu Hải', '2003-02-22', '639471847', 74000000, '09372894682', 'hh2k3@gmail.com', '11 Điện Biên Phủ, Cà Mau', 1, 3, 2),
     (4, 'Phạm Quốc Tiến', '2003-04-04', '746736837', 27000900, '0874727429', 'tien2003@gmail.com', '89 Lê Duẩn, Quảng Trị', 1, 4, 4),
     (5, 'Đình Khuê', '2003-05-15', '747284864', 10000000, '0964834625', 'khue2003@gmail.com', '9 Lê Đại Hành, Đà Nẵng', 2, 1, 1);
 
INSERT INTO loai_khach (ma_loai_khach, ten_loai_khach)
VALUE(1, 'Diamond'),
     (2, 'Platinium'),
     (3, 'Gold'),
     (4, 'Silver'),
     (5, 'Member');
     
INSERT INTO khach_hang
VALUE(1, 5, 'Lê Thanh Việt', '2003-03-02', 0, '847842947', '0328382701', 'vietle@gmail.com', '133 Đõ Thúc Tịnh, Đà Nẵng'),
     (2, 3, 'Tôn Nữ Thị Muối', '2003-12-19', 0, '846426867', '0387986471', 'tonnu2003@gmail.com', '5 Việt Lê, Quảng Trị'),
     (3, 1, 'Yến Nhi', '2003-05-30', 1, '748364836', '0386947462', 'yen2003@gmail.com', '55 Anh Phan, Huế'),
     (4, 1, 'Dương Ngọc Hải', '2003-12-09', 1, '658463847', '0946847846', 'hai2003@gmail.com', '23 Tôn Đảng, Đà Nẵng'),
     (5, 4, 'Ninh Khánh Duy', '2001-12-09', 0, '756384647', '0367789671', 'duy2k3@gmail.com', '21 Lê Lợi, Quảng Bình'),
     (6, 4, 'Lux', '2008-12-06', 0, '648462847', '0897472914', 'tieuthuanhsang@gmail.com', '07 Điện Biên Phủ, Đà Nẵng'),
     (7, 2, 'Meo', '1999-09-09', 1, '657674679', '0978647273', 'meomei69@gmail.com', '30 Lê Duẩn, Đà Nẵng');
     
INSERT INTO kieu_thue (ma_kieu_thue, ten_kieu_thue)
VALUE(1, 'Year'),
     (2, 'Month'),
     (3, 'Day'),
     (4, 'Hour');

     
INSERT INTO loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu)
VALUE(1, 'Villa'),
     (2, 'House'),
     (3, 'Room');
    
INSERT INTO dich_vu
VALUE(1, 'Villa', 10000, 7000000, 7, 3, 1, 'vip', 'Hồ bơi', 700, 2),
     (2, 'House Of Fame', 7000, 2000000, 5, 2, 2, 'vip', 'Sân sau', null, 2),
     (3, 'Room Twin 01', 700, 1000000, 2, 4, 3, 'normal', 'Máy nóng lạnh', null, null),
     (4, 'Villa Death Bed', 10000, 500000, 7, 3, 1, 'normal', 'Hồ bơi', 300, 3),
     (5, 'House Of Fame No.2', 10000, 2000000, 5, 3, 2, 'normal', 'Sân sau', null, 2),
     (6, 'Room Twin 02', 700, 300000, 2, 4, 3, 'normal', 'Máy nóng lạnh', null, null);


INSERT INTO dich_vu_di_kem
VALUE(1, 'Dù bay', 70000, 'lần', 'an toàn'),
     (2, 'Spa', 100000, 'lần', 'tốt'),
     (3, 'Quầy bar', 20000, 'chai', 'ngon, thức uống đa dạng'),
     (4, 'Đưa đón sân bay', 30000, 'chiếc', 'đúng giờ'),
     (5, 'Cho thuê xe tự lái', 7000, 'chiếc', 'tốt'),
     (6, 'Dịch vỵ trông trẻ', 30000, 'giờ', 'tốt');

     
INSERT INTO hop_dong
VALUE(1, '2023-10-10', '2023-10-11', 70000, 4, 1, 3),
     (2, '2023-05-14', '2020-05-17', 0, 5, 4, 1),
     (3, '2023-12-07', '2023-12-10', 800000, 1, 2, 2),
     (4, '2023-07-14', '2021-07-17', 700000, 2, 7, 5),
     (5, '2023-08-14', '2023-08-17', 0, 3, 3, 6),
     (6, '2023-11-11', '2023-11-12', 79999, 1, 6, 5),
     (7, '2023-09-09', '2023-09-10', 100000, 4, 4, 4),
     (8, '2022-02-22', '2022-02-26', 150000, 3, 4, 1),
     (9, '2023-03-02', '2023-03-03', 0, 1, 2, 3),
     (10, '2023-04-18', '2023-04-20', 98372, 5, 3, 2),
     (11, '2021-12-25', '2021-12-25', 70000, 2, 3, 1),
     (12, '2020-03-12', '2020-05-12', 0, 3, 3, 1);

     
INSERT INTO hop_dong_chi_tiet
VALUE(1,  1, 4, 6),
     (2, 2, 5, 9),
     (3, 3, 6, 12),
     (4, 2, 1, 7),
     (5, 3, 2, 10),
     (6, 2, 3, 11),
     (7, 1, 2, 10),
     (8, 9, 2, 19);
