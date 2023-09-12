package com.example.demo.service;


import com.example.demo.model.Student;
import com.example.demo.repository.IStudentRepository;
import com.example.demo.repository.StudentRepository;

import java.util.List;

public class StudentService implements IStudentService{
    private IStudentRepository iStudentRepository = new StudentRepository();
    @Override
    public List<Student> display() {
        return iStudentRepository.display();
    }

    @Override
    public void save(Student student) {
        iStudentRepository.save(student);
    }

    @Override
    public void delete(int id) {
        iStudentRepository.delete(id);
    }
}
