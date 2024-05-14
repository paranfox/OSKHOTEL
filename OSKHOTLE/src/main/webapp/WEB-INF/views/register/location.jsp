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
	<script src="${path}/resources/js/location.js?ver=1" ></script>
	<form method="post" action="${path}/register/location">
		<h2>위치</h2>
		<label for="streetAddressInput" class="control-label">주소</label><br>
		<br> <input name="hotelAddress" placeholder="여기에 입력하세요" required><br>
		<br> <label class="control-label">건물/빌딩/동, 층, 호수 </label><br>
		<br> <input name="" placeholder="여기에 입력하세요" required><br>
		<br> <label class="control-label">도/주(시/도)</label><br> <br>
		<select id="countrybox" name="countrybox" required>
		
		</select>
		<br> <br>  <span
			class="help-block">도시를 입력해 주세요</span> <br> <br>
			<select id="citybox" name="citybox" required>
			
			</select>
			<br> <br> <label
			for="postalCodeInput" class="control-label">우편번호 <small>(선택
				사항)</small><br> <br>
		</label><input name="" placeholder="#####" maxlength="13" id="" value="">
		<br> <br> <input type="hidden" id="lodging" name="lodging"
			value="H"> <input type="submit" value="다음">
	</form>

</body>
</html>