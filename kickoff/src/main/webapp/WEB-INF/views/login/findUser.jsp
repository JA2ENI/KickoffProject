<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "/findPw/css/loginFind.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Kick Off: 아이디, 비밀번호 찾기</title>
</head>
<body style="overflow-y: hidden">
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form method="POST" name="findUser" action="/findUserPw">
				<div class="row-container">
					<h1>비밀번호 찾기</h1>
					<div class="subTitle">개인 회원용</div>
					<input type="text" placeholder="아이디" name="userId" id="userId" />
					<div class="sendContainer">
					<input type="text" placeholder="휴대폰 번호" name="inputPhoneNumberPw" id="inputPhoneNumberPw" />
					<button type="button" id="sendPhoneNumberPw" name="sendPhoneNumberPw">전송</button>
					</div>
					<div class="confirmContainer">
					<input type="text" placeholder="인증 번호" id="inputCertifiedNumberPw" name="inputCertifiedNumberPw" />
					<button type="button" id="confirmButtonPw" name="confirmButtonPw">인증</button>
					</div>
					<button type="submit" id="findUserPw" name="findUserPw" onclick="findUser.submit();">비밀번호 찾기</button>
					<a href="/loginAll" class="login_btn">로그인하러 가기</a>
				</div>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form method="POST" name="findUser" action="/findUserId">
				<div class="row-container">
					<h1>아이디 찾기</h1>
					<div class="subTitle">개인 회원용</div>
					<input type="text" placeholder="이름" name="userName" id="userName" class="userName"/>
					<div class="sendContainer">
						<input type="text" placeholder="휴대폰 번호" name="inputPhoneNumber" id="inputPhoneNumber"/>
						<button type="button" id="sendPhoneNumber" name="sendPhoneNumber">전송</button>
					</div>
					<div class="confirmContainer">
						<input type="text" placeholder="인증 번호" id="inputCertifiedNumber" name="inputCertifiedNumber" />
						<button type="button" id="confirmButton" name="confirmButton">인증</button>
					</div>
					<button type="submit" id="findUserId" name="findUserId" onclick="findUser.submit();">아이디 찾기</button>
					<a href="/loginAll" class="login_btn">로그인하러 가기</a>
				</div>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>환영합니다!</h1>
					<p>아이디를 찾으실 분들은 이곳을 클릭해주세요.</p>
					<button class="ghost" id="signIn">아이디 찾기</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>환영합니다!</h1>
					<p>비밀번호를 찾으실 분들은 이곳을 클릭해주세요.</p>
					<button class="ghost" id="signUp">비밀번호 찾기</button>
				</div>
			</div>
		</div>
		<script src="/findPw/js/loginFind.js"></script>
	</div>

	<script>
		$('#findUserId').click(function(e) {

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
                        	$('#findUserId').prop('disabled', false);
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

	<script>
		$('#findUserPw').click(function(e) {
			
		    // 아이디를 입력하지 않거나 휴대폰 인증을 완료하지 않은 경우 알림 창을 표시하고 아무 동작도 하지 않음
		    if ($('#inputCertifiedNumberPw').val() === '' || $('#userId').val() === '') {
		        alert('아이디 입력이나 휴대폰 인증을 완료해주세요!');
		        e.preventDefault();
		    }
		});
	</script>

	<script>
		$('#sendPhoneNumberPw').click(function(){
		    let phoneNumber = $('#inputPhoneNumberPw').val();
		    
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
		            $('#confirmButtonPw').click(function(){
		                if($.trim(res) == $('#inputCertifiedNumberPw').val()){
		                    Swal.fire(
		                        '인증성공!',
		                        '휴대폰 인증이 정상적으로 완료되었습니다.',
		                        'success'
		                    ).then(function() {
	                        	
	                        	// 아이디 입력과 휴대폰 인증이 완료되면 아이디 찾기 버튼 활성화
	                        	$('#findUserPw').prop('disabled', false);
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

</body>
</html>