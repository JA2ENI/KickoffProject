<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Kick Off: 자유게시판 글 신고</title>
<!-- include할 문서에 스타일, js -->
 <link rel="stylesheet" href="/includes/css/style.css">
 <link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">
    
    <script src="/includes/js/jquery-3.3.1.min.js"></script>

    <script src="/includes/js/jquery.lettering.js"></script>
    <script src="/includes/js/jquery.sticky.js"></script>


    <script src="/includes/js/ScrollMagic.min.js"></script>
    <script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>


    <script src="/includes/js/main.js"></script>
<!-- 여기까지 복붙하기 -->    
<link rel="stylesheet" href="/board/css/boardReport.css" />
</head>
<body>
<%@include file="/includes/header.jsp"%>
<!-- Header -->
    <div class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">자유게시판 게시글 신고</h1>
                <p class="lead fw-normal text-white-50 mb-0">게시글을 신고한 후에는 신고 처리 과정이 진행되는 동안에는 게시글에 대한 정보는 보이지 않습니다.</p>
            </div>
        </div>
    </div>

<br>
<br>
<form id="frm" name="frm" action="report_action?boardSeqno=${boardSeqno}" onsubmit="return _onSubmit();" method="post">
	<div class="report">
		<label>
			<input type="radio" name="reportComment" value="광고성이거나 스팸성 게시물" >
			<span>광고성이거나 스팸성 게시물</span>
		</label> 
		<br />
		<label>
			<input type="radio" name="reportComment" value="혐오 발언, 인종 차별, 성차별 등 다른 사용자를 비방하거나 차별하는 내용이 포함된 게시물">
			<span>혐오 발언, 인종 차별, 성차별 등 다른 사용자를 비방하거나 차별하는 내용이 포함된 게시물</span>
		</label> 
		<br />
		<label>
			<input type="radio" name="reportComment" value="불법적인 내용이 포함된 게시물 (저작권 침해, 명예훼손, 개인정보 유출 등)">
			<span>불법적인 내용이 포함된 게시물 (저작권 침해, 명예훼손, 개인정보 유출 등)</span>
		</label>
		<br /> 
		<label>
			<input type="radio" name="reportComment" value="욕설이나 비속어, 음란물 등 부적절한 내용이 포함된 게시물">
			<span>욕설이나 비속어, 음란물 등 부적절한 내용이 포함된 게시물</span>
		</label>
		<br /> 
		<label>
			<input type="radio" name="reportComment" value="풋살 게임에 대한 부적절한 규칙 및 행동을 제안하거나 언급하는 게시물">
			<span>풋살 게임에 대한 부적절한 규칙 및 행동을 제안하거나 언급하는 게시물</span>
		</label>
		<br />
		<div class="btn_boardreport">
				<button type="reset" class="btn_reset" onclick="location.href='/board';">취소</button>
				<button type="submit" class="btn_delete" onclick="document.getElementById('frm').submit();">신고</button>
		</div>
	</div>
</form>
</body>
</html>

