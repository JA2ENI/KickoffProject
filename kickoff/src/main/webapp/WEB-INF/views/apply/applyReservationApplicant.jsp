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
<link href="/apply/css/applyReservation.css" rel="stylesheet" />

<title>Kick off: 예약 신청</title>
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
						<div class="userName">${userInfo.USER_NAME}</div>
						<div class="userId">${userInfo.USER_ID}</div>
					</div>
					<div class="uTeam-container">
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM</div>
							<c:if test="${not empty userInfo.TEAM_NAME}">
								<div class="uContant">${userInfo.TEAM_NAME}</div>
							</c:if>
							<c:if test="${empty userInfo.TEAM_NAME}">
								<div class="uContant">-</div>
							</c:if>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM LEVEL</div>
							<c:if test="${not empty userInfo.TEAM_LEVEL}">
								<div class="uContant">${userInfo.TEAM_LEVEL}</div>
							</c:if>
							<c:if test="${empty userInfo.TEAM_LEVEL}">
								<div class="uContant">-</div>
							</c:if>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">POSITION</div>
							<c:if test="${not empty userInfo.USER_SUB_POSITION}">
								<div class="uContant">${userInfo.USER_MAIN_POSITION}/${userInfo.USER_SUB_POSITION}</div>
							</c:if>
							<c:if test="${empty userInfo.USER_SUB_POSITION}">
								<div class="uContant">${userInfo.USER_MAIN_POSITION}/-</div>
							</c:if>
						</div>
						<!-- 모든 풋살장의 예약완료 중 해당 USER가 예약완료한 총 횟수 -->
						<div class="uTeam-wrap">
							<div class="uTitle">RESERVATION COMPLETION</div>
							<div class="uContant">${userInfo.rCount}</div>
						</div>
						<!-- 로그인한 USER의 매칭완료 총 횟수 -->
						<div class="uTeam-wrap">
							<div class="uTitle">GAME COMPLETION</div>
							<div class="uContant">${userInfo.gameCount}</div>
						</div>
					</div>
				</div>
			</div>
		</article>
		<article class="reservation">
			<div class="reservation-container">
				<div class="reservation-wrap">
					<div class="reservation-title">예약 신청</div>
					<c:choose>
						<c:when test="${fn:length(myApplyList) > 0}">
							<c:forEach var="row" items="${myApplyList}" varStatus="num">
								<div class="box-wrap">
									<div class="box-frame">
										<div class="box-content">
											<c:choose>
												<c:when test="${row.reservationStatus == '예약 중'}">
													<div class="status2 ing">예약 중</div>
												</c:when>
												<c:when test="${row.reservationStatus == '예약 완료'}">
													<div class="status2 end">예약 완료</div>
												</c:when>
												<c:otherwise>
													<div class="status2 cancel">예약 취소</div>
												</c:otherwise>
											</c:choose>
											<div class="one-wrap">
												<div class="date day">${row.reservationDate}</div>
												<div class="date">${row.dayOfWeek}</div>
												<div class="date">${row.reservationStartTime}~${row.reservationEndTime}</div>
											</div>
											<div class="two-wrap">
												<a href="/reservationDetail?reservationNo=${row.reservationNo}" class="placeName">${row.reservationPlaceName}</a>
												<div class="numReservation">${row.reservationCourtName}</div>
											</div>
											<!-- 신청 취소 -->
											<div class="btn-wrap">
												<button type="button" class="btn-detail" onclick="javascript:alert('test')">신청취소</button>
											</div>
											<c:if test="${row.userStatus == '예약 완료'}">
												<div class="ticket-wrap">
													<img class="ticket" src="/apply/images/reservationThanks.png" />
												</div>
											</c:if>
											<c:if test="${row.userStatus == '예약 취소'}">
												<div class="ticket-wrap">
													<img class="ticket" src="/apply/images/reservationSorry.png" />
												</div>
											</c:if>
											<div class="three-wrap">
												<div class="arrow">▶</div>
												<div class="three-content">${row.reservationPlaceGround}</div>
												<div>&sdot;</div>
												<div class="three-content">${row.reservationHeadcount}</div>
												<div>&sdot;</div>
												<div class="three-content">${row.reservationPlaceSize}</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<!-- 추후, 리스트가 없을 경우 '예약 리스트' 이동 버튼 만들기 -->
						</c:otherwise>
					</c:choose>
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
<script src="/apply/js/applyReservation.js"></script>

</html>