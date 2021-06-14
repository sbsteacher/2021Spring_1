<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <form action="list" id="frm">
        <input type="hidden" name="page" value="${ param.page == null ? 1 : param.page }">
        <select name="recordCnt">
            <c:forEach begin="5" end="20" step="5" var="cnt">
                <c:choose>
                    <c:when test="${cnt eq param.recordCnt}">
                        <option selected>${cnt}</option>
                    </c:when>
                    <c:otherwise>
                        <option>${cnt}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
    </form>
</div>
<table>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>작성일시</th>
    </tr>
    <c:forEach items="${requestScope.list}" var="item">
        <tr class="record" onclick="moveToDetail(${item.iboard});">
            <td>${item.iboard}</td>
            <td>
                <c:choose>
                    <c:when test="${param.searchType eq 1 || param.searchType eq 2}">
                        ${item.title.replace(param.searchText, '<mark>' += param.searchText += '</mark>')}
                    </c:when>
                    <c:otherwise>
                        ${item.title}
                    </c:otherwise>
                </c:choose>
                <!-- 좋아요 -->
                <c:if test="${ not empty sessionScope.loginUser && item.isFav eq 1 }">
                    <i class="fas fa-kiss-wink-heart"></i>
                </c:if>
            </td>

            <c:choose>
                <c:when test="${empty item.profileImg}">
                    <c:set var="img" value="/res/img/noprofile.jpg"/>
                </c:when>
                <c:otherwise>
                    <c:set var="img" value="/img/${item.iuser}/${item.profileImg}"/>
                </c:otherwise>
            </c:choose>
            <td>
                <c:choose>
                    <c:when test="${param.searchType eq 4}">
                        ${item.writerNm.replace(param.searchText, '<mark>' += param.searchText += '</mark>')}
                    </c:when>
                    <c:otherwise>
                        ${item.writerNm}
                    </c:otherwise>
                </c:choose>
                <img src="${img}" class="profileImg">
            </td>
            <td>${item.regdt}</td>
        </tr>
    </c:forEach>
</table>

<div>
    <c:forEach begin="1" end="${requestScope.maxPageVal}" var="page">
        <c:choose>
            <c:when test="${(empty param.page && page eq 1) || param.page eq page}">
                <span class="selected">${page}</span>
            </c:when>
            <c:otherwise>
                <span><a href="list?page=${page}&recordCnt=${param.recordCnt == null ? 5 : param.recordCnt}">${page}</a></span>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>