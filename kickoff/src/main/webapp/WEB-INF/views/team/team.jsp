<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<link rel="stylesheet" href="/includes/css/styleApply.css">
<link rel="stylesheet" href="/main/css/vendor/icomoon/style.css">

<link href="/team/css/teamList.css" rel="stylesheet" />

<title>Kick off: 풋살팀</title>
</head>
<body>
	<%@include file="/includes/header.jsp"%>
	<section>
		<div class="menu">
			<a href="/team" class="text-menu" >리스트</a>
			<a href="javascript:alert('주소 입력');" class="text-menu">나의 팀</a>
			<a href="/teamRank" class="text-menu">랭킹</a>
		</div>
		<div class="container">
			<div class="root-container">
				<article class="article-container one">
					<div class="item-wrap">
						<div class="title">TEAM</div>
						<div class="content-container">
							<div class="title-wrap">
								<div class="subject team">팀</div>
								<div class="subject area">지역</div>
							</div>
							<!-- <button type="button" class="detail" onclick="javascript:alert('s');"> -->
							<button type="button" class="detail" onclick="btnTeam()">
								<div class="content-wrap">
									<div class="content team">풋살이 최고야</div>
									<div class="content area">서울특별시</div>
								</div>
							</button>
							
							<!-- Test 추후 삭제 -->
							<button type="button" class="detail">
								<div class="content-wrap">
									<div class="content team">풋살이 최고야</div>
									<div class="content area">서울특별시</div>
								</div>
							</button>
							
							<button type="button" class="detail">
								<div class="content-wrap">
									<div class="content team">풋살이 최고야</div>
									<div class="content area">서울특별시</div>
								</div>
							</button>
							<!-- test END -->
						</div>
					</div>
				</article>
				<article id="boxDetail" class="article-container two">
					<div class="item-wrap">
						<div class="title">TEAM BOARD</div>
						<div class="content-container">
							<div class="title-wrap">
								<div class="subject team2">팀</div>
								<div class="subject date">모집일자</div>
								<div class="subject total">모집인원</div>
								<div class="subject gender">모집성별</div>
								<div class="subject status">모집상태</div>
							</div>
							<button type="button" class="detail" onclick="javascript:alert('게시글 상세보기');">
								<div class="content-wrap">
									<div class="content team2">풋살이 최고야</div>
									<div class="content date">~23.07.03</div>
									<div class="content total">10</div>
									<div class="content gender">혼성</div>
									<div class="content status">모집 중</div>
									<!-- <div class="content status2">모집완료</div> -->
								</div>
							</button>
							<!-- Test 추후 삭제 -->
							<button type="button" class="detail" onclick="javascript:alert('게시글 상세보기');">
								<div class="content-wrap">
									<div class="content team2">우리동네풋살왕</div>
									<div class="content date">~23.07.03</div>
									<div class="content total">10</div>
									<div class="content gender">혼성</div>
									<div class="content status2">모집완료</div>
								</div>
							</button>
							<button type="button" class="detail" onclick="javascript:alert('게시글 상세보기');">
								<div class="content-wrap">
									<div class="content team2">독수리슛FC</div>
									<div class="content date">~23.07.03</div>
									<div class="content total">10</div>
									<div class="content gender">혼성</div>
									<div class="content status">모집 중</div>
								</div>
							</button>
							<!-- test END -->
						</div>
					</div>
				</article>
				<!-- Team 모집글 -->
				<article id="boxDetail2" class="article-container two">
					<div class="item-wrap">
						<div class="title">TEAM BOARD</div>
						<div class="content-container">
							<div class="title-wrap">
								<div class="subject team2">팀</div>
								<div class="subject date">모집일자</div>
								<div class="subject total">모집인원</div>
								<div class="subject gender">모집성별</div>
								<div class="subject status">모집상태</div>
							</div>
							<button type="button" class="detail" onclick="javascript:alert('게시글 상세보기');">
								<div class="content-wrap">
									<div class="content team2">풋살이 최고야</div>
									<div class="content date">~23.07.03</div>
									<div class="content total">10</div>
									<div class="content gender">혼성</div>
									<div class="content status">모집 중</div>
									<!-- <div class="content status2">모집완료</div> -->
								</div>
							</button>
							<!-- Test 추후 삭제 -->
							<button type="button" class="detail" onclick="javascript:alert('게시글 상세보기');">
								<div class="content-wrap">
									<div class="content team2">풋살이 최고야</div>
									<div class="content date">~23.07.31</div>
									<div class="content total">5</div>
									<div class="content gender">남성</div>
									<div class="content status2">모집완료</div>
								</div>
							</button>
							<!-- test END -->
						</div>
					</div>
				</article>
			</div>
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
<script src="/team/js/teamList.js"></script>

</html>