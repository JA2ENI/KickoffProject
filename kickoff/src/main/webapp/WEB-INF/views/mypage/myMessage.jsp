<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kick Off: 마이페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/myPage/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

<!-- Bootstrap CSS-->
<link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link href="/myPage/vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="/myPage/vendor/mdi-font/material-design-iconic-font.min.css" rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="/myPage/css/theme.css" rel="stylesheet" media="all">
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<input type="button" onclick="location.href='main'" class="kickoff-logo" value="Kick Off"/>
					<br>
					<a href="/myMessage" class="logo"><strong>메시지</strong></a>
				</header>

				<section class="section">
					<div class="container-fluid">
						<!-- Page Heading -->
						<div class="table-data__tool">
							<div class="table-data__tool-left">
								<div class="rs-select2--light rs-select2--md">
									<select class="js-select2" name="property">
										<option selected="selected">ALL</option>
										<option value="game">매치</option>
										<option value="helper">용병</option>
										<option value="team">팀</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
<!-- 								<button class="au-btn-filter">
									<i class="zmdi zmdi-filter-list"></i>filters
								</button> -->
							</div>
							<div class="message-btn-wrap">
								<button class="au-btn-b1 au-btn-icon au-btn--white au-btn--small">
									<i class="zmdi zmdi-refresh"></i>
								</button>
								<button class="au-btn-b1 au-btn-icon au-btn--white au-btn--small">삭제</button>
							</div>
						</div>
						<div class="table-responsive table-responsive-data2 mar">
							<table class="table table-data2">
								<thead>
									<tr>
										<th>
											<label class="au-checkbox">
												<input type="checkbox">
                                                <span class="au-checkmark check"></span>
                                            </label>
                                        </th>
										<th class="title">유형</th>
										<th class="title">보낸사람</th>
										<th class="title">제목</th>
										<th class="title">날짜</th>
										<th class="title">답장</th>
									</tr>
								</thead>
								<tbody>
									<tr class="tr-shadow">
										<td>
                                            <label class="au-checkbox">
                                            	<input type="checkbox">
                                                <span class="au-checkmark"></span>
                                            </label>
                                        </td>
										<td><span class="block-email">매치</span></td>
										<td>kickoff</td>
										<td class="desc">용병 신청 받았습니다.</td>
										<td>05.01</td>
										<td>
											<div class="table-data-feature">
												<button class="send" data-toggle="tooltip" data-placement="top" title="Send">
													<i>답장</i>
												</button>
											</div>
										</td>
									</tr>
									<tr class="spacer"></tr>
									<tr class="tr-shadow">
										<td>
                                            <label class="au-checkbox">
                                            	<input type="checkbox">
                                                <span class="au-checkmark"></span>
                                            </label>
                                        </td>
										<td><span class="block-email">용병</span></td>
										<td>4jo</td>
										<td class="desc">안녕하세요. 용병 신청 받았습니다.</td>
										<td>05.02</td>
										<td>
											<div class="table-data-feature">
												<button class="send" data-toggle="tooltip" data-placement="top" title="Send">
													<i>답장</i>
												</button>
											</div>
										</td>
									</tr>
									<tr class="spacer"></tr>
									<tr class="tr-shadow">
										<td>
                                            <label class="au-checkbox">
                                            	<input type="checkbox">
                                                <span class="au-checkmark"></span>
                                            </label>
                                        </td>
										<td><span class="block-email">팀</span></td>
										<td>hero</td>
										<td class="desc">안녕하세요.</td>
										<td>05.03</td>
										<td>
											<div class="table-data-feature">
												<button class="send" data-toggle="tooltip" data-placement="top" title="Send">
													<i>답장</i>
												</button>
											</div>
										</td>
									</tr>
									<tr class="spacer"></tr>
									<tr class="tr-shadow">
										<td>
                                            <label class="au-checkbox">
                                            	<input type="checkbox">
                                                <span class="au-checkmark"></span>
                                            </label>
                                        </td>
										<td><span class="block-email">매치</span></td>
										<td>hi</td>
										<td class="desc">안녕하세요. hi입니다.</td>
										<td>05.04</td>
										<td>
											<div class="table-data-feature">
												<button class="send" data-toggle="tooltip" data-placement="top" title="Send">
													<i>답장</i>
												</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
						<!-- END DATA TABLE -->
				</section>
			</div>
		</div>
		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Menu -->
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

				<!-- Section -->


				<!-- Footer -->

			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script src="/myPage/js/jquery.min.js"></script>
	<script src="/myPage/js/skel.min.js"></script>
	<script src="/myPage/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="/myPage/js/main.js"></script>
	<!-- Jquery JS-->
	<script src="/myPage/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script
		src="/myPage/vendor/bootstrap-4.1/popper.min.js"></script>
	<script
		src="/myPage/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script src="/myPage/vendor/select2/select2.min.js"></script>

	<!-- Main JS-->
	<script src="/myPage/js/reservationMain.js"></script>


</body>
</html>