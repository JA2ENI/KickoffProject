<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kick Off: 마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link href="/myPage/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link rel="stylesheet" href="/myPage/css/main.css" />
<link rel="stylesheet" href="/myPage/css/font-awesome.min.css" />
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<input type="button" onclick="location.href='main'" class="kickoff-logo" value="Kick Off"/>
					<br>
					<strong class="logo">내 게시글</strong>
				</header>
				<section>
					<div class="container-fluid">
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
											<c:forEach var="row" items="${myBoardList}">
												<tr>
													<td>
														<a href="/boardDetail?boardSeqno=${row.boardSeqno}">
															${row.writeTitle}
														</a>
													</td>
													<td>${row.writeRegDate}</td>
													<td>${row.viewCount}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
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
						<li><a href="/myGameRecordList">매칭</a></li>
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
	<script	src="/myPage/vendor/datatables/jquery.dataTables.min.js"></script>
	<script	src="/myPage/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script src="/myPage/js/demo/datatables-demo.js"></script>

</body>
</html>