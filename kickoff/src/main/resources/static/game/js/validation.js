/* 유효성 검사 */
/*
function validCheck() {
    const frm = document.forms[0];
    const placeName = frm.placeName;
    const gameStyle = frm.gameStyle;
    const gender = frm.gender;
    const reservationDate = frm.reservationDate;
    const reservationStartTime = frm.reservationStartTime;
    const reservationEndTime = frm.reservationEndTime;
    const gameStatus = frm.gameStatus;
    let isValid = true;

    if(placeName.value == ""){
        alert("풋살장을 선택해주세요.")
        placeName.focus();
        isValid=false;
    } else if(gameStyle.value == "") {
        alert("형태를 선택해주세요.")
        gameStyle.focus();
        isValid = false;
    } else if(gender.value == "") {
        alert("성별을 선택해주세요.")
        gender.focus();
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
    } else if(gameStatus.value == "") {
        alert("매칭 상태를 입력해주세요.")
        gameStatus.focus();
        isValid = false;
    }
    if(isValid) {
        alert('매칭 모집을 시작합니다.')
        frm.action='gameUpdate';
        frm.submit();
    }
}
*/

function requestCheck() {
    const frm = document.forms[0];
    let isValid = true;

    if(isValid) {
        alert('매칭 모집을 시작합니다.')
        frm.action='gameUpdate';
        frm.submit();
        location.href = "/game";
    }
}
