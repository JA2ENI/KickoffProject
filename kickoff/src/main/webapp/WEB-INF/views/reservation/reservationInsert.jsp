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
    <title>Kick off: 풋살장 예약 등록</title>

    <!-- Google Font -->
    <link href="https://fonts.google.com/noto/specimen/Noto+Sans+KR?subset=korean&noto.script=Kore" rel="stylesheet">
	
    <!-- Css Styles -->
    <link rel="stylesheet" href="/reservation/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/rservation/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/includes/css/style.css">
    <link rel="stylesheet" href="/reservation/css/style.css" type="text/css">
    
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
                <h1 class="display-4 fw-bolder">풋살장 예약 등록</h1>
                <p class="lead fw-normal text-white-50 mb-0">멋진 경기가 펼쳐 질 풋살장예약 등록하세요.</p>
            </div>
        </div>
    </div>

    <!-- Section -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form role="form" id="frmSubmit" name="frmSubmit" action="" method="POST">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
							<div class="checkout__input">
                                <p>풋살장<span>*</span></p>
                                <input type="text" class="inputPlaceName" id="inputPlaceName" name="reservationPlaceName" value="${placeInfo.placeName}" readonly/>
                           	</div>
                          	<div class="checkout__input">
                                <p>코트<span>*</span></p>
                                <select id="courtName" name="reservationCourtName" onChange="selectCourt(this)">
                                	<option value="">코트 선택하기</option>
                                	<option value="A코트">A코트</option>
                                	<option value="B코트">B코트</option>
                                	<option value="C코트">C코트</option>
                                	<option value="D코트">D코트</option>
                                	<option value="E코트">E코트</option>
                                </select>
                            </div>
                           	<div class="checkout__input">
                                <p>위치<span>*</span></p>
                                <input type="text" class="inputAddress" id="inputAddress" name="reservationPlaceAddress" value="${placeInfo.placeAddress}" readonly>
                            </div>
                            <div class="checkout__input">
                                <p>형태<span>*</span></p>
                                <label>
                                	<input type="radio" name="reservationCourtForm" value="indoor" onclick='getPlaceForm(event)' />&nbsp실내
                                </label>
                                <label>
                                	<input type="radio" name="reservationCourtForm" value="outdoor" onclick='getPlaceForm(event)' />&nbsp실외
                                </label>
                            </div>
                            <div class="checkout__input">
                                <p>추천 경기<span>*</span></p>
                                <select id="inputHeadcount" name="reservationHeadcount" onChange="selectHeadcount(this)">
                                    <option value="">추천경기 선택하기</option>
                                    <option value="4 vs 4">4 vs 4</option>
                                    <option value="5 vs 5">5 vs 5</option>
                                    <option value="6 vs 6">6 vs 6</option>
                                </select>
                            </div>
                   			<div class="checkout__input">
                        		<p>예약 날짜<span>*</span></p>
                       			<input id="setDate" name="reservationDate" onChange="getDate()" />
                   			</div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>시작 시간<span>*</span></p>
                                        <select id="openTime" name="reservationStartTime" onChange="getStartTime(this)">
                                        	<option value="">시작 시간 선택</option>
                                        	<c:forEach var="i" begin="1" end="24">
	                                        	<c:choose>
	                                        		<c:when test="${i lt 10}">
	                                        			<option value="0${i}:00">0${i}:00</option>
	                                        		</c:when>
	                                        		<c:otherwise>
	                                        			<option value="${i}:00">${i}:00</option>
	                                        		</c:otherwise>
	                                        	</c:choose>
                                        	</c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>종료 시간<span>*</span></p>
                                        <select id="closeTime" name="reservationEndTime" onChange="getEndTime(this)">
                                        	<option value="">종료 시간 선택</option>
                                        	<c:forEach var="i" begin="1" end="24">
	                                        	<c:choose>
	                                        		<c:when test="${i lt 10}">
	                                        			<option value="0${i}:00">0${i}:00</option>
	                                        		</c:when>
	                                        		<c:otherwise>
	                                        			<option value="${i}:00">${i}:00</option>
	                                        		</c:otherwise>
	                                        	</c:choose>
                                        	</c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>예약 상태<span>*</span></p>
                                <label>
                                	<input type="radio" onclick='getStatus(event)' checked/>&nbsp예약대기
                                </label>
                                <label>
                                	<input type="radio" disabled/>&nbsp예약완료
                                </label>
                            </div>
                            <div class="checkout__input">
                                <p>대관비<span>*</span></p>
                                <input type="number" class="inputPrice" id="inputPrice" name="reservationPrice" onChange="getPrice()" placeholder="ex) 50000">
                            </div>
                            <div class="checkout__input">
								<p>기타사항</p>
                               	<textarea class="etc" name="reservationComment"></textarea>
                            </div>
                        </div>
                        
                        <!-- Check List -->
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>Check List</h4>
								<div class="checkout__order__products">
									Title<span>Content</span>
								</div>
								<ul>
									<li>풋살장<span>${placeInfo.placeName}</span></li>
									<li>코트<span id="court"></span></li>
									<li>위치<span>${placeInfo.placeAddress}</span></li>
									<li>형태<span id="placeForm"></span></li>
                                    <li>추천 경기<span id="headcount"></span></li>
									<li>예약 날짜<span id="date"></span></li>
									<li>시작 시간<span id="startTime"></span></li>
									<li>종료 시간<span id="endTime"></span></li>
									<li>예약 상태<span id="status">예약대기</span></li>
									<li>대관비<span id="price"></span></li>
								</ul>
                                <input type="hidden" name="empId" value="${empId}" />
                                <input type="hidden" name="imgName" value="${placeInfo.imgName}" />
                                <input type="hidden" name="imgPath" value="${placeInfo.imgPath}" />
                                <input type="hidden" name="placeId" value="${placeInfo.placeId}" />
                                <input type="hidden" name="reservationPlaceSize" value="${placeInfo.placeSize}" />
                                <input type="hidden" name="reservationPlaceGround" value="${placeInfo.placeGround}" />
                                <input type="hidden" name="reservationPlaceParking" value="${placeInfo.placeParking}" />

								<input type="button" id="insert" class="site-btn-insert" onclick="validCheck()" value="등록"/>
                                <a href="/reservation" id="cancle" class="site-btn-cancle">취소</a>
							</div>
						</div>
					</div>
                </form>
            </div>
        </div>
    </section>

    <%@include file="/includes/include-body.jspf"%>
    <!-- Footer -->
	<%@include file="/includes/footer.jsp"%>

	<script type="text/javascript">
		/* calendar */
		$('#setDate').datepicker({
			format: "yyyy-mm-dd",
		    uiLibrary: 'bootstrap4',
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

    <script src="/main/js/vendor/jquery.lettering.js"></script>
    <script src="/main/js/vendor/jquery.sticky.js"></script>
    <script src="/main/js/vendor/ScrollMagic.min.js"></script>
    <script src="/main/js/vendor/scrollmagic.animation.gsap.min.js"></script>
    <script src="/main/js/main.js"></script>

</body>
		
</html>