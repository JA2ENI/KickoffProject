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

<link href="/team/css/teamManage.css" rel="stylesheet" />

<title>Kick off: 풋살팀 관리</title>
</head>
<body>
	<%@include file="/includes/header.jsp"%>
	<section>
		<div class="menu">
			<a href="/team" class="text-menu" >리스트</a>
			<a href="/teamManage" class="text-menu">나의 팀</a>
			<a href="/teamRank" class="text-menu">랭킹</a>
		</div>
		<div class="container">
			<div class="root-container">
				<article class="article-container one">
					<div class="item-wrap">
						<div class="title">TEAM INFO</div>
						<div class="content-container1">
						
					
					</div>
				</div>
			</article>
				<article id="boxDetail" class="article-container two">
					<div class="item-wrap">
						<div class="wrap">
							<div class="title board">TEAM MEMBER</div>
							
						</div>
						<div class="content-container">
							<div class="title-wrap">
								<div class="subject img"></div>
								<div class="subject type">구분</div>
								<div class="subject name">이름</div>
								<div class="subject position">포지션</div>
								<div class="subject gender">성별</div>
								<div class="subject manage">관리</div>
							</div>
							
							<p id="msg">아직 팀이 없으시군요😥</p>
							<p id="msg2">먼저 팀을 만들어 멋진 팀을 생성해보세요!</p>
							<a href="/teamCreateForm" class="btn-teamInsert">팀 생성</a>
							
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