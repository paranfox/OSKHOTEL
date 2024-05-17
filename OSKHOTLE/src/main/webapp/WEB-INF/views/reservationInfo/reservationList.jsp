<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>My Reservations</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.container {
	margin-top: 50px;
}

.pageSize{
	float: right;
}
/* 페이징을 가로로 나열하기 위한 CSS */
.pagination {
	display: flex; /* 페이징 아이템들을 가로로 나열하기 위해 Flexbox 레이아웃을 사용합니다. */
	list-style: none; /* 리스트 아이템들의 기본 스타일을 제거합니다. */
	padding-left: 0; /* 왼쪽 여백을 제거합니다. */
}

.pagination li {
	margin-right: 5px; /* 각 페이지 번호 사이의 간격을 설정합니다. */
}
</style>
</head>
<body>
	<div class="container">
		<h1>나의 Reservations</h1>
		<div class="row">
			<div class="col-md-12">
				<form action="../reservationInfo/reservationList" method="post">
					<input type="date" id="reservationCheckIn" name="reservationCheckIn" value="${pagination.reservationCheckIn }">
					 ~ 
					<input	type="date" id="reservationCheckOut" name="reservationCheckOut"	value="${pagination.reservationCheckOut }">
					<select id="searchType">
						<option value="reservationNo">예약 날짜</option>
						<option value="reservationChechIn">체크인 날짜</option>
					</select>
					<input type="submit" value="검색">
				</form>
				<select class="pageSize" id="pageSize" name="pageSize" onChange="pageChange()">
					<option value="5" <c:if test="${pagination.pageSize == 5 }">selected</c:if>>5줄 보기</option>
					<option value="10" <c:if test="${pagination.pageSize == 10 }">selected</c:if>>10줄 보기</option>
					<option value="15" <c:if test="${pagination.pageSize == 15 }">selected</c:if>>15줄 보기</option>
					<option value="20" <c:if test="${pagination.pageSize == 20 }">selected</c:if>>20줄 보기</option>
				</select>
				<table class="table">
					<thead>
						<tr>
							<th>NO</th>
							<th>숙소명</th>
							<th>체크인</th>
							<th>체크아웃</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="reservationVO" items="${reservationList }">
							<tr>
								<td>${reservationVO.reservationNo }</td>
								<td><a
									href="reservationDetail?reservationNo=${reservationInfoVO.reservationNo }">
										${reservationVO.reservationLodgingName }</a></td>
								<fmt:formatDate value="${reservationVO.reservationCheckIn }"
									pattern="yyyy-MM-dd" var="reservationCheckIn" />
								<td>${reservationCheckIn }</td>
								<fmt:formatDate value="${reservationVO.reservationCheckOut }"
									pattern="yyyy-MM-dd" var="reservationCheckOut" />
								<td>${reservationCheckOut }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.isPrev() }">
						<li class="page-item"><a class="page-link"
							href="reservationList?pageNum=${pageMaker.startNum -1 }&pageSize=${pagination.pageSize}">이전</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startNum }"
						end="${pageMaker.endNum }" var="num">
						<li class="page-item"><a class="page-link"
							href="reservationList?pageNum=${num }&pageSize=${pagination.pageSize}">${num }</a></li>
					</c:forEach>
					<c:if test="${pageMaker.isNext() }">
						<li class="page-item"><a class="page-link"
							href="reservationList?pageNum=${pageMaker.endNum + 1 }&pageSize=${pagination.pageSize}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function pageChange() {
			let pageSize = document.getElementById('pageSize').value;
			location.href="reservationList?pageNum=${pageMaker.startNum }&pageSize="+pageSize;
		}
		
		function searchDate() {
			let reservationCheckIn = document.getElementById('reservationCheckIn').value;
			let reservationCheckOut = document.getElementById('reservationCheckIn').value;
			location.href="../reservationInfo/reservationList?pageNum=${pageMaker.startNum }&pageSize=${pagination.pageSize}&reservationCheckIn="+reservationCheckIn+"&reservationCheckOut="+reservationCheckOut;
		}
	</script>

</body>
</html>
