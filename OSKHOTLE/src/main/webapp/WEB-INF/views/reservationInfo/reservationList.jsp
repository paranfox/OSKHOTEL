<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Reservations</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>나의 Reservations</h1>
        <br>
        <form action="reservationList" method="get">
       		<input type="date" name="dateStart" >
       		~
      		<input type="date" name="dateEnd" >
        	<input type="submit" value="검색">
        </form>
        <br>
        <div class="row">
            <div class="col-md-12">
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
                                <td><a href="reservationDetail?reservationNo=${reservationInfoVO.reservationNo }">
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
            </div>
        </div>
    </div>
</body>
</html>
