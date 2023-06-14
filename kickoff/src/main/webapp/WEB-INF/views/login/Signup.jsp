<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/login/css/login.css">
	<title>Kick Off: 회원가입</title>
</head>
<body style="overflow-y: hidden">
	<div class="container" id="container">
			<form action="signup_action" id="frm" name="frm" method="post" onsubmit="return _onSubmit();">
				<h1>회원가입</h1>
				<br /> <br />
				<div class="signupform" style="overflow: auto; width: 350px; height: 350px; background: #F7F6DC​; border-radius: 10px;">
					<input type="text" placeholder="아이디" />
					<button>중복확인</button>
					<input type="password" placeholder="비밀번호" /> 
					<input type="password" placeholder="비밀번호확인" /> 
					<input type="text"placeholder="이름" /> 
					<input type="text" placeholder="핸드폰 번호" />
					<button>핸드폰 번호 인증</button>
					<select name="gender">
      					<option placeholder="성별">성별</option>
      					<option placeholder="남성">남성</option>
      					<option placeholder="여성">여성</option>
      				</select>
					<input type="email" placeholder="이메일" /> 
					<input type="text" placeholder="생년" />
					<input type="text" placeholder="월" />
					<input type="text" placeholder="일" />
					<input type="text" placeholder="주소" />
				</div>
				<br />
				<div class="signbtn">
				<button type="submit" class="btn_submit" onclick="document.getElementById('frm').submit();">회원가입 </button>
				</div>
		</form>
	</div>
</body>
</html>