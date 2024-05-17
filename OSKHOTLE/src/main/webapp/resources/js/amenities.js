document.addEventListener('DOMContentLoaded', function() {
    let nextButton = document.querySelector('button[type="submit"]');
    let checkboxes = document.querySelectorAll('.main-1-1 input[type="checkbox"]');

    nextButton.addEventListener('click', function(event) {
        let checkedCount = 0;
        checkboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                checkedCount++;
            }
        });

        if (checkedCount < 3) {
            alert('최소 3개의 옵션을 선택해야 합니다.');
            event.preventDefault(); // 다음으로 이동을 막음
        }
    }); // end click()
}); // end addEventListener()
		