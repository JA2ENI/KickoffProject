<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Russo+One&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<link rel="stylesheet" href="/includes/css/styleApply.css">
<link rel="stylesheet" href="/main/css/vendor/icomoon/style.css">
<link href="/includes/css/applyNavi.css" rel="stylesheet" />
<link href="/apply/css/applyHelper.css" rel="stylesheet" />

<title>Kick off: 용병 신청</title>
</head>
<body>
	<div class="header-container">
		<%@include file="/includes/headerApply.jsp"%>
	</div>
	<%@include file="/includes/applyNavi.jsp"%>
	<section>
		<article class="myInfo">
			<div class="myInfo-container">
				<div class="myInfo-wrap">
					<div class="uInfo">
						<!-- session user name -->
						<div class="userName">안재은</div>
						<!-- user ID -->
						<div class="userId">ja2eni</div>
					</div>
					<div class="uTeam-container">
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM</div>
							<div class="uContant">우최팀</div>
							<!-- 소속팀이 없으면 다른 문구 기입 -->
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">TEAM RANK</div>
							<div class="uContant">루키</div>
							<!-- 필수일거 같지만 혹시 모르니 없으면 다른 문구 기입 -->
						</div>
						<div class="uTeam-wrap">
							<div class="uTitle">POSITION</div>
							<div class="uContant">피보(Pivo)</div>
							<!-- 필수일거 같지만 혹시 모르니 없으면 다른 문구 기입 -->
						</div>
						<!-- 매칭(게임) 총 횟수 -->
						<div class="uTeam-wrap">
							<div class="uTitle">GAME</div>
							<div class="uContant">5</div>
						</div>
					</div>
				</div>
			</div>
		</article>
		<article class="helper">
			<div class="helper-container">
				<div class="helper-wrap">
					<div class="hTitle">용병 신청</div>
						<div class="box-wrap">
							<div class="box-frame">
								<div class="box-content">
									<!-- 모집 상태에 따라 -->
									<div class="status ing">모집 중</div>
									<!-- <div class="status end">모집 완료</div> -->
									<!-- <div class="status cancel">모집 취소</div> -->
									<div class="one-wrap">
										<div class="date day">6월 14일</div>
										<div class="date">수요일</div>
										<div class="date">20:00</div>
									</div>
									<div class="two-wrap">
										<a href="javascript:alert('제목 상세보기 test');" class="placeName">서울 송파 천마 풋살파크 2구장</a>
										<!-- 모집자_총 모집인원수 & 신청자 수 -->
										<div class="numApply">5/10명</div>
										<!-- 신청자_총 모집인원수 -->
										<!-- <div class="numHelper">10명</div> -->
									</div>
									<!-- 모집자_디테일 체크박스 -->
									<div class="checkbox-wrap">
										<input type="checkbox" id="drop" class="drop" onclick="drop()" /><label for="drop"></label>
									</div>
									<!-- 신청자_상세보기 버튼 -->
									<!-- <div class="btn-wrap">
										<button type="button" class="btn-detail" onclick="javascript:alert('test')">상세보기</button>
									</div> -->
									<!-- 신청자_신청 수락/거절 상태 -->
									<div class="ticket-wrap">
										<img class="ticket" src="/apply/images/thanks.png" />
										<!-- <img class="ticket" src="/apply/images/sorry.png" /> -->
									</div>
									<div class="three-wrap">
										<div class="arrow">▶</div>
										<div class="three-content">남성</div>
										<div>&sdot;</div>
										<div class="three-content">5vs5</div>
										<div>&sdot;</div>
										<div class="three-content">피보(Pivo)</div>
									</div>
								</div>
								<div id="detail" class="detail-container">
									<div class="detail-wrap" id="sideon">
										<div class="detail-content">
											<div class="dContent">ja2eni</div>
											<div class="dContent">&#149;</div>
											<div class="dContent">남성</div>
											<div class="dContent">&#149;</div>
											<div class="dContent">피보</div>
										</div>
									</div>
									
									<!-- test (추후 삭제)-->
									<div class="detail-wrap">
										<div class="detail-content">
											<div class="dContent">test2234</div>
											<div class="dContent">&#149;</div>
											<div class="dContent">남성</div>
											<div class="dContent">&#149;</div>
											<div class="dContent">아라</div>
										</div>
									</div>
									<div class="detail-wrap">
										<div class="detail-content">
											<div class="dContent">test223458</div>
											<div class="dContent">&#149;</div>
											<div class="dContent">여성</div>
											<div class="dContent">&#149;</div>
											<div class="dContent">골레이로</div>
										</div>
									</div>
									<!-- test END -->
								</div>
								
								<!-- 모집자_수락/거절(side bar) -->
								<div class="side-container">
									<div class="side-wrap">
										<div class="side-head">
											<div class="side-title">신청자</div>
											<div class="btn-side">
												<i class="i">X</i>
											</div>
										</div>
										<div class="side-body">
											<div class="content one">
												<div class="sTitle">ID</div>
												<div class="sContent">ja2eni</div>
											</div>
											<div class="content">
												<div class="sTitle">GENDER</div>
												<div class="sContent">남성</div>
											</div>
											<div class="content">
												<div class="sTitle">POSITION</div>
												<div class="sContent">피보(Pivo)</div>
											</div>
											<div class="content">
												<div class="sTitle">TEAM</div>
												<div class="sContent">우최팀</div>
											</div>
											<!-- 총경기 횟수 -->									
											<div class="content">
												<div class="sTitle">GAME</div>
												<div class="sContent">7</div>
											</div>
											<!-- 용병지원 횟수 -->
											<div class="content seven">
												<div class="sTitle">HELPER</div>
												<div class="sContent">10</div>
											</div>
											<!-- alert 띄우기(?) -->
											<div class="content btn-side-wrap">
												<button type="button" id="accept" class="sBtn accept">수락</button>
												<button type="button" id="accept" class="sBtn refusal">거절</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</article>
	</section>
</body>

<!-- footer -->
<%@include file="/includes/footer.jsp"%>

<script>
	/* side-bar */
	$(function(){
		/* #sideon + 숫자(반복문) */
		$("#sideon").on("click", function(){
			$(".side-container").toggleClass("menuon");
		});
		
		$(".btn-side").on("click", function(){
			$(".side-container").toggleClass("menuon");
		});
	});
</script>

<!-- script -->
<script src="/includes/js/jquery-3.3.1.min.js"></script>
<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>
<script src="/includes/js/ScrollMagic.min.js"></script>
<script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
<script src="/includes/js/main.js"></script>
<script src="/apply/js/applyList.js"></script>
<script src="/apply/js/applyHelper.js"></script>

</html>