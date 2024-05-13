<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage</title>
<style>
.button-container {
	display: flex;
	gap: 10px; /* 버튼 사이 간격 조절 */
}
</style>
</head>
<body>
	<%@include file="../fix/header.jsp"%>
	<form action="user/mypage" method="post">
		<h2>${sessionScope.userId}님의정보</h2>
		<div>
			<label>이름(Name)</label> <br> <input type="text" name="userName"
				placeholder="${UserVO.userName }" readonly />
		</div>
		<br>
		<div>
			<label>이메일(Email)</label> <br> <input type="email"
				name="userEmail" placeholder="${UserVO.userEmail }" readonly/>
		</div>
		<br>
		<div>
			<label>전화번호(Phone)</label> <br> <input type="text"
				name="userPhone" placeholder="${UserVO.userPhone }" readonly/>
		</div>
	</form>
	<br>
	<div class="button-container">

		<button type="button" onclick="location.href='update'">수정하기</button>
		
		<form action="delete" method="post">
			<button type="submit">탈퇴하기</button>
		</form>
	</div>

</body>
</html>