
/* 로그인 체크 */
function check() {
	alert("로그인 후 이용해주세요.")
	location.href="/loginAll";
}

/* RESERVATION INSERT */
function insertCheck() {
    const frm = document.forms[0];
    const reservationCourtName = frm.reservationCourtName;
    const reservationCourtForm = frm.reservationCourtForm;
    const reservationHeadcount = frm.reservationHeadcount;
    const reservationDate = frm.reservationDate;
    const reservationStartTime = frm.reservationStartTime;
    const reservationEndTime = frm.reservationEndTime;
    const reservationPrice = frm.reservationPrice;
    let isValid = true;

    if(reservationCourtName.value == ""){
        alert("코트 이름을 선택해주세요.")
        reservationCourtName.focus();
        isValid=false;
    } else if(reservationCourtForm.value == "") {
        alert("형태를 선택해주세요.")
        reservationCourtForm.focus();
        isValid = false;
    } else if(reservationHeadcount.value == "") {
        alert("추천 경기를 선택해주세요.")
        reservationHeadcount.focus();
        isValid = false;
    } else if(reservationDate.value == "") {
        alert("예약 날짜를 선택해주세요.")
        reservationDate.focus();
        isValid = false;
    } else if(reservationStartTime.value == "") {
        alert("시작 시간을 선택해주세요.")
        reservationStartTime.focus();
        isValid = false;
    } else if(reservationEndTime.value == "") {
        alert("종료 시간을 선택해주세요.")
        reservationEndTime.focus();
        isValid = false;
    } else if(reservationPrice.value == "") {
        alert("대관비를 입력해주세요.")
        reservationPrice.focus();
        isValid = false;
    } else if(reservationPrice.value.length > 7) {
        alert("대관비는 7자리 이하입니다.")
        reservationPrice.focus();
        isValid = false;
    }

    if(isValid) {
        alert('풋살장 예약 모집을 시작합니다.')
        frm.action='reservationInsert';
        frm.submit();
    }
}

/* RESERVATION UPDATE */
function updateCheck() {
    const frm = document.forms[0];
    const reservationCourtName = frm.reservationCourtName;
    const reservationCourtForm = frm.reservationCourtForm;
    const reservationHeadcount = frm.reservationHeadcount;
    const reservationDate = frm.reservationDate;
    const reservationStartTime = frm.reservationStartTime;
    const reservationEndTime = frm.reservationEndTime;
    const reservationPrice = frm.reservationPrice;
    let isValid = true;

    if(reservationCourtName.value == ""){
        alert("코트 이름을 선택해주세요.")
        reservationCourtName.focus();
        isValid=false;
    } else if(reservationCourtForm.value == "") {
        alert("형태를 선택해주세요.")
        reservationCourtForm.focus();
        isValid = false;
    } else if(reservationHeadcount.value == "") {
        alert("추천 경기를 선택해주세요.")
        reservationHeadcount.focus();
        isValid = false;
    } else if(reservationDate.value == "") {
        alert("예약 날짜를 선택해주세요.")
        reservationDate.focus();
        isValid = false;
    } else if(reservationStartTime.value == "") {
        alert("시작 시간을 선택해주세요.")
        reservationStartTime.focus();
        isValid = false;
    } else if(reservationEndTime.value == "") {
        alert("종료 시간을 선택해주세요.")
        reservationEndTime.focus();
        isValid = false;
    } else if(reservationPrice.value == "") {
        alert("대관비를 입력해주세요.")
        reservationPrice.focus();
        isValid = false;
    } else if(reservationPrice.value.length > 7) {
        alert("대관비는 7자리 이하입니다.")
        reservationPrice.focus();
        isValid = false;
    }

    if(isValid) {
        alert('풋살장 예약모집글이 수정되었습니다.')
        frm.action='reservationUpdate';
        frm.submit();
    }
}

/* RESERVATION REQUEST */
function requestCheck() {
	if(!confirm("신청하시겠습니까?")){
		return false;
	} else {
		alert('풋살장 예약 신청되었습니다.')
	    const frm = document.forms[0];
	    frm.action='reservationRequest';
	    frm.submit();
	}
}
		
