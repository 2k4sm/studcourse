package com._k4sm.studcourse.controller;

import com._k4sm.studcourse.entity.Student;
import com._k4sm.studcourse.entity.Course;
import com._k4sm.studcourse.service.StudentService;
import com._k4sm.studcourse.service.CourseService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class StudCourseController {
    private final StudentService studentService;
    private final CourseService courseService;

    public StudCourseController(StudentService studentService, CourseService courseService) {
        this.studentService = studentService;
        this.courseService = courseService;
    }

    @GetMapping("/")
    public String home() {
        return "home";
    }

    // Students endpoints
    @GetMapping("/students")
    public String listStudents(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        return "students";
    }

    @GetMapping("/students/add")
    public String addStudentForm(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("courses", courseService.getAllCourses());
        return "add-student";
    }

    @PostMapping("/students/add")
    public String saveStudent(@ModelAttribute Student student) {
        studentService.saveStudent(student);
        return "redirect:/students";
    }

    @GetMapping("/students/edit/{id}")
    public String editStudent(@PathVariable Long id, Model model) {
        Student student = studentService.getStudentById(id)
                .orElseThrow(() -> new RuntimeException("Student not found"));
        model.addAttribute("student", student);
        model.addAttribute("courses", courseService.getAllCourses());
        return "update-student";
    }

    @PostMapping("/students/update")
    public String updateStudent(@ModelAttribute Student student) {
        studentService.saveStudent(student);
        return "redirect:/students";
    }

    @DeleteMapping("/students/{id}")
    @ResponseBody
    public ResponseEntity<?> deleteStudent(@PathVariable Long id) {
        try {
            if (studentService.canDeleteStudent(id)) {
                studentService.deleteStudent(id);
                return ResponseEntity.ok().build();
            }
            return ResponseEntity.badRequest()
                    .body("Cannot delete student who is enrolled in courses");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    // Courses endpoints
    @GetMapping("/courses")
    public String listCourses(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "courses";
    }

    @GetMapping("/courses/add")
    public String addCourseForm(Model model) {
        model.addAttribute("course", new Course());
        return "add-course";
    }

    @PostMapping("/courses/add")
    public String saveCourse(@ModelAttribute Course course) {
        courseService.saveCourse(course);
        return "redirect:/courses";
    }

    @DeleteMapping("/courses/{id}")
    @ResponseBody
    public ResponseEntity<?> deleteCourse(@PathVariable Long id) {
        try {
            courseService.deleteCourse(id);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
