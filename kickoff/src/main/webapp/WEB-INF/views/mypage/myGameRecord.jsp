<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/myPage/css/main.css" />
	<link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">
	<link href="/myPage/vendor/select2/select2.min.css" rel="stylesheet" media="all">
	<link href="/myPage/vendor/mdi-font/material-design-iconic-font.min.css" rel="stylesheet" media="all">
	<link href="/myPage/css/theme.css" rel="stylesheet" media="all">
	
	<title>Kick Off: 마이페이지</title>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<header id="header">
					<input type="button" onclick="location.href='main'" class="kickoff" value="Kick Off"/>
					<br>
					<a href="/myGameRecord" class="logo"><strong>매칭 목록</strong></a>
				</header>
				<section class="section">
					<div class="container-fluid">
						<div class="table-data__tool">
							<div class="table-data__tool-left">
								<div class="rs-select2--light rs-select2--md">
									<select class="js-select2" name="property">
										<option selected="selected">ALL</option>
										<option value="gameSeqno">경기 번호</option>										
										<option value="gameDate">경기 날짜</option>
										<option value="team1Id">팀1</option>
										<option value="team2Id">팀2</option>										
										<option value="gameStyle">경기 형태</option>
										<option value="gameScore">경기 결과</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
							</div>
						</div>
						<div class="table-responsive table-responsive-data2">
							<table class="table table-data2">
								<thead>
									<tr>
										<th class="title">경기 번호</th>
										<th class="title">경기 날짜</th>										
										<th class="title">팀1</th>
										<th class="title">팀2</th>
										<th class="title">경기 형태</th>
										<th class="title">경기 결과</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="line" items="${myGameRecordList}">
									<tr class="tr-shadow">
										<td>팀장</td>
										<td><span class="block-email">${line.gameSeqno}</span></td>
										<td class="desc">${line.gameDate}</td>
										<td>${line.team1Name}</td>
										<td>${line.team2Name}</td>
										<td>${line.gameStyle}</td>
										<td>
											<div class="table-data-feature">
												<button class="send" title="Send" onclick="location.href='/myGameInsert?gameSeqno=${line.gameSeqno}'">
													<i>기록하기</i>
												</button>
											</div>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
						<!-- END DATA TABLE -->
				</section>
			</div>
		</div>
		<div id="sidebar">
			<div class="inner">
				<nav id="menu">
					<header class="major">
						<h2>MyPage</h2>
					</header>
					<ul>
						<li><a href="/myReservation">예약 내역</a></li>
						<li><a href="/myBoardList">내 게시글</a></li>
						<li><a href="/myInfoCheck">회원 정보 수정</a></li>
						<li><a href="/myTeam">팀</a></li>
						<li><a href="/myMessage">메시지</a></li>
						<li><a href="/myHelper">용병</a></li>
						<li><a href="/myGameRecord">매칭</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<!-- Scripts -->
	<script src="/myPage/js/jquery.min.js"></script>
	<script src="/myPage/js/skel.min.js"></script>
	<script src="/myPage/js/util.js"></script>
	<script src="/myPage/js/main.js"></script>
	<script src="/myPage/vendor/jquery-3.2.1.min.js"></script>
	<script src="/myPage/vendor/bootstrap-4.1/popper.min.js"></script>
	<script src="/myPage/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<script src="/myPage/vendor/select2/select2.min.js"></script>
	<script src="/myPage/js/reservationMain.js"></script>

</body>
</html>