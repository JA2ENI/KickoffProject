<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Kick off: 매칭 등록</title>

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
                <h1 class="display-4 fw-bolder">매칭 등록</h1>
                <p class="lead fw-normal text-white-50 mb-0">열정 넘치게 벌어질 경기를 등록해보세요.</p>
            </div>
        </div>
    </div>

    <!-- Section -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form role="frm" id="frm" name="frm" action="/gameUpdate" method="POST">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
							<div class="checkout__input">
								<p>풋살장<span>*</span></p>
								<select id="placeName" name="placeName" onChange="selectPlaceName(this)">
									<option value="">예약한 풋살장 선택하기</option>
									<c:choose>
										<c:when test="${fn:length(placeInfo) > 0}">
											<c:forEach var="row" items="${placeInfo}">
												<option value="${row.reservationPlaceName}">${row.reservationPlaceName}</option>
											</c:forEach>
										</c:when>
									</c:choose>
								</select>
							</div>
							<div class="checkout__input">
                                <p>경기 형태<span>*</span></p>
                                <select id="inputGameStyle" name="gameStyle" onChange="selectgameStyle(this)">
                                    <option value="">경기형태 선택하기</option>
                                    <option value="4 vs 4" <c:if test="${insertGame.gameStyle == '4 vs 4'}">selected</c:if>>4 vs 4</option>
                                    <option value="5 vs 5" <c:if test="${insertGame.gameStyle == '5 vs 5'}">selected</c:if>>5 vs 5</option>
                                    <option value="6 vs 6" <c:if test="${insertGame.gameStyle == '6 vs 6'}">selected</c:if>>6 vs 6</option>
                                </select>
                            </div>
                            <div class="checkout__input">
                        		<p>경기 날짜<span>*</span></p>
                       			<input id="setDate" name="gameDate" value="${insertGame.gameDate}" onChange="getDate()" />
                   			</div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>시작 시간<span>*</span></p>
                                        <select id="openTime" name="gameStartTime" value="${insertGame.gameStartTime}" onChange="getStartTime(this)">
                                        	<option value="">시작 시간 선택</option>
                                        	<c:forEach var="i" begin="1" end="24">
	                                        	<c:choose>
	                                        		<c:when test="${i lt 10}">
	                                        			<option value="0${i}">0${i}:00</option>
	                                        		</c:when>
	                                        		<c:otherwise>
	                                        			<option value="${i}">${i}:00</option>
	                                        		</c:otherwise>
	                                        	</c:choose>
                                        	</c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>종료 시간<span>*</span></p>
                                        <select id="closeTime" name="gameEndTime" onChange="getEndTime(this)">
                                        	<option value="">종료 시간 선택</option>
                                        	<c:forEach var="i" begin="1" end="24">
	                                        	<c:choose>
	                                        		<c:when test="${i lt 10}">
	                                        			<option value="0${i}">0${i}:00</option>
	                                        		</c:when>
	                                        		<c:otherwise>
	                                        			<option value="${i}">${i}:00</option>
	                                        		</c:otherwise>
	                                        	</c:choose>
                                        	</c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>성별<span>*</span></p>
                                <label>
                                	<input type="radio" name="gender" value="female" onclick='getGender(event)' <c:if test="${insertGame.gameGender eq 'female'}">checked="checked"</c:if>/>&nbsp여성
                                </label>
                                <label>
                                	<input type="radio" name="gender" value="male" onclick='getGender(event)' <c:if test="${insertGame.gameGender eq 'male'}">checked="checked"</c:if>/>&nbsp남성
                                </label>
                                <label>
                                	<input type="radio" name="gender" value="mix" onclick='getGender(event)' <c:if test="${insertGame.gameGender eq 'mix'}">checked="checked"</c:if>/>&nbsp혼성
                                </label>
                            </div>
                            
                            <div class="checkout__input">
                                <p>팀 정보<span>*</span></p>
                                <input type="text" class="teamName" id="teamName" name="teamName" value="${teamInfo.teamName}" readonly>
                            </div>
                            <div class="checkout__input">
                                <p>매칭 상태<span>*</span></p>
                                <label>
                                    <input type="radio" name="gameStatus" value="매칭 중" onclick='getGameStatus(event)' <c:if test="${insertGame.gameStatus eq '매칭 중'}">checked="checked"</c:if>/>&nbsp매칭 중
                                </label>
                                <label>
                                    <input type="radio" name="gameStatus" value="매칭 대기" onclick='getGameStatus(event)'<c:if test="${insertGame.gameStatus eq '매칭 대기'}">checked="checked"</c:if>/>&nbsp매칭 대기
                                </label>
                            </div>
                            <div class="checkout__input">
								<p>기타사항</p>
                               	<textarea class="etc" name="Comment">${insertGame.gameOther}</textarea>
                            </div>
                        </div>
                        
                        <!-- Check List -->
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>등록하기</h4>
								<ul>
									<li>풋살장<span id="selectPlaceName"></span></li>
                                    <li>경기 형태<span id="gameStyle"></span></li>
									<li>경기 날짜<span id="gameDate"></span></li>
									<li>시작 시간<span id="startTime"></span></li>
									<li>종료 시간<span id="endTime"></span></li>
									<li>성별<span id="gender"></span></li>
									<li>팀 정보<span>${teamInfo.teamName}</span></li>
									<li>매칭 상태<span id="status"></span></li>
								</ul>
                                <input type="hidden" name="reservationNo" value="${insertGame.gameSeqno}" />
                                <%-- Button --%>
                                <input type="submit" id="insert" class="site-btn-insert" value="등록"/>
								<a href="/game" id="cancle" class="site-btn-cancle">취소</a>
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
	<script src="/team/js/common.js"></script>
	
    <script src="/includes/js/jquery.lettering.js"></script>
    <script src="/includes/js/jquery.sticky.js"></script>
    <script src="/includes/js/ScrollMagic.min.js"></script>
    <script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
    <script src="/includes/js/main.js"></script>
	
</body>
		
</html>