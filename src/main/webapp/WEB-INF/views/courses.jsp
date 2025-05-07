<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Management</title>
    <link rel="stylesheet" href="<c:url value='/style.css'/>">
</head>
<body>
    <div class="container">
        <h2>Course Directory</h2>

        <a href="<c:url value='/courses/add'/>" class="btn mb-20">+ Add New Course</a>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Course Title</th>
                        <th>Description</th>
                        <th>Enrolled Students</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="course" items="${courses}">
                        <tr>
                            <td>${course.id}</td>
                            <td>
                                <strong>${course.title}</strong>
                            </td>
                            <td>
                                <div class="course-description">
                                    ${course.description}
                                </div>
                            </td>
                            <td>
                                <span class="student-count">
                                    ${course.students.size()} students
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <a href="<c:url value='/'/>" class="btn btn-secondary mt-20">← Back to Home</a>
    </div>
</body>
</html>
