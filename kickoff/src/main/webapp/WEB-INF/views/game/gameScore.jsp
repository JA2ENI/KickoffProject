<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Kick Off: 매칭 기록</title>
<!-- include할 문서에 스타일, js -->
<link rel="stylesheet"	href="/includes/css/style.css">
	<link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">

<script src="/includes/js/jquery-3.3.1.min.js"></script>

<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>


<script src="/includes/js/ScrollMagic.min.js"></script>
<script	src="/includes/js/scrollmagic.animation.gsap.min.js"></script>


<script src="/includes/js/main.js"></script>
<!-- 여기까지 복붙하기 -->

<link rel="stylesheet"	href="/board/css/boardDeatil.css" />

</head>
<body>
	<%@include file="/includes/header.jsp"%>
	<!-- Header -->
	<div class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">매칭 기록</h1>
				<p class="lead fw-normal text-white-50 mb-0">경기 후, 기록을 남겨 팀의 위상을 높이세요</p>
			</div>
		</div>
	</div>
		<form role="form" method="post">
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
							<th scope="row" class="active">팀 이름</th>
							<td></td>
							<th scope="row" class="active">상대 팀 이름</th>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="active">매칭 시간</th>
							<td></td>
							<th scope="row" class="active">매칭 일정</th>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="active" >매칭 장소</th>
							<td></td>
							<th scope="row" class="active" >경기 형태</th>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="active" >성별</th>
							<td></td>
							<th scope="row" class="active" >경기 점수</th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<br />
			<hr>
				
				<div class="btn_boarddetail">
				<button type="reset" class="btn_reset" onclick="location.href='/board';">기록하기</button>

			</div>
		</div>
	</form>
</body>
</html>

