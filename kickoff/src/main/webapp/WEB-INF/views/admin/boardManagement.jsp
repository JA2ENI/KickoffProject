<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Kick Off: 관리자-게시물 관리</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- Custom styles for this page -->
    <link href="/emp/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/admin/css/main.css" />
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
									<a href="/boardManagement" class="logo"><strong>마이 페이지</strong> 관리자 전용</a>
								</header>
							
							<!-- Begin Page Content -->
			                	<section>
				                	<div class="container-fluid">
				                    <!-- Page Heading -->
				                    <h1 class="h3 mb-2 text-gray-800">신고 게시글 관리</h1><br /><br />                 
				
				                    <!-- DataTales Example -->
				                    <div class="card shadow mb-4">
				                        <div class="card-body">
				                            <div class="table-responsive">
				                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				                                    <thead>
				                                        <tr>
				                                            <th id="title">제목</th>
				                                            <th id="id">작성자</th>
				                                            <th id="date">날짜</th>
				                                            <th id="count">신고 횟수</th>
				                                            <th id="comment">신고 사유</th>
				                                            <th id="manage">관리</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                	<c:forEach var="list" items="${reportList}">
				                                        <tr>
				                                            <td><c:out value="${list.reportTitle}" /></td>
				                                            <td><c:out value="${list.reportId}" /></td>
				                                            <td><c:out value="${list.reportWriteReg}" /></td>
				                                            <td><c:out value="${list.reportCount}" /></td>
				                                            <td><c:out value="${list.reportComment}" /></td>
				                                            <td>
				                                            <button type="button" class="btn-remove" onclick="deleteReport('${list.boardSeqno}')">삭제</button>
                                                        	</td>
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
										<li><a href="/userManagement">회원 관리</a></li>
										<li><a href="/boardManagement">신고 게시글 관리</a></li>
									</ul>
								</nav>

					

						</div>
					</div>

			</div>
			
			<script>
			/* report delete */
			function deleteReport(boardSeqno) {
			    if (confirm("신고글을 삭제하시겠습니까?")) {
			        location.href = "/deleteReport?boardSeqno=" + boardSeqno;
			    }
			}
			</script>

		<!-- Scripts -->
			<script src="/emp/js/jquery.min.js"></script>
			<script src="/emp/js/skel.min.js"></script>
			<script src="/emp/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/emp/js/main.js"></script>
			
			
    <!-- Page level plugins-->
    <script src="/emp/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/emp/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/emp/js/demo/datatables-demo.js"></script>

	</body>
</html>