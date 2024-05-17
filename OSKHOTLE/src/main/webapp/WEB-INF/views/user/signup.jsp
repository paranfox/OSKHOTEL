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
    $('#userId').blur(function(){
        let userId = $('#userId').val();
        
        // 아이디가 공백인 경우 메시지를 표시
        if (userId == "") {
            $("#id_feedback").html('아이디를 입력해주세요.').css('color','#dc3545');
            return;
        }
        
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
    });

    $('#userPassword, #userPassword_ck').blur(function(){
        let password = $("#userPassword").val();       // 비밀번호 입력
        let ck_password = $("#userPassword_ck").val(); // 비밀번호 체크 입력
        let acceptPass = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;

        if(!password){
            $('#checkpass-msg').text("비밀번호를 입력해주세요").css("color", "red");
            $("#userPassword").focus();
            return false;
        } else if(!acceptPass.test(password)){
            $('#checkpass-msg').text("비밀번호는 영어+숫자+특수문자를 조합해야 합니다(8자 이상)").css("color", "red");
            $("#userPassword").focus();
            return false;
        } else if(!ck_password){
            $('#checkpass-msg').text("비밀번호 확인을 입력해주세요").css("color", "red");
            $("#userPassword_ck").focus();
            return false;
        } else if(password !== ck_password){
            $('#checkpass-msg').text("비밀번호가 일치하지 않습니다").css("color", "red");
            $("#userPassword_ck").focus();
            return false;
        } else {
            $('#checkpass-msg').text("사용가능한 비밀번호입니다.").css("color", "green");
        }
    });
});
     
       $('#userPassword, #userPassword_ck').blur(function(){


</script>

<body>
<%@include file="../fix/header.jsp" %>
    <h1>회원 가입</h1>
    <form action="signup" method="post">
         <div >
              <label for="userId" class="userId">아이디(Id)</label> <br>
              <input type="text" class="userId" name="userId" id="userId" placeholder="아이디" required/> 
              <div><font id="id_feedback" size="2"></font></div>
        </div>
        <br>
        <div>
            <label>비밀번호(Pw)</label> <br>
            <input type="password"  name="userPassword" id="userPassword" placeholder="비밀번호입력" required/>
            <input type="password" name="userPassword_ck" id="userPassword_ck" placeholder="비밀번호확인" required/>
            <p><small id="checkpass-msg" class="form-error"></small></p>
			
        </div>
        <br>
        <div>
            <label>이름(Name)</label> <br>
             <input type="text" name="userName" maxlength="40" value="" placeholder="이름" required/>
			<p><small id="checkpass-msg" class="form-error"></small></p>
        </div>
        <br>
        <div>
            <label>이메일(Email)</label> <br>
            <input type="hidden" name="userEmail" id="userEmail" required/>
             <input type="text" placeholder="이메일" id="userEmail_id" name=""/>
             <span style="margin:0 10px;">@</span>
			 <select class="fcc_select" name="" id="userEmail_domain">
                <option value="naver.com">naver.com</option>
                <option value="kakao.com">kakao.com</option>
                <option value="daum.net">daum.net</option>
   				<option value="gmail.com">gmail.com</option>
    			<option value="hanmail.net">hanmail.net</option>
    			<option value="hotmail.com">hotmail.com</option>
   			 	<option value="korea.com">korea.com</option>
   				<option value="nate.com">nate.com</option>
   				<option value="yahoo.com">yahoo.com</option>
            </select>
          <p><small id="checkmail-msg" class="form-error"></small></p>

        </div>
        <br>
        <div>
            <label>전화번호(Phone)</label> <br>
            <input type="tel" placeholder="전화번호" name="userPhone" value="" autocomplete="off" required/>
				<div class="valid">전화번호를 입력하세요.</div>
        </div>
        <br>
        <button type="submit">회원가입</button>
    </form>
    

    
</body>
</html>