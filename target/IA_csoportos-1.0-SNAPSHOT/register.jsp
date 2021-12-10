<%--
  Created by IntelliJ IDEA.
  User: ktzs
  Date: 2021. 12. 10.
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
%>
<head>
    <title>Regisztráció</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>A regisztrációhoz adja meg az adatait!</h1>
<c:if test="${not empty param.errorMsg}">
    <div class="error-msg">
            ${param.errorMsg}
    </div>
</c:if>
<c:if test="${not empty param.successMsg}">
    <span style="color: green; font-weight: bold;">
            ${param.successMsg}
    </span>
</c:if>
<form method="POST" action="action.jsp">
    <label for="username">Felhasználónév:</label>
    <input type="text" id="username" name="username"><br>
    <label for="password">Jelszó:</label>
    <input type="password" id="password" name="password"><br>
    <label for="fullname">Teljes név:</label>
    <input type="text" id="fullname" name="fullname"><br>
    <label for="email">E-mail cím:</label>
    <input type="email" id="email" name="email"><br>
    <input type="submit" name="register" value="Regisztráció"></input>
</form>
</body>
</html>
