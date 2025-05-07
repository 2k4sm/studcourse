<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Course</title>
    <link rel="stylesheet" href="<c:url value='/style.css'/>">
</head>
<body>
    <div class="container">
        <h2>Add New Course</h2>

        <form:form method="post" modelAttribute="course" action="${pageContext.request.contextPath}/courses/add">
            <div class="form-group">
                <label for="title">Course Title</label>
                <form:input path="title" id="title" placeholder="Enter course title"/>
            </div>

            <div class="form-group">
                <label for="description">Course Description</label>
                <form:textarea path="description" id="description"
                             rows="4" placeholder="Enter course description"
                             class="course-description-input"/>
                <small class="form-text">
                    Provide a clear and concise description of the course content and objectives.
                </small>
            </div>

            <div class="form-group">
                <button type="submit" class="btn">Create Course</button>
                <a href="<c:url value='/courses'/>" class="btn btn-secondary">Cancel</a>
            </div>
        </form:form>
    </div>
</body>
</html>
