<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div><a href="#" onclick="goBack();">돌아가기</a></div>

<c:if test="${requestScope.boardDomain.iuser eq sessionScope.loginUser.iuser}">
    <div>
        <a href="writeMod?iboard=${param.iboard}">수정</a>
        <a href="delBoard?iboard=${param.iboard}">삭제</a>
    </div>
</c:if>

<h1>${requestScope.boardDomain.title}</h1>
<div>글번호 : ${requestScope.boardDomain.iboard}
    <c:if test="${ not empty sessionScope.loginUser }">
        <i id="favIcon" class="far fa-kiss-wink-heart pointer"></i>
    </c:if>
</div>
<div>작성자 : <c:out value="${requestScope.boardDomain.writerNm}"/> | 작성일 : ${requestScope.boardDomain.regdt}</div>
<div><c:out value="${requestScope.boardDomain.ctnt}"/></div>

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

<div id="modal" class="displayNone">
    <div class="modal_content">
        <form id="cmtModFrm" action="#">
            <input type="hidden" id="icmt">
            <input type="text" id="modCmt">
        </form>
        <input type="button" value="댓글 수정" onclick="modAjax();">
        <input type="button" value="취소" onclick="closeModModal();">
    </div>
</div>
