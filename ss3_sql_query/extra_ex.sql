use demo_ss2;

select c.name, count(*) as "số lượng học viên"
from class c
join student s on s.class_id = c.id
group by c.name;

SELECT c.name, MAX(point) AS max_score
FROM student s
join class c on s.class_id = c.id
group by c.name;

select c.name, avg(point) AS max_score
from student s
join class c on s.class_id = c.id
group by c.name;


SELECT s.name, s.point
FROM student s
ORDER BY s.point DESC, s.name
LIMIT 3;

SELECT s.name, s.point
FROM student s
ORDER BY s.point DESC, s.name
LIMIT 1;

SELECT s.name, s.point
FROM student s
WHERE s.point = (SELECT MAX(s.point) FROM student);
