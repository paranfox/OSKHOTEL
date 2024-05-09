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
            <p>목쌤의 코딩 사이트입니다!</p>
        </div>
        <div class="footer-section">
            <h3>Contact Us</h3>
            <p>Email: mokcoding@example.com<br>Phone: 123-456-7890</p>
        </div>
        <div class="footer-section">
            <h3>Follow Us</h3>
            <ul class="social-links">
                <li><a href="#" target="_blank">Facebook</a></li>
                <li><a href="#" target="_blank">Twitter</a></li>
                <li><a href="#" target="_blank">Instagram</a></li>
            </ul>
        </div>
    </div>
    <div class="copyright">
        <p>© 2024 Mokcoding. All rights reserved.</p>
    </div>
</footer>
</body>
</html>