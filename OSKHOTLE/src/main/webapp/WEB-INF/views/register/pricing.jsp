<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록 가격등록 페이지</title>
</head>
<body>
	<%@include file="../fix/header.jsp"%>
	<form method="post" action="${path}/register/pricing">
	<label>1박당 가격</label>
	<input type="text" placeholder="가격을 입력해 주세요">
	
	<input type="submit" value="다음">
	</form>
</body>
</html>