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
<link href="/apply/css/applySelect.css" rel="stylesheet" />

<title>Kick off: 신청자&amp;모집자</title>
</head>
<body>
	<div class="header-container">
		<%@include file="/includes/header.jsp"%>
	</div>
	<header>
		<div class="title">"신청자, 모집자 중 선택하세요"</div>
	</header>
	<section>
		<div class="img_container">
			<button type="button" onclick="location.href='/applySelect?num=1';">
				<img id="imgCourt" class="icons" src="/apply/images/applicant.png" />
			</button>
			<button type="button" onclick="location.href='/applySelect?num=2';">
				<img id="imgGame" class="icons" src="/apply/images/recruiter.png" />
			</button>
		</div>
	</section>
	<input type="hidden" id="msg" name="msg" value="${msg}"/>
</body>

<!-- footer -->
<%@include file="/includes/footer.jsp"%>

<script>
	const msg = $('input[name=msg]').val();
	
	if(msg == "msg") {
		alert('유효하지 않는 요청입니다.');
		location.href="/applyList";
	} else if(msg == "login") {
		alert('로그인 후 이용해주세요.');
		location.href="/loginAll";
	} else if(msg == "emp") {
		alert('업체회원만 이용할 수 있습니다.');
		location.href='/applyList';
	}
	
</script>

<!-- script -->
<script src="/includes/js/jquery-3.3.1.min.js"></script>
<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>
<script src="/includes/js/ScrollMagic.min.js"></script>
<script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
<script src="/includes/js/main.js"></script>

</html>