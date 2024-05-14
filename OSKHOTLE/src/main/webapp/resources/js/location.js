$(document).ready(function(){
		getAllCountry(); // 함수 호출 코드 추가
		
		// 도시 전체 가져오기
		function getAllCountry() {
		
			// url에 boardId 전송
			let url = '../hotel/location';
			// 가져올 데이터가 JSON이므로
			// getJSON으로 파싱하는게 편리함
			$.getJSON(
				url,
				function(data) {
				console.log('여기작동?');
					// data : 서버에서 전송받은 list 데이터가 저장되어 있음.
					// getJSON()에서 json 데이터는
					// javascript object로 자동 parsing됨
					console.log(data); // data의 타입은 object
				
					let list = ''; // 댓글 데이터를 HTML에 표현할 문자열 변수
					
					// $(컬렉션).each() : 컬렉션데이터를 반복문으로 꺼내는 함수
					$(data).each(function(){
						// this : 컬렉션의 각 인덱스 데이터를 의미
						console.log(this);
					
						list += '<option value="' + this.countryNo + '">'
						+ this.countryName
						+ '</option>';
						
					}); // end each()
					
					$('#countrybox').html(list);
					
				}
			); // end getJSON
			
		} // end getAllCountry()
		
		// 도시 선택시 지역 수정
        $('#countrybox').on('change',  function(){
           console.log(this);
           
           let countryNo = $("#countrybox option:selected").val();
           console.log("선택된 도시 번호 : " + countryNo);
           
          	 $.ajax({
   				type : 'POST',
   				url : '../hotel/location/' + countryNo,
   				data : {
   					'countryNo' : countryNo,
   				},
   				success : function(data) {
   					console.log(data);
   					console.log('도시지역 선택시 나와야함');
   				
   					let list = ''; 
   					
   					$(data).each(function(){
   						// this : 컬렉션의 각 인덱스 데이터를 의미
   						console.log(this);
   					
   						list += '<option value="' + this.cityNo + '">'
   						+ this.cityName
   						+ '</option>';
   						
   					}); // end each()
   					
   					$('#citybox').html(list);
   					
   					
   				} // getAllCity;
   			
   			}); // end ajax()
           
        }); // end citybox.on()
		
	}); // end document 
