package com._k4sm.studcourse.service;

import com._k4sm.studcourse.entity.Course;
import com._k4sm.studcourse.repository.CourseRepository;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class CourseService {
    private final CourseRepository repo;

    public CourseService(CourseRepository repo) {
        this.repo = repo;
    }

    public List<Course> getAllCourses() {
        return repo.findAll();
    }

    public Course saveCourse(Course course) {
        return repo.save(course);
    }

    public Optional<Course> getCourseById(Long id) {
        return repo.findById(id);
    }
}
