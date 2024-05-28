<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<title>${reservationInfoVO.reservationLodgingName }</title>
</head>
<body>
	<h2>예약 정보</h2>
	<div>
		<p>예약 번호 : ${reservationInfoVO.reservationNo }</p>
		<fmt:formatDate value="${reservationInfoVO.reservationCheckIn }"
		pattern="yyyy-MM-dd" var="reservationCheckIn"/>
		<p>체크인 : ${reservationCheckIn }</p>
		<p> ~ </p>
		<fmt:formatDate value="${reservationInfoVO.reservationCheckOut }"
		pattern="yyyy-MM-dd" var="reservationCheckOut"/>
		<p>체크아웃 : ${reservationCheckOut }</p>
	</div>
	<div>
		<p>${reservationInfoVO.reservationLodgingName }</p>
	</div>
	<div>
		<p>객실 정보</p>
		<p>미구현</p>
	</div>
	<div>
		<p>투숙객 정보</p>
		<p>${reservationInfoVO.reservationFirstName } ${reservationInfoVO.reservationLastName }</p>
		<p>어른 : ${reservationInfoVO.reservationAdult }명 + 아이 : ${reservationInfoVO.reservationChild }명</p>
	</div>
	<div>
		<p>결제 금액</p>
		<p>${reservationInfoVO.reservationTotalPrice }원</p>
	</div>
</body>
</html>