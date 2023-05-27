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
    <title>Kick off: 매칭 수정</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">
	
    <!-- Css Styles -->
    <link rel="stylesheet" href="/reservation/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/reservation/css/style.css" type="text/css">
    <link rel="stylesheet" href="/includes/css/style.css">
    
    <!-- calendar -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />    
	
</head>

<body>
<%@include file="/includes/header.jsp"%>

	<div class="icons-wrap text-md-right"></div>

	<!-- Header -->
    <div class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">매칭 수정</h1>
                <p class="lead fw-normal text-white-50 mb-0">상대 팀과 겨루기 어쩌구</p>
            </div>
        </div>
    </div>

    <!-- Section -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form id="frm" name="frm" action="#" method="POST">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
							<div class="checkout__input">
                               <p>풋살장 선택<span>*</span></p>
                               <input type="text" value="여기에 '풋살장 이름' 가져오기 (입력 비활성화)" readonly>
                               <!-- readonly: 입력 필드 비활성화되지만 form으로 전송 가능 -->
                           	</div>
                          	<div class="checkout__input">
                                <p>경기 형태<span>*</span></p>
                                <select id="courtName" onChange="selectCourt(this)">
                                	<option value="">경기 형태 선택하기</option>
                                	<option value="A">3 v/s 3</option>
                                	<option value="B">5 v/s 5</option>
                                	<option value="C">6 v/s 6</option>
                                </select>
                            </div>
                           	<div class="checkout__input">
                                <p>팀 이름<span>*</span></p>
                                <input type="text" value="정보 가져오기 (입력 비활성화)" readonly>
                            </div>
                            <div class="checkout__input">
                                <p>팀 등급<span>*</span></p>
                                <input type="text" value="정보 가져오기 (입력 비활성화)" readonly>
                            </div>
                            <div class="checkout__input">
                                <p>성별<span>*</span></p>
                                <label>
                                	<input type="radio" name="placeForm" value="indoor" onclick='getPlaceForm(event)' />&nbsp남성
                                </label>
                                <label>
                                	<input type="radio" name="placeForm" value="outdoor" onclick='getPlaceForm(event)' />&nbsp여성
                                </label>
                                <label>
                                	<input type="radio" name="placeForm" value="outdoor" onclick='getPlaceForm(event)' />&nbsp혼성
                                </label>
                            </div>                   
                            <div class="row">
                            	<div class="col-lg-6">
                           			<div class="checkout__input">
                                		<p>매칭 일정<span>*</span></p>
                               			<input id="setStartDate" onChange="getStartDate()" />
                           			</div>
                           		</div>                           		
                          	</div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>매칭 시작 시간<span>*</span></p>
                                        <select id="openTime" name="openTime" onChange="getStartTime(this)">
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
                                        <p>매칭 종료 시간<span>*</span></p>
                                        <select id="closeTime" name="closeTime" onChange="getEndTime(this)">
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
                                <p>매칭 상태<span>*</span></p>
                                <label>
                                	<input type="radio" name="status" value="매칭 중" onclick='getStatus(event)' checked/>&nbsp매칭 중
                                </label>
                                <label>
                                	<input type="radio" disabled/>&nbsp마감 임박
                                </label>
                                <label>
                                	<input type="radio" disabled/>&nbsp매칭 완료
                                </label>
                            </div>
                            <div class="checkout__input">
								<p>기타사항</p>
                               	<textarea class="etc"></textarea>
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
									<li>풋살장<span>이름이름</span></li>
									<li>경기 형태<span id="court"></span></li>
									<li>팀 이름<span>주소주소</span></li>
									<li>팀 등급<span id="placeForm"></span></li>
									<li>매칭 일정<span id="startDate"></span></li>
									<li>매칭 종료<span id="endDate"></span></li>
									<li>시작 시간<span id="startTime"></span></li>
									<li>종료 시간<span id="endTime"></span></li>
									<li>매칭 상태<span id="status">매칭 중</span></li>									
								</ul>
								<a href="gameFix.jsp" id="insert" class="site-btn-insert">수정</a>
								<a href="gameDetail.jsp" id="cancle" class="site-btn-cancle">취소</a>
							</div>
						</div>
					</div>
                </form>
            </div>
        </div>
    </section>

	<script type="text/javascript">
		/* calendar */
		var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
		$('#setStartDate').datepicker({
			format: "yyyy-mm-dd",
		    uiLibrary: 'bootstrap4',
		    iconsLibrary: 'fontawesome',
		    minDate: today,
		    maxDate: function () {
		        return $('#endDate').val();
		    }
		});
		$('#setEndDate').datepicker({
			format: "yyyy-mm-dd",
		    uiLibrary: 'bootstrap4',
		    iconsLibrary: 'fontawesome',
		    minDate: function () {
		        return $('#startDate').val();
		    }
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
	
    <script src="/main/js/vendor/jquery.lettering.js"></script>
    <script src="/main/js/vendor/jquery.sticky.js"></script>
    <script src="/main/js/vendor/ScrollMagic.min.js"></script>
    <script src="/main/js/vendor/scrollmagic.animation.gsap.min.js"></script>
    <script src="/main/js/main.js"></script>
	
</body>
		
</html>