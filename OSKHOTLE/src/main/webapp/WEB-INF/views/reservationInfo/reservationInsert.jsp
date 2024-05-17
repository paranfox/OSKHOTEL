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
			<label>이름(First Name)</label> <br>
			<input type="text" name="firstname"/> 
		</div>
		<div>
			<label>성(Last Name)</label> <br>
			<input type="text" name="lastname"/>
		</div>
		<br>
		<div>
			<label>이메일</label>
			<input type="email" name="email" value="${UserVO.uesrEmail }"/>
		</div>
		
		
	</form>
</body>
</html>