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
    <title>Kick off: 풋살장 예약 수정</title>

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
                <h1 class="display-4 fw-bolder">풋살장 예약 수정</h1>
                <p class="lead fw-normal text-white-50 mb-0">멋진 경기가 펼쳐 질 풋살장 예약 수정하세요.</p>
            </div>
        </div>
    </div>
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form role="frm" id="frm" name="frm" action="" method="POST">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
							<div class="checkout__input">
                               <p>풋살장<span>*</span></p>
                               <input type="text" name="reservationPlaceName" value="${rUpdate.RESERVATION_PLACE_NAME}" readonly>
                           	</div>
                          	<div class="checkout__input">
                                <p>코트<span>*</span></p>
                                <select id="courtName" name="reservationCourtName" onChange="selectCourt(this)">
                                	<option value="">코트 선택하기</option>
                                    <option value="A코트" <c:if test="${rUpdate.RESERVATION_COURT_NAME == 'A코트'}">selected</c:if>>A코트</option>
                                	<option value="B코트" <c:if test="${rUpdate.RESERVATION_COURT_NAME == 'B코트'}">selected</c:if>>B코트</option>
                                	<option value="C코트" <c:if test="${rUpdate.RESERVATION_COURT_NAME == 'C코트'}">selected</c:if>>C코트</option>
                                	<option value="D코트" <c:if test="${rUpdate.RESERVATION_COURT_NAME == 'D코트'}">selected</c:if>>D코트</option>
                                	<option value="E코트" <c:if test="${rUpdate.RESERVATION_COURT_NAME == 'E코트'}">selected</c:if>>E코트</option>
                                </select>
                            </div>
                           	<div class="checkout__input">
                                <p>위치<span>*</span></p>
                                <input type="text" name="reservationPlaceAddress" value="${rUpdate.RESERVATION_PLACE_ADDRESS}" readonly>
                            </div>
                            <div class="checkout__input">
                                <p>형태<span>*</span></p>
                                <label>
                                	<input type="radio" name="reservationCourtForm" value="indoor" onclick='getPlaceForm(event)' <c:if test="${rUpdate.RESERVATION_COURT_FORM eq 'indoor'}">checked="checked"</c:if>/>&nbsp실내
                                </label>
                                <label>
                                	<input type="radio" name="reservationCourtForm" value="outdoor" onclick='getPlaceForm(event)' <c:if test="${rUpdate.RESERVATION_COURT_FORM eq 'outdoor'}">checked="checked"</c:if>/>&nbsp실외
                                </label>
                            </div>
                            <div class="checkout__input">
                                <p>추천 경기<span>*</span></p>
                                <select id="inputHeadcount" name="reservationHeadcount" onChange="selectHeadcount(this)">
                                    <option value="">추천경기 선택하기</option>
                                    <option value="4 vs 4" <c:if test="${rUpdate.RESERVATION_HEADCOUNT == '4 vs 4'}">selected</c:if>>4 vs 4</option>
                                    <option value="5 vs 5" <c:if test="${rUpdate.RESERVATION_HEADCOUNT == '5 vs 5'}">selected</c:if>>5 vs 5</option>
                                    <option value="6 vs 6" <c:if test="${rUpdate.RESERVATION_HEADCOUNT == '6 vs 6'}">selected</c:if>>6 vs 6</option>
                                </select>
                            </div>
                   			<div class="checkout__input">
                        		<p>예약 날짜<span>*</span></p>
                       			<input id="setDate" name="reservationDate" value="${rUpdate.RESERVATION_DATE}" onChange="getDate()" />
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
                                    <input type="radio" name="reservationStatus" value="예약 중" onclick='getStatus(event)' <c:if test="${rUpdate.RESERVATION_STATUS eq '예약 중'}">checked="checked"</c:if>/>&nbsp예약 중
                                </label>
                                <label>
                                    <input type="radio" name="reservationStatus" value="예약 완료" onclick='getStatus(event)'<c:if test="${rUpdate.RESERVATION_STATUS eq '예약 완료'}">checked="checked"</c:if>/>&nbsp예약 완료
                                </label>
                            </div>
                            <div class="checkout__input">
                                <p>대관비<span>*</span></p>
                                <input type="number" class="inputPrice" id="inputPrice" name="reservationPrice" value="${rUpdate.RESERVATION_PRICE}" onChange="getPrice()" placeholder="ex) 50000">
                            </div>
                            <div class="checkout__input">
								<p>기타사항</p>
                               	<textarea class="etc" name="reservationComment">${rUpdate.RESERVATION_COMMENT}</textarea>
                            </div>
                        </div>
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>Check List</h4>
								<div class="checkout__order__products">
									Title<span>Content</span>
								</div>
								<ul>
									<li>풋살장<span>${rUpdate.RESERVATION_PLACE_NAME}</span></li>
									<li>코트<span id="court">${rUpdate.RESERVATION_COURT_NAME}</span></li>
									<li>위치<span>${rUpdate.RESERVATION_PLACE_ADDRESS}</span></li>
									<li>형태<span id="placeForm">${rUpdate.RESERVATION_COURT_FORM}</span></li>
                                    <li>추천 경기<span id="headcount">${rUpdate.RESERVATION_HEADCOUNT}</span></li>
									<li>예약 날짜<span id="date">${rUpdate.RESERVATION_DATE}</span></li>
									<li>시작 시간<span id="startTime">${rUpdate.RESERVATION_START_TIME}</span></li>
									<li>종료 시간<span id="endTime">${rUpdate.RESERVATION_END_TIME}</span></li>
									<li>예약 상태<span id="status">${rUpdate.RESERVATION_STATUS}</span></li>
									<li>대관비<span id="price">${rUpdate.RESERVATION_PRICE}</span></li>
								</ul>
                                <input type="hidden" name="reservationNo" value="${rUpdate.RESERVATION_NO}" />
                                <input type="button" id="insert" class="site-btn-insert" onclick="updateCheck()" value="등록"/>
								<a href="/reservationDetail?reservationNo=${rUpdate.RESERVATION_NO}" id="cancle" class="site-btn-cancle">취소</a>
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
	<script src="/reservation/js/common.js"></script>
    <script src="/reservation/js/validation.js"></script>
	
    <script src="/includes/js/jquery.lettering.js"></script>
    <script src="/includes/js/jquery.sticky.js"></script>
    <script src="/includes/js/ScrollMagic.min.js"></script>
    <script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
    <script src="/includes/js/main.js"></script>
	
</body>
		
</html>