SELECT * FROM demo_ss2.student;

use demo_ss2;

select * from  student where `name` like '%hai' or `name` like  '%huynh';

select * from student where `point`> 5;

select * from  student where `name` like 'nguyen%';

SELECT
  `point`,
  COUNT(*) AS so_luong_hoc_sinh
FROM
  student
GROUP BY
  `point`;
  
SELECT
  `point`,
  COUNT(*) AS so_luong_hoc_sinh
FROM
  student
WHERE 
  `point`> 5
GROUP BY
  `point`;
  
SELECT
  `point`,
  COUNT(*) AS so_luong_hoc_sinh 
FROM
  student
WHERE 
  `point`> 5
GROUP BY
  `point`
HAVING
  COUNT(*) >= 2;
  
SELECT
  *
FROM
  student
WHERE
  class_id = 1
ORDER BY
  `name` like '%name' ASC;