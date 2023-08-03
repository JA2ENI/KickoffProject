
/* 엔터키 submit 방지 */
document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
}, true);

/* 예약 취소*/
function applyCancel(url) {
	var check = confirm("예약 취소 하시겠습니까?");
	
	if(check == true) {
		location = url;
	} 
}

/* 비밀번호 or 정보수정 선택 */


/* Email */
function getEmailAddress(e) {
	const text = e.options[e.selectedIndex].text;
	$('input[name=email]').attr('value', text);
}

function getSelboxDirect() {
	var text = $('#selboxDirect').val();
	$('input[name=email]').attr('value', text);
}

/* Email 직접입력 show&hide */
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
	/*$("#emailAddress").change(function() {
		if($("#emailAddress").val() == "direct") {
			$("#emailAddress").hide();
			$("#selboxDirect").show();
		}  else {
			$("#selboxDirect").hide();
		}
	}) */
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

/* 자동 하이픈 제거 */
$(document).ready(function(){
	$('#phone').blur(function(){
		var num = $('#phone').val();
		blur(num)
	});
});

function blur(num) {
	var num = num.replace(/\-/g, '');
	$("#phone").val(num);
}

/* 네이버 휴대폰 인증 api */
$("#sendPhone").click(function() {
    var phoneNumber = $('#phone').val();
    
	const phone_pattern = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/;
	if(!phone_pattern.test(phoneNumber)) {
		alert("휴대폰 번호를 다시 입력해주세요.");
		phone.focus();
		HttpRequest.abort();
	} else if($("#phone").val() != "") {
        $("#checkPhoneBox").show();
    } else {
        $("#checkPhoneBox").hide();
    }
		
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
                    $('#certificationNum').val('success');
                    var num = phoneNumber.replace(/[^0-9]/g, '');
                    var temp = '';
                    temp += num.substr(0,3);
                    temp += '-';
                    temp += num.substr(3,4);
                    temp += '-';
                    temp += num.substr(7);
                    $('#phoneNumber').val(temp);
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
        
/* MYPAGE USER_INFO UPDATE */
function updateInfoCheck() {
    const frm = document.forms[0];
    const mail = frm.mail;
    const emailAddress = frm.emailAddress;
    const selboxDirect = frm.selboxDirect;
    const year = frm.year;
    const month = frm.month;
    const day = frm.day;
    const certificationNum = $('#certificationNum').val();
    const userAddress = frm.userAddress;
   	let isValid = true;
    const mail_pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/;
    const email_pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])+\.[a-zA-Z]{2,3}$/;
   	const year_pattern = /^(19[0-9][0-9]|20\d{2})$/;
   	const month_pattern = /^(0[0-9]|1[0-2])$/;
   	const day_pattern = /^(0[1-9]|[1-2][0-9]|3[0-1])$/;
   	  
   	if(!mail_pattern.test(mail.value)) {
		alert("이메일을 다시 입력해주세요.");
		mail.focus();
		isValid = false;
	} else if(emailAddress.value == "") {
        alert("이메일 주소를 선택해주세요.")
        emailAddress.focus();
        isValid = false;
    } else if(!email_pattern.test(selboxDirect.value) && emailAddress.value == 'direct') {
		alert("이메일 주소를 다시 입력해주세요.");
		selboxDirect.focus();
		isValid = false;	   
    } else if(!year_pattern.test(year.value)) {
		alert("연도를 다시 입력해주세요.");
		year.focus();
		isValid = false;	   
    } else if(!month_pattern.test(month.value)) {
		alert("월을 다시 입력해주세요.");
		month.focus();
		isValid = false;
	} else if(!day_pattern.test(day.value)) {
		alert("일을 다시 입력해주세요.");
		day.focus();
		isValid = false;
	} else if(certificationNum == 'certificationNum') {
		alert("휴대폰 번호 인증해주세요.");
		sendPhone.focus();
		isValid = false;
	} else if(userAddress.value == "") {
        alert("주소를 입력해주세요.")
        userAddress.focus();
        isValid = false;
    }
   	
    if(isValid) {
        alert('회원님의 정보가 수정되었습니다.')
        frm.action='updateInfoResult';
        frm.submit();
    }
}

