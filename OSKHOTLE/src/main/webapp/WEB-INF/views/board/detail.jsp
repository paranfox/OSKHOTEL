<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- jquery 라이브러리 import -->
<script src="https://code.jquery.com/jquery-3.7.1.js">
</script>
<meta charset="UTF-8">
<title>${boardVO.boardTitle }</title>
</head>
<body>
   <h2>글 보기</h2>
   <div>
      <p>글 번호 : ${boardVO.boardId }</p>
   </div>
   <div>
      <p>제목 : </p>
      <p>${boardVO.boardTitle }</p>
   </div>
   <div>
      <p>작성자 : ${boardVO.memberId }</p>
      <!-- boardDateCreated 데이터 포멧 변경 -->
      <fmt:formatDate value="${boardVO.boardDateCreated }"
               pattern="yyyy-MM-dd HH:mm:ss" var="boardDateCreated"/>
      <p>작성일 : ${boardDateCreated }</p>
   </div>
   <div>
      <textarea rows="20" cols="120" readonly>${boardVO.boardContent }</textarea>
   </div>
   
   <button onclick="location.href='list'">글 목록</button>
   <button onclick="location.href='modify?boardId=${boardVO.boardId}'">글 수정</button>
   <button id="deleteBoard">글 삭제</button>
   <form id="deleteForm" action="delete" method="POST">
        <input type="hidden" name="boardId" value="${boardVO.boardId}">
   </form> 
   <!-- 데이터가 변하는 방식은 post방식을 쓰고 delete는 post방식으로 함 -->
   
   <script type="text/javascript">
     $(document).ready(function(){
    	 $('#deleteBoard').click(function(){
    		if(confirm('삭제하시겠습니까?')){
    			$('#deleteForm').submit(); // form 데이터 전송
    		} 
    	 });	
     }); // end document
   </script>
   
   <input type="hidden" id="boardId" value="41">

   <div style="text-align: center;">
      <input type="text" id="memberId" >
      <input type="text" id="replyContent">
      <button id="btnAdd">작성</button>
   </div>

   <hr>
   <div style="text-align: center;">
      <div id="replies"></div>
   </div>

   <script type="text/javascript">
      $(document).ready(function(){
         getAllReply(); // 함수 호출      
         
         // 댓글 작성 기능
         $('#btnAdd').click(function(){
            var boardId = $('#boardId').val(); // 게시판 번호 데이터
            var memberId = $('#memberId').val(); // 작성자 데이터
            var replyContent = $('#replyContent').val(); // 댓글 내용
            // javascript 객체 생성
            var obj = {
                  'boardId' : boardId,
                  'memberId' : memberId,
                  'replyContent' : replyContent
            }
            console.log(obj);
            
            // $.ajax로 송수신
            $.ajax({
               type : 'POST', // 메서드 타입
               url : '../reply', // url
               headers : { // 헤더 정보
                  'Content-Type' : 'application/json' // json content-type 설정 , 등록, 수정, 삭제에만 있음
               }, 
               data : JSON.stringify(obj), // JSON으로 변환
               success : function(result) { // 전송 성공 시 서버에서 result 값 전송
                  console.log(result);
                  if(result == 1) {
                     alert('댓글 입력 성공');
                     getAllReply(); // 함수 호출      
                  }
               }
            });
         }); // end btnAdd.click()
         
         // 게시판 댓글 전체 가져오기
         function getAllReply() {
            var boardId = $('#boardId').val();
            
            var url = '../reply/all/' + boardId;
            $.getJSON(
               url,       
               function(data) {
                  // data : 서버에서 전송받은 list 데이터가 저장되어 있음.
                  // getJSON()에서 json 데이터는 
                  // javascript object로 자동 parsing됨.
                  console.log(data);
                  
                  var list = ''; // 댓글 데이터를 HTML에 표현할 문자열 변수
                  
                  // $(컬렉션).each() : 컬렉션 데이터를 반복문으로 꺼내는 함수
                  $(data).each(function(){
                     // this : 컬렉션의 각 인덱스 데이터를 의미
                     console.log(this);
                    
                     // 전송된 replyDateCreated는 문자열 형태이므로 날짜 형태로 변환이 필요
                     var replyDateCreated = new Date(this.replyDateCreated);

                     list += '<div class="reply_item">'
                        + '<pre>'
                        + '<input type="hidden" id="replyId" value="'+ this.replyId +'">'
                        + this.memberId
                        + '&nbsp;&nbsp;' // 공백
                        + '<input type="text" id="replyContent" value="'+ this.replyContent +'">'
                        + '&nbsp;&nbsp;'
                        + replyDateCreated
                        + '&nbsp;&nbsp;'
                        + '<button class="btn_update" >수정</button>'
                        + '<button class="btn_delete" >삭제</button>'
                        + '</pre>'
                        + '</div>';
                  }); // end each()
                     
                  $('#replies').html(list); // 저장된 데이터를 replies div 표현
               } // end function()
            ); // end getJSON()
         } // end getAllReply()
         
         // 수정 버튼을 클릭하면 선택된 댓글 수정
         $('#replies').on('click', '.reply_item .btn_update', function(){
            console.log(this);
            
            // 선택된 댓글의 replyId, replyContent 값을 저장
            // prevAll() : 선택된 노드 이전에 있는 모든 형제 노드를 접근
            var replyId = $(this).prevAll('#replyId').val();
            var replyContent = $(this).prevAll('#replyContent').val();
            console.log("선택된 댓글 번호 : " + replyId + ", 댓글 내용 : " + replyContent);
            
            // ajax 요청
            $.ajax({
               type : 'PUT', 
               url : '../reply/' + replyId,
               headers : {
                  'Content-Type' : 'application/json'
               },
               data : replyContent, 
               success : function(result) {
                  console.log(result);
                  if(result == 1) {
                     alert('댓글 수정 성공!');
                     getAllReply();
                  }
               }
            });
            
         }); // end replies.on()
         
         // 삭제 버튼을 클릭하면 선택된 댓글 삭제
         $('#replies').on('click', '.reply_item .btn_delete', function(){
            console.log(this);
            var boardId = $('#boardId').val(); // 게시판 번호 데이터
            var replyId = $(this).prevAll('#replyId').val();
            
            // ajax 요청
            $.ajax({
               type : 'DELETE', 
               url : '../reply/' + replyId + '/' + boardId, 
               headers : {
                  'Content-Type' : 'application/json'
               },
               success : function(result) {
                  console.log(result);
                  if(result == 1) {
                     alert('댓글 삭제 성공!');
                     getAllReply();
                  }
               }
            })
         }); // end replies.on()      

      }); // end document()
   </script>
   
</body>
</html>


