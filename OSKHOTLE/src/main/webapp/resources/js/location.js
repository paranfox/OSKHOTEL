$(document).ready(function(){
				getAllReplies(); // 함수 호출 코드 추가
				
				$('#btnAdd').click(function(){
					let boardId = $('#boardId').val(); // 게시판 번호 데이터
					let memberId = $('#memberId').val(); // 작성자 데이터
					let replyContent = $('#replyContent').val(); // 댓글 내용
					let obj = {
							'boardId' : boardId,
							'memberId' : memberId,
							'replyContent' : replyContent
					};
					console.log(obj);
					
					// $.ajax로 송수신
					$.ajax({
						type : 'POST',
						url : 'replies/add',
						data : {'obj' : JSON.stringify(obj)}, // JSON으로 변환
						success : function(result) {
							console.log(result);
							getAllReplies(); // 함수 호출 코드 추가
						}
					});
				});
				
				
				// 게시판 댓글 전체 가져오기
				function getAllReplies() {
					// 댓글을 가져오기 위해 boardId 필요
					let boardId = $('#boardId').val();
					
					// url에 boardId 전송
					let url = 'replies/all?boardId=' + boardId;
					let memberId = "${sessionScope.memberId }";
					
					// 가져올 데이터가 JSON이므로
					// getJSON으로 파싱하는게 편리함
					$.getJSON(
						url, 
						function(data) {
							// data : 서버에서 전송받은 list 데이터가 저장되어 있음.
							// getJSON()에서 json 데이터는
							// javascript object로 자동 parsing됨
							console.log(data); // data의 타입은 object
						
							let list = ''; // 댓글 데이터를 HTML에 표현할 문자열 변수
							
							// $(컬렉션).each() : 컬렉션데이터를 반복문으로 꺼내는 함수
							$(data).each(function(){
								// this : 컬렉션의 각 인덱스 데이터를 의미
								console.log(this);
							
								// String을 date 타입으로 변경
								let replyDataCreated = new Date(this.replyDateCreated);
								
								let disabled = '';
								let readonly = '';
								
								if(memberId != this.memberId) {
									disabled = 'disabled';
									readonly = 'readonly';
								}
								
								list += '<div class="reply_item">'
								+ '<pre>'
								+ '<input type="hidden" id="replyId" value="' + this.replyId +'">'
								+ this.memberId
								+ '&nbsp;&nbsp;' // 공백
								+ '<input type="text" id="replyContent" '+ readonly +' value="' + this.replyContent + '">'
								+ '&nbsp;&nbsp;'
								+ replyDataCreated
							    + '<button class="btn_update" '+disabled+'>수정</button>'
							    + '<button class="btn_delete" '+disabled+'>삭제</button>'
							    + '</pre>'
							    + '</div>';
								
							}); // end each()
							
							$('#replies').html(list);
							
						}
					); // end getJSON
					
				} // end getAllReplies()
				
				// 수정 버튼을 클릭하면 선택된 댓글 수정
				// on메서드를 사용해서 class이름이 같아도 찾아감
				$('#replies').on('click', '.reply_item .btn_update', function(){
					console.log(this);
					// 선택된 댓글의 replyId, replyContent 값을 저장
					// prevAll() : 선택된 노드 이전에 있는 모든 형제 노드를 접근
					let replyId = $(this).prevAll('#replyId').val();
					let replyContent = $(this).prevAll('#replyContent').val();
					console.log("선택된 댓글 번호 : " + replyId + ",  댓글 내용 : " + replyContent);
					
					
					// ajax로 데이터 전송하여
					// 댓글 수정 기능 수행하고
					// 수행 결과를 리턴하는 코드
					// ajax 요청
					$.ajax({
						type : 'POST',
						url : 'replies/update',
						data : {
							'replyId' : replyId,
							'replyContent' : replyContent
						},
						success : function(result) {
							console.log(result);
							getAllReplies();
						}
						
					}); // end ajax()
					
				}); // end #replies.on()
				
				// 삭제 버튼을 클릭하면 선택된 댓글 삭제
				$('#replies').on('click', '.reply_item .btn_delete', function(){
					console.log(this);
					// 선택된 댓글의 replyId, replyContent 값을 저장
					// prevAll() : 선택된 노드 이전에 있는 모든 형제 노드를 접근
					let replyId = $(this).prevAll('#replyId').val();
					
					$.ajax({
						type : 'POST',
						url : 'replies/delete',
						data : {
							'replyId' : replyId,
						},
						success : function(result) {
							console.log(result);
							getAllReplies();
						}
						
					}); // end ajax()
					
				}); // end #replies.on()
				
				
			}); // end document 
		
			function listForm() {
				let form = document.getElementById("updateForm");
				form.method = "GET";
				form.action = "list.do";
				form.submit();
			}
			
			function updateForm() {
				let form = document.getElementById("updateForm");
				form.method = "GET";
				form.action = "update.do";
				form.submit();
			}

			function deleteForm() {
				if (confirm('정말로 삭제 하시겠습니까?')) {
					let form = document.getElementById("updateForm");
					form.method = "POST";
					form.action = "delete.do";
					form.submit();
				} else {
					form.method = "GET";
					location.href = "detail.do";
				}
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			