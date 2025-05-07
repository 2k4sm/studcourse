package com._k4sm.studcourse.service;

import com._k4sm.studcourse.entity.Student;
import com._k4sm.studcourse.repository.StudentRepository;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class StudentService {
    private final StudentRepository repo;

    public StudentService(StudentRepository repo) {
        this.repo = repo;
    }

    public List<Student> getAllStudents() {
        return repo.findAll();
    }

    public Student saveStudent(Student student) {
        return repo.save(student);
    }

    public Optional<Student> getStudentById(Long id) {
        return repo.findById(id);
    }
}
