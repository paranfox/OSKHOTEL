<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Insert</title>
</head>
<body>
	<h1>숙소 예약</h1>
	<form action="/reservationinsert" method="post">
		<div>
			<p>이름(First Name)</p> <br>
			<input type="text" name="firstname"> 
		</div>
		<div>
			<p>성(Last Name)</p> <br>
			<input type="text" name="lastname">
		</div>
		<br>
		<div>
			<p>이메일</p>
			<input type="email" name="email" value="${UserVO.uesrEmail }">
		</div>
		<div>
			<p>전화번호</p>
			<input type="text" name="phone" value="${UserVO.userPhone }">
		</div>
		<div>
			<p><input type="checkbox" name="other"> 다른 사름을 위한 예약</p>
		</div>
		<div>
			<input type="submit" value="결제하기">
		</div>
	</form>
</body>
</html>