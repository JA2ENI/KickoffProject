

/* input-text 엔터키 submit 방지 */
$('input[type="text"]').keydown(function() {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
});

/* 풋살장 이름 */
function selectPlaceName(e) {
	const text = e.options[e.selectedIndex].text;

	document.getElementById('selectPlaceName').innerText = text;
}

/* 경기형태 */
function selectgameStyle(e) {
	const text = e.options[e.selectedIndex].text;

	document.getElementById('gameStyle').innerText = text;
}

/* 경기 날짜 */
function getDate()  {
	const text = document.getElementById('setDate').value;
	
	document.getElementById('gameDate').innerText = text;
}

/* 시작 시간 */
function getStartTime(e) {
	const text = e.options[e.selectedIndex].text;

	document.getElementById('startTime').innerText = text;
}

/* 종료 시간 */
function getEndTime(e) {
	const text = e.options[e.selectedIndex].text;

	document.getElementById('endTime').innerText = text;
}

/* 성별 */
function getGender(event) {
	document.getElementById('gender').innerText = event.target.value;
}

/* 매칭 상태*/
function getGameStatus(event) {
	document.getElementById('status').innerText = event.target.value;
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


