<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OSKHOTEL HEADER</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="${path}/resources/css/header.css"/>
<style>
    /* 헤더 스타일링 */
    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        background-color: #f2f2f2;
    }
    /* 오른쪽 버튼 스타일링 */
    #loginSection {
        margin-left: auto;
    }
    
    /* 버튼 간격 조정 */
    #loginSection button {
        margin-right: 10px;
    }
</style>
</head>
<body>
    <header>
        <a href="${path}/index">게시판</a>
        <header id="loginSection">
            <%-- 세션에 값이 있으면 로그인 상태로 간주 --%>
            <c:if test="${not empty sessionScope}">
                <button type="button" onclick="location.href='${path}/user/mypage'">${sessionScope.userName} 마이페이지 </button>
                <button type="button" onclick="location.href='${path}/user/logout'">로그아웃</button>
            </c:if>
            <%-- 세션에 값이 없으면 로그아웃 상태로 간주 --%>
            <c:if test="${empty sessionScope}">
                <button type="button" onclick="location.href='${path}/user/login'">로그인</button>
            </c:if>
        </header>
    </header>
</body>
</html>
