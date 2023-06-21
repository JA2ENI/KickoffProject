<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="https://fonts.google.com/noto/specimen/Noto+Sans+KR?subset=korean&noto.script=Kore" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&family=Russo+One&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/includes/css/style.css">
<link rel="stylesheet" href="/main/css/vendor/icomoon/style.css">
<link href="/apply/css/applyList.css" rel="stylesheet" />

<title>Kick off: 신청 목록</title>
</head>
<body>
	<div class="header-container">
		<%@include file="/includes/header.jsp"%>
	</div>
	<header>
		<div class="title">"풋살의 모든 신청이 한 눈에! Kickoff에서 확인해보세요."</div>
	</header>
	<section>
		<div id="img_container" class="img_container">
			<div class="text-container">
				<div id="reservation" class="text">예약</div>
				<div id="game" class="text">매칭</div>
				<div id="team" class="text">팀</div>
				<div id="helper" class="text">용병</div>
			</div>
			<img id="ball" class="ball" src="/apply/images/ball.png" />
			<button type="button" onclick="location.href='/applyReservation';">
				<img id="imgCourt" class="icons" src="/apply/images/court.png" />
			</button>
			<img id="ball2" class="ball" src="/apply/images/ball.png" />
			<button type="button" onclick="javascript:alert('매칭 신청');">
				<img id="imgGame" class="icons" src="/apply/images/game.png" />
			</button>
			<img id="ball3" class="ball" src="/apply/images/ball.png" />
			<button type="button" onclick="javascript:alert('팀 신청');">
				<img id="imgTeam" class="icons" src="/apply/images/team.png" />
			</button>
			<img id="ball4" class="ball" src="/apply/images/ball.png" />
			<button type="button" onclick="location.href='/applyList?page=helper';">
				<img id="imgHelper" class="icons" src="/apply/images/helper.png" />
			</button>
			<img class="futsal" src="/apply/images/futsal.png" />
		</div>
	</section>
</body>

<!-- footer -->
<%@include file="/includes/footer.jsp"%>

<!-- script -->
<script src="/includes/js/jquery-3.3.1.min.js"></script>
<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>
<script src="/includes/js/ScrollMagic.min.js"></script>
<script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
<script src="/includes/js/main.js"></script>
<script src="/apply/js/applyList.js"></script>

</html>