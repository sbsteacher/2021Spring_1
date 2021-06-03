<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
</head>
<body>
    <h1>로그인</h1>
    <div>${requestScope.errMsg}</div>
    <form action="login" method="post">
        <div><input type="text" name="uid" placeholder="id" value="mic"></div>
        <div><input type="password" name="upw" placeholder="password" value="1212"></div>
        <div>
            <input type="submit" value="Login">
        </div>
    </form>

    <div>
        <a href="join">join</a>
    </div>
</body>
</html>
