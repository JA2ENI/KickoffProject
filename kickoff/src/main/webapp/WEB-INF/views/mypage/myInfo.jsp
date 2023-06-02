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
					<a href="/myInfo" class="logo"><strong>회원정보 수정</strong></a>
				</header>
				<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form role="form" id="frm" name="frm" action="/reservationRequest" method="POST">
					<div class="row-request-container">
						<div class="col-lg-8-1 col-md-6">
							<div class="checkout__input__request">
								<p>풋살장<span>*</span></p>
								<input name="reservationPlaceName" value="${reservationDetail.reservationPlaceName}" readonly>
							</div>
							<div class="checkout__input__request">
								<p>코트<span>*</span></p>
								<input name="reservationCourtName" value="${reservationDetail.reservationCourtName}" readonly>
							</div>
							<div class="checkout__input__request">
								<p>신청자<span>*</span></p>
								<input type="text" name="reservationUserName" value="${userInfo.userName}" readonly>
							</div>
							<div class="checkout__input__request">
								<p>번호<span>*</span></p>
								<input type="text" name="reservationUserPhone" value="${userInfo.userPhoneNumber}" readonly>
							</div>
							<div class="checkout__input__request">
								<p>예약날짜<span>*</span></p>
								<input type="text" name="reservationDate" value="${reservationDetail.reservationDate}" readonly>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input__request">
										<p>시작 시간<span>*</span></p>
										<input type="text" name="reservationStartTime" value="${reservationDetail.reservationStartTime}" readonly>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input__request">
										<p>종료 시간<span>*</span></p>
										<input type="text" name="reservationEndTime" value="${reservationDetail.reservationEndTime}" readonly>
									</div>
								</div>
							</div>
							<div class="checkout__input__request">
								<p>경기<span>*</span></p>
								<input type="text" name="reservationGameStyle" value="${reservationDetail.reservationHeadcount}" readonly>
							</div>
							<div class="checkout__input__request">
								<p>대관비<span>*</span></p>
								<input type="text" name="reservationPrice" value="${reservationDetail.reservationPrice}" readonly>
							</div>
							<input type="hidden" name="userId" value="${userId}" />
							<input type="hidden" name="placeId" value="${reservationDetail.placeId}" />
							<input type="hidden" name="reservationPlaceAddress" value="${reservationDetail.reservationPlaceAddress}" />
							<input type="hidden" name="reservationOriginNo" value="${reservationDetail.reservationNo}" />
							<div class="btn-container">
								<input type="submit" id="insert" class="request" onclick="requestCheck()" value="신청"/>
								<a href="/reservation" id="cancle" class="cancle">취소</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
				
				
				
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
						<li><a href="/myInfo">회원 정보 수정</a></li>
						<li><a href="/myTeam">팀</a></li>
						<li><a href="/myMessage">메시지</a></li>
						<li><a href="/myHelper">용병</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<!-- Scripts -->
	<script src="/myPage/js/jquery.min.js"></script>
	<script src="/myPage/js/skel.min.js"></script>
	<script src="/myPage/js/util.js"></script>
	<script src="/myPage/js/main.js"></script>

</body>
</html>