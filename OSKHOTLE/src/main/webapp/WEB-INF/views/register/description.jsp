<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록 상세내용 페이지</title>
</head>
<body>
	<%@include file="../fix/header.jsp"%>
	<script src="${path}/resources/js/description.js?ver=1"></script>
	<form method="post" action="${path}/register/description">
		<label>숙소명</label> <br> <br>
		<input type="text" required="required" name=""
			maxlength="50"> <br> <br>
			<label>숙소 소개</label> <br> <br>
			<textarea required="required" maxlength="50000" name=""> </textarea> <br> <br>
			<label>숙소 성급</label>
		<div class ="hotelstar">
  <span class="star on"><input type="hidden" value="1"> </span>
  <span class="star"><input type="hidden" value="2"> </span>
  <span class="star"><input type="hidden" value="3"> </span>
  <span class="star"><input type="hidden" value="4"> </span>
  <span class="star"><input type="hidden" value="5"> </span>
  <input type="hidden" name="hotelster" value="">
</div>
 <br> <br>

		<input type="submit" value="다음">
	</form>
</body>
</html>