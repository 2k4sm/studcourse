<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Students</title>
    <link rel="stylesheet" href="<c:url value='/style.css'/>">
</head>
<body>
    <div class="container">
        <h2>Student Directory</h2>
        <a href="<c:url value='/students/add'/>" class="btn">Add New Student</a>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Courses</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        <td>${student.email}</td>
                        <td>
                            <c:forEach var="course" items="${student.courses}" varStatus="status">
                                ${course.title}${!status.last ? ', ' : ''}
                            </c:forEach>
                        </td>
                        <td>
                            <a href="<c:url value='/students/edit/${student.id}'/>" class="btn">Edit</a>
                            <button onclick="deleteStudent(${student.id})" class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="<c:url value='/'/>" class="btn btn-secondary">Back to Home</a>
    </div>

    <script>
    function deleteStudent(id) {
        if (confirm('Are you sure you want to delete this student?')) {
            fetch(`/students/${id}`, {
                method: 'DELETE'
            })
            .then(response => {
                if (response.ok) {
                    window.location.reload();
                } else {
                    return response.text().then(text => alert(text));
                }
            })
            .catch(error => alert('Error: ' + error));
        }
    }
    </script>
</body>
</html>
