<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Kick Off: 풋살장 조회</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	
    <!-- Bootstrap CSS-->
	<link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

	<!-- Vendor CSS-->
	<link href="/emp/vendor/select2/select2.min.css" rel="stylesheet" media="all">
	<link href="/emp/vendor/mdi-font/material-design-iconic-font.min.css" rel="stylesheet" media="all">
	<!--[if lte IE 8]><script src="/emp/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="/emp/css/main.css" />
	<link rel="stylesheet" href="/emp/css/empFutsal/fix.css" />
	<!--[if lte IE 9]><link rel="stylesheet" href="/emp/css/ie9.css" /><![endif]-->
	<!--[if lte IE 8]><link rel="stylesheet" href="/emp/css/ie8.css" /><![endif]-->
	
	
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
									<strong>내 풋살장 조회</strong>
								</header>
							
							<!-- Begin Page Content -->
							<c:choose>
							<c:when test="${fn:length(empFutsalList) > 0}">
							<c:forEach var="row" items="${empFutsalList}" begin="0" end="${listSize}" step="1" varStatus="num">
			                	<section>
				                	<div class="container-fluid">				                 		
										<div class="container">
											<div class="facility-content">
												<div class="image-wrap">
													<img class="image" src="${row.imgPath}${row.imgName}" />
												</div>
												<div class="facility-wrap">
													<h2>${row.placeName}</h2>
													<h3>${row.placeAddress}</h3>
													<p class="info">
														규격<span>${row.placeSize}</span>
													</p>
													<p class="info">
														풋살장 형태<span>${row.placeForm}</span>
													</p>
													<p class="info">
														바닥형태<span>${row.placeGround}</span>
													</p>
													<p class="info">
														대여시간<span>${row.placeTime}</span>
													</p>
													<p class="info">
														개방일수<span>${row.placeOpen}</span>
													</p>
													<p class="info">
														주차장<span>${row.placeParking}</span>
													</p>
													<p class="info">
														가격<span>${row.placePrice}</span>
													</p>
													<p class="info">
														조명 유무<span class="status">${row.placeLight}</span>
													</p>
												</div>
											</div>
										</div>
										<div class="container">
											<div class="map-wrap">
												<h4 class="title">
													구장위치<span>*</span>
												</h4>
											<div class="map-container">
												<div id="map"></div>
												<div class="title-wrap be-default mb-3">
													<p>${empFutsalFix.placeAddress}</p>
												</div>
											</div>
											</div>
										</div>
										<!-- button -->
										<div class="btn-container">
											<a href="/empFutsalFupdate?placeId=${empFutsalList.get(num.index).placeId}" id="cancle" class="cancle">수정하기</a>
										</div>
									
									</div>
									</section>
									</c:forEach>
								</c:when>
								</c:choose>
								</div>
							</div>								
			                <!-- /.container-fluid -->
								


				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="/empReservation">예약관리</a></li>
										<li><a href="/myBoard">내 게시글</a></li>
										<li><a href="/fixInfoCheck">회원 정보 수정</a></li>
										<li>
											<!-- opener 에 원래 active 열고 닫게 할 수 있어야 함 -->
											<span class="opener active">풋살장 관리</span>
											<ul>
												<li><a href="/empFutsalForm">풋살장 등록</a></li>
												<li><a href="/empFutsalFix">풋살장 조회</a></li>
											</ul>
										</li>										
									</ul>
								</nav>

						</div>
					</div>


		<!-- Scripts -->
			<script src="/emp/js/jquery.min.js"></script>
			<script src="/emp/js/skel.min.js"></script>
			<script src="/emp/js/util.js"></script>
			<!--[if lte IE 8]><script src="/emp/js/ie/respond.min.js"></script><![endif]-->
			<script src="/emp/js/main.js"></script>
			
	
	<!-- script -->
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c12ebb063cb05a9fc037082cb8601ef1&libraries=services"></script> -->
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
		geocoder.addressSearch('${address}', function(result, status) {

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
	
			
    <!-- Jquery JS-->
	<script src="/myPage/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script src="/myPage/vendor/bootstrap-4.1/popper.min.js"></script>
	<script src="/myPage/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script src="/myPage/vendor/select2/select2.min.js"></script>
	
	</body>
</html>