<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Home</title>
  <link rel="stylesheet" href="<c:url value='/static/style.css'/>">
</head>
<body class="container">
  <h1>Student‑Course Management</h1>
  <nav>
    <ul>
      <li><a href="<c:url value='/students'/>">Manage Students</a></li>
      <li><a href="<c:url value='/courses'/>">Manage Courses</a></li>
    </ul>
  </nav>
</body>
</html>
