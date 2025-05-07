<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Students</title>
  <link rel="stylesheet" href="<c:url value='/static/style.css'/>">
</head>
<body class="container">
  <h2>All Students</h2>
  <p><a href="<c:url value='/students/add'/>">+ Add New Student</a></p>
  <table>
    <thead>
      <tr>
        <th>ID</th><th>Name</th><th>Email</th><th>Courses</th><th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="stu" items="${students}">
        <tr>
          <td>${stu.id}</td>
          <td>${stu.name}</td>
          <td>${stu.email}</td>
          <td>
            <c:forEach var="c" items="${stu.courses}">
              ${c.title}<c:if test="${!c_last}">, </c:if>
            </c:forEach>
          </td>
          <td><a href="<c:url value='/students/edit/${stu.id}'/>">Edit</a></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <p><a href="<c:url value='/'/>">← Home</a></p>
</body>
</html>
