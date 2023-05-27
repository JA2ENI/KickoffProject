

/* input-text 엔터키 submit 방지 */
$('input[type="text"]').keydown(function() {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
});

/* court */
function selectCourt(e) {
	const text = e.options[e.selectedIndex].text;

	document.getElementById('court').innerText = text;
}

/* placeForm */
function getPlaceForm(event) {
	document.getElementById('placeForm').innerText = event.target.value;
}

/* startTime */
function getStartTime(e) {
	const text = e.options[e.selectedIndex].text;

	document.getElementById('startTime').innerText = text;
}

/* endTime */
function getEndTime(e) {
	const text = e.options[e.selectedIndex].text;

	document.getElementById('endTime').innerText = text;
}

/* status */
function getStatus(event) {
	document.getElementById('status').innerText = event.target.value;
}

/* input text */
/* price*/
function getPrice()  {
	const text = document.getElementById('inputPrice').value;
	
	document.getElementById('price').innerText = text;
}

/* startDate */
function getStartDate()  {
	const text = document.getElementById('setStartDate').value;
	
	document.getElementById('startDate').innerText = text;
}

/* endDate */
function getEndDate()  {
	const text = document.getElementById('setEndDate').value;
	
	document.getElementById('endDate').innerText = text;
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
	
	if(!$('#courtName > option:selected').val()) {
	    alert("코트를 선택해주세요.");
	} else if (!$('#openTime > option:selected').val()) {
	    alert("시작 시간을 선택해주세요.");
	} else if (!$('#closeTime > option:selected').val()) {
	    alert("종료 시간을 선택해주세요.");
	} else if(!$("#inputPrice").val()) {
		alert("가격을 입력해주세요.");
		$("inputPrice").focus();
		return false;
	} 
	
	if(confirm("등록 하시겠습니까?") == true) {
		comSubmit.setUrl("<c:url value='/' />"); 
		comSubmit.submit();
	} else {
		return;
	}
}

/* cancle check */
function fn_openReservation() {
	var comSubmit = new ComSubmit();
	
	if(confirm("정말 취소하시겠습니까?") == true) {
		comSubmit.setUrl("<c:url value='/reservation.jsp' />");
		comSubmit.submit();
	} else {
		return;
	}
}


