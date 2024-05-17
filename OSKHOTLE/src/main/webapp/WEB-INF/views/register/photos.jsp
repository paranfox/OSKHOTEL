<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록 사진등록 페이지</title>
</head>
<body>
	<%@include file="../fix/header.jsp"%>
	<label>사진등록</label>
	<form method="post" action="${path}/register/photos">

		<input type="file">
		 <input type="submit" value="다음">
	</form>
</body>
</html>