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
<h1>A szavazás eléréséhez be kell jelentkeznie.
</h1>
<br/>
<c:if test="${not empty param.errorMsg}">
    <span style="color: red; font-weight: bold;">
        ${param.errorMsg}
    </span>
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
    <input type="submit" name="login" value="Bejelentkezés"></input>
</form>
<p>Ha még nem rendelkezik felhasználóval, <a href="register.jsp">regisztráljon!</a></p>
</body>
</html>