<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<link href="/apply/css/applyTeam.css" rel="stylesheet" />

<title>Kick off: 팀 신청</title>
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
						<div class="userName">${teamInfoDO.teamName}</div>
					</div>
					<div class="uTeam-container">
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM LOCAL</div>
							<div class="uContant">${teamInfoDO.teamLocal}</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM LEVEL</div>
							<div class="uContant">${teamInfoDO.teamLevel}</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM AGE</div>
							<!-- MIAN/SUB -->
							<div class="uContant">${teamInfoDO.teamAge}</div>
						</div>
						<!-- 매칭 경기 횟수 -->
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM NUMBER</div>
							<div class="uContant">${teamInfoDO.teamNumber}</div>
						</div>
						<!-- 용병 경기 횟수 -->
						<div class="uTeam-wrap">
							<div class="uTitle">GAME</div>
							<div class="uContant">0</div>
						</div>
					</div>
				</div>
			</div>
		</article>
		<article class="team">
			<div class="team-container">
				<div class="team-wrap">
					<div class="team-title">팀 신청</div>
					<c:choose>
						<c:when test="${fn:length(recruitInfo) > 0}">
						<c:forEach var="info" items="${recruitInfo}" varStatus="num">
						<div class="box-wrap">
							<div class="box-frame">
								<div class="box-content">
									<!-- 모집 상태에 따라 -->
									<div class="status"><c:out value="${info.TEAM_STATUS}" /></div>
									<div class="one-wrap">
										<div class="date day"><c:out value="${info.TEAM_START_DATE}" /></div>
										<div class="date">~</div>
										<div class="date day"><c:out value="${info.TEAM_END_DATE}" /></div>
									</div>
									<div class="two-wrap">
										<!-- 상세보기 -->
										<a href="javascript:alert('제목 상세보기 test');" class="teamName"><c:out value="${info.TEAM_NAME}" /></a>
										<!-- 신청자 수/모집인원수 -->
										<div class="numApply">3/<c:out value="${info.TEAM_NUMBER}" /></div>
									</div>
									<div id="checkbox${num.index}" class="checkbox-wrap">
										<input type="checkbox" id="drop${num.index}" class="drop" onclick="drop(${num.index})" /><label for="drop${num.index}"></label>
									</div>
									<div class="three-wrap">
										<div class="arrow">▶</div>
										<div class="three-content"><c:out value="${info.TEAM_LOCAL}" /></div>
										<div>&sdot;</div>
										<div class="three-content"><c:out value="${info.TEAM_GENDER}" /></div>
										<div>&sdot;</div>
										<div class="three-content"><c:out value="${info.TEAM_AGE}" /></div>
									</div>
								</div>
								<!-- 신청자 리스트 -->
								<div id="detail${num.index}" class="detail">
							<c:choose>
								<c:when test="${fn:length(applyInfo) > 0}">
						
								<c:forEach var="list" items="${applyInfo}" varStatus="num2">
									<c:if test="${info.TEAM_SEQNO == list.TEAM_SEQNO}">
									<div id="detail" class="detail-container" onclick="ajaxSidebar('${list.USER_ID}', ${num2.index})">
										<div class="detail-wrap" id="sideon" onclick="sideon()">
											<div class="detail-content">
												<div class="dContent"><c:out value="${list.USER_ID}" /></div>
												<div class="dContent2">&#149;</div>
												<div class="dContent"><c:out value="${list.USER_GENDER}" /></div>
												<div class="dContent2">&#149;</div>
												<div class="dContent"><c:out value="${list.USER_MAIN_POSITION}" /> /
												<c:out value="${list.USER_SUB_POSITION != null ? list.USER_SUB_POSITION : '-'}" /></div>
												<input type="hidden" id="userId${num2.index}" value="${list.USER_ID}"/>
												<input type="hidden" id="dropCheck${num.index}" value="${info.TEAM_SEQNO == list.TEAM_SEQNO}"/>
											</div>
										</div>
									</div>
									</c:if>
								</c:forEach>
								</c:when>
								</c:choose>
							</div>
						</div>
					</div>
					</c:forEach>
					</c:when>
					</c:choose>
				</div>
			</div>
								<!-- 수락&거절(side bar) -->
								<div class="side-container" id="sideBar">
									<div class="side-wrap">
										<div class="side-head">
											<div class="side-title">신청자</div>
											<div class="btn-side">
												<i class="i">X</i>
											</div>
										</div>
										<div class="side-body">
											<div class="content one">
												<div class="sTitle">ID/NAME</div>
												<div id="applyUserId" class="sContent"></div>
											</div>
											<div class="content">
												<div class="sTitle">GENDER</div>
												<div id="userGender" class="sContent"></div>
											</div>
											<div class="content">
												<div class="sTitle">AGE</div>
												<div id="userAge" class="sContant"></div>
											</div>
											<div class="content">
												<div class="sTitle">POSITION</div>
												<div id="userPosition" class="sContent"></div>
											</div>				
											<div class="content">
												<div class="sTitle">LOCAL</div>
												<div id="userLocal" class="sContent"></div>
											</div>
											<!-- 용병 경기 횟수 -->
											<div class="content seven">
												<div class="sTitle">HELPER</div>
												<div id="userHelper" class="sContent"></div>
											</div>
											<!-- alert 띄우기(?) -->
											<div class="content btn-side-wrap">
												<button type="button" id="accept" class="sBtn accept">수락</button>
												<button type="button" id="accept" class="sBtn refusal">거절</button>
							</div>
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
	$(function(){
		/* #sideon + 숫자(반복) */
		$("#sideon").on("click", function(){
			$(".side-container").addClass("menuon");
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
<script src="/apply/js/applyTeam.js"></script>

</html>