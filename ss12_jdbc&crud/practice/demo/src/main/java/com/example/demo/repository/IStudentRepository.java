package com.example.demo.repository;


import com.example.demo.model.Student;

import java.sql.SQLException;
import java.util.List;

public interface IStudentRepository {
    List<Student> display();
    void save(Student student);

    void delete(int id) ;
}
