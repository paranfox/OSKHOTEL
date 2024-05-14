<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="${path}/resources/css/footer.css"/>
</head>
<body>
	<footer style="text-align: center;">
    <div class="footer-container">
        <div class="footer-section">
            <h3>About Us</h3>
            <p>OSKHOTEL 사이트입니다!</p>
        </div>
        <div class="footer-section">
            <h3>Contact Us</h3>
            <p>Email: oskhotel@gmail.com<br>Phone: 010-2345-9876</p>
        </div>
        <div class="footer-section">
            <h3>Follow Us</h3>
            <ul class="social-links">
                <li><a href="#" target="_blank">여기어때</a></li>
                <li><a href="#" target="_blank">야놀자</a></li>
                <li><a href="#" target="_blank">아고다</a></li>
            </ul>
        </div>
    </div>
    <div class="copyright">
        <p>© 2024 OSKHOTEL. All rights reserved.</p>
    </div>
</footer>
</body>
</html>