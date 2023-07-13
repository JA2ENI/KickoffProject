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
		<article class="myInfo">
			<div class="myInfo-container">
				<div class="myInfo-wrap">
					<div class="userName">나의 풋살장</div>
					<div class="uTeam-container">
						<div class="uTeam-wrap">
							<div class="uTitle">PLACE NAME</div>
							<div class="uContant">${placeInfo.placeName}</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">OPEN TIME</div>
							<div class="uContant">${placeInfo.placeOpen}</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">PLACE FORM</div>
							<div class="uContant">${placeInfo.placeForm}</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">PLACE GROUND</div>
							<div class="uContant">${placeInfo.placeGround}</div>
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">PLACE RENTAL FEE</div>
							<div class="uContant">${placeInfo.placePrice}</div>
						</div>
					</div>
				</div>
			</div>
		</article>
		<article class="reservation">
			<div class="reservation-container">
				<div id="wrapReload" class="reservation-wrap">
					<div class="reservation-title">예약 신청</div>
					<c:choose>
						<c:when test="${fn:length(empRList) > 0}">
							<c:forEach var="emp" items="${empRList}" varStatus="num">
								<div class="box-wrap">
									<div class="box-frame">
										<div class="box-content">
											<div class="status statusAjax${num.index}"></div>
											<div class="one-wrap">
												<div class="date day">${emp.RESERVATION_DATE}</div>
												<div class="date">${emp.DAY_OF_WEEK}</div>
												<div class="date">${emp.RESERVATION_START_TIME}~${emp.RESERVATION_END_TIME}</div>
											</div>
											<div class="two-wrap">
												<a href="/reservationDetail?reservationNo=${emp.RESERVATION_NO}" class="placeName">${emp.RESERVATION_PLACE_NAME}</a>
												<div class="numReservation">${emp.RESERVATION_COURT_NAME}</div>
											</div>
											<div id="checkbox${num.index}" class="checkbox-wrap">
												<input type="checkbox" id="drop${num.index}" class="drop" onclick="drop(${num.index})"/><label for="drop${num.index}" ></label>
											</div>
											<div class="three-wrap">
												<div class="arrow">▶</div>
												<div class="three-content">${emp.RESERVATION_PLACE_GROUND}</div>
												<div>&sdot;</div>
												<div class="three-content">${emp.RESERVATION_HEADCOUNT}</div>
												<div>&sdot;</div>
												<div class="three-content">${emp.RESERVATION_PLACE_SIZE}</div>
											</div>
										</div>
										<div id="detail${num.index}" class="detail">
											<c:choose>
												<c:when test="${fn:length(userRList) > 0}">
													<c:forEach var="apply" items="${userRList}" varStatus="num2">
														<c:if test="${emp.RESERVATION_NO == apply.RESERVATION_ORIGIN_NO}">
															<div class="detail-container" onclick="ajaxSidebar(${num2.index})">
																<div class="apply-wrap acceptMark${num2.index}">
																	<img id="imgAccept" class="applyStatus" src="/apply/images/accept.png" />
																</div>
																<div class="apply-wrap refuseMark${num2.index}">
																	<img id="imgRefuse"class="applyStatus" src="/apply/images/refuse.png" />
																</div>
																<div class="detail-wrap" id="sideon" onclick="sideon()">
																	<div class="detail-content">
																		<div class="dContent">${apply.USER_ID}</div>
																		<div class="dContent">&#149;</div>
																		<div class="dContent">${apply.RESERVATION_USER_NAME}</div>
																		<div class="dContent">&#149;</div>
																		<div class="dContent">${apply.RESERVATION_USER_PHONE}</div>
																		<input type="hidden" id="empId" value="${emp.EMP_ID}"/>
																		<input type="hidden" id="aUserId${num2.index}" class="aUserId${num2.index}" value="${apply.USER_ID}"/>
																		<input type="hidden" id="rNum${num2.index}" value="${emp.RESERVATION_NO}"/>
																		<input type="hidden" id="dropCheck${num.index}" value="${emp.RESERVATION_NO == apply.RESERVATION_ORIGIN_NO}"/>
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
						<c:otherwise>
							<!-- 추후, 리스트가 없을 경우 'EMP 풋살장 예약 등록 페이지' or '예약 리스트' 이동 버튼 만들기 -->
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- 수락&거절(side bar) -->
			<div id="sideBar" class="side-container">
				<div class="side-wrap">
					<div class="side-head">
						<div class="side-title">신청자</div>
						<div class="btn-side bSide" onclick="btnSide()">
							<i class="i">X</i>
						</div>
					</div>
					<div class="side-body">
						<div class="content one">
							<div class="sTitle">ID</div>
							<div id="userId" class="sContent"></div>
						</div>
						<div class="content">
							<div class="sTitle">GENDER</div>
							<div id="gender" class="sContent"></div>
						</div>
						<div class="content">
							<div class="sTitle">POSITION</div>
							<div id="position" class="sContent"></div>
						</div>
						<div class="content">
							<div class="sTitle">TEAM</div>
							<div id="teamName" class="sContent"></div>
						</div>
						<div class="content">
							<div class="sTitle">TEAM AREA</div>
							<div id="teamLocal" class="sContent"></div>
						</div>
						<div class="content seven">
							<!-- 로그인한 EMP유저 풋살장에 해당 USER가 예약완료한 총 건수 -->
							<div class="sTitle">RESERVATION</div>
							<div id="rCount" class="sContent"></div>
						</div>
						<div id="sStatus" class="sStatus accept1"></div>
						<div id="sStatus" class="sStatus refuse1"></div>
						<div class="content btn-side-wrap">
							<button type="button" id="accept" class="sBtn accept" onclick="select('accept')">수락</button>
							<button type="button" id="refuse" class="sBtn refuse" onclick="select('refuse')">거절</button>
							<input type="hidden" id="sUserId" name="sUserId" value="" />
							<input type="hidden" id="sNum" name="sNum" value=""/>
						</div>
					</div>
				</div>
			</div>
		</article>
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
<script src="/apply/js/applyReservation.js"></script>

</html>