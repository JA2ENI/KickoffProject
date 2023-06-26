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
    <title>Kick off: 풋살팀 등록</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">
    <link rel="stylesheet" href="/teamInsert/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/teamInsert/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/teamInsert/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/teamInsert/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/teamInsert/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/teamInsert/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/teamInsert/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/team/css/teamCreate.css" type="text/css">
    <link rel="stylesheet" href="/team/css/style.css" type="text/css">
    <link rel="stylesheet" href="/includes/css/style.css">
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
            <h1 class="display-4 fw-bolder">풋살팀 모집 글 등록</h1>
            <p class="lead fw-normal text-white-50 mb-0">팀 등록을 통해 새로운 팀원들을 만나 승리를 경험해보세요.</p>
        </div>
    </div>
</div>

<section>
		
			<div class="container">
				<article class="article-container">
					<div class="item-wrap">
						<div class="inner-btn">
							<p>팀 이름</p>
							<input type="text" class="text-box" value="${teamInfo.teamName}" />
						</div>
						<div class="text-wrap all">
							<p>팀 모집 인원</p>
							<input type="text" class="text-box" placeholder="숫자만 입력해주세요." />
						</div>
						<div class="select-age all">
							<p class="age-title">주요 연령대</p>
							<input type="text" class="text-box" value="${teamInfo.teamAge}"/>
						</div>
						<div class="select-gender">
							<p>팀 성별</p>
							<input type="text" class="text-box" value="${teamInfo.teamGender}"/>
						</div>
						<div class="select-level all">
							<p>팀 레벨</p>
							<input type="text" class="text-box" value="${teamInfo.teamLevel}"/>
						</div>
						<div class="area-wrap all">
							<p>주 활동지역</p>
							<input type="text" class="text-box" value="${teamInfo.teamLocal}"/>
						</div>
					</div>
				</article>
				<article class="article-container">
					<div class="item-wrap">
						<div class="date-container">
							<div class="date-wrap">
								<div class="day-wrap all">
									<p>주 이용요일</p>
									<input type="text" class="text-box2" value="${teamInfo.teamDay}"/>
								</div>
								<div class="time-wrap all">
									<p>주 이용시간</p>
									<input type="text" class="text-box2" value="${teamInfo.teamTime}"/>
								</div>
							</div>
						</div>
							<div class="start-date">
                                <div class="checkout__input">
                                    <p>모집 시작일</p>
                                    <input type="date" name="teamStartDate" onChange="getStartDate(this)">
                                </div>
                        	</div>
                            <div class="end-date">
                                <div class="checkout__input">
                                    <p>모집 종료일</p>
                                    <input type="date" name="teamEndDate" onChange="getEndDate(this)">
                                </div>
                            </div>
                            <div class="text-wrap all">
								<p>기타사항</p>
	                            <textarea class="etc" name="teamOther" ></textarea>
							</div>
                            <div class="checkout__input">
                                <p>모집 상태</p>
                                <label>
                                	<input type="radio" onclick='getStatus(event)' checked/>&nbsp모집 중
                                </label>
                                <label>
                                	<input type="radio" disabled/>&nbsp모집 완료
                                </label>
                            </div>
						<div class="btn-wrap">
							<button type="submit" class="create" onclick="javascript:alert('test!');">팀 생성하기</button>
						</div>
					</div>
				</article>
			</div>
	</section>

<!-- Footer -->
<%@include file="/includes/footer.jsp"%>


<!-- Js Plugins -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/reservation/js/jquery-3.3.1.min.js"></script>
<script src="/reservation/js/bootstrap.min.js"></script>
<script src="/reservation/js/jquery.nice-select.min.js"></script>
<script src="/reservation/js/jquery-ui.min.js"></script>
<script src="/reservation/js/jquery.slicknav.js"></script>
<script src="/reservation/js/mixitup.min.js"></script>
<script src="/reservation/js/owl.carousel.min.js"></script>
<script src="/reservation/js/main.js"></script>
<script src="/team/js/common.js"></script>

<script src="/main/js/vendor/jquery.lettering.js"></script>
<script src="/main/js/vendor/jquery.sticky.js"></script>
<script src="/main/js/vendor/ScrollMagic.min.js"></script>
<script src="/main/js/vendor/scrollmagic.animation.gsap.min.js"></script>
<script src="/team/js/main.js"></script>

<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>


<script src="/includes/js/ScrollMagic.min.js"></script>
<script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>


<script src="/includes/js/main.js"></script>


</body>

</html>