<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OSKHOTEL MAIN</title>
</head>
<body>
	<%@include file="fix/header.jsp"%>
	<c:forEach var="i" begin="0" end="5" step="1">
	<div>
		index 안에 있는 내용<br>
	</div>

	</c:forEach>
	<a href="hotelinfo/hotelregister">호텔 등록 페이지로 이동</a>
	

	<%@include file="fix/footer.jsp"%>