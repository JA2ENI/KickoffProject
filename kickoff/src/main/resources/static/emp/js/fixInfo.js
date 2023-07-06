/* 엔터키 submit 방지 */
document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
}, true);


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