create schema student_management;
create table class(
id int primary key auto_increment,
class_name nvarchar(255)
);
create table teacher(
teacher_id int primary key auto_increment,
teacher_name nvarchar(255),
teacher_age date,
country nvarchar(255)
);
