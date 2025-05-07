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

        <a href="<c:url value='/students/add'/>" class="btn mb-20">+ Add New Student</a>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Enrolled Courses</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="stu" items="${students}">
                    <tr>
                        <td>${stu.id}</td>
                        <td>${stu.name}</td>
                        <td>${stu.email}</td>
                        <td>
                            <c:forEach var="c" items="${stu.courses}" varStatus="status">
                                ${c.title}${!status.last ? ', ' : ''}
                            </c:forEach>
                        </td>
                        <td><a href="<c:url value='/students/edit/${stu.id}'/>" class="btn">Edit</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="<c:url value='/'/>" class="btn btn-secondary mt-20">← Back to Home</a>
    </div>
</body>
</html>
