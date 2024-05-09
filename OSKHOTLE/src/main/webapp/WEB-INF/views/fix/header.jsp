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

		<div class="header_blank"> <a class="logo" href="${path}/index">
			<img alt="mainlogo" src="${path}/resources/image/mainlogo.png"
				width="50px" height="50px"></a>
		</div>
</body>
</html>