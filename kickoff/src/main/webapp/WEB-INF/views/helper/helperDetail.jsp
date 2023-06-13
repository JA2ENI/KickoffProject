<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Kick Off: 용병 상세보기</title>
<!-- include할 문서에 스타일, js -->
<link rel="stylesheet"
	href="/includes/css/style.css">
	<link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">

<script src="/includes/js/jquery-3.3.1.min.js"></script>

<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>


<script src="/includes/js/ScrollMagic.min.js"></script>
<script
	src="/includes/js/scrollmagic.animation.gsap.min.js"></script>


<script src="/includes/js/main.js"></script>

<!-- 여기까지 복붙하기 -->

<link rel="stylesheet"
	href="/board/css/boardDetail.css" />

<style>
	.kakao {
		background: #B1D7B4;
		padding: 5px;
		width: 540px;
		margin-left: 13px;
		box-shadow: 0 2px 5px rgba(127, 183, 126, .75);
		border-radius: 4px;
	}
</style>

<script>
	${userScript}
</script>

</head>
<body>
	<%@include file="/includes/header.jsp"%>
	<!-- Header -->
	<div class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">${content.helperPlaceName}</h1>
				<p class="lead fw-normal text-white-50 mb-0">${content.userId}</p>
			</div>
		</div>
	</div>
	<form role="form" method="post">
		<div class="container">
			<div class="table-responsive">
				<table class="board_detail">
					<colgroup>
						<col width="20%" />
						<col width="35%" />
						<col width="15%" />
						<col width="35%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">글 번호</th>
							<td>${content.helperSeqno}</td>
							<th scope="row">모집 인원 수</th>
							<td>${content.helperWant}</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td>${content.userId}</td>
							<th scope="row">경기 날짜</th>
							<td>${content.helperTime}</td>
						</tr>
						<tr>
							<td colspan="4" class="view_text">
							포지션: ${content.helperPosition}<br />
							경기형식: ${content.helperMatch}<br />
								모집성별: ${content.helperGender}<br />
								모집 인원 수: ${content.helperWant}<br />
								모집 팀 레벨: ${content.helperTeamLevel}<br />
								풋살장 이름: ${content.helperPlaceName}<br />
								참가비: ${content.helperPrice}<br />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class = "kakao">
			<div id="map" style="width:500px;height:350px;margin-left: 15px;"></div>
		</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d724483fb639866457f6535349fcd24&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					mapOption = {
						center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level: 3 // 지도의 확대 레벨
					};

			// 지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC); 
			

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${content.helperAddress}', function(result, status) {

				// 정상적으로 검색이 완료됐으면
				if (status === kakao.maps.services.Status.OK) {

					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					var yResult = result[0].y;
					var xResult = result[0].x;

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords
					});

					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new kakao.maps.InfoWindow({
						content: '<div style="width:150px;text-align:center;padding:6px 0;">${content.helperPlaceName}<br />' +
						'<a href="https://map.kakao.com/link/to/${content.helperPlaceName}' + ',' + yResult + ',' + xResult + '"' + 'style="color:blue" target="_blank">길찾기</a></div>'
					});
					infowindow.open(map, marker);

					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
			});
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		</script>
		<button type = "button" class = "btn1" id = "btn1" onclick="location.href='/helperMessage';">신청</button>
		<button type = "button" class = "btn2" id = "btn2" onclick="location.href='/helperList';">돌아가기</button>
	</form>
</body>
</html>

