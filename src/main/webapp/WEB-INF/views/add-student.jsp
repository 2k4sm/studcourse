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
        <form:form method="post" modelAttribute="student" action="${pageContext.request.contextPath}/students/add">
            <div class="form-group">
                <label for="name">Full Name</label>
                <form:input path="name" id="name" placeholder="Enter student's full name"/>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <form:input path="email" id="email" placeholder="Enter student's email"/>
            </div>

            <div class="form-group">
                <label>Course Selection</label>
                <div class="select-courses">
                    <c:forEach items="${courses}" var="course">
                        <label>
                            <form:checkbox path="courses" value="${course.id}"/>
                            ${course.title}
                        </label>
                    </c:forEach>
                </div>
            </div>

            <div class="form-group">
                <button type="submit" class="btn">Save Student</button>
                <a href="<c:url value='/students'/>" class="btn btn-secondary">Cancel</a>
            </div>
        </form:form>
    </div>
</body>
</html>
