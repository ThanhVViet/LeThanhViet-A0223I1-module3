package com.example.demo.service;


import com.example.demo.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> display();
    void save(Student student);
    void delete(int id);
}
