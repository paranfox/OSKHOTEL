<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up</title>
</head>
<body>
    <h1>회원 가입</h1>
    <form action="/signup" method="post">
        <div>
            <label>아이디(Id)</label> <br>
            <input type="text" name="userid" placeholder="아이디"/>
        </div>
        <br>
        <div>
            <label>비밀번호(Pw)</label> <br>
            <input type="password" name="password" placeholder="비밀번호"/>
        </div>
        <br>
        <div>
            <label>이름(Name)</label> <br>
            <input type="text" name="username" placeholder="이름"/>
        </div>
        <br>
        <div>
            <label>이메일(Email)</label> <br>
            <input type="email" name="email" placeholder="이메일"/>
        </div>
        <br>
        <div>
            <label>전화번호(Phone)</label> <br>
            <input type="text" name="phone" placeholder="전화번호"/>
        </div>
        <br>
        <button type="submit">회원가입</button>
    </form>
</body>
</html>