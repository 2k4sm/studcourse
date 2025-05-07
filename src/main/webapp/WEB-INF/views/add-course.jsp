<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Course</title>
    <link rel="stylesheet" href="<c:url value='/style.css'/>">
</head>
<body>
    <div class="container">
        <h2>Add New Course</h2>

        <form:form method="post" modelAttribute="course">
            <div class="form-group">
                <label for="title">Course Title</label>
                <form:input path="title" id="title" required="true"/>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <form:textarea path="description" id="description" rows="4"/>
            </div>

            <button type="submit" class="btn">Save Course</button>
            <a href="<c:url value='/courses'/>" class="btn btn-secondary">Cancel</a>
        </form:form>
    </div>
</body>
</html>
