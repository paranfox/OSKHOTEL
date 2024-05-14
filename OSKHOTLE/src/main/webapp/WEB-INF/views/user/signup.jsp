<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body>
<%@include file="../fix/header.jsp" %>
    <h1>회원 가입</h1>
    <form action="signup" method="post">
         <div >
              <label for="userId" class="userId">아이디(Id)</label> <br>
              <input type="text" class="userId" name="userId" id="userId" placeholder="아이디"/> 
              <div><font id="id_feedback" size="2"></font></div>
        </div>
        <br>
        <div>
            <label>비밀번호(Pw)</label> <br>
            <input type="password" placeholder="비밀번호" name="userPassword" value="" maxlength="20" />
			<div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자를 모두 포함)</div>
			
        </div>
        <br>
         <div>
            <label>비밀번호 확인(Pw)</label> <br>
            <input type="password" title="비밀번호 확인" name="userPassword_ck" class="chk" />
			<div class="valid">비밀번호를 다시 입력하세요.</div>
        </div>     
         <br>
        <div>
            <label>이름(Name)</label> <br>
             <input type="text" name="userName" maxlength="40" value="" placeholder="이름" />
			<div class="valid">이름을 입력하세요.</div>
        </div>
        <br>
        <div>
            <label>이메일(Email)</label> <br>
            <input type="email" placeholder="이메일" name="userEmail" maxlength="40" value="" />
			<div class="valid">이메일을 입력하세요.</div>

        </div>
        <br>
        <div>
            <label>전화번호(Phone)</label> <br>
            <input type="tel" placeholder="전화번호" name="userPhone" value="" autocomplete="off" />
				<div class="valid">전화번호를 입력하세요.</div>
        </div>
        <br>
        <button type="submit">회원가입</button>
    </form>
    
     <script type="text/javascript">
    $(document).ready(function(){
        $('#userId').blur(function(){
            let userId = $('#userId').val();
            
            let url = "../usercheck/useridCheck/" + userId; // 수정: AJAX 요청의 URL을 "/useridCheck"로 설정
            $.ajax({
                url,
                type : 'get',
                function(result){
                    if(result.result == 1){ // 수정: 서버에서 반환하는 JSON의 result 속성을 사용
                        $("#id_feedback").html('이미 사용중인 아이디입니다.');
                        $("#id_feedback").css('color','#dc3545');
                    } else {
                        $("#id_feedback").html('사용할 수 있는 아이디입니다.');
                        $("#id_feedback").css('color','#2fb380');
                    }
                }
            });
        });
    });
</script>
    
</body>
</html>