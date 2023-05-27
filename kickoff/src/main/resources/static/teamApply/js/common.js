
/*input-text 엔터키 submit 방지 */
$('input[type="text"]').keydown(function() {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
});


/* position */
function selectPosition(e) {
	const text = e.options[e.selectedIndex].text;

	document.getElementById('position').innerText = text;
}

/* check */
$(document).ready(function() {
	$("#insert").on("click", function(e) {
		e.preventDefault();
		fn_insertReservation();
	});
	
	$("#cancle").on("click", function(e) {
		e.preventDefault();
		fn_openReservation();
	});
});

/* insert check */
function fn_insertReservation(){
	var comSubmit = new ComSubmit("frm");
	
	if(!$('#position > option:selected').val()) {
	    alert("포지션을 선택해주세요.");
	}  
	
	if(confirm("등록 하시겠습니까?") == true) {
		comSubmit.setUrl("<c:url value='/team.jsp' />"); 
		comSubmit.submit();
	} else {
		return;
	}
}

/* cancle check */
function fn_openReservation() {
	var comSubmit = new ComSubmit();
	
	if(confirm("취소하시겠습니까?") == true) {
		comSubmit.setUrl("<c:url value='/team.jsp' />");
		comSubmit.submit();
	} else {
		return;
	}
}