-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
select *
from student s
join class c
on s.class_id = c.id;

-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào 
-- và cả các bạn đã đăng ký nhưng chưa có lớp học.
select *
from student s
left join class c
on s.class_id = c.id;

-- 4. Lấy thông tin của các học viên tên “Hai” và 'Huynh’.
select *
from student s 
where s.name like '%hai' or s.name like '%huynh';

-- 4.1 Lấy thông tin của các học viên tên bắt đầu = 'h'.
select *
from student s 
where substring_index(name," ",-1) like 'h%';

-- 5. Lấy ra học viên có điểm lớn hơn 5.
select *
from student 
where point > 5;

-- 6. Lấy ra học viên có họ là “nguyen”
select *
from student s 
where s.name like 'nguyen%';

-- 7. Thông kế số lượng học sinh theo từng loại điểm.
select point, count(*) as "số lượng học viên"
from student
group by point;

-- 8. Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5
select point, count(*) as "số lượng học viên"
from student
where point > 5
group by point;
-- 9. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select point, count(*) as "số lượng học viên"
from student
where point > 5
group by point
having count(*) >= 2;

-- 10. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet.

select *
from student s
join class c
on s.class_id = c.id
where c.name = "c1121g1"
order by substring_index(s.name," ",-1) desc;


select *
from student s
join class c on s.class_id = c.id
join instructor_class ic on c.id = ic.class_id
join instructor i on ic.instructor_id = i.id
where c.name = "c1121g1";
