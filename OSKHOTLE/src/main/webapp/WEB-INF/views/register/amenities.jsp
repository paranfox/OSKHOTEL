<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록 편의시설 페이지</title>
<link rel="stylesheet" href="../${path}/resources/css/amenities.css" />
</head>
<body>
	<%@include file="../fix/header.jsp"%>
	<script src="${path}/resources/js/amenities.js?ver=1"></script>
	<div class="main-content">
		<form name="amenitiesPageForm" method="post" action="${path}/register/amenities">
			<div class="main">
				<h1>숙소 제공 편의 시설/서비스 관리하기</h1>
				<p>숙소에서 제공하는 편의 시설/서비스를 설정하세요.</p>
			</div>
			<div class="main-1">
				<h2>추천 사항</h2>
				<p>여행객들은 숙소 예약 시 다음과 같은 시설/서비스가 있는 곳을 선호합니다.</p>
				<div class="main-1-1">
					<label><input type="checkbox" id="towels">타월</label>
					<label><input type="checkbox" id="air-conditioner">에어컨</label>
					<label><input type="checkbox" id="terraces">발코니 / 테라스</label>
					<label><input type="checkbox" id="workspace">책상/</label>
					<label><input type="checkbox" id="keyless">키리스(Keyless) 액세스</label>
					<label><input type="checkbox" id="beachfront">비치프런트</label>
					<label><input type="checkbox" id="free-parking">무료 주차 </label>
					<label><input type="checkbox" id="free-wifi">무료 Wi-Fi</label>
					<label><input type="checkbox" id="heating">난방</label>
					<label><input type="checkbox" id="basic-kitchen-appliances">기본 주방용품 (취사도구,식용유, 조미료)</label>
					<label><input type="checkbox" id="dedicated-entrances">전용 출입구</label>
					<label><input type="checkbox" id="TV">TV</label>
				</div>
			</div>
			<div>
				<button type="submit">다음</button>
			</div>
		</form>
	</div>
</body>
</html>
