<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Kick Off: 풋살팀 모집글 상세보기</title>
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

	<link href="/team/css/teamDetail.css" rel="stylesheet" />
</head>
<body>
	<%@include file="/includes/header.jsp"%>
	<!-- Header -->
	
	<section>
	<form role="form" action="/teamDetail" method="post">
		<div class="container">
			<div class="root-container">
				
				<article id="boxDetail" class="article-container two">
					<div class="item-wrap">
						<div class="wrap">
							<div class="title board">${teamContents.teamName}</div>
							<a class="team-status">${teamContents.teamStatus}</a>
						</div>
						<div class="content-container">
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
							<th scope="row">모집 연령대</th>
							<td>${teamContents.teamAge}</td>
						</tr>
						<tr>
							<th scope="row">모집 성별</th>
							<td>${teamContents.teamGender}</td>
							<th scope="row">모집 인원</th>
							<td>${teamContents.teamNumber}</td>
						</tr>
						<tr>
							<th scope="row">풋살팀 소속 지역</th>
							<td>${teamContents.teamLocal}</td>
							<th scope="row">풋살팀 레벨</th>
							<td>${teamContents.teamLevel}</td>
						</tr>
						<tr>
							<th scope="row">주 이용 요일</th>
							<td>${teamContents.teamDay}</td>
							<th scope="row">주 이용 시간</th>
							<td>${teamContents.teamTime}</td>
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
					</div>
				</article>
			</div>
				<div class="btn">
					<button type="reset" class="btn_reset" onclick="location.href='/team';">목록</button>
					<c:if test="${userId eq teamContents.leaderId}">
						<button type="button" class="btn_update" onclick="updateTeam('${teamContents.teamSeqNo}')">수정</button>
					</c:if>
					<c:if test="${userId eq teamContents.leaderId}">
						<button type="button" class="btn_delete" onclick="deleteTeam('${teamContents.teamSeqNo}')">삭제</button>
					</c:if>
					<c:if test="${userId ne teamInfoDO.leaderId && userId ne teamInfoDO.memberId}">
						<button type="button" class="btn_apply" onclick="location.href='/teamApply';">지원하기</button>
					</c:if>
			   </div>
		</div>
	</form>
	</section>
	<script src="/team/js/teamDetail.js"></script>
</body>
</html>

