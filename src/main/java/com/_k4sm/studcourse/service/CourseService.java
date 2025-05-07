package com._k4sm.studcourse.service;

import com._k4sm.studcourse.entity.Course;
import com._k4sm.studcourse.repository.CourseRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.*;

@Service
public class CourseService {
    private final CourseRepository courseRepo;

    public CourseService(CourseRepository courseRepo) {
        this.courseRepo = courseRepo;
    }

    public List<Course> getAllCourses() {
        return courseRepo.findAll();
    }

    @Transactional
    public Course saveCourse(Course course) {
        return courseRepo.save(course);
    }

    public Optional<Course> getCourseById(Long id) {
        return courseRepo.findById(id);
    }

    @Transactional
    public void deleteCourse(Long id) {
        Course course = courseRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Course not found"));

        // Remove this course from all enrolled students
        course.getStudents().forEach(student -> student.getCourses().remove(course));

        courseRepo.delete(course);
    }
}
