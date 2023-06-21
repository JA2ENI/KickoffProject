<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Kick Off: 매칭 상세페이지</title>
<!-- include할 문서에 스타일, js -->
<link rel="stylesheet"
	href="/includes/css/style.css">
	<link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">

<script src="/includes/js/jquery-3.3.1.min.js"></script>

<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>


<script src="/includes/js/ScrollMagic.min.js"></script>
<script
	src="/includes/js/scrollmagic.animation.gsap.min.js"></script>


<script src="/includes/js/main.js"></script>
<!-- 여기까지 복붙하기 -->

<link rel="stylesheet"
	href="/game/css/boardDetail.css" />

</head>
<body>
	<%@include file="/includes/header.jsp"%>
	<!-- Header -->
	<div class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">매칭 상세보기</h1>
				<p class="lead fw-normal text-white-50 mb-0">KICK OFF</p>				
			</div>
		</div>
	</div>
	<form role="form" action="/board/create_action" method="post">
		<div class="container">
			<div class="table-responsive">
				<table class="board_detail">
					<colgroup>
						<col width="20%" />
						<col width="35%" />
						<col width="15%" />
						<col width="35%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">풋살장 이름</th>
							<td>${gameScoreDetail.placeName}</td>
						</tr>
						<tr>
							<th scope="row">팀 이름</th>
							<td>${gameScoreDetail.team1Name} <span style="text-weight:bold; color:red;">&nbsp;VS&nbsp;</span> ${gameScoreDetail.team2Name}</td>
						</tr>
						<tr>
							<th scope="row">매칭 일정</th>
							<td>${gameScoreDetail.gameDate}</td>
						</tr>
						<tr>
							<th scope="row">매칭 시간</th>
							<td>${gameScoreDetail.gameStartTime} ~ ${gameScoreDetail.gameEndTime}</td>
						</tr>
						<tr>
							<th scope="row">성별</th>
							<td>${gameScoreDetail.gameGender}</td>
							<th scope="row">경기형태</th>
							<td>${gameScoreDetail.gameStyle}</td>
						</tr>
						<tr>
							<th scope="row">기타 사항</th>
							<td>${gameScoreDetail.gameOther}</td>
							<th scope="row">매칭 상태</th>
							<td>${gameScoreDetail.gameStatus}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br />
			<hr style="color: #B1D7B4;">

			<div class="btn_boarddetail">
				<button type="reset" class="btn_reset" onclick="location.href='/game/gameDetail.jsp';">매칭 수정</button>
				<button class="btn_delete" onclick="location.href='/game/game.jsp';">매칭 신청</button>
			</div>
		</div>
	</form>
</body>
</html>

