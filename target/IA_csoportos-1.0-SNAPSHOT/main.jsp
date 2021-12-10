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
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Üdvözöljük, ${sessionScope.fullname}!</h1>
<%
    if(session.getAttribute("admin") != null) {
        %>
<h2>Önnek admin jogosultsága van.</h2>
<%
    }
%>
<form action="action.jsp" method="POST">
    <input type="submit" name="logout" value="Kijelentkezés">
</form>
<hr>
<%!
    float[] szavazatok = { 0, 0, 0, 0, 0 };
    float osszesSzavazat = 0;
%>
<%
    boolean marSzavazott = session.getAttribute("marSzavazott") != null;
    if(request.getMethod().equals("POST") && request.getParameter("lang") != null) {
        if(!marSzavazott) {
            int voteNum = Integer.parseInt(request.getParameter("lang"));
            szavazatok[voteNum]++;
            osszesSzavazat++;
            session.setAttribute("marSzavazott", true);
        }

%>
<p>A szavazás eredményei</p>
<p>C# - <%=szavazatok[0]%> db szavazat (<%= szavazatok[0] / osszesSzavazat * 100%>%)</p>
<p>Javascript - <%=szavazatok[1]%> db szavazat (<%= szavazatok[1] / osszesSzavazat * 100%>%)</p>
<p>C++ - <%=szavazatok[2]%> db szavazat (<%= szavazatok[2] / osszesSzavazat * 100%>%)</p>
<p>Java - <%=szavazatok[3]%> db szavazat (<%= szavazatok[3] / osszesSzavazat * 100%>%)</p>
<p>Python - <%=szavazatok[4]%> db szavazat (<%= szavazatok[4] / osszesSzavazat * 100%>%)</p>
<p>Összesen <%=osszesSzavazat%> db szavazat érkezett be.</p>
<%
    } else if(marSzavazott) {
%>
<p>Ön már szavazott. Az eredmények:</p>
<p>C# - <%=szavazatok[0]%> db szavazat (<%= szavazatok[0] / osszesSzavazat * 100%>%)</p>
<p>Javascript - <%=szavazatok[1]%> db szavazat (<%= szavazatok[1] / osszesSzavazat * 100%>%)</p>
<p>C++ - <%=szavazatok[2]%> db szavazat (<%= szavazatok[2] / osszesSzavazat * 100%>%)</p>
<p>Java - <%=szavazatok[3]%> db szavazat (<%= szavazatok[3] / osszesSzavazat * 100%>%)</p>
<p>Python - <%=szavazatok[4]%> db szavazat (<%= szavazatok[4] / osszesSzavazat * 100%>%)</p>
<p>Összesen <%=osszesSzavazat%> db szavazat érkezett be.</p>
<%
    }
    else {
%>
<p>Kérem, szavazzon! Saját meglátása szerint melyik a legjobb programozási nyelv?</p>
<form action="main.jsp" method="POST">
    <!-- C#, Javascript, C++, Java, Python -->
    <div>
        <input type="radio" name="lang" id="cs" value="0">
        <label for="cs">C#</label>
    </div>
    <div>
        <input type="radio" name="lang" id="js" value="1">
        <label for="js">Javascript</label>
    </div>
    <div>
        <input type="radio" name="lang" id="cpp" value="2">
        <label for="cpp">C++</label>
    </div>
    <div>
        <input type="radio" name="lang" id="java" value="3">
        <label for="java">Java</label>
    </div>
    <div>
        <input type="radio" name="lang" id="py" value="4">
        <label for="py">Python</label>
    </div>
    <div>
        <input type="submit" value="Szavazás" name="vote">
    </div>
</form>
<%
    }
%>
</body>
</html>
