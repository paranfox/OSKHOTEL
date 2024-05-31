<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .login-container {
            background-color: #ffffff;
            padding: 2em;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 1em;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 0.8em;
            margin: 0.5em 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .login-container button {
            width: 100%;
            padding: 0.8em;
            margin: 0.5em 0;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            font-size: 1em;
        }
        .login-container button[type="button"] {
            background-color: #6c757d;
        }
        .login-container button:hover {
            background-color: #0056b3;
        }
        .login-container button[type="button"]:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <form action="login" method="post">
            <h2>로그인</h2>
            <div>
                <input type="text" name="userId" placeholder="아이디" required/>
            </div>
            <div>
                <input type="password" name="userPassword" placeholder="비밀번호" required/>
            </div>
            <br>
            <button type="submit">로그인</button>
            <button type="button" onclick="location.href='signup'">회원가입</button>
        </form>
    </div>
</body>
</html>