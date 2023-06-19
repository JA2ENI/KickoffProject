<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/login/css/login.css">
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/login/js/Signup.js"></script>
	<title>Kick Off: 업체 회원가입</title>
</head>
<body style="overflow-y: hidden">
	<div class="container" id="container">
			<form action="signupemp_action" id="frm" name="frm" method="post" onsubmit="return _onSubmit();" >
				<h1>업체 회원가입</h1>
				<br /> <br />
				<div class="signupform" style="overflow: auto; width: 350px; height: 350px; background: #F7F6DC​; border-radius: 10px;">
					<input type="text" id="empId" name="empId" placeholder="아이디" />
					<button type="button">중복확인</button>
					<input type="password" id="empPw" name="empPw" placeholder="비밀번호" />
					<input type="password" id="empPw" name="empPw" placeholder="비밀번호 확인" />
					<input type="text" id="empName" name="empName" placeholder="업체 이름" />
					<input type="text" id="empPhoneNumber" name="empPhoneNumber" placeholder="업체 번호" />
					<!-- <input type="text" id="empAddress" name="empAddress" placeholder="업체 주소" /> -->
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
					<input type="email" id="empEmail" name="empEmail" placeholder="이메일" />
					<input type="text" id="empDate" name="empDate" placeholder="업체 등록연도" />
					<input type="text" id="empDate" name="empDate" placeholder="월" />
					<input type="text" id="empDate" name="empDate" placeholder="일" />
					<input type="text" id="empNo" name="empNo" placeholder="사업자 번호" />
					<button>사업자 번호 인증</button>
				</div>
				<br />
				<div class="signbtn">
				<button type="submit" class="btn_submit" onclick="document.getElementById('frm').submit();" >회원가입 </button>
				</div>
		</form>
	</div>
</body>
</html>