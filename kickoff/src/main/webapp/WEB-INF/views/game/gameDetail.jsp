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
		<div class="img-box">
			<h3 class="first">${gameScoreDetail.team1Name}</h3><h3 class="sec">${gameScoreDetail.team2Name}</h3>
			<img src="/game/images/vs.png" style="width:30%; margin-top:40px;">
			
		</div>
		<h2>${gameScoreDetail.placeName}</h2>
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
							<th scope="row">매칭 일정</th>
							<td>${gameScoreDetail.gameDate}</td>
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

			<div class="btn_boarddetail">
			<c:if test="${(userId eq gameScoreDetail.writerId)}">
				<button type="reset" class="btn_reset" onclick="location.href='/gameFix?gameSeqno=${gameScoreDetail.gameSeqno}';">매칭 수정</button>
			</c:if>
				<button class="btn_delete" onclick="location.href='/gameApply';">매칭 신청</button>
			</div>
		</div>
	</form>
</body>
</html>

