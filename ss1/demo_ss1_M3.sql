CREATE DATABASE if not exists demo_ss1;
use demo_ss1;

CREATE TABLE teacher (
id int primary key auto_increment,
`name` varchar(50),
date_of_birth date,
address varchar(255)
);

INSERT INTO teacher(`name`,date_of_birth,address)
VALUES ("Công","1991-10-09","Đà Nẵng");
INSERT INTO teacher(`name`,date_of_birth,address)
VALUES ("Quang","1995-01-01","Quảng Trị");
INSERT INTO teacher(`name`,date_of_birth,address)
VALUES ("Anh TrungDP","1985-01-01","Huế"),
		("Anh Chánh","1984-01-01","Quảng Nam");
INSERT INTO teacher(address)
VALUES ("Hà Nội");

SELECT *
FROM teacher;

UPDATE teacher 
SET address = 'Đà Lạt' 
WHERE (`id` = 1);

DELETE FROM teacher
WHERE (`id` = 5);
