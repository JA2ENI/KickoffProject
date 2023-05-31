<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Kick Off: 풋살장 목록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- Custom styles for this page -->
    <link href="/emp/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
		<!--[if lte IE 8]><script src="/emp/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/emp/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="/emp/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="/emp/css/ie8.css" /><![endif]-->
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
									<strong>내 풋살장 목록</strong>
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
				                                            <th>번호</th>
				                                            <th>풋살장</th>
				                                            <th>주소</th>
				                                            <th>전화번호</th>
				                                            <th>규격</th>
				                                            <th>작성자</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody>
														<c:forEach var="list" items="${empFutsalList}">
					                                        <tr>
																<td>${list.empFutsalList}</td>
																<td>
																	<a href="/empFutsalFix?placeName=${list.placeId}">
																		${list.placeName}
																	</a>
																</td>
																<td>${list.placeAddress}</td>
																<td>${list.placePhoneNumber}"</td>
																<td>${list.placeSize}"</td>
																<td>${list.empId}"</td>
					                                        </tr>
														</c:forEach>
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
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="/empReservation">예약관리</a></li>
										<li><a href="/myBoard">내 게시글</a></li>
										<li><a href="/fixInfo">회원 정보 수정</a></li>
										<li>
											<!-- opener 에 원래 active 열고 닫게 할 수 있어야 함 -->
											<span class="opener active">풋살장 관리</span>
											<ul>
												<li><a href="/empFutsalForm">풋살장 등록</a></li>
												<li><a href="/empFutsalFix">풋살장 목록</a></li>
											</ul>
										</li>										
									</ul>
								</nav>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="/emp/js/jquery.min.js"></script>
			<script src="/emp/js/skel.min.js"></script>
			<script src="/emp/js/util.js"></script>
			<!--[if lte IE 8]><script src="/emp/js/ie/respond.min.js"></script><![endif]-->
			<script src="/emp/js/main.js"></script>
			
			
    <!-- Page level plugins-->
    <script src="/emp/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/emp/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/emp/js/demo/datatables-demo.js"></script>

	</body>
</html>