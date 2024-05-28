<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>

<script type="text/javascript">
$(document).ready(function(){
 
    function isOnlyWhitespace(input) {
        return !input.trim().length;
    }

    $('#userId').blur(function(){
        let userId = $('#userId').val();
        
        if (userId == "" || isOnlyWhitespace(userId)) {
            $("#id_feedback").html('아이디를 입력해주세요.').css('color','#dc3545');
            $('#userId').val('');
        } else {
            let url = "../usercheck/useridCheck/" + userId;
            $.ajax({
                url: url,
                type: 'GET',
                dataType: 'json',
                success: function(result){
                    if(result == 1){
                        $("#id_feedback").html('이미 사용중인 아이디입니다.').css('color','#dc3545');
                    } else {
                        $("#id_feedback").html('사용할 수 있는 아이디입니다.').css('color','#2fb380');
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
            $('#checkpass-msg').text("비밀번호를 입력해주세요").css("color", "red");
            $('#userPassword').val('');
        } else if(!acceptPass.test(password)){
            $('#checkpass-msg').text("비밀번호는 영어+숫자+특수문자를 조합해야 합니다(8자 이상)").css("color", "red");          
        } else if(!ck_password || isOnlyWhitespace(ck_password)){
            $('#checkpass-msg').text("비밀번호 확인을 입력해주세요").css("color", "red");    
        } else if(password !== ck_password){
            $('#checkpass-msg').text("비밀번호가 일치하지 않습니다").css("color", "red"); 
        } else {
            $('#checkpass-msg').text("사용가능한 비밀번호입니다.").css("color", "green");
        }
    });

    $('#userName').blur(function(){
        let userName = $('#userName').val();
        if (userName == "" || isOnlyWhitespace(userName)) {
            $("#name_feedback").html('이름을 입력해주세요.').css('color','#dc3545');
            $('#userName').val('');
        } else {
            $("#name_feedback").html('');
        }
    });

    $('#userEmail').blur(function(){
        let userEmail = $('#userEmail').val();
        let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (userEmail == "" || isOnlyWhitespace(userEmail)) {
            $("#email_feedback").html('이메일을 입력해주세요.').css('color','#dc3545');
            $('#userEmail').val('');
        } else if (!emailPattern.test(userEmail)) {
            $("#email_feedback").html('이메일의 형식이 맞지 않습니다. 예) 33wndql@naver.com').css('color','#dc3545');
        } else {
            $("#email_feedback").html('');
        }
    });

    $(".email_auth_btn").click(function(){	     	 
   	 let email = $('#userEmail').val();
   	 
   	 $.ajax({
			type : "POST",
			url : "/emailAuth",
			data : {userEmail : userEmail},
			success: function(data){
				alert("인증번호가 발송되었습니다.");
				email_auth_cd = data;
			},
			error: function(data){
				alert("메일 발송에 실패했습니다.");
			}
		}); 
	});
    
    $('#userPhone').blur(function(){
        let userPhone = $('#userPhone').val();
        let phonePattern = /^010\d{8}$/;
        if (userPhone == "" || isOnlyWhitespace(userPhone)) {
            $("#phone_feedback").html('전화번호를 입력해주세요.').css('color','#dc3545');
            $('#userPhone').val('');
        } else if (!phonePattern.test(userPhone)) {
            $("#phone_feedback").html('전화번호(숫자) 11자리를 입력해주세요.').css('color','#dc3545');
            $('#userPhone').val('');
        } else {
            $("#phone_feedback").html('');
        }
    });
});
</script>
<body>
<%@include file="../fix/header.jsp" %>
    <h1>회원 가입</h1>
    <form action="signup" method="post">
        <div>
            <label for="userId" class="userId">아이디(Id)</label> <br>
            <input type="text" class="userId" name="userId" id="userId" placeholder="아이디" required/>
            <div><font id="id_feedback" size="2"></font></div>
        </div>
        <br>
        <div>
            <label>비밀번호(Pw)</label> <br>
            <input type="password" name="userPassword" id="userPassword" placeholder="비밀번호입력" required/>
            <input type="password" name="userPassword_ck" id="userPassword_ck" placeholder="비밀번호확인" required/>
            <p><small id="checkpass-msg" class="form-error"></small></p>
        </div>
        <div>
            <label>이름(Name)</label> <br>
            <input type="text" placeholder="이름" name="userName" id="userName" required/>
            <div><font id="name_feedback" size="2"></font></div>
        </div>
        <br> 
         <div>
            <label>이메일(Email)</label> <br>
			<input type="text" placeholder="이메일" name="userEmail" id="userEmail" class="userEmail">
			<button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
			<div><font id="email_feedback" size="2"></font></div>
			<input type="text" placeholder="인증번호 입력" id="email_auth_key">
	    </div>
        <br><br>
        <div>
            <label>전화번호(Phone)</label> <br>
            <input type="text" placeholder="전화번호" name="userPhone" id="userPhone" autocomplete="off" required/>
            <div><font id="phone_feedback" size="2"></font></div>
        </div>
        <br>
        <button type="submit">회원가입</button>
    </form>
     <script type="text/javascript">
        $(document).ready(function(){
            $('form').submit(function(event){
                if ($("#checkpass-msg").css("color") == "rgb(255, 0, 0)" ||
                	$("#name_feedback").html() !== '' ||
                    $("#email_feedback").html() !== '' ||
                    $("#phone_feedback").html() !== '') {
                    event.preventDefault();
                    alert("입력한 내용에 오류가 있습니다. 다시 확인해주세요.");
                }
                
            });
        });
    </script>
</body>
</html>

