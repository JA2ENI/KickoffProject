<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>Kick off: 풋살장 예약 상세</title>
	
    <!-- Google Font -->
    <link href="https://fonts.google.com/noto/specimen/Noto+Sans+KR?subset=korean&noto.script=Kore" rel="stylesheet">
    
    <link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">
    <link href="/includes/css/style.css" rel="stylesheet" >
    <link href="/reservation/css/detail.css" rel="stylesheet" >
</head>

<body>
	<div class="root">
		<div class="full-cover">
			<!-- header -->
			<div class="header-container">
				<%@include file="/includes/header.jsp"%>
			</div>
			<!-- title -->
			<div class="title-container">
				<div class="title-box px-lg-5">
					<div class="text-center">
						<h1 class="title fw-bolder">풋살장 예약 상세</h1>
						<p class="sub fw-normal text-white-50 mb-0">멋진 경기가 펼쳐 질 풋살장 예약 신청해보세요.</p>
					</div>
				</div>
			</div>
			<form role="form" id="frm" name="frm" method="post">
				<!-- 풋살장 이미지 -->
				<div class="root-container">
					<div class="picture">
						<img class="mainImage" src="${reservationDetail.imgPath}${reservationDetail.imgName}">
					</div>
				</div>
				<!-- reservation container -->
				<div class="container reservation-container">
					<div class="container p-0 px-md-3">
						<div class="ground-title-content">
							<div class="address-wrap">
								<h3 class="placeName">${reservationDetail.reservationPlaceName}</h3>
								<p class="address">${reservationDetail.reservationPlaceAddress}</p>
							</div>
							<div class="time-price-wrap">
								<p>${reservationDetail.reservationDate} ${reservationDetail.reservationStartTime}:00~${reservationDetail.reservationEndTime}:00</p>
								<h3 class="price">대관비 ${reservationDetail.reservationPrice}원</h3>
							</div>
						</div>
					</div>
					<div class="container">
						<h5 class="title">
							구장시설<span>*</span>
						</h5>
						<div class="facility-content">
							<div class="facility-wrap">
								<!-- 아마 아이콘도 추후 경로 변경해야 함 -->
								<div class="img-wrap">
									<img src="/reservation/images/court.png">
								</div>
								<b class="text-dark">코트이름</b><small>${reservationDetail.reservationCourtName}</small>
							</div>
							<div class="facility-wrap">
								<div class="img-wrap">
									<img src="/reservation/images/size.png">
								</div>
								<b class="text-dark">구장규격</b><small>${reservationDetail.reservationPlaceSize}</small>
							</div>
							<div class="facility-wrap">
								<div class="img-wrap">
									<img src="/reservation/images/vs.png">
								</div>
								<b class="text-dark">추천경기</b><small>${reservationDetail.reservationHeadcount}</small>
							</div>
							<div class="facility-wrap">
								<div class="img-wrap">
									<img src="/reservation/images/loading.png">
								</div>
								<c:choose>
									<c:when test="${reservationDetail.reservationStatus == '예약 중'}">
										<b class="text-dark">예약상태</b><small>예약 중</small>
									</c:when>
									<c:otherwise>
										<b class="text-dark">예약상태</b><small>예약 완료</small>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="facility-wrap">
								<div class="img-wrap">
									<img src="/reservation/images/form.png">
								</div>
								<c:choose>
									<c:when test="${reservationDetail.reservationPlaceGround == '천연잔디'}">
										<b class="text-dark">바닥형태</b><small>천연잔디</small>
									</c:when>
									<c:when test="${reservationDetail.reservationPlaceGround == '인조잔디'}">
										<b class="text-dark">바닥형태</b><small>인조잔디</small>
									</c:when>
									<c:otherwise>
										<b class="text-dark">바닥형태</b><small>피치플로어</small>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="facility-wrap">
								<div class="img-wrap">
									<img src="/reservation/images/parking.png">
								</div>
								<c:choose>
									<c:when test="${reservationDetail.reservationPlaceParking == 'Y'}">
										<b class="text-dark">주차장</b><small>YES</small>
									</c:when>
									<c:otherwise>
										<b class="text-dark">주차장</b><small>NO</small>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="facility-wrap">
								<c:choose>
									<c:when test="${reservationDetail.reservationCourtForm == 'outdoor'}">
										<div class="img-wrap">
											<img src="/reservation/images/sunlight.png">
										</div>
										<b class="text-dark">공간형태</b><small>실외</small>
									</c:when>
									<c:otherwise>
										<div class="img-wrap">
											<img src="/reservation/images/noSunlight.png">
										</div>
										<b class="text-dark">공간형태</b><small>실내</small>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="facility-wrap">
								<c:choose>
									<c:when test="${reservationDetail.reservationPlaceParking == 'YES'}">
										<div class="img-wrap">
											<img src="/reservation/images/lighting.png">
										</div>
										<b class="text-dark">조명</b><small>YES</small>
									</c:when>
									<c:otherwise>
										<div class="img-wrap">
											<img src="/reservation/images/noLighting.png">
										</div>
										<b class="text-dark">조명</b><small>NO</small>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="container">
						<h5 class="title">
							구장위치<span>*</span>
						</h5>
						<div class="map-container">
							<div id="map"></div>
							<div class="title-wrap be-default mb-3">
								<p>${reservationDetail.reservationPlaceAddress}</p>
							</div>
						</div>
					</div>
					<input type="hidden" name="reservationNo" value="${reservationDetail.reservationNo}"/>
					<!-- button -->
					<c:if test="${empId != null && empId == reservationDetail.empId}">
						<div class="btn-container">
							<a href="/reservationUpdateForm?reservationNo=${reservationDetail.reservationNo}" id="update" class="btn">수정</a>
							<a href="/reservation" id="list" class="btn">목록</a>
						</div>
					</c:if>
					<c:if test="${userId != null && empId == null}">
						<div class="btn-container2">
							<a href="/reservationRequestForm?reservationNo=${reservationDetail.reservationNo}" id="booking" class="booking">예약</a>
						</div>
					</c:if>
				</div>
			</form>
		</div>
	</div>

	<!-- footer -->
	<%@include file="/includes/footer.jsp"%>

	<!-- script -->
	<!-- 서버 인증키 -->
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c12ebb063cb05a9fc037082cb8601ef1&libraries=services"></script> -->
	<!-- 로컬 인증키 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d724483fb639866457f6535349fcd24&libraries=services"></script>
	<script>
		/* Kakao Map */

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
		};

		// 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${reservationDetail.reservationPlaceAddress}', function(result, status) {

		// 정상적으로 검색이 완료됐으면
		if (status === kakao.maps.services.Status.OK) {

		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		// 결과값으로 받은 위치를 마커로 표시합니다
		var marker = new kakao.maps.Marker({
		map: map,
		position: coords
		});

		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(coords);
		}
		});
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	</script>

	<script src="/includes/js/jquery-3.3.1.min.js"></script>
	<script src="/includes/js/jquery.lettering.js"></script>
	<script src="/includes/js/jquery.sticky.js"></script>
	<script src="/includes/js/ScrollMagic.min.js"></script>
	<script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
	<script src="/includes/js/main.js"></script>
	<!-- map script -->
	<script src="/includes/js/kakaoMap.js"></script>
</body>
</html>