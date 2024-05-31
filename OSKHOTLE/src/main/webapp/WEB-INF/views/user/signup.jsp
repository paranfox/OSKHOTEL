<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        .signup-container {
            background-color: #ffffff;
            padding: 2em;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .signup-container h1 {
            margin-bottom: 1em;
        }
        .signup-container input[type="text"],
        .signup-container input[type="password"] {
            width: 100%;
            padding: 0.8em;
            margin: 0.5em 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .signup-container button {
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
        .signup-container button:hover {
            background-color: #0056b3;
        }
        .signup-container small {
            display: block;
            margin-top: 0.5em;
        }
        .form-error {
            color: #dc3545;
        }
        .form-success {
            color: #2fb380;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h1>회원 가입</h1>
        <form action="signup" method="post">
            <div>
                <input type="text" name="userId" id="userId" placeholder="아이디" required/>
                <small id="id_feedback"></small>
            </div>
            <div>
                <input type="password" name="userPassword" id="userPassword" placeholder="비밀번호 입력" required/>
                <input type="password" name="userPassword_ck" id="userPassword_ck" placeholder="비밀번호 확인" required/>
                <small id="checkpass-msg" class="form-error"></small>
            </div>
            <div>
                <input type="text" name="userName" id="userName" placeholder="이름" required/>
                <small id="name_feedback" class="form-error"></small>
            </div>
            <div>
                <input type="text" name="userEmail" id="userEmail" placeholder="이메일" required/>
                <small id="email_feedback" class="form-error"></small>
            </div>
            <div>
                <input type="text" name="userPhone" id="userPhone" placeholder="전화번호" autocomplete="off" required/>
                <small id="phone_feedback" class="form-error"></small>
            </div>
            <button type="submit">회원가입</button>
        </form>
    </div>
    <script type="text/javascript">
        $(document).ready(function(){
            function isOnlyWhitespace(input) {
                return !input.trim().length;
            }

            $('#userId').blur(function(){
                let userId = $('#userId').val();
                if (userId == "" || isOnlyWhitespace(userId)) {
                    $("#id_feedback").text('아이디를 입력해주세요.').addClass('form-error').removeClass('form-success');
                    $('#userId').val('');
                } else {
                    let url = "../usercheck/useridCheck/" + userId;
                    $.ajax({
                        url: url,
                        type: 'GET',
                        dataType: 'json',
                        success: function(result){
                            if(result == 1){
                                $("#id_feedback").text('이미 사용중인 아이디입니다.').addClass('form-error').removeClass('form-success');
                            } else {
                                $("#id_feedback").text('사용할 수 있는 아이디입니다.').addClass('form-success').removeClass('form-error');
                            }
                        }
                    });
                }
            });

            $('#userPassword, #userPassword_ck').blur(function(){
                let password = $("#userPassword").val();
                let ck_password = $("#userPassword_ck").val();
                let acceptPass = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;

                if(!password || isOnlyWhitespace(password)){
                    $('#checkpass-msg').text("비밀번호를 입력해주세요").addClass('form-error').removeClass('form-success');
                    $('#userPassword').val('');
                } else if(!acceptPass.test(password)){
                    $('#checkpass-msg').text("비밀번호는 영어+숫자+특수문자를 조합해야 합니다(8자 이상)").addClass('form-error').removeClass('form-success');          
                } else if(!ck_password || isOnlyWhitespace(ck_password)){
                    $('#checkpass-msg').text("비밀번호 확인을 입력해주세요").addClass('form-error').removeClass('form-success');    
                } else if(password !== ck_password){
                    $('#checkpass-msg').text("비밀번호가 일치하지 않습니다").addClass('form-error').removeClass('form-success'); 
                } else {
                    $('#checkpass-msg').text("사용가능한 비밀번호입니다.").addClass('form-success').removeClass('form-error');
                }
            });

            $('#userName').blur(function(){
                let userName = $('#userName').val();
                if (userName == "" || isOnlyWhitespace(userName)) {
                    $("#name_feedback").text('이름을 입력해주세요.').addClass('form-error').removeClass('form-success');
                    $('#userName').val('');
                } else {
                    $("#name_feedback").text('').removeClass('form-error');
                }
            });

            $('#userEmail').blur(function(){
                let userEmail = $('#userEmail').val();
                let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (userEmail == "" || isOnlyWhitespace(userEmail)) {
                    $("#email_feedback").text('이메일을 입력해주세요.').addClass('form-error').removeClass('form-success');
                    $('#userEmail').val('');
                } else if (!emailPattern.test(userEmail)) {
                    $("#email_feedback").text('이메일의 형식이 맞지 않습니다. 예) example@naver.com').addClass('form-error').removeClass('form-success');
                } else {
                    $("#email_feedback").text('').removeClass('form-error');
                }
            });

            $('#userPhone').blur(function(){
                let userPhone = $('#userPhone').val();
                let phonePattern = /^010\d{8}$/;
                if (userPhone == "" || isOnlyWhitespace(userPhone)) {
                    $("#phone_feedback").text('전화번호를 입력해주세요.').addClass('form-error').removeClass('form-success');
                    $('#userPhone').val('');
                } else if (!phonePattern.test(userPhone)) {
                    $("#phone_feedback").text('전화번호(숫자) 11자리를 입력해주세요.').addClass('form-error').removeClass('form-success');
                    $('#userPhone').val('');
                } else {
                    $("#phone_feedback").text('').removeClass('form-error');
                }
            });

            $('form').submit(function(event){
                if ($(".form-error").text() !== "") {
                    event.preventDefault();
                    alert("입력한 내용에 오류가 있습니다. 다시 확인해주세요.");
                }
            });
        });
    </script>
</body>
</html>