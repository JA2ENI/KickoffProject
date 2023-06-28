<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kick Off: 마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link href="/myPage/css/main.css" rel="stylesheet" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

<!-- Bootstrap CSS-->
<link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link href="/myPage/vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="/myPage/vendor/mdi-font/material-design-iconic-font.min.css" rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="/myPage/css/theme.css" rel="stylesheet" media="all">
<link href="/myPage/css/myReservation.css" rel="stylesheet" media="all">

</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<input type="button" onclick="location.href='main'" class="kickoff-logo" value="Kick Off"/>
					<br>
					<strong class="logo">예약 내역</strong>
				</header>
				<c:choose>
					<c:when test="${fn:length(myReservationList) > 0}">
						<c:forEach var="row" items="${myReservationList}" varStatus="num">
							<c:if test="${row.reservationCancel eq 'N'}">
								<section>
									<div class="container-fluid">
										<div class="container reservation-container"> 
											<div class="container p-0">
												<div class="root-content">
													<div class="container">
														<div class="facility-content">
															<div class="image-wrap">
																<img class="image" src="${imgInfo.get(num.index).imgPath}${imgInfo.get(num.index).imgName}" />
															</div>
															<div class="facility-wrap">
																<h2>${row.reservationPlaceName}</h2>
																<h3>${row.reservationPlaceAddress}</h3>
																<p class="info">
																	예약 날짜<span>${row.reservationDate}</span>
																</p>
																<p class="info">
																	예약 시간<span>${row.reservationStartTime}~${row.reservationEndTime}</span>
																</p>
																<p class="info">
																	대관 비용<span>${row.reservationPrice}원</span>
																</p>
																<p class="info">
																	예약 상태<span class="status">${row.reservationStatus}</span>
																</p>
															</div>
														</div>
													</div>
													<div class="container">
														<div class="map-wrap">
															<h4 class="title">
																구장위치<span id="test">*</span>
															</h4>
															<div class="map-container">
																<div id="map${num.index}" class="map-content"></div>
															</div>
															<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d724483fb639866457f6535349fcd24&libraries=services"></script>
															<script>
																/* Kakao Map */
																var mapContainer${num.index} = document.getElementById('map${num.index}'); // 지도를 표시할 div
																
																var	mapOption${num.index} = {
																	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
																	level: 3 // 지도의 확대 레벨
																};
														
																// 지도를 생성합니다
																var map${num.index} = new kakao.maps.Map(mapContainer${num.index}, mapOption${num.index});
														
																// 주소-좌표 변환 객체를 생성합니다
																var geocoder${num.index} = new kakao.maps.services.Geocoder();
														
																// 주소로 좌표를 검색합니다
																geocoder${num.index}.addressSearch('${row.reservationPlaceAddress}', function(result, status) {
														
																	// 정상적으로 검색이 완료됐으면
																	if (status === kakao.maps.services.Status.OK) {
														
																		var coords${num.index} = new kakao.maps.LatLng(result[0].y, result[0].x);
														
																		// 결과값으로 받은 위치를 마커로 표시합니다
																		var marker${num.index} = new kakao.maps.Marker({
																			map: map${num.index},
																			position: coords${num.index}
																		});
														
																		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																		map${num.index}.setCenter(coords${num.index});
																	}
																});
																var zoomControl${num.index} = new kakao.maps.ZoomControl();
																map${num.index}.addControl(zoomControl${num.index}, kakao.maps.ControlPosition.RIGHT);
															</script>
														</div>
													</div>
													<!-- button -->
													<div class="btn-container">
														<a href="javascript:cancel('/cancle?reservationNo=${row.reservationNo}')" id="cancle" class="cancle">예약 취소</a>
														<a href="/reservationDetail?reservationNo=${row.reservationOriginNo}" id="detail" class="detail">상세 보기</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="listNone">
							"환상의 경기가 펼쳐질 풋살장을 예약해보세요"
						</div>
						<a href="/reservation" id="reservation" class="reservation">풋살장 예약</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
					<header class="major">
						<h2>MyPage</h2>
					</header>
					<ul>
						<li><a href="/myReservation">예약 내역</a></li>
						<li><a href="/myBoardList">내 게시글</a></li>
						<li><a href="/myInfoCheck">회원 정보 수정</a></li>
						<li><a href="/myMessage">메시지</a></li>
						<li><a href="/myGameRecordList">매칭</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<!-- script -->
	<!-- 서버인증키 -->
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c12ebb063cb05a9fc037082cb8601ef1&libraries=services"></script> -->
	
	<script src="/myPage/js/jquery.min.js"></script>
	<script src="/myPage/js/skel.min.js"></script>
	<script src="/myPage/js/util.js"></script>
	<script src="/myPage/js/main.js"></script>
	<script src="/myPage/vendor/jquery-3.2.1.min.js"></script>
	<script src="/myPage/vendor/bootstrap-4.1/popper.min.js"></script>
	<script src="/myPage/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<script src="/myPage/vendor/select2/select2.min.js"></script>
	<script src="/myPage/js/reservationMain.js"></script>
	<script src="/myPage/js/mypage.js"></script>

</body>
</html>