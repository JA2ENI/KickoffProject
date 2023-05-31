<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kick Off: 마이페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- Custom styles for this page -->
<link
	href="/myPage/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/myPage/css/main.css" />
<link rel="stylesheet" href="/myPage/css/font-awesome.min.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
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
					<strong class="logo">내 게시글</strong>
				</header>

				<!-- Begin Page Content -->
				<section>
					<div class="container-fluid">

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>제목</th>
												<th>작성일</th>
												<th>조회</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>4조 풋살왕</td>
												<td>23.05.10</td>
												<td>95</td>
											</tr>
											<tr>
												<td>4조 파이팅!!</td>
												<td>23.05.09</td>
												<td>100</td>
											</tr>
											<tr>
												<td>Kickoff 짱짱!</td>
												<td>23.05.08</td>
												<td>300</td>
											</tr>
											<tr>
												<td>commit 짱!</td>
												<td>23.05.07</td>
												<td>110</td>
											</tr>
											<tr>
												<td>축구왕 슛돌이</td>
												<td>23.05.06</td>
												<td>100</td>
											</tr>
											<tr>
												<td>독수리 슛!</td>
												<td>23.05.05</td>
												<td>80</td>
											</tr>
											<tr>
												<td>슬램덩크 말고 슛돌이</td>
												<td>23.05.04</td>
												<td>150</td>
											</tr>
											<tr>
												<td>통키는 손, 나는 발임</td>
												<td>23.05.03</td>
												<td>78</td>
											</tr>
											<tr>
												<td>강슛돌과 줄리앙</td>
												<td>23.05.02</td>
												<td>100</td>
											</tr>
											<tr>
												<td>손흥민, 토트넘</td>
												<td>23.05.01</td>
												<td>185</td>
											</tr>
											<tr>
												<td>하이 이강인 미드필더</td>
												<td>23.04.30</td>
												<td>91</td>
											</tr>
											<tr>
												<td>헤이 안정환 2002년 월드컵 시절</td>
												<td>23.04.29</td>
												<td>120</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- /.container-fluid -->
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
						<li><a href="/myInfo">회원 정보 수정</a></li>
						<li><a href="/myTeam">팀</a></li>
						<li><a href="/myMessage">메시지</a></li>
						<li><a href="/myHelper">용병</a></li>
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


	<!-- Page level plugins-->
	<script
		src="/myPage/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="/myPage/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/myPage/js/demo/datatables-demo.js"></script>

</body>
</html>