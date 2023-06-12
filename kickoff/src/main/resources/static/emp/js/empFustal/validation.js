/* 유효성 검사 */
function validCheck() {
    const frm = document.forms[0];
    const placeName = frm.placeName;
    const courtForm = frm.courtForm;
    const empFutsalAddress = frm.empFutsalAddress;
    const placeForm = frm.placeForm;
    const setDate = frm.setDate;
    const openTime = frm.openTime;
    const placeLight = frm.placeLight;
    const placeParking = frm.placeParking;
    const inputPrice = frm.inputPrice;

    if(placeName.value == ""){
        alert("풋살장 이름을 작성해주세요.")
        placeName.focus();
        isValid=false;
    } else if(courtForm.value == "") {
        alert("바닥 형태를 선택해주세요.")
        courtForm.focus();
        isValid = false;
    } else if(placeForm.value == "") {
        alert("실외/실내 여부를 선택해주세요.")
        placeForm.focus();
        isValid = false;
    } else if(setDate.value == "") {
        alert("개방 일수를 선택해주세요.")
        setDate.focus();
        isValid = false;
    } else if(openTime.value == "") {
        alert("대여 시간을 선택해주세요.")
        openTime.focus();
        isValid = false;
    } else if(placeLight.value == "") {
        alert("조명 여부를 선택해주세요.")
        placeLight.focus();
        isValid = false;
    } else if(empFutsalAddress.value == "") {
        alert("위치를 입력해주세요.")
        empFutsalAddress.focus();
        isValid = false;
    } else if(placeParking.value == "") {
        alert("주차장 여부를 입력해주세요.")
        placeParking.focus();
        isValid = false;
    } else if(inputPrice.value.length > 7) {
        alert("가격은 7자리 이하입니다..")
        inputPrice.focus();
        isValid = false;
    }

}

function requestCheck() {
    const frm = document.forms[0];
    let isValid = true;

    if(isValid) {
        alert('풋살장 등록이 완료되었습니다.')
        frm.action='empFutsal';
        frm.submit();
    }
}