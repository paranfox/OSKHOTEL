<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록 기본 페이지</title>
</head>
<body>
<%@include file="../fix/header.jsp" %>
    <h1>기본정보</h1>
    <form method="post" action="${path}/register/basics">
        <label for="hotelName">Hotel Name:</label>
        <input type="text" id="hotelName" name="hotelName" required><br><br>

        <label for="hotelRoomNo">Hotel Room Type :</label>
        <select id="hotelRoomNo" name="hotelRoomNo" required>
        	<option value="0">선택을 해 주세요</option>
            <option value="1">Single Room</option>
            <option value="2">Double Room</option>
            <option value="3">Suite</option>
        </select><br><br>

		<input type="hidden" id="lodging" name="lodging" value="H">
		
        <input type="submit" value="다음">
    </form>
</body>
</html>