<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/login/css/login.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/login/js/Signup.js"></script>
	<title>Kick Off: 회원가입</title>
</head>
<body style="overflow-y: hidden">
	<div class="container" id="container">
			<form action="signup_action" id="frm" name="frm" method="post" onsubmit="return _onSubmit();">
				<h1>회원가입</h1>
				<br /> <br />
				<div class="signupform" style="overflow: auto; width: 350px; height: 350px; background: #F7F6DC​; border-radius: 10px;">
					<input type="text" placeholder="아이디" />
					<button type="button">중복확인</button>
					<input type="password" placeholder="비밀번호" /> 
					<input type="password" placeholder="비밀번호확인" /> 
					<input type="text" name="userName" id="userName" placeholder="이름" /> 
					<!--<input type="text" placeholder="핸드폰 번호" />
					<button>핸드폰 번호 인증</button>-->
					<div class="sendContainer">
					<input type="text" placeholder="휴대폰 번호" name="inputPhoneNumberPw" id="inputPhoneNumberPw" />
					<button type="button" id="sendPhoneNumberPw" name="sendPhoneNumberPw">전송</button>
					</div>
					<div class="confirmContainer">
					<input type="text" placeholder="인증 번호" id="inputCertifiedNumberPw" name="inputCertifiedNumberPw" />
					<button type="button" id="confirmButtonPw" name="confirmButtonPw">인증</button>
					</div>
					<select name="gender">
      					<option placeholder="성별">성별</option>
      					<option placeholder="남성">남성</option>
      					<option placeholder="여성">여성</option>
      				</select>
					<input type="email" placeholder="이메일" /> 
					<input type="text" placeholder="생년" />
					<input type="text" placeholder="월" />
					<input type="text" placeholder="일" />
					<!--  <input type="text" placeholder="주소" />-->
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</div>
				<br />
				<div class="signbtn">
				<button type="submit" class="btn_submit" id="sign" name="sign" onclick="document.getElementById('frm').submit();">회원가입 </button>
				</div>
		</form>
	</div>
	
	<!--  <script>
		$('#sign').click(function(e) {

					// 이름을 입력하지 않거나 휴대폰 인증을 완료하지 않은 경우 알림 창을 표시하고 아무 동작도 하지 않음
					if ($('#inputCertifiedNumber').val() === '' || $('#userName').val() === '') {
						alert('이름 입력이나 휴대폰 인증을 완료해주세요!');
						e.preventDefault();
					}
				});
	</script>
	
	<script>
	$('#sendPhoneNumber').click(function(){
	    let phoneNumber = $('#inputPhoneNumber').val();
	    
            Swal.fire({
                text: '인증번호 발송 완료!',
            });
	
	    $.ajax({
	        type: "GET",
	        url: "/check/sendSMS",
	        data: {
	            "phoneNumber" : phoneNumber
	        },
	        success: function(res){
	            $('#confirmButton').click(function(){
	                if($.trim(res) == $('#inputCertifiedNumber').val()){
	                    Swal.fire(
	                        '인증성공!',
	                        '휴대폰 인증이 정상적으로 완료되었습니다.',
	                        'success'
	                    ).then(function() {
                        	
                        	// 아이디 입력과 휴대폰 인증이 완료되면 아이디 찾기 버튼 활성화
                        	$('#sign').prop('disabled', false);
                        });

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
	</script>-->
</body>
</html>