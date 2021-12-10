<%--
  Created by IntelliJ IDEA.
  User: ktzs
  Date: 2021. 12. 10.
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Regisztráció</title>
</head>
<body>
<h1>A regisztrációhoz adja meg az adatait!</h1>
<form>
    <label for="username">Felhasználónév:</label>
    <input type="text" id="username" name="username"><br>
    <label for="password">Jelszó:</label>
    <input type="password" id="password" name="password"><br>
    <label for="fullname">Teljes név:</label>
    <input type="text" id="fullname" name="fullname"><br>
    <label for="email">E-mail cím:</label>
    <input type="email" id="email" name="email"><br>
    <button type="submit">Regisztráció</button>
</form>
</body>
</html>
