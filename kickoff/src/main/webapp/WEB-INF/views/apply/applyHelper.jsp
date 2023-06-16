<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="https://fonts.google.com/noto/specimen/Noto+Sans+KR?subset=korean&noto.script=Kore" rel="stylesheet">
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
	<%@include file="/includes/applyNavi.jsp" %>
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
							<div class="uTeam">TEAM</div>
							<div class="uTeamName">우최팀</div>
							<!-- 소속팀이 없으면 다른 문구 기입 -->
						</div>
						<div class="uTeam-wrap">
							<div class="uTeamRank">TEAM RANK</div>
							<div class="uTeamRankName">루키</div>
							<!-- 필수일거 같지만 혹시 모르니 없으면 다른 문구 기입 -->
						</div>
						<div class="uTeam-wrap">
							<div class="uPosition">POSITION</div>
							<div class="uPositionName">피보(Pivo)</div>
							<!-- 필수일거 같지만 혹시 모르니 없으면 다른 문구 기입 -->
						</div>
						<!-- 매칭(게임) 총 횟수 -->
						<div class="uTeam-wrap">
							<div class="uGame">GAME</div>
							<div class="uGameCount">5</div>
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
									<div class="placeName">내가 바로 독수리슛 풋살장</div>
									<!-- 모집자 -->
									<div class="numApply">5/10명</div>
									<!-- 신청자 -->
									<!-- <div class="numHelper">10명</div> -->
									<input type="checkbox" id="drop" class="drop" onclick="drop()"/>
								</div>
								<div class="three-wrap">
									<div class="arrow">▶</div>
									<div class="gender">남성</div>
									<div>&sdot;</div>
									<div class="hMatch">5vs5</div>
									<div>&sdot;</div>
									<div class="hPosition">피보(Pivo)</div>
								</div>
							</div>
							<div id="detail" class="detail">
								<div>상세내용</div>
								<div>1</div>
								<div>2</div>
								<div>3</div>
							</div>
						</div>


						<div class="box-frame">
							<div class="box-content">
								test1
								<input type="checkbox" id="drop" class="checkbox" onclick="drop()"/>
							</div>
							<div class="detail" id="detail">
								<div>상세내용</div>
								<div>1</div>
								<div>2</div>
								<div>3</div>
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

 		function drop() {
			var drop = document.getElementById('drop');
			var detail = document.getElementById('detail');
			
			if(drop.checked == true) {
				detail.style.display = "block";
			} else {
				detail.style.display = "none";
			}
		} 

</script>


<!-- script -->
<script src="/includes/js/jquery-3.3.1.min.js"></script>
<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>
<script src="/includes/js/ScrollMagic.min.js"></script>
<script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
<script src="/includes/js/main.js"></script>
<script src="/apply/js/applyList.js"></script>

</html>