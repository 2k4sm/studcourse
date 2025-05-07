<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <link rel="stylesheet" href="<c:url value='/style.css'/>">
</head>
<body>
    <div class="container">
        <h2>Add New Student</h2>

        <form:form method="post" modelAttribute="student">
            <div class="form-group">
                <label for="name">Name</label>
                <form:input path="name" id="name" required="true"/>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <form:input path="email" id="email" type="email" required="true"/>
            </div>

            <div class="form-group">
                <label>Courses</label>
                <div class="course-selection">
                    <c:forEach items="${courses}" var="course">
                        <div class="course-checkbox">
                            <form:checkbox path="courses" value="${course.id}" id="course${course.id}"/>
                            <label for="course${course.id}">${course.title}</label>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <button type="submit" class="btn">Save Student</button>
            <a href="<c:url value='/students'/>" class="btn btn-secondary">Cancel</a>
        </form:form>
    </div>
</body>
</html>
