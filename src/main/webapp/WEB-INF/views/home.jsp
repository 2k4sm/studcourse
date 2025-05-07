<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Course Management</title>
    <link rel="stylesheet" href="<c:url value='/style.css'/>">
</head>
<body>
    <div class="container">
        <h1>Student Course Management</h1>
        <nav>
            <ul>
                <li><a href="<c:url value='/students'/>" class="btn">Manage Students</a></li>
                <li><a href="<c:url value='/courses'/>" class="btn">Manage Courses</a></li>
            </ul>
        </nav>
    </div>
</body>
</html>
