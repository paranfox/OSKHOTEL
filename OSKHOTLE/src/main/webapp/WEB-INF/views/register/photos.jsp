<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록 사진등록 페이지</title>
<script>
function validateForm() {
    var files = document.getElementById('fileInput').files;
    if(files.length < 3) {
        alert("최소 3장의 사진을 업로드해주세요.");
        return false;
    }
    for(var i = 0; i < files.length; i++) {
        var file = files[i];
        if(file.type != 'image/png') {
            alert("PNG 이미지만 업로드 가능합니다.");
            return false;
        }
    }
    return true;
}

function handleFileSelect() {
    var files = document.getElementById('fileInput').files;
    var fileList = document.getElementById('fileList');
    fileList.innerHTML = '';
    for(var i = 0; i < files.length; i++) {
        var file = files[i];
        var listItem = document.createElement('li');
        var img = document.createElement('img');
        img.src = URL.createObjectURL(file);
        img.width = 300;
        img.height = 300;
        img.onload = function() {
            URL.revokeObjectURL(this.src);
        }
        listItem.appendChild(img);
        listItem.appendChild(document.createTextNode(file.name));
        fileList.appendChild(listItem);
    }
}
</script>
</head>
<body>
	<%@include file="../fix/header.jsp"%>
	<label>사진등록</label>
	<form method="post" action="${path}/register/photos" onsubmit="return validateForm();">
		<input type="file" id="fileInput" multiple onchange="handleFileSelect();">
		<ul id="fileList"></ul>
		<input type="submit" value="다음">
	</form>
</body>
</html>
