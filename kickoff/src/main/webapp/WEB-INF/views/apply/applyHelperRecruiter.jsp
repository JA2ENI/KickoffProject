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
						<div class="userName">${recruiterUser.USER_NAME}</div>
						<div class="userId">${recruiterUser.USER_ID}</div>
					</div>
					<div class="uTeam-container">
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM</div>
							<div class="uContant">${recruiterUser.TEAM_NAME}</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM LEVEL</div>
							<div class="uContant">${recruiterUser.TEAM_LEVEL}</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM RANK</div>
							<div class="uContant">${recruiterUser.TEAM_RANK}</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">POSITION</div>
							<!-- MAIN/SUB -->
							<div class="uContant">${recruiterUser.USER_MAIN_POSITION}/${recruiterUser.USER_SUB_POSITION}</div>
						</div>
						<!-- 모집 진행 중인 용병 -->
						<div class="uTeam-wrap">
							<div class="uTitle">BOARD</div>
							<div class="uContant">${recruiterUser.helperInfo}</div>
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
										<input type="checkbox" id="drop${vs.index}" class="drop" onclick="drop${vs.index}()" /><label for="drop${vs.index}"></label>
										<script type="text/javascript">
										function drop${vs.index}() {
											var drop${vs.index} = document.getElementById('drop${vs.index}');
											var detail${vs.index} = document.getElementById('detail${vs.index}');

											if (drop${vs.index}.checked == true) {
												detail${vs.index}.style.display = "block";
											} else {
												detail${vs.index}.style.display = "none";
											}
										}
										</script>
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

								<div id="detail${vs.index}" class="detail">
								
								<c:forEach var = "apply" items = "${applyUser[vs.index]}">
								<!-- 신청자 리스트 -->
									<div id="detail" class="detail-container">
										<div class="detail-wrap" id="sideon" onclick = "sideon()">
											<div class="detail-content">
												<div class="dContent">${apply.userId}</div>
												<div class="dContent">&#149;</div>
												<div class="dContent">${apply.userGender}</div>
												<div class="dContent">&#149;</div>
												<div class="dContent">${apply.userMainPosition}/${apply.userSubPosition}</div>
											</div>
										</div>
									</div>
								</c:forEach>
								
								</div>
									
								<!-- 수락&거절(side bar) -->
								<div class="side-container">
									<div class="side-wrap">
										<div class="side-head">
											<div class="side-title">신청자</div>
											<div class="btn-side" onclick = "btnside()">
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
		<!-- Paging -->
		<div class="paging-wrap container">
			<div class="paging-container">
	    		<a href="#this" class="pageText">&lt;Prev</a>
           		<a href="#this" class="pageText">${pageNum}</a> 
           		<a href="#this" class="pageText">${pageNum}</a> 
	   			<a href="#this" class="pageText">Next&gt;</a>
		   	</div>
		</div>
		<!-- Paging END -->
	</section>
</body>

<!-- footer -->
<%@include file="/includes/footer.jsp"%>

<script>
	/* side-bar */
	function sideon() {
		$(".side-container").addClass("menuon");
	}
	
	function btnside() {
		$(".side-container").toggleClass("menuon");
	}
	
</script>

<!-- script -->
<script src="/includes/js/jquery-3.3.1.min.js"></script>
<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>
<script src="/includes/js/ScrollMagic.min.js"></script>
<script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
<script src="/includes/js/main.js"></script>
<script src="/apply/js/applyList.js"></script>
<!-- <script src="/apply/js/applyHelper.js"></script> -->

</html>