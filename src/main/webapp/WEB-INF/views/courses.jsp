<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Courses</title>
  <link rel="stylesheet" href="<c:url value='/static/style.css'/>">
</head>
<body class="container">
  <h2>All Courses</h2>
  <p><a href="<c:url value='/courses/add'/>">+ Add New Course</a></p>
  <table>
    <thead>
      <tr>
        <th>ID</th><th>Title</th><th>Description</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="c" items="${courses}">
        <tr>
          <td>${c.id}</td>
          <td>${c.title}</td>
          <td>${c.description}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <p><a href="<c:url value='/'/>">← Home</a></p>
</body>
</html>
