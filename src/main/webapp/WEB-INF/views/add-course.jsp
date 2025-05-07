<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add Course</title>
  <link rel="stylesheet" href="<c:url value='/static/style.css'/>">
</head>
<body class="container">
  <h2>Add Course</h2>
  <form:form method="post" modelAttribute="course" action="${pageContext.request.contextPath}/courses/add">
    <table>
      <tr>
        <td><form:label path="title">Title:</form:label></td>
        <td><form:input path="title"/></td>
      </tr>
      <tr>
        <td><form:label path="description">Description:</form:label></td>
        <td><form:textarea path="description" rows="3" cols="30"/></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="Save"/>
        </td>
      </tr>
    </table>
  </form:form>
  <p><a href="<c:url value='/courses'/>">← Back to Courses</a></p>
</body>
</html>
