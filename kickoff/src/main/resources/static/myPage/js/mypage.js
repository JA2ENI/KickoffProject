
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

/* Email */
$("#selboxDirect").change(function(){
	$('#email').val($(this).val());
});

$("#emailAddress").click(function(){
	$('#email').val($(this).val());
});

/* Email 직접입력 */
$(function(){
	$("#selboxDirect").hide();
	$("#checkPhoneBox").hide();
	$("#emailAddress").change(function() {
		if($("#emailAddress").val() == "direct") {
			$("#emailAddress").hide();
			$("#selboxDirect").show();
		}  else {
			$("#selboxDirect").hide();
		}
	}) 
});

/* 회원 탈퇴 */
function userDelete() {
	var confirmFlag = confirm("정말 탈퇴하시겠습니까?");

	if(confirmFlag) {
		location.href="/userDelete";
	} 
}

/* 주소 api */
function kakaopost() {
	var width = 500;
	var height = 460;
	
    new daum.Postcode({
    	width: width,
    	height: height,
    	
        oncomplete: function(data) {
           document.querySelector("#userAddress").value =  data.address;
        }
    }).open({
    	left: (window.screen.width / 2) - (width / 2),
    	top: (window.screen.height / 2) - (height / 2)
    });
}

/* 네이버 휴대폰 인증 api */
$("#sendPhone").click(function() {
    if($("#phone").val() != "")    {
        $("#checkPhoneBox").show();
    } else {
        $("#checkPhoneBox").hide();
    }

    var phoneNumber = $('#phone').val();

    var obj = {"to" : phoneNumber};

    Swal.fire({
        text: '인증번호 발송 완료!',
    });

    $.ajax({
        url: "/sms/send",
        type: "post",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(obj),
        success: function(data) {
            $('#checkPhoneBtn').click(function() {
                if(data.smsConfirmNum == $('#checkPhone').val()){
                    Swal.fire(
                        '인증성공!',
                        '휴대폰 인증이 정상적으로 완료되었습니다.',
                        'success'
                    )
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: '인증오류',
                        text: '인증번호가 올바르지 않습니다!',
                    });
                }
            });
        }
    });
});
        

/* 유효성 검사 */
/*function validCheck() {
    const frm = document.forms[0];
    const mail = frm.mail;
    const email = frm.email;
    const year = frm.year;
    const month = frm.month;
    const day = frm.day;
    const userPhoneNumber = frm.userPhoneNumber;
    const userAddress = frm.userAddress;
    let isValid = true;

    if(mail.value == ""){
        alert("이메일을 입력해주세요.")
        mail.focus();
        isValid=false;
    } else if(email.value == "") {
        alert("이메일을 선택해주세요.")
        email.focus();
        isValid = false;
    } else if(year.value == "") {
        alert("연도를 입력해주세요.")
        year.focus();
        isValid = false;
    } else if(month.value == "") {
        alert("월을 입력해주세요.")
        month.focus();
        isValid = false;
    } else if(day.value == "") {
        alert("일을 입력해주세요.")
        day.focus();
        isValid = false;
    } else if(userPhoneNumber.value == "") {
        alert("휴대폰 번호를 입력해주세요.")
        userPhoneNumber.focus();
        isValid = false;
    } else if(userAddress.value == "") {
        alert("주소를 입력해주세요.")
        userAddress.focus();
        isValid = false;
    } 

    if(isValid) {
        frm.action='reservationInsert';
        frm.submit();
    }
}
*/

