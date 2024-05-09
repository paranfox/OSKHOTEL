<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록 주소 페이지</title>
</head>
<body>
	<%@include file="../fix/header.jsp"%>
	<script src="${path}/resources/js/location.js"></script>
	<form method="post" action="${path}/register/location">
		<h2 class="m-t-4">위치</h2>
		<label for="streetAddressInput" class="control-label">주소</label><br>
		<br> <input name="" placeholder="여기에 입력하세요" id=""><br>
		<br> <label class="control-label">건물/빌딩/동, 층, 호수 </label><br>
		<br> <input name="" placeholder="여기에 입력하세요" id=""><br>
		<br> <label class="control-label">도/주(시/도)</label><br> <br>
		<select name="" title="" id=""><option value="0" hidden=""
				disabled=""></option>
			<option value="3409">강원</option>
			<option value="3411">경기</option>
			<option value="3413">경남</option>
			<option value="3412">경북</option>
			<option value="3410">광주</option>
			<option value="3416">대구</option>
			<option value="3417">대전</option>
			<option value="3414">부산</option>
			<option value="3415">서울</option>
			<option value="3418">울산</option>
			<option value="3408">인천</option>
			<option value="3405">전남</option>
			<option value="3404">전북</option>
			<option value="3403">제주</option>
			<option value="3407">충남</option>
			<option value="3406">충북</option></select> <br> <br>  <span
			class="help-block">도시를 입력해 주세요</span><br> <br> <label
			for="postalCodeInput" class="control-label">우편번호 <small>(선택
				사항)</small><br> <br>
		</label><input name="" placeholder="#####" maxlength="13" id="" value="">
		<br> <br> <input type="hidden" id="lodging" name="lodging"
			value="H"> <input type="submit" value="다음">
	</form>

</body>
</html>