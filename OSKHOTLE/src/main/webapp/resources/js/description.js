$(document).ready(function(){
$('.hotelstar > .star').click(function() {
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  
		  console.log(this.querySelector('input').value);
		  let value = this.querySelector('input').value;
		  document.querySelector('input[name="hotelster"]').value = value;
		  
		}); // end .ster.click()
		
}); // end document 
document.addEventListener('DOMContentLoaded', function() {
    var form = document.querySelector('form');
    var textarea = document.querySelector('textarea');

    form.addEventListener('submit', function(event) {
        if (textarea.value.trim() === '') {
            alert('숙소 소개를 입력해주세요.');
            event.preventDefault(); // form 제출을 막음
        }
    });
}); // end addEventListener