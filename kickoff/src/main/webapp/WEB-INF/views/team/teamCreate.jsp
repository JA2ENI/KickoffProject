<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Russo+One&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<link rel="stylesheet" href="/includes/css/styleApply.css">
<link rel="stylesheet" href="/main/css/vendor/icomoon/style.css">

<link href="/team/css/teamCreate.css" rel="stylesheet" />

<title>Kick off: 풋살팀 생성</title>
</head>
<body>
	<%@include file="/includes/header.jsp"%>
<section>
	<form method="POST" action="/teamCreate">
		<div class="teamMark">
			<img class="img-teamMark" src="/team/img/teamMark.png">
		</div>
		<div class="title">팀 생성</div>
			<div class="container">
				<article class="article-container">
					<div class="item-wrap">
						<div class="inner-btn">
							<p>팀 이름</p>
							<input type="text" class="text-box" name="teamName" />
							<button type="button" class="btn-check" onclick="nameCheck()">중복확인</button>
						</div>
						<div class="text-wrap all">
							<p>팀 주장 <span>(최초 등록자가 주장으로 임명됩니다)</span></p>
							<input type="text" class="text-box" name="leaderId" value="${userId}" readonly/>
						</div>
						<div class="select-age all">
							<p class="age-title">주요 연령대</p>
							<input type="radio" id="teenager" class="age" name="teamAge" value="10대"/><label for="teenager">10대</label>
							<input type="radio" id="twenties" class="age" name="teamAge" value="20대"/><label for="twenties">20대</label>
							<input type="radio" id="thirties" class="age" name="teamAge" value="30대"/><label for="thirties">30대</label>
							<input type="radio" id="forties" class="age" name="teamAge" value="40대"/><label for="forties">40대</label>
							<input type="radio" id="fifties" class="age" name="teamAge" value="50대"/><label for="fifties">50대</label>
							<input type="radio" id="sixties" class="age" name="teamAge" value="60대"/><label for="sixties">60대</label>
						</div>
						<div class="select-level all">
							<p>팀 레벨</p>
							<input type="radio" id="rookie" class="level" name="teamLevel" value="루키"/><label for="rookie">루키</label>
							<input type="radio" id="amateur" class="level" name="teamLevel" value="아마추어"/><label for="amateur">아마추어</label>
							<input type="radio" id="semipro" class="level" name="teamLevel" value="세미프로"/><label for="semipro">세미프로</label>
							<input type="radio" id="pro" class="level" name="teamLevel" value="프로"/><label for="pro">프로</label>
							<input type="radio" id="platinum" class="level" name="teamLevel" value="플래티넘"/><label for="platinum">플래티넘</label>
							<input type="radio" id="diamond" class="level" name="teamLevel" value="다이아"/><label for="diamond">다이아</label>
						</div>
						<div class="area-wrap all">
							<p>주 활동지역</p>
							<select class="area" name="teamLocal">
								<option value="">주 활동지역을 선택해 주세요.</option>
								<option value="서울특별시">서울특별시</option>
								<option value="인천광역시">인천광역시</option>
								<option value="대전광역시">대전광역시</option>
								<option value="광주광역시">광주광역시</option>
								<option value="대구광역시">대구광역시</option>
								<option value="울산광역시">울산광역시</option>
								<option value="부산광역시">부산광역시</option>
							</select>
						</div>
						<div class="text-wrap all">
							<p>간략한 팀 소개</p>
							<input type="text" id="ment" class="text-box" name="teamIntro" maxlength="20"/>
							<span id="font-count">0/20</span>
						</div>
					</div>
				</article>
				<article class="article-container">
					<div class="item-wrap">
						<div class="img-wrap one">
							<img class="img-png" src="/team/img/1-3-1.png" />
						</div>
						<div class="img-wrap two">
							<img class="img-png" src="/team/img/2-2-1.png" />
						</div>
						<div class="img-wrap three">
							<img class="img-png" src="/team/img/3-1-1.png" />
						</div>
						<div class="formation-wrap">
							<p>팀 포메이션</p>
							<select id="formation" class="formation" name="teamFormation">
								<option value="1-3-1" id="for-one">1-3-1</option>
								<option value="2-2-1" id="for-two">2-2-1</option>
								<option value="3-1-1" id="for-three">3-1-1</option>
							</select>
						</div>
						<div class="select-gender">
							<p>팀 성별</p>
							<input type="radio" id="male" class="gender" name="teamGender" value="남성"/><label for="male">남성</label>
							<input type="radio" id="female" class="gender" name="teamGender" value="여성"/><label for="female">여성</label>
							<input type="radio" id="mix" class="gender" name="teamGender" value="혼성"/><label for="mix">혼성</label>
						</div>
						<div class="date-container">
							<div class="date-wrap">
								<div class="day-wrap all">
									<p>주 이용요일</p>
									<select class="day" name="teamDay">
										<option value="">선택해주세요</option>
										<option value="일요일">일요일</option>
										<option value="월요일">월요일</option>
										<option value="화요일">화요일</option>
										<option value="수요일">수요일</option>
										<option value="목요일">목요일</option>
										<option value="금요일">금요일</option>
										<option value="토요일">토요일</option>
									</select>
								</div>
								<div class="time-wrap all">
									<p>주 이용시간</p>
									<select class="time" name="teamTime">
										<option value="">선택해주세요</option>
										<option value="10:00~12:00">10:00~12:00</option>
										<option value="12:00~14:00">12:00~14:00</option>
										<option value="14:00~16:00">14:00~16:00</option>
										<option value="16:00~18:00">16:00~18:00</option>
										<option value="18:00~20:00">18:00~20:00</option>
										<option value="20:00~22:00">20:00~22:00</option>
										<option value="22:00~24:00">22:00~24:00</option>
									</select>
								</div>
							</div>
						</div>
						<p>팀 컬러</p>
						<div class="select-color">
							<input type="radio" id="red" class="color" name="teamColor" value="red"/><label for="red" class="red"></label>
							<input type="radio" id="orange" class="color" name="teamColor" value="orange"/><label for="orange" class="orange"></label>
							<input type="radio" id="yellow" class="color" name="teamColor" value="yellow"/><label for="yellow" class="yellow"></label>
							<input type="radio" id="green" class="color" name="teamColor" value="green"/><label for="green" class="green"></label>
							<input type="radio" id="blue" class="color" name="teamColor" value="blue"/><label for="blue" class="blue"></label>
							<input type="radio" id="skyblue" class="color" name="teamColor" value="skyblue"/><label for="skyblue" class="skyblue"></label>
							<input type="radio" id="navy" class="color" name="teamColor" value="navy"/><label for="navy" class="navy"></label>
							<input type="radio" id="purple" class="color" name="teamColor" value="purple"/><label for="purple" class="purple"></label>
						</div>
						<div class="btn-wrap">
							<button type="submit" class="create" onclick="createTeam()">팀 생성하기</button>
						</div>
					</div>
				</article>
			</div>
	</form>
</section>
</body>

<!-- footer -->
<%@include file="/includes/footer.jsp"%>

<!-- script -->
<script src="/includes/js/jquery-3.3.1.min.js"></script>
<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>
<script src="/includes/js/ScrollMagic.min.js"></script>
<script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
<script src="/includes/js/main.js"></script>
<script src="/team/js/teamCreate.js"></script>

</html>