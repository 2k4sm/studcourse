package com._k4sm.studcourse.service;

import com._k4sm.studcourse.entity.Student;
import com._k4sm.studcourse.repository.StudentRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.*;

@Service
public class StudentService {
    private final StudentRepository studentRepo;

    public StudentService(StudentRepository studentRepo) {
        this.studentRepo = studentRepo;
    }

    public List<Student> getAllStudents() {
        return studentRepo.findAll();
    }

    @Transactional
    public Student saveStudent(Student student) {
        if (student.getId() != null) {
            Student existing = studentRepo.findById(student.getId())
                    .orElseThrow(() -> new RuntimeException("Student not found"));
            existing.setName(student.getName());
            existing.setEmail(student.getEmail());
            existing.setCourses(student.getCourses());
            return studentRepo.save(existing);
        }
        return studentRepo.save(student);
    }

    public Optional<Student> getStudentById(Long id) {
        return studentRepo.findById(id);
    }

    @Transactional
    public void deleteStudent(Long id) {
        Student student = studentRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Student not found"));
        if (!student.getCourses().isEmpty()) {
            throw new RuntimeException("Cannot delete student enrolled in courses");
        }
        studentRepo.delete(student);
    }

    public boolean canDeleteStudent(Long id) {
        return getStudentById(id)
                .map(student -> student.getCourses().isEmpty())
                .orElse(false);
    }
}
