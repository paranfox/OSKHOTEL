<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="${path}/resources/css/header.css" />
<title>My Reservations</title>
<style>
    .container {
        font-family: Arial, sans-serif;
        margin: 50px auto;
        max-width: 1200px;
        padding: 0 15px;
        background-color: #f8f9fa;
    }
    .container h1 {
        font-size: 24px;
        color: #343a40;
        margin-bottom: 20px;
    }
    .userInfo {
        float: right;
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
        text-decoration: none;
    }
    .userInfo:hover {
        background-color: #0056b3;
    }
    .reservation-form {
        margin-bottom: 20px;
    }
    .reservation-form input[type="date"],
    .reservation-form input[type="submit"],
    .reservation-form select {
        padding: 8px;
        margin-right: 10px;
        border: 1px solid #ced4da;
        border-radius: 5px;
    }
    .reservation-form input[type="submit"] {
        background-color: #28a745;
        color: white;
        border: none;
        cursor: pointer;
    }
    .reservation-form input[type="submit"]:hover {
        background-color: #218838;
    }
    .table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    .table th, .table td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #dee2e6;
    }
    .table th {
        background-color: #e9ecef;
    }
    .table tr:hover {
        background-color: #f1f3f5;
    }
    .pagination {
        display: flex;
        justify-content: center;
        list-style: none;
        padding: 0;
    }
    .pagination li {
        margin: 0 5px;
    }
    .pagination a {
        display: block;
        padding: 8px 16px;
        text-decoration: none;
        color: #007bff;
        border: 1px solid #dee2e6;
        border-radius: 5px;
    }
    .pagination a:hover {
        background-color: #e9ecef;
    }
    .pagination .active a {
        background-color: #007bff;
        color: white;
        border: none;
    }
</style>
</head>
<body>
    <%@include file="../fix/header.jsp"%>
    <div class="container">
        <h1>${sessionScope.userId } Reservations</h1>
        <button class="userInfo" onclick="location.href='/project/user/mypage'">회원 정보</button>
        <br><br>
        <div class="row">
            <div class="col-md-12">
                <form class="reservation-form" action="../reservationInfo/reservationList" method="get">
                    <input type="date" id="startDate" name="startDate" value="${pagination.startDate }"> ~ 
                    <input type="date" id="endDate" name="endDate" value="${pagination.endDate }">
                    <input type="submit" value="검색">
                    <select class="pageSize" id="pageSize" name="pageSize" onChange="pageChange()">
                        <option value="5" <c:if test="${pagination.pageSize == 5 }">selected</c:if>>5줄 보기</option>
                        <option value="10" <c:if test="${pagination.pageSize == 10 }">selected</c:if>>10줄 보기</option>
                        <option value="15" <c:if test="${pagination.pageSize == 15 }">selected</c:if>>15줄 보기</option>
                        <option value="20" <c:if test="${pagination.pageSize == 20 }">selected</c:if>>20줄 보기</option>
                    </select>
                </form>
                <br>
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
                        <c:forEach var="reservationInfoVO" items="${reservationList }">
                            <tr>
                                <td>${reservationInfoVO.reservationNo }</td>
                                <td><a href="../reservationInfo/reservationDetail?reservationNo=${reservationInfoVO.reservationNo }">${reservationInfoVO.reservationLodgingName }</a></td>
                                <fmt:formatDate value="${reservationInfoVO.reservationCheckIn }" pattern="yyyy-MM-dd" var="reservationCheckIn" />
                                <td>${reservationCheckIn }</td>
                                <fmt:formatDate value="${reservationInfoVO.reservationCheckOut }" pattern="yyyy-MM-dd" var="reservationCheckOut" />
                                <td>${reservationCheckOut }</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <ul class="pagination">
                    <c:if test="${pageMaker.isPrev() }">
                        <li class="page-item"><a class="page-link" href="reservationList?startDate=${pagination.startDate }&endDate=${pagination.endDate }&pageNum=${pageMaker.startNum - 1 }&pageSize=${pagination.pageSize}">이전</a></li>
                    </c:if>
                    <c:forEach begin="${pageMaker.startNum }" end="${pageMaker.endNum }" var="num">
                        <li class="page-item"><a class="page-link" href="reservationList?startDate=${pagination.startDate }&endDate=${pagination.endDate }&pageNum=${num }&pageSize=${pagination.pageSize}">${num }</a></li>
                    </c:forEach>
                    <c:if test="${pageMaker.isNext() }">
                        <li class="page-item"><a class="page-link" href="reservationList?startDate=${pagination.startDate }&endDate=${pagination.endDate }&pageNum=${pageMaker.endNum + 1 }&pageSize=${pagination.pageSize}">다음</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function pageChange() {
            let pageSize = document.getElementById('pageSize').value;
            location.href="reservationList?startDate=${pagination.startDate }&endDate=${pagination.endDate }&pageNum=${pageMaker.startNum }&pageSize=" + pageSize;
        }
    </script>
</body>
</html>

