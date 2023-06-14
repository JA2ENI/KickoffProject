<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/myPage/css/main.css" />
	<!-- Bootstrap CSS-->
	<link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">
	<!-- Vendor CSS-->
	<link href="/myPage/vendor/select2/select2.min.css" rel="stylesheet" media="all">
	<link href="/myPage/vendor/mdi-font/material-design-iconic-font.min.css" rel="stylesheet" media="all">
	<!-- Main CSS-->
	<link href="/myPage/css/theme.css" rel="stylesheet" media="all">
	
	<title>Kick Off: 마이페이지</title>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<input type="button" onclick="location.href='main'" class="kickoff" value="Kick Off"/>
					<br>
					<a href="/myTeam" class="logo"><strong>소속팀</strong></a>
				</header>
				<!-- Section -->
				<section class="section">
					<div class="container-fluid">
						<div class="table-data__tool">
							<div class="table-data__tool-left">
								<div class="rs-select2--light rs-select2--md">
									<select class="js-select2" name="property">
										<option selected="selected">ALL</option>
										<option value="member">직책</option>
										<option value="name">이름</option>
										<option value="position">포지션</option>
										<option value="gender">성별</option>
										<option value="adress">거주지</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
<!-- 								<button class="au-btn-filter">
									<i class="zmdi zmdi-filter-list"></i>filters
								</button> -->
							</div>
							<div class="facility-wrap">
								<p class="info">
									인원<span>4/30</span>
								</p>
								<p class="info">
									지역<span>경기 수원시</span>
								</p>
								<p class="info">
									성별<span>혼성</span>
								</p>
							</div>
						</div>
						<c:choose>
						<div class="table-responsive table-responsive-data2">
							<table class="table table-data2">
								<thead>
									<tr>
										<th class="title">직책</th>
										<th class="title">이름</th>
										<th class="title">포지션</th>
										<th class="title">성별</th>
										<th class="title">거주지</th>
										<th class="title">관리</th>
									</tr>
								</thead>
								<tbody>
									<tr class="tr-shadow">
										<td>팀장</td>
										<td><span class="block-email">김팀장</span></td>
										<td class="desc">골레이로(Goleiro)</td>
										<td>남</td>
										<td>수원</td>
										<td>
											<div class="table-data-feature">
												<button class="out" data-toggle="tooltip" data-placement="top" title="Send">
													<i>방출</i>
												</button>
											</div>
										</td>
									</tr>
									<tr class="spacer"></tr>
									<tr class="tr-shadow">
										<td>팀원</td>
										<td><span class="block-email">이팀원</span></td>
										<td class="desc">피보(Pivo)</td>
										<td>여</td>
										<td>서울</td>
										<td>
											<div class="table-data-feature">
												<button class="out" data-toggle="tooltip" data-placement="top" title="Send">
													<i>방출</i>
												</button>
											</div>
										</td>
									</tr>
									<tr class="spacer"></tr>
									<tr class="tr-shadow">
										<td>팀원</td>
										<td><span class="block-email">최팀원</span></td>
										<td class="desc">아라(Ala)</td>
										<td>남</td>
										<td>인천</td>
										<td>
											<div class="table-data-feature">
												<button class="out" data-toggle="tooltip" data-placement="top" title="Send">
													<i>방출</i>
												</button>
											</div>
										</td>
									</tr>
									<tr class="spacer"></tr>
									<tr class="tr-shadow">
										<td>팀원</td>
										<td><span class="block-email">장팀원</span></td>
										<td class="desc">픽소(Fixo)</td>
										<td>남</td>
										<td>서울</td>
										<td>
											<div class="table-data-feature">
												<button class="out" data-toggle="tooltip" data-placement="top" title="Send">
													<i>방출</i>
												</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						</c:choose>
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