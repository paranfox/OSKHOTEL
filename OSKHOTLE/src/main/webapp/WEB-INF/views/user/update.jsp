<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>UPDATE</title>
    <script type="text/javascript">
        function confirmUpdate() {
            return confirm("수정하시겠습니까?");
        }
    </script>
</head>
<body>
<%@include file="../fix/header.jsp" %>
    <h2>${sessionScope.userId}님의 정보</h2>
    <form action="update" method="post" onsubmit="return confirmUpdate()">
        <input type="hidden" name="userId" value="${sessionScope.userId}"/>
        <div>
            <label>이름(Name)</label> <br>
            <input type="text" name="userName" value="${UserVO.userName }"/>
        </div>
         <br>
        <div>
             <label>비밀번호(Pw)</label> <br>
            <input type="password" name="userPassword" value="${UserVO.userPassword }"/>
        </div>
        <br>
        <div>
            <label>이메일(Email)</label> <br>
            <input type="email" name="userEmail" value="${UserVO.userEmail }"/>
        </div>
        <br>
        <div>
            <label>전화번호(Phone)</label> <br>
            <input type="text" name="userPhone" value="${UserVO.userPhone }"/>
        </div>
        <br>
        <button type="submit">회원정보 수정</button>
        <button type="button" onclick="location.href='mypage'">마이페이지</button>
    </form>
</body>
</html>
