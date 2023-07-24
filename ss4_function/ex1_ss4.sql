use QuanLySinhVien;
-- 1
select *
from Subject
order by Credit desc
limit 1;

select max(s.Credit) as Credit, s.SubName
from Subject s;

select *
from Subject
where Credit = (select MAX(Credit) from Subject);

-- 2
select s.SubId, s.SubName , MAX(m.Mark) as mark
from Subject s
join Mark m on s.SubId = m.SubId
group by s.SubId
limit 1;

-- 3

select s.StudentName, s.Phone, avg(m.Mark) as Mark
from Student s 
join Mark m on s.StudentId = m.StudentId
group by s.StudentId
order by avg(m.Mark) desc;





