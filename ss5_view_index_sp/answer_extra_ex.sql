explain select * from student
where name = 'nguyen ngoc cu';


-- đánh index cho name
create index index_student_name
on student(name);



drop index index_student_name on student;

-- ========== View ==========
select * from student;
-- Tạo view chỉ chứa thông tin id và name của student
create view view_student(id, namess) as
select id, name from student;

select * from view_student
order by id;

update view_student
set namess = 'nguyen ngoc cu'
where id = 1;
​
-- ========== Stored Procedure ==========
-- Java: viết hàm void có tên là findByName, có tham số truyền vào là name
-- void findByName(String name) {
--   // Body
-- }
-- ========== IN ==========
delimiter //
create procedure find_by_name(in name varchar(50)) -- mặc định tham số là in
begin
	select * 
    from student s
    where s.name = name;
end //
delimiter ;
call find_by_name('nguyen ngoc cu');
call find_by_name('le hai chung');
​
-- ========== OUT ==========
delimiter //
create procedure find_by_name_out(in name varchar(50), out count int) -- mặc định tham số là in
begin
    select count(*) into count 
    from student s 
    where s.name = name;
end //
delimiter ;

call find_by_name_out('Nguyễn Văn A', @count);
select @count;
​
​
-- ========== INOUT ==========
delimiter //
create procedure find_by_name_inout(inout name varchar(50))
begin
	set name = (
    select count(*) from student s
    where s.name = name
    );
end //
delimiter ;

set @abc = 'Nguyễn Văn A';
select @abc;
call find_by_name_inout(@abc);
select @abc;
​
​
-- 4 viêt 1 function xếp loại học lưc theo point
delimiter //
create function f_xep_loai(diem int)
returns varchar(50)
deterministic
begin
	declare loai varchar(50);
	if diem>=8 then
	set loai ='giỏi';
	elseif diem>=7 then
	set loai='khá';
	else
	set loai='trung bình';
	end if;
	return loai;
end //
delimiter ;
-- sử dụng function
select s.name, f_xep_loai(s.point) 
from student s;









-- 5 tạo trigger tự động tạo tài khoản jame trước khi thêm mới một học viên
 select * from student;
 select * from jame;
​
DELIMITER //
CREATE TRIGGER tr_auto_create_jame 
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
insert into jame(`account`, `password`) values ( new.email, '123');
END //
DELIMITER ;

insert into student(`name`,birthday, email, gender,`point`, class_id,`account`) 
values ('Thanh Ngân','1992-12-12','ngant@gmail.com',1,8,1,'ngant@gmail.com');
 
 
 
 