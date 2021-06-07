<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>${requestScope.boardDomain.title}</title>
    <link rel="stylesheet" href="/res/css/boardDetail.css">
    <script defer src="/res/js/boardDetail.js"></script>
</head>
<body>
    <div><a href="#" onclick="goBack();">돌아가기</a></div>
    <h1>${requestScope.boardDomain.title}</h1>
    <div>글번호 : ${requestScope.boardDomain.iboard}</div>
    <div>작성자 : <c:out value="${requestScope.boardDomain.writerNm}"/> | 작성일 : ${requestScope.boardDomain.regdt}</div>
    <div><c:out value="${requestScope.boardDomain.ctnt}"/></div>
    <div>${requestScope.boardDomain.ctnt}</div>

    <c:if test="${not empty sessionScope.loginUser}">
        <div>
            <form id="cmtFrm" onsubmit="return false;">
                <input type="text" id="cmt" placeholder="댓글" value="">
                <input type="button" value="댓글달기" onclick="regCmt();">
            </form>
        </div>
    </c:if>
    <div id="cmtList" data-login-user-pk="${sessionScope.loginUser.iuser}"
         data-iboard="${param.iboard}"></div>

















</body>
</html>
