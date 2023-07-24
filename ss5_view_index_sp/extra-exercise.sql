-- 1. Tạo 1 Store Procedure có tên findByName với tham số truyền vào là name để tìm các record 

use demo_ss2;

DELIMITER //
create procedure findByName_1 ( in `name` varchar(55), out `name_out` varchar(55))
begin
set name_out=(select s.name from student s where s.name = `name`);
end;
   //
delimiter ;

  call findByName_1 ('nguyen ngoc cu',@isPresent);
  
DELIMITER $$

CREATE PROCEDURE findByName (
    s_name VARCHAR(50)
)
BEGIN

    SELECT *
    FROM student s
    WHERE name = s_name;

END
$$
DELIMITER ;

CALL findByName('nguyen ngoc cu');

DELIMITER $$

CREATE PROCEDURE findByName_2 (
    s_name VARCHAR(50)
)
BEGIN

    SELECT *
    FROM student s
    WHERE name LIKE '%s_name';

END
$$
DELIMITER ;

CALL findByName_2('ngoc cu');

  
  -- 2. Tạo 1 Trigger tự động tạo tài khoản jame trước khi thêm mới một học viên
  
-- Assuming you have a table 'students' with columns 'student_id', 'student_name', 'email', and 'date_of_birth'
-- and a table 'accounts' with columns 'account_id', 'student_id', 'username', and 'password'

DELIMITER //

CREATE TRIGGER `create_account_trigger` BEFORE INSERT ON student
FOR EACH ROW
BEGIN
  -- Generate a random username based on student's name and ID
  -- SET @username = CONCAT(SUBSTRING(NEW.name, 1, 4), NEW.id);
  
  SET @username = NEW.name;

  -- Generate a random password (you can customize this logic as per your requirements)
 -- SET @password = MD5(UUID());
  
  SET @password = NEW.name;

  -- Insert the new account record into the 'accounts' table
  INSERT INTO `jame` (account, password)
  VALUES (@username, @password);
END;
//

DELIMITER ;

DROP TRIGGER create_account_trigger;

INSERT INTO student (id, name, email, birthday)
VALUES (15, 'viẻt', 'van.a@example.com', '2000-01-01');

SELECT * FROM  jame;

-- 3. Viết function xếp loại học lưc theo point. >= 8 là loại giỏi, >= 6 là khá  còn lại là yếu,


DELIMITER $$

CREATE PROCEDURE grade_student(point INT)

BEGIN

  SELECT name, point,
    CASE
        WHEN point >= 8 THEN 'Giỏi'
        WHEN point >= 6 THEN 'Khá'
        ELSE 'Yếu'
    END as 'Học lực'
FROM student;

END;


DELIMITER ;


DELIMITER $$
 
DROP PROCEDURE IF EXISTS `docSo`$$
 
CREATE PROCEDURE `docSo`(IN a INT(11))
BEGIN
 
    DECLARE message VARCHAR(255);
     
    CASE a
        WHEN 0 THEN
            SET message = 'KHONG';
        WHEN 1 THEN
            SET message = 'MOT';
        WHEN 2 THEN
            SET message = 'HAI';
        ELSE
            SET message = 'KHONG TIM THAY';
                 
    END CASE;
     
    SELECT message;
     
END$$
 
DELIMITER ;
















