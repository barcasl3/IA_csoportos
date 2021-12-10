<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page session="true" %>
<!DOCTYPE html>
<html>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
%>
<%
    if(session.getAttribute("username") != null) {
%>
    <jsp:forward page="main.jsp"/>
<%
    }
%>
<head>
    <title>Bejelentkezés</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<sql:setDataSource
    var="felhasznalok"
    driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/users"
    scope="session"
    user="admin"
    password="admin"
/>
<h1>Üdvözöljük a szavazás oldalán!
</h1>
<h3>Kérjük, jelentkezzen be!</h3>
<c:if test="${not empty param.errorMsg}">
    <div class="error-msg">
        ${param.errorMsg}
    </div>
</c:if>
<c:if test="${not empty param.successMsg}">
    <div class="success-msg">
            ${param.successMsg}
    </div>
</c:if>
<form method="POST" action="action.jsp">
    <label for="username">Felhasználónév:</label>
    <input type="text" id="username" name="username"><br>
    <label for="password">Jelszó:</label>
    <input type="password" id="password" name="password"><br>
    <input type="submit" name="login" value="Bejelentkezés"></input>
</form>
<p>Ha még nem rendelkezik felhasználóval, <a href="register.jsp">regisztráljon!</a></p>
</body>
</html>