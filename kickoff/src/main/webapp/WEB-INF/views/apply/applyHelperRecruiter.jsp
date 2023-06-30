<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Russo+One&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<link rel="stylesheet" href="/includes/css/styleApply.css">
<link rel="stylesheet" href="/main/css/vendor/icomoon/style.css">
<link href="/includes/css/applyNavi.css" rel="stylesheet" />
<link href="/apply/css/applyHelper.css" rel="stylesheet" />

<title>Kick off: 용병 신청</title>
</head>
<body>
	<div class="header-container">
		<%@include file="/includes/header.jsp"%>
	</div>
	<%@include file="/includes/applyNavi.jsp"%>
	<section>
		<!-- Session User Info -->
		<article class="myInfo">
			<div class="myInfo-container">
				<div class="myInfo-wrap">
					<div class="uInfo">
						<div class="userName">안재은</div>
						<div class="userId">ja2eni</div>
					</div>
					<div class="uTeam-container">
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM</div>
							<div class="uContant">우최팀</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM LEVEL</div>
							<div class="uContant">루키</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">POSITION</div>
							<!-- MIAN/SUB -->
							<div class="uContant">PIVO/GOLEIRO</div>
						</div>
						<!-- 매칭 경기 횟수 -->
						<div class="uTeam-wrap">
							<div class="uTitle">GAME</div>
							<div class="uContant">5</div>
						</div>
						<!-- 용병 경기 횟수 -->
						<div class="uTeam-wrap">
							<div class="uTitle">HELPER</div>
							<div class="uContant">0</div>
						</div>
					</div>
				</div>
			</div>
		</article>
		<article class="helper">
			<div class="helper-container">
				<div class="helper-wrap">
					<div class="hTitle">용병 신청</div>
						<div class="box-wrap">
						<c:forEach var = "list" items = "${helperSelect}" varStatus = "vs">
							<div class="box-frame">
								<div class="box-content">
									<!-- 모집 상태에 따라 -->
										<div class="status ing">${list.helperStatus}</div>
									<!-- <div class="status end">모집 완료</div> -->
									<!-- <div class="status cancel">모집 취소</div> -->
									<div class="one-wrap">
										<div class="date day">${list.helperTime}</div>
										<!-- <div class="date">수요일</div>
										<div class="date">20:00</div> -->
									</div>
									<div class="two-wrap">
										<!-- 상세보기 -->
										<a href="javascript:alert('제목 상세보기 test');" class="placeName">${list.helperPlaceName}</a>
										<!-- 신청자 수/모집인원수 -->
										<div class="numApply">${applyAccept}/${list.helperWant}명</div>
									</div>
									<div class="checkbox-wrap">
										<input type="checkbox" id="drop" class="drop" onclick="drop()" /><label for="drop"></label>
									</div>
									<div class="three-wrap">
										<div class="arrow">▶</div>
										<div class="three-content">${list.helperGender}</div>
										<div>&sdot;</div>
										<div class="three-content">${list.helperMatch}</div>
										<div>&sdot;</div>
										<div class="three-content">${list.helperPosition}</div>
									</div>
								</div>
									<%-- <c:forEach var = "apply" items = "applyUser">
									<!-- 신청자 리스트 -->
									<div id="detail" class="detail">
									<div id="detail" class="detail-container">
										<div class="detail-wrap" id="sideon">
											<div class="detail-content">
												<div class="dContent">${apply.userId}</div>
												<div class="dContent">&#149;</div>
												<div class="dContent">${apply.userGender}</div>
												<div class="dContent">&#149;</div>
												<div class="dContent">${apply.userMainPosition}/${apply.userSubPosition}</div>
											</div>
										</div>
									</div>
									</div>
									</c:forEach> --%>

								<!-- 수락&거절(side bar) -->
								<div class="side-container">
									<div class="side-wrap">
										<div class="side-head">
											<div class="side-title">신청자</div>
											<div class="btn-side">
												<i class="i">X</i>
											</div>
										</div>
										<div class="side-body">
											<div class="content one">
												<div class="sTitle">ID</div>
												<div class="sContent">ja2eni</div>
											</div>
											<div class="content">
												<div class="sTitle">GENDER</div>
												<div class="sContent">남성</div>
											</div>
											<div class="content">
												<div class="sTitle">POSITION</div>
												<div class="uContant">PIVO/GOLEIRO</div>
											</div>
											<div class="content">
												<div class="sTitle">TEAM</div>
												<div class="sContent">우최팀</div>
											</div>
											<!-- 매칭 경기 횟수 -->									
											<div class="content">
												<div class="sTitle">GAME</div>
												<div class="sContent">7</div>
											</div>
											<!-- 용병 경기 횟수 -->
											<div class="content seven">
												<div class="sTitle">HELPER</div>
												<div class="sContent">10</div>
											</div>
											<!-- alert 띄우기(?) -->
											<div class="content btn-side-wrap">
												<button type="button" id="accept" class="sBtn accept">수락</button>
												<button type="button" id="accept" class="sBtn refusal">거절</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
		</article>
	</section>
</body>

<!-- footer -->
<%@include file="/includes/footer.jsp"%>

<script>
	/* side-bar */
	$(function(){
		/* #sideon + 숫자(반복) */
		$("#sideon").on("click", function(){
			$(".side-container").toggleClass("menuon");
		});
		
		$(".btn-side").on("click", function(){
			$(".side-container").toggleClass("menuon");
		});
	});
</script>

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