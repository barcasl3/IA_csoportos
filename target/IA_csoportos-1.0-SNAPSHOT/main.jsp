<%--
  Created by IntelliJ IDEA.
  User: ktzs
  Date: 2021. 12. 10.
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<html>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
%>
<%
    if(session.getAttribute("username") == null) {
%>
<jsp:forward page="index.jsp">
    <jsp:param name="errorMsg" value="Az oldal eléréséhez be kell jelentkeznie!"/>
</jsp:forward>
<%
    }
%>
<head>
    <title>Szavazás</title>
</head>
<body>
<h1>Sikeres bejelentkezés!</h1>
<%
    if(session.getAttribute("admin") != null) {
        %>
<h2>Admin hozzáférés.</h2>
<%
    }
%>
<form action="action.jsp" method="POST">
    <input type="submit" name="logout" value="Kijelentkezés">
</form>
</body>
</html>
