<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Courses</title>
    <link rel="stylesheet" href="<c:url value='/style.css'/>">
</head>
<body>
    <div class="container">
        <h2>Course Directory</h2>
        <a href="<c:url value='/courses/add'/>" class="btn">Add New Course</a>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Enrolled Students</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>${course.id}</td>
                        <td>${course.title}</td>
                        <td>${course.description}</td>
                        <td>
                            <span class="course-tag">${course.students.size()} students</span>
                        </td>
                        <td>
                            <button onclick="deleteCourse(${course.id})" class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="<c:url value='/'/>" class="btn btn-secondary">Back to Home</a>
    </div>

    <script>
    function deleteCourse(id) {
        if (confirm('Are you sure you want to delete this course? All student enrollments will be removed.')) {
            fetch(`${pageContext.request.contextPath}/courses/${id}`, {
                method: 'DELETE'
            })
            .then(response => {
                if (response.ok) {
                    window.location.reload();
                } else {
                    return response.text().then(text => alert(text || 'Error deleting course'));
                }
            })
            .catch(error => alert('Error: ' + error));
        }
    }
    </script>
</body>
</html>
