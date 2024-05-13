<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
</head>
<body>
<%@include file="../fix/header.jsp" %>
    <form action="login" method="post">
    <h2>로그인</h2>
        <div>
            <input type="text" name="userId" placeholder="아이디"/>
        </div>
        <div>
            <input type="password" name="userPassword" placeholder="비밀번호"/>
        </div>

        <button type="submit">로그인</button>
        <button type="button" onclick="location.href='signup'">회원가입</button>
    </form>
</body>
</html>