<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kick Off: 마이페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/myPage/css/myInfo.css">
	<link rel="stylesheet" href="/myPage/css/main.css" />
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<header id="header">
					<input type="button" onclick="location.href='main'" class="kickoff" value="Kick Off"/>
					<br>
					<a href="/myInfo" class="logo"><strong>회원 정보 수정</strong></a>
				</header>
				<section class="checkout spad">
					<div class="container">
						<div class="checkout__form">
							<form role="form" id="frm" name="frm" action="/myInfoResult" method="POST">
								<div class="row-request-container">
									<div class="col-lg-8-1 col-md-6">
										<div class="checkout__input__request">
											<p>아이디<span>*</span></p>
											<input type="text" class="inputBox" name="userId" value="${userInfo.userId}" readonly/>
										</div>
										<div class="checkout__input__request">
											<p>이메일<span>*</span></p>
											<input type="text" id="userEmail" class="inputBox" name="userEmail" value="${userInfo.userEmail}" placeholder="example@naver.com"/>
										</div>
										<div class="checkout__input__request">
											<p>이 름<span>*</span></p>
											<input type="text" class="inputBox" name="userName" value="${userInfo.userName}" readonly/>
										</div>
										<div class="checkout__input__request">
											<p>(임시)생년월일</p>
											<input type="text" id="year" class="inputBox" name="userBirthdate" value=""/>
										</div>
										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input__request">
													<p>연도<span>*</span></p><!-- placeholder="2022" -->
													<input type="text" id="year" class="inputBox" value="" maxlength="4"/>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input__request">
													<p>월<span>*</span></p><!-- placeholder="12" -->
													<input type="text" id="month" class="inputBox" value="" maxlength="2"/>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input__request">
													<p>일<span>*</span></p><!-- placeholder="25" -->
													<input type="text" id="day" class="inputBox" value="" maxlength="2"/>
												</div>
											</div>
											<!-- <input type="hidden" id="userBirthdate" name="userBirthdate" value=""/> -->
										</div>
										<div class="checkout__input__request">
											<p>휴대폰 번호<span>*</span></p>
											<div class="phone_content">
												<input type="text" id="phone" class="inputBox phone" name="userPhoneNumber" value="${userInfo.userPhoneNumber}" maxlength="13" placeholder="010-1212-3434"/>
												<input type="button" id="checkPhone" class="checkPhone phone" onclick="" value="번호 인증"/>
												<!-- <a href="/reservation" id="cancle" class="cancle">취소</a> -->
											</div>
										</div>
										<div class="checkout__input__request address">
											<p>도로명 주소<span>*</span></p>
											<input type="text" id="userAddress" class="inputBox" name="userAddress" value="${userInfo.userAddress}" onclick="kakaopost()">
										</div>
										<div class="btn-container">
 											<input type="button" id="update" class="update" value="수정"/>
										</div>
										<div class="">
											<a href="/main" id="delete" class="delete" onclick="">회원 탈퇴</a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
					<header class="major">
						<h2>MyPage</h2>
					</header>
					<ul>
						<li><a href="/myReservation">예약 내역</a></li>
						<li><a href="/myBoardList">내 게시글</a></li>
						<li><a href="/myInfoCheck">회원 정보 수정</a></li>
						<li><a href="/myTeam">팀</a></li>
						<li><a href="/myMessage">메시지</a></li>
						<li><a href="/myHelper">용병</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	
	<!-- Kakao postcode -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
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
	</script>
	
	<!-- Scripts -->
	<script src="/myPage/js/jquery.min.js"></script>
	<script src="/myPage/js/skel.min.js"></script>
	<script src="/myPage/js/util.js"></script>
	<script src="/myPage/js/mypage.js"></script>
	<script src="/myPage/js/main.js"></script>

</body>
</html>