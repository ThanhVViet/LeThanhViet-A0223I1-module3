use QuanLySinhVien;

select * from Student;

select * from Student where StudentName like 'h%';

select * from Class;

select * from Class where month(StartDate) = 12;

select * from Subject where Credit >= 3 AND Credit <= 5;

SET SQL_SAFE_UPDATES = 0;

update Student set ClassId = 2 where StudentName = "Hung";

select StudentName, SubName , Mark
from Student
join Mark on Student.StudentId = Mark.StudentId
join Subject on Mark.SubId = Subject.SubId
order by Mark desc, Student.StudentName;

select Student.StudentName, Subject.SubName , Mark.Mark
from Student, Subject , Mark
where  Mark.StudentId = Student.StudentId
and  Mark.SubId = Subject.SubId
order by Mark desc;






