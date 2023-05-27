<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Kick Off: 자유게시판 글 상세보기</title>
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
	href="/team/css/boardDetail.css" />

</head>
<body>
	<%@include file="/includes/header.jsp"%>
	<!-- Header -->
	<div class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">풋살팀</h1>
				<p class="lead fw-normal text-white-50 mb-0"></p>
			</div>
		</div>
	</div>
	<form role="form" action="/teamDetail" method="post">
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
							<th scope="row">풋살팀 이름</th>
							<td>${teamContents.teamName}</td>
							<th scope="row">모집 상태</th>
							<td style="color: red; font-weight: bold;">${teamContents.teamStatus}</td>
						</tr>
						<tr>
							<th scope="row">풋살팀 성별</th>
							<td>${teamContents.teamGender}</td>
							<th scope="row">모집 인원</th>
							<td>${teamContents.teamNumber}</td>
						</tr>
						<tr>
							<th scope="row">풋살팀 소속 지역</th>
							<td>${teamContents.teamLocal}</td>
							<th scope="row">풋살팀 등급</th>
							<td>${teamContents.teamGrade}</td>
						</tr>
						<tr>
							<th scope="row">모집 시작일</th>
							<td>${teamContents.teamStartDate}</td>
							<th scope="row">모집 종료일</th>
							<td>${teamContents.teamEndDate}</td>
						</tr>
						<tr>
							<th scope="row">기타 사항</th>
							<td colspan="4" class="view_text"><textarea title="내용"
									id="contents" name="contents">${teamContents.teamOther}</textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
	
	

			<div class="btn_boarddetail">
				<button type="reset" class="btn_reset" onclick="location.href='/team';">목록</button>
				<button type="button" class="btn_apply" onclick="location.href='/teamApply';">팀 지원</button>
			</div>
		</div>
	</form>
</body>
</html>

