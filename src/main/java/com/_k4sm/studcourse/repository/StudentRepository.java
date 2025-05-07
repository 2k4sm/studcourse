package com._k4sm.studcourse.repository;

import com._k4sm.studcourse.entity.Student;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
}
