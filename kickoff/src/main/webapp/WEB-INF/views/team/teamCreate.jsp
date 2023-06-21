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

<link href="/team/css/teamCreate.css" rel="stylesheet" />

<title>Kick off: 팀 생성</title>
</head>
<body>
	<%@include file="/includes/header.jsp"%>
	<section>
		<div class="title">팀 생성</div>
			<div class="container">
				<article class="article-container">
					<div class="item-wrap">
						<p>팀 이름</p>
						<input type="text" class="text-box"/>
						<div class="item"> </div>
						<div class="item">2</div>
						<div class="item">3</div>
					</div>
				</article>
				<article class="article-container">
					<div class="item-wrap">
						<div class="item">4</div>
						<div class="item">5</div>
						<div class="item">6</div>
					</div>
				</article>
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
<script src="/apply/js/applyHelper.js"></script>

</html>