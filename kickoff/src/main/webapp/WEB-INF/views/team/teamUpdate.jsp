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
    <title>Kick off: 풋살팀 모집글 수정</title>

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
            <h1 class="display-4 fw-bolder">풋살팀 모집 글 수정</h1>
            <p class="lead fw-normal text-white-50 mb-0">모집글을 등록하여 새로운 팀원들을 만나 승리를 경험해보세요.</p>
        </div>
    </div>
</div>

<section>
		<form method="POST" action="/teamUpdateAction">
			<input type="hidden" id="teamSeqNo" name="teamSeqNo" value="${teamContents.teamSeqNo}"/>
			<div class="container">
				<article class="article-container">
					<div class="item-wrap">
						<div class="inner-btn">
							<p>팀 이름</p>
							<input type="text" class="text-box" name="teamName" value="${teamContents.teamName}" readonly/>
							<input type="hidden" class="text-box" name="leaderId" value="${userId}"/>
						</div>
						<div class="text-wrap all">
							<p>모집 인원</p>
							<input type="text" class="text-box" name="teamNumber" placeholder="숫자만 입력해주세요." value="${teamContents.teamNumber}" />
						</div>
						<div class="select-gender">
							<p>모집 성별</p>
							<select id="gender" class="text-box" name="teamGender">
								<option value="남성" id="male" <c:if test="${teamContents.teamGender eq '남성'}">selected</c:if>>남성</option>
								<option value="여성" id="female" <c:if test="${teamContents.teamGender eq '여성'}">selected</c:if>>여성</option>
								<option value="혼성" id="mix" <c:if test="${teamContents.teamGender eq '혼성'}">selected</c:if>>혼성</option>
							</select>
						</div>
						<div class="select-age all">
							<p class="age-title">모집 연령대</p>
							<select id="age" class="text-box" name="teamAge">
								<option value="10대" id="teenager" <c:if test="${teamContents.teamAge eq '10대'}">selected</c:if>>10대</option>
								<option value="20대" id="twenties" <c:if test="${teamContents.teamAge eq '20대'}">selected</c:if>>20대</option>
								<option value="30대" id="thirties" <c:if test="${teamContents.teamAge eq '30대'}">selected</c:if>>30대</option>
								<option value="40대" id="forties" <c:if test="${teamContents.teamAge eq '40대'}">selected</c:if>>40대</option>
								<option value="50대" id="fifties" <c:if test="${teamContents.teamAge eq '50대'}">selected</c:if>>50대</option>
								<option value="60대" id="sixties" <c:if test="${teamContents.teamAge eq '60대'}">selected</c:if>>60대</option>
							</select>
						</div>
						<div class="select-level all">
							<p>팀 레벨</p>
							<input type="text" class="text-box" name="teamLevel" value="${teamContents.teamLevel}" readonly/>
						</div>
						<div class="area-wrap all">
							<p>주 활동지역</p>
							<input type="text" class="text-box" name="teamLocal" value="${teamContents.teamLocal}" readonly/>
						</div>
						<div class="btn-wrap">
							<button type="reset" class="reset" onclick="location.href='/teamDetail?teamSeqNo=${teamContents.teamSeqNo}';">취소</button>
						</div>
					</div>
				</article>
				<article class="article-container">
					<div class="item-wrap">
						<div class="date-container">
							<div class="date-wrap">
								<div class="day-wrap all">
									<p>주 이용요일</p>
									<input type="text" class="text-box2" name="teamDay" value="${teamContents.teamDay}" readonly/>
								</div>
								<div class="time-wrap all">
									<p>주 이용시간</p>
									<input type="text" class="text-box2" name="teamTime" value="${teamContents.teamTime}" readonly/>
								</div>
							</div>
						</div>
							<div class="start-date">
                                <div class="checkout__input">
                                    <p>모집 시작일</p>
                                    <input type="date" name="teamStartDate" name="teamStartDate" value="${teamContents.teamStartDate}" readonly/>
                                </div>
                        	</div>
                            <div class="end-date">
                                <div class="checkout__input">
                                    <p>모집 종료일</p>
                                    <input type="date" name="teamEndDate" name="teamEndDate" value="${teamContents.teamEndDate}"/>
                                </div>
                            </div>
                            <div class="text-wrap all">
								<p>기타사항</p>
	                            <textarea class="etc" name="teamOther">${teamContents.teamOther}</textarea>
							</div>
                            <div class="checkout__input">
                                <p>모집 상태</p>
                                <label for="status-ing">
                                	<input type="radio" id="status-ing" value="모집 중" name="teamStatus" checked/>&nbsp모집 중
                                </label>
                                <label for="status-end">
                                	<input type="radio" id="status-end" value="모집 완료" name="teamStatus" />&nbsp모집 완료
                                </label>
                            </div>
						<div class="btn-wrap">
							<button type="submit" class="update">팀 모집글 수정</button>
						</div>
					</div>
				</article>
			</div>
		</form>
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