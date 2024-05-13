<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OSKHOTEL HEADER</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="${path}/resources/css/header.css" />
</head>
<body>
	<div class="header_blank">
		<a class="logo" href="${path}/index"> OSKHOTEL</a>
		<%-- 세션에 값이 있으면 로그인 상태로 간주 --%>
		<div id="loginSection">
			<c:if test="${not empty sessionScope}">
				<button type="button" onclick="location.href='${path}/user/mypage'">${sessionScope.userName}
					마이페이지</button>
				<button type="button" onclick="location.href='${path}/user/logout'">로그아웃</button>
			</c:if>
			<%-- 세션에 값이 없으면 로그아웃 상태로 간주 --%>
			<c:if test="${empty sessionScope}">
				<button type="button" onclick="location.href='${path}/user/login'">로그인</button>
			</c:if>
		</div>

	</div>

</body>
</html>
