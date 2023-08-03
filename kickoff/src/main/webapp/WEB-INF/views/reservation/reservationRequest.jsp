<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Kick off: 풋살장 예약 신청</title>

    <!-- Google Font -->
    <link href="https://fonts.google.com/noto/specimen/Noto+Sans+KR?subset=korean&noto.script=Kore" rel="stylesheet">
	
    <!-- Css Styles -->
    <link rel="stylesheet" href="/reservation/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/styles.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/style.css" type="text/css">
    <link rel="stylesheet" href="/includes/css/style.css">
    
    <!-- calendar -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />    
	
 	<link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">
</head>

<body>
	<div class="header-container">
		<%@include file="/includes/header.jsp"%>
	</div>
	<!-- Header -->
     <div class="bg-dark py-5" style="background-color: #7fb77e !important;">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">풋살장 예약 신청</h1>
                <p class="lead fw-normal text-white-50 mb-0">멋진 경기가 펼쳐 질 풋살장 예약 신청하세요.</p>
            </div>
        </div>
    </div>
    <!-- Section -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form role="frm" id="frm" name="frm" action="" method="POST">
					<div class="row-request-container">
						<div class="col-lg-8-1 col-md-6">
							<div class="checkout__input__request">
								<p>풋살장<span>*</span></p>
								<input name="reservationPlaceName" value="${rRequest.RESERVATION_PLACE_NAME}" readonly>
							</div>
							<div class="checkout__input__request">
								<p>코트<span>*</span></p>
								<input name="reservationCourtName" value="${rRequest.RESERVATION_COURT_NAME}" readonly>
							</div>
							<div class="checkout__input__request">
								<p>신청자<span>*</span></p>
								<input type="text" name="reservationUserName" value="${rRequest.USER_NAME}" readonly>
							</div>
							<div class="checkout__input__request">
								<p>번호<span>*</span></p>
								<input type="text" name="reservationUserPhone" value="${rRequest.USER_PHONE_NUMBER}" readonly>
							</div>
							<div class="checkout__input__request">
								<p>예약날짜<span>*</span></p>
								<input type="text" name="reservationDate" value="${rRequest.RESERVATION_DATE}" readonly>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input__request">
										<p>시작 시간<span>*</span></p>
										<input type="text" name="reservationStartTime" value="${rRequest.RESERVATION_START_TIME}" readonly>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input__request">
										<p>종료 시간<span>*</span></p>
										<input type="text" name="reservationEndTime" value="${rRequest.RESERVATION_END_TIME}" readonly>
									</div>
								</div>
							</div>
							<div class="checkout__input__request">
								<p>경기<span>*</span></p>
								<input type="text" name="reservationHeadcount" value="${rRequest.RESERVATION_HEADCOUNT}" readonly>
							</div>
							<div class="checkout__input__request">
								<p>대관비<span>*</span></p>
								<input type="text" name="reservationPrice" value="${rRequest.RESERVATION_PRICE}" readonly>
							</div>
							<input type="hidden" name="userId" value="${rRequest.USER_ID}" />
							<input type="hidden" name="placeId" value="${rRequest.PLACE_ID}" />
							<input type="hidden" name="reservationPlaceAddress" value="${rRequest.RESERVATION_PLACE_ADDRESS}" />
							<input type="hidden" name="reservationOriginNo" value="${rRequest.RESERVATION_NO}" />
							<div class="btn-container">
								<input type="button" id="insert" class="request" onclick="requestCheck()" value="신청"/>
								<a href="/reservation" id="cancle" class="cancle">취소</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<%@include file="/includes/footer.jsp"%>
	
	<script type="text/javascript">
		/* calendar */
		$('#setDate').datepicker({
			format: "yyyy-mm-dd",
            uiLibrary: 'bootstrap4'
        });
	</script>
	
    <!-- Js Plugins -->
    <script src="/reservation/js/jquery-3.3.1.min.js"></script>
    <script src="/reservation/js/bootstrap.min.js"></script>
    <script src="/reservation/js/jquery.nice-select.min.js"></script>
    <script src="/reservation/js/jquery-ui.min.js"></script>
    <script src="/reservation/js/jquery.slicknav.js"></script>
    <script src="/reservation/js/mixitup.min.js"></script>
    <script src="/reservation/js/owl.carousel.min.js"></script>
    <script src="/reservation/js/main.js"></script>
    <script src="/reservation/js/validation.js"></script>
	<script src="/reservation/js/common.js"></script>

    <script src="/includes/js/jquery.lettering.js"></script>
    <script src="/includes/js/jquery.sticky.js"></script>
    <script src="/includes/js/ScrollMagic.min.js"></script>
    <script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
    <script src="/includes/js/main.js"></script>
	
</body>
		
</html>