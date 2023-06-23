<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Russo+One&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<link rel="stylesheet" href="/includes/css/styleApply.css">
<link rel="stylesheet" href="/main/css/vendor/icomoon/style.css">
<link href="/includes/css/applyNavi.css" rel="stylesheet" />
<link href="/apply/css/applyReservation.css" rel="stylesheet" />

<title>Kick off: 예약 신청</title>
</head>
<body>
	<div class="header-container">
		<%@include file="/includes/header.jsp"%>
	</div>
	<%@include file="/includes/applyNavi.jsp"%>
	<section>
		<!-- Session User Info -->
		<article class="myInfo">
			<div class="myInfo-container">
				<div class="myInfo-wrap">
					<div class="uInfo">
						<div class="userName">안재은</div>
						<div class="userId">ja2eni</div>
					</div>
					<div class="uTeam-container">
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM</div>
							<div class="uContant">독수리슛FC</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM LEVEL</div>
							<div class="uContant">플래티넘</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">POSITION</div>
							<!-- MIAN/SUB -->
							<div class="uContant">PIVO/GOLEIRO</div>
						</div>
						<!-- 매칭 경기 횟수 -->
						<div class="uTeam-wrap">
							<div class="uTitle">GAME</div>
							<div class="uContant">5</div>
						</div>
						<!-- 용병 경기 횟수 -->
						<div class="uTeam-wrap">
							<div class="uTitle">HELPER</div>
							<div class="uContant">10</div>
						</div>
					</div>
				</div>
			</div>
		</article>
		<article class="reservation">
			<div class="reservation-container">
				<div class="reservation-wrap">
					<div class="reservation-title">예약 신청</div>
						<div class="box-wrap">
							<div class="box-frame">
								<div class="box-content">
									<!-- 모집 상태에 따라 -->
									<div class="status ing">예약 중</div>
									<!-- <div class="status end">예약 완료</div> -->
									<!-- <div class="status cancel">예약 취소</div> -->
									<div class="one-wrap">
										<div class="date day">2023년 6월 14일</div>
										<div class="date">수요일</div>
										<div class="date">20:00~22:00</div>
									</div>
									<div class="two-wrap">
										<!-- 상세보기 -->
										<a href="javascript:alert('제목 상세보기 test');" class="placeName">안재풋살장</a>
										<div class="numReservation">A코트</div>
									</div>
									<!-- 신청 취소 -->
									<div class="btn-wrap">
										<button type="button" class="btn-detail" onclick="javascript:alert('test')">신청취소</button>
									</div>
									<!-- 신청 수락&거절 상태 -->
									<div class="ticket-wrap">
										<img class="ticket" src="/apply/images/reservationThanks.png" />
										<!-- <img class="ticket" src="/apply/images/reservationSorry.png" /> -->
									</div>
									<div class="three-wrap">
										<div class="arrow">▶</div>
										<div class="three-content">인조잔디</div>
										<div>&sdot;</div>
										<div class="three-content">5vs5</div>
										<div>&sdot;</div>
										<div class="three-content">13x28</div>
									</div>
								</div>
							</div>
							<!-- test 추후 삭제 -->
							<div class="box-frame">
								<div class="box-content">
									<!-- 모집 상태에 따라 -->
									<!-- <div class="status ing">예약 중</div> -->
									<div class="status end">예약 완료</div>
									<!-- <div class="status cancel">예약 취소</div> -->
									<div class="one-wrap">
										<div class="date day">2023년 6월 14일</div>
										<div class="date">수요일</div>
										<div class="date">20:00~22:00</div>
									</div>
									<div class="two-wrap">
										<!-- 상세보기 -->
										<a href="javascript:alert('제목 상세보기 test');" class="placeName">안재풋살장</a>
										<div class="numReservation">A코트</div>
									</div>
									<!-- 신청 취소 -->
									<div class="btn-wrap">
										<button type="button" class="btn-detail" onclick="javascript:alert('test')">신청취소</button>
									</div>
									<!-- 신청 수락&거절 상태 -->
									<div class="ticket-wrap">
										<!-- <img class="ticket" src="/apply/images/reservationThanks.png" /> -->
										<img class="ticket" src="/apply/images/reservationSorry.png" />
									</div>
									<div class="three-wrap">
										<div class="arrow">▶</div>
										<div class="three-content">인조잔디</div>
										<div>&sdot;</div>
										<div class="three-content">5vs5</div>
										<div>&sdot;</div>
										<div class="three-content">13x28</div>
									</div>
								</div>
							</div>
							<!-- test END -->
						</div>
					</div>
				</div>
		</article>
	</section>
</body>

<!-- footer -->
<%@include file="/includes/footer.jsp"%>

<script>
	/* side-bar */
	$(function(){
		/* #sideon + 숫자(반복) */
		$("#sideon").on("click", function(){
			$(".side-container").toggleClass("menuon");
		});
		
		$(".btn-side").on("click", function(){
			$(".side-container").toggleClass("menuon");
		});
	});
</script>

<!-- script -->
<script src="/includes/js/jquery-3.3.1.min.js"></script>
<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>
<script src="/includes/js/ScrollMagic.min.js"></script>
<script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
<script src="/includes/js/main.js"></script>
<script src="/apply/js/applyList.js"></script>
<script src="/apply/js/applyReservation.js"></script>

</html>