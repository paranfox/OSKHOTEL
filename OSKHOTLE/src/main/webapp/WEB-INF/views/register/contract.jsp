<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록 확정 페이지</title>
</head>
<body>
	<%@include file="../fix/header.jsp"%>
	<label>등록을 완료 하시겠습니까?</label>
	<p>이용약관 적는 곳이지만 지금은 필요 없을 듯 나중에 작성</p>
	<form method="post" action="${path}/register/#">
		<input type="submit" value="다음">
	</form>
</body>
</html>