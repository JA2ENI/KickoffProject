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
    <title>Kick off: 풋살팀 수정</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel = "stylesheet" href = "/kickoff/resource/main/css/vendor/icomoon/style.css">
    <link rel="stylesheet" href="/kickoff/resource/teamInsert/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/kickoff/resource/teamInsert/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/kickoff/resource/teamInsert/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/kickoff/resource/teamInsert/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/kickoff/resource/teamInsert/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/kickoff/resource/teamInsert/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/kickoff/resource/teamInsert/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/kickoff/resource/team/css/style.css" type="text/css">
    <link rel="stylesheet" href="/kickoff/resource/includes/css/style.css">
</head>

<body>
 <div class="header-container">
      <%@include file="/includes/header.jsp"%>
</div>

	<div class="icons-wrap text-md-right"></div>

	<!-- Header -->
    <div class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">풋살팀 수정</h1>
                <p class="lead fw-normal text-white-50 mb-0">팀 등록을 통해 새로운 팀원들을 만나 승리를 경험해보세요.</p>
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
                               <p>풋살팀 이름<span>*</span></p>
                               <input type="text" value="여기에 '풋살팀 이름' 가져오기 (입력 비활성화)" readonly>
                               <!-- readonly: 입력 필드 비활성화되지만 form으로 전송 가능 -->
                           	</div>
                           	<div class="checkout__input">
                               <p>모집 인원<span>*</span></p>
                               <input type="text" value="" id="team-number" onChange="selectNumber(this)">
                           	</div>
                          	<div class="checkout__input">
                                <p>풋살팀 성별<span>*</span></p>
                                <select id="team-gender" onChange="selectGender(this)">
                                	<option value="">성별 선택하기</option>
                                	<option value="A">남성</option>
                                	<option value="B">여성</option>
                                	<option value="C">혼성</option>
                                </select>
                            </div>
                           	<div class="checkout__input">
                                <p>풋살팀 소속지역<span>*</span></p>
                                <select id="team-local" onChange="selectTeam(this)">
                                	<option>서울</option>
                                   <option>경기</option>
                                   <option>인천</option>
                                   <option>강원</option>
                                   <option>대전</option>
                                   <option>충남/세종</option>
                                   <option>충북</option>
                                   <option>대구</option>
                                   <option>경북</option>
                                   <option>부산</option>
                                   <option>울산</option>
                                   <option>경남</option>
                                   <option>광주</option>
                                   <option>전남</option>
                                   <option>전북</option>
                                   <option>제주</option>
                                </select>
                            </div> 
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>모집 시작일<span>*</span></p>
                                        	<input type="date" id="open-date" name="open-date" onChange="getStartDate(this)">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>모집 종료일<span>*</span></p>
                                        	<input type="date" id="close-date" name="close-date" onChange="getEndDate(this)">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>팀장 포지션<span>*</span></p>
                                <select id="master-position" onChange="selectGender(this)">
                                	<option>PIVO(피보):공격수</option>
                                   <option>ALA(아라):미드필더</option>
                                   <option>FIXO(픽소):수비수</option>
                                   <option>GOLEIRO(골레이로):골키퍼</option>
                                </select>
                            </div>
                             <div class="checkout__input">
                                <p>모집 상태<span>*</span></p>
                                <label>
                                	<input type="radio" name="placeForm" value="indoor" onclick='getPlaceForm(event)' checked/>&nbsp모집중
                                </label>
                                <label>
                                	<input type="radio" name="placeForm" value="outdoor" onclick='getPlaceForm(event)' />&nbsp모집완료
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
									<li>풋살팀 이름<span>이름이름</span></li>
									<li>모집 인원<span id="tema-number"></span></li>
									<li>풋살팀 성별<span></span></li>
									<li>풋살팀 소속 지역<span id="team-local"></span></li>
									<li>모집 시작일<span id="open-date"></span></li>
									<li>모집 종료일<span id="close-date"></span></li>
									<li>팀장 포지션<span id="master-position"></span></li>
									<li>모집 상태<span></span></li>
								</ul>
								<a href="#" onclick="location.href='/TeamCommit/viewex/team/team.jsp';" id="insert" class="site-btn-insert">수정</a>
								<a href="#" onclick="location.href='/TeamCommit/viewex/team/team.jsp';" id="cancel" class="site-btn-cancle">취소</a>
							</div>
						</div>
					</div>
                </form>
            </div>
        </div>
    </section>

  
    <!-- Js Plugins -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/kickoff/resource/reservation/js/jquery-3.3.1.min.js"></script>
    <script src="/kickoff/resource/reservation/js/bootstrap.min.js"></script>
    <script src="/kickoff/resource/reservation/js/jquery.nice-select.min.js"></script>
    <script src="/kickoff/resource/reservation/js/jquery-ui.min.js"></script>
    <script src="/kickoff/resource/reservation/js/jquery.slicknav.js"></script>
    <script src="/kickoff/resource/reservation/js/mixitup.min.js"></script>
    <script src="/kickoff/resource/reservation/js/owl.carousel.min.js"></script>
    <script src="/kickoff/resource/reservation/js/main.js"></script>
	<script src="/kickoff/resource/team/js/common.js"></script>
	
    <script src="/kickoff/resource/main/js/vendor/jquery.lettering.js"></script>
    <script src="/kickoff/resource/main/js/vendor/jquery.sticky.js"></script>
    <script src="/kickoff/resource/main/js/vendor/ScrollMagic.min.js"></script>
    <script src="/kickoff/resource/main/js/vendor/scrollmagic.animation.gsap.min.js"></script>
    <script src="/kickoff/resource/team/js/main.js"></script>
    
     <script src="/kickoff/resource/includes/js/jquery.lettering.js"></script>
    <script src="/kickoff/resource/includes/js/jquery.sticky.js"></script>


    <script src="/kickoff/resource/includes/js/ScrollMagic.min.js"></script>
    <script src="/kickoff/resource/includes/js/scrollmagic.animation.gsap.min.js"></script>


    <script src="/kickoff/resource/includes/js/main.js"></script>
  
	
</body>
		
</html>