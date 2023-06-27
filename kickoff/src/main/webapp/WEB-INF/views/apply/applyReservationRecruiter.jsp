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
					<div class="userName">나의 풋살장</div>
					<div class="uTeam-container">
						<div class="uTeam-wrap">
							<div class="uTitle">PLACE NAME</div>
							<div class="uContant">안재풋살장</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">PLACE AREA</div>
							<div class="uContant">서울특별시</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">OPEN TIME</div>
							<div class="uContant">08:00</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">PLACE FORM</div>
							<div class="uContant">실외</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">PLACE GROUND</div>
							<div class="uContant">인조잔디</div>
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
										<!-- 신청자 수/모집인원수 -->
										<div class="numReservation">A코트</div>
									</div>
									<div class="checkbox-wrap">
										<input type="checkbox" id="drop" class="drop" onclick="drop()" /><label for="drop"></label>
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
								<!-- 신청자 리스트 -->
								<div id="detail" class="detail-container">
									<div class="detail-wrap" id="sideon">
										<div class="detail-content">
											<div class="dContent">ja2eni</div>
											<div class="dContent">&#149;</div>
											<div class="dContent">남성</div>
											<div class="dContent">&#149;</div>
											<div class="dContent">안재FC</div>
										</div>
									</div>
									<!-- test (추후 삭제)-->
									<div class="detail-wrap">
										<div class="detail-content">
											<div class="dContent">ja2eni</div>
											<div class="dContent">&#149;</div>
											<div class="dContent">남성</div>
											<div class="dContent">&#149;</div>
											<div class="dContent">안재FC</div>
										</div>
									</div>
									<div class="detail-wrap">
										<div class="detail-content">
											<div class="dContent">ja2eni</div>
											<div class="dContent">&#149;</div>
											<div class="dContent">남성</div>
											<div class="dContent">&#149;</div>
											<div class="dContent">안재FC</div>
										</div>
									</div>
									<!-- test END -->
								</div>
								<!-- 수락&거절(side bar) -->
								<div class="side-container">
									<div class="side-wrap">
										<div class="side-head">
											<div class="side-title">신청자</div>
											<div class="btn-side">
												<i class="i">X</i>
											</div>
										</div>
										<div class="side-body">
											<div class="content one">
												<div class="sTitle">ID</div>
												<div class="sContent">ja2eni</div>
											</div>
											<div class="content">
												<div class="sTitle">GENDER</div>
												<div class="sContent">남성</div>
											</div>
											<div class="content">
												<div class="sTitle">POSITION</div>
												<div class="uContant">PIVO/GOLEIRO</div>
											</div>
											<div class="content">
												<div class="sTitle">TEAM</div>
												<div class="sContent">우최팀</div>
											</div>
											<!-- 매칭 경기 횟수 -->									
											<div class="content">
												<div class="sTitle">GAME</div>
												<div class="sContent">7</div>
											</div>
											<!-- 용병 경기 횟수 -->
											<div class="content seven">
												<div class="sTitle">HELPER</div>
												<div class="sContent">10</div>
											</div>
											<!-- alert 띄우기(?) -->
											<div class="content btn-side-wrap">
												<button type="button" id="accept" class="sBtn accept">수락</button>
												<button type="button" id="accept" class="sBtn refusal">거절</button>
											</div>
										</div>
									</div>
								</div>
							</div>
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