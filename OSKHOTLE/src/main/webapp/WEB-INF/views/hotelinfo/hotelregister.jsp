<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록 페이지</title>
</head>
<body>
	<form method="post" action="hotelinsert">
		<label for="job">직업</label> 
		<select id="job" name="job" size="1">
			<option value="">선택하세요.</option>
			<option value="학생">학생</option>
			<option value="컴퓨터/인터넷">컴퓨터/인터넷</option>
			<option value="언론">언론</option>
			<option value="공무원">공무원</option>
			<option value="군인">군인</option>
			<option value="서비스업">서비스업</option>
			<option value="교육">교육</option>
		</select> <br> <br>
		
		<br><br>
		<input type="submit" value="확인" style="margin-left:50px">
	</form>
	
</body>
</html>