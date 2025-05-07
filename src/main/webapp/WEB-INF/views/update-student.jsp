<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Student</title>
  <link rel="stylesheet" href="<c:url value='/static/style.css'/>">
</head>
<body class="container">
  <h2>Update Student</h2>
  <form:form method="post" modelAttribute="student" action="${pageContext.request.contextPath}/students/update">
    <form:hidden path="id"/>
    <table>
      <tr>
        <td><form:label path="name">Name:</form:label></td>
        <td><form:input path="name"/></td>
      </tr>
      <tr>
        <td><form:label path="email">Email:</form:label></td>
        <td><form:input path="email"/></td>
      </tr>
      <tr>
        <td><form:label path="courses">Courses:</form:label></td>
        <td>
          <form:select path="courses" multiple="true" items="${courses}" itemValue="id" itemLabel="title"/>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="Update"/>
        </td>
      </tr>
    </table>
  </form:form>
  <p><a href="<c:url value='/students'/>">← Back to Students</a></p>
</body>
</html>
