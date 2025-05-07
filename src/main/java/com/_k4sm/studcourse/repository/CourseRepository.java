package com._k4sm.studcourse.repository;

import com._k4sm.studcourse.entity.Course;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {
}
