<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kick Off: 마이페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/myPage/css/myInfo.css">
<link rel="stylesheet" href="/myPage/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<input type="button" onclick="location.href='main'" class="kickoff" value="Kick Off"/>
					<br>
					<a href="/myInfo" class="logo"><strong>회원정보 수정</strong></a>
				</header>

				<!-- Begin Page Content -->
				<section>
					<div class="container-fluid">
						<form action="#">
							<div class="signupform" style="overflow: visible; width: 980px; height: auto; border-radius: 10px;">
								<input type="text" placeholder="아이디 나중에 값 불러와야함" readonly/>
								<input type="password" placeholder="비밀번호" />
								<input type="password" placeholder="비밀번호확인" />
								<input type="text" placeholder="이름 나중에 값 불러와야함" readonly/>
								<input type="text" placeholder="핸드폰 번호" />
								<button>휴대폰 번호 인증</button>
								<input type="email" placeholder="이메일" /> 
								<input type="date" placeholder="생년월일" /> 
								<input type="text" placeholder="주소" />
							</div>
							<br />
							<button>수정하기</button>
							<br /> 
							<a href="/main">회원 탈퇴</a>
						</form>
					</div>

					<!-- /.container-fluid -->
				</section>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>MyPage</h2>
					</header>
					<ul>
						<li><a href="/myReservation">예약 내역</a></li>
						<li><a href="/myBoardList">내 게시글</a></li>
						<li><a href="/myInfo">회원 정보 수정</a></li>
						<li><a href="/myTeam">팀</a></li>
						<li><a href="/myMessage">메시지</a></li>
						<li><a href="/myHelper">용병</a></li>
					</ul>
				</nav>

				<!-- Section -->

				<!-- Footer -->
			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script src="/myPage/js/jquery.min.js"></script>
	<script src="/myPage/js/skel.min.js"></script>
	<script src="/myPage/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/myPage/js/main.js"></script>

</body>
</html>