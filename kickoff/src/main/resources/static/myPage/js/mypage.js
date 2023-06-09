
/* 엔터키 submit 방지 */
document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
}, true);

/* 예약 내역 */
/* cancel */
function cancel(url) {
	var check = confirm("예약 취소 하시겠습니까?");
	
	if(check == true) {
		location = url;
	} 
}

