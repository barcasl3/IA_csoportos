<%--
  Created by IntelliJ IDEA.
  User: ktzs
  Date: 2021. 12. 10.
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page session="true" %>
<html>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
%>
<head>
    <title>Átirányítás...</title>
    <c:choose>
        <c:when test="${not empty param.login && not empty param.username && not empty param.password}">
            <!-- bejelentkezési kérés -->
            <sql:query var="loginQuery" dataSource="${felhasznalok}">
                SELECT * FROM APP.users WHERE username = '${param.username}' AND password = '${param.password}'
            </sql:query>
            <c:choose>
                <c:when test="${loginQuery.rowCount != 0}">
                    <%
                        session.setAttribute("username", request.getParameter("username"));
                    %>
                    <c:if test="${loginQuery.rows[0].admin}">
                        <%
                            session.setAttribute("admin", true);
                        %>
                    </c:if>
                    <jsp:forward page="main.jsp"/>
                </c:when>
                <c:otherwise>
                    <jsp:forward page="index.jsp">
                        <jsp:param name="errorMsg" value="A megadott felhasználónév vagy jelszó nem megfelelő!"/>
                    </jsp:forward>
                </c:otherwise>
            </c:choose>

        </c:when>
        <c:when test="${not empty param.register}">
            <c:choose>
                <c:when test="${not empty param.username && not empty param.password && not empty param.email && not empty param.fullname}">
                    <!-- minden adat kitöltve -->
                    <sql:update var="registerQuery" dataSource="${felhasznalok}">
                        INSERT INTO APP.users (username, password, email, fullname) VALUES ('${param.username}', '${param.password}', '${param.email}', '${param.fullname}')
                    </sql:update>

                    <jsp:forward page="index.jsp">
                        <jsp:param name="successMsg" value="Sikeres regisztráció! Kérem, jelentkezzen be!"/>
                    </jsp:forward>
                </c:when>
                <c:otherwise>
                    <!-- hiányos adatok -->
                    <jsp:forward page="register.jsp">
                        <jsp:param name="errorMsg" value="Minden adat megadása kötelező!"/>
                    </jsp:forward>
                </c:otherwise>
            </c:choose>

        </c:when>
        <c:when test="${not empty param.logout}">
            <%
                session.invalidate();
            %>
            <jsp:forward page="index.jsp">
                <jsp:param name="successMsg" value="Sikeres kijelentkezés!"/>
            </jsp:forward>
        </c:when>
        <c:otherwise>
            <jsp:forward page="index.jsp">
                <jsp:param name="errorMsg" value="Érvénytelen kérés."/>
            </jsp:forward>
        </c:otherwise>
    </c:choose>
</head>
<body>

</body>
</html>
