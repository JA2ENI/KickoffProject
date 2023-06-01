<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="/emp/js/ie/html5shiv.js"></script><![endif]-->
		<link rel = "stylesheet" href = "/emp/css/fixInfo.css">
		<link rel="stylesheet" href="/emp/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="/emp/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="/emp/css/ie8.css" /><![endif]-->
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
									<strong>회원정보 수정</strong>
								</header>
							
							<!-- Begin Page Content -->
			                	<section>
				                	<div class="container-fluid">										
										    <form action="#">
										      <div class="signupform" style="overflow:visible; width:980px; height:auto; border-radius: 10px;">
										      	<input type="text" placeholder="아이디 나중에 값 불러오기" />
										      	<input type="password" placeholder="비밀번호" />
										      	<input type="password" placeholder="비밀번호확인" />
										      	<input type="text" placeholder="업체 이름" />
										      	<input type="text" placeholder="업체 번호" />
										      	<input type="text" placeholder="업체 주소" />
										      	<input type="email" placeholder="이메일" />
										      	<input type="date" placeholder="업체 등록일" />
										      	<input type="text" placeholder="사업자 번호" />
												  <!--  사업자 번호 인증 버튼 부분 결정하기 -->
										      	<button onclick="location.href='';">사업자 번호 인증</button>
												  <button class="confirm" id="confirmNumber">사업자 번호 인증</button>
										      </div>
										      <br />
										      <button onclick="location.href='/fixInfo.jsp';">수정하기</button>
										      <br/>
										      <button onclick="location.href='/main.jsp';">회원 탈퇴</button>
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
										<h2>Menu</h2>
									</header>
									<ul>
										<a href="/empReservation">예약관리</a>
										<li><a href="/myBoard">내 게시글</a></li>
										<li><a href="/fixInfo">회원 정보 수정</a></li>
										<li>
											<!-- opener 에 원래 active 열고 닫게 할 수 있어야 함 -->
											<span class="opener">풋살장 관리</span>
											<ul>
												<li><a href="/empFutsalForm">풋살장 등록</a></li>
												<li><a href="/empFutsalFix">풋살장 조회</a></li>
											</ul>
										</li>										
									</ul>
								</nav>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src = "/login/js/loginEmp.js"></script>
			<script src="/emp/js/jquery.min.js"></script>
			<script src="/emp/js/skel.min.js"></script>
			<script src="/emp/js/util.js"></script>
			<!--[if lte IE 8]><script src="/emp/js/ie/respond.min.js"></script><![endif]-->
			<script src="/emp/js/main.js"></script>

	</body>
</html>