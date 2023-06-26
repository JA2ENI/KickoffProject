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
				<input type="text" id="userId" name="userId" placeholder="아이디" />
				<button type="button">중복확인</button>
				
				<input type="password" id="userPw" name="userPw" placeholder="비밀번호" /> 
				<input type="password" id="userPw2" name="userPw2" placeholder="비밀번호확인" /> 
				
				<input type="text" id="userName" name="userName"  placeholder="이름" />
				
				<!--<input type="text" placeholder="핸드폰 번호" />
					<button>핸드폰 번호 인증</button>-->
				<div class="sendContainer">
					<input type="text" placeholder="휴대폰 번호" name="inputPhoneNumber" id="inputPhoneNumber" />
					<button type="button" id="sendPhoneNumber" name="sendPhoneNumber">전송</button>
				</div>
				<div class="confirmContainer">
					<input type="text" placeholder="인증 번호" id="inputCertifiedNumber" name="inputCertifiedNumber" />
					<button type="button" id="confirmButton" name="confirmButton">인증</button>
				</div>
				
				<select id="userGender" name="userGender" onChange="selectuserGender(this)">
					<option placeholder="성별">성별</option>
					<option placeholder="남성">남성</option>
					<option placeholder="여성">여성</option>
				</select> 
				
				<input type="email" id="userEmail" name="userEmail" placeholder="이메일" /> 
				
				<input type="text" id="year" name="year" placeholder="생년" /> 
				<input type="text" id="month" name="month" placeholder="월" /> 
				<input type="text" id="day" name="day" placeholder="일" />
				
				<!--  <input type="text" placeholder="주소" />-->
				<input type="text" id="postcode" name="postcode" placeholder="우편번호">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br> 
				<input type="text" id="address" name="address" placeholder="주소"><br> 
				<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
				<input type="text" id="extraAddress" placeholder="참고항목">
				
				<select id="userMainPosition" name="userMainPosition" onChange="selectuserMainPosition(this)">
					<option placeholder="">메인 포지션 선택(필수)</option>
					<option placeholder="PIVO">PIVO(피보): 공격수</option>
					<option placeholder="ALA">ALA(아라): 미드필더</option>
					<option placeholder="FIXO">FIXO(픽소): 수비수</option>
					<option placeholder="GOLEIRO">GOLEIRO(골레이로): 골키퍼</option>
				</select>
				
				<select id="userSubPosition" name="userSubPosition" onChange="selectuserSubPosition(this)">
					<option placeholder="">서브 포지션 선택</option>
					<option placeholder="PIVO">PIVO(피보): 공격수</option>
					<option placeholder="ALA">ALA(아라): 미드필더</option>
					<option placeholder="FIXO">FIXO(픽소): 수비수</option>
					<option placeholder="GOLEIRO">GOLEIRO(골레이로): 골키퍼</option>
					<option placeholder="-">서브 포지션 없음</option>
				</select>
			</div>
			<br />
				<div class="signbtn">
				<button type="reset" class="btn_reset" onclick="location.href='/main';">취소</button>
				<button type="submit" class="btn_submit" id="sign" name="sign" onclick="document.getElementById('frm').submit();">회원가입 </button>
				</div>
		</form>
	</div>

	<script>
		$('#signup_action').click(function(e) {

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
	</script>
	
	<script type="text/javascript">
	function _onSubmit() {

        if ($("#userId").val() == "") {
            alert("아이디를 입력해주세요.");
            $("#userId").focus();
            return false;
        }

        if ($("#userPw").val() == "") {
            alert("비밀번호를 입력해주세요.");
            $("#userPw").focus();
            return false;
        }
        
        if ($("#inputCertifiedNumber").val() == "") {
            alert("인증 번호를 입력해주세요.");
            $("#inputCertifiedNumberPw").focus();
            return false;
        }
        
        if ($("#userGender").val() == "") {
            alert("성별을 입력해주세요.");
            $("#userGender").focus();
            return false;
        }
        
        if ($("#userEmail").val() == "") {
            alert("이메일을 입력해주세요.");
            $("#userEmail").focus();
            return false;
        }
        
        if ($("#postcode").val() == "") {
            alert("주소를 입력해주세요.");
            $("#postcode").focus();
            return false;
        }
        
        if ($("#detailAddress").val() == "") {
            alert("상세주소를 입력해주세요.");
            $("#detailAddress").focus();
            return false;
        }
        
        if ($("#userMainPosition").val() == "") {
            alert("메인 포지션을 선택해주세요.");
            $("#userMainPosition").focus();
            return false;
        }

        if (!confirm("등록하시겠습니까?")) {
            return false;
        }
	}
	</script>
</body>
</html>