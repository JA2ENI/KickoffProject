<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
								<section class="checkout spad">
									<div class="container">
										<div class="checkout__form">
											<form role="form" id="frm" name="frm" action="/myInfoCheckResult" method="POST">
												<div class="row-request-container">
													<div class="notice">회원님의 소중한 정보 보호를 위해,</div>
													<div class="notice two">Kick Off의 현재 비밀번호를 확인해 주세요.</div>
													<div class="col-lg-8-1 col-md-6 check">
														<div class="checkout__input__request id">
															<p>아이디<span>*</span></p>
															<input type="text" class="inputBox id" name="userId" value="${userId}" readonly/>
														</div>
														<div class="checkout__input__request pw">
															<p>비밀번호<span>*</span></p>
															<input type="password" id="userPw" class="inputBox pw" name="userPw"/>
															<span class="msg">${msg}</span>
														</div>
														<div class="btn-container">
															<input type="submit" id="userCheck" class="userCheck" value="확인"/>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</section>
								
								
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
							