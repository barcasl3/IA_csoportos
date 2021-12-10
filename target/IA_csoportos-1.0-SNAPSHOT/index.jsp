<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bejelentkezés</title>
</head>
<body>
<h1>A szavazás eléréséhez be kell jelentkeznie.
</h1>
<br/>
<form>
    <label for="username">Felhasználónév:</label>
    <input type="text" id="username" name="username"><br>
    <label for="password">Jelszó:</label>
    <input type="password" id="password" name="password"><br>
    <button type="submit">Bejelentkezés</button>
</form>
<p>Ha még nem rendelkezik felhasználóval, <a href="register.jsp">regisztráljon!</a></p>
</body>
</html>