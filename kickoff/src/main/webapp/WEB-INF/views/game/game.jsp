<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Kick Off: 매칭 목록</title>

    <link rel="stylesheet" href="/includes/css/style.css">
    <link rel = "stylesheet" href = "/includes/css/footer.css" />
    <link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">

    <!-- Custom fonts for this template -->
    <link href="/helper/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/helper/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/helper/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link rel = "stylesheet" href = "/includes/css/week.css" />

    </head>
        <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <%@include file="/includes/header.jsp"%>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class = "calender">
                            <div class="card-header py-3">

                        <%@include file = "/includes/weeks.jsp" %>
                        </div>
                        </div>
                <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>풋살장</th>
                            <th>대전 팀</th>
                            <th>경기 날짜</th>
                            <th>경기 형태</th>
                            <th>성별</th>
                            <th>매칭 상태</th>
                        </tr>
                        </thead>
                        <c:forEach var="list" items="${table}">
                            <tr>
                                <td><c:out value="${list.placeName}" /></td>
                                <td><c:out value="${list.team1Name}" /><span style="text-weight:bold; color:red;">&nbsp;VS&nbsp;</span><c:out value="${list.team2Name}" /></td>
                                <td><c:out value="${list.gameDate}" /></td>
                                <td><c:out value="${list.gameStyle}" /></td>
                                <td><c:out value="${list.gameGender}" /></td>
                                <td><button type = "button" class = "btn_detail" onclick="location.href='/gameDetail?gameSeqno=${list.gameSeqno}';">${list.gameStatus}</button></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="btn_container">
                    <button type="button" class="btn_insert" onclick="location.href='/gameUpdate';">매칭 글 등록</button>
                </div>
            </div>
            </div>
                    </div>

                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->
                <!-- Footer -->
                <%@include file="/includes/footer.jsp"%>
                <!-- End of Footer -->
            </div>
            <!-- End of Content Wrapper -->
        </div>
        <!-- End of Page Wrapper -->


<!-- Bootstrap core JavaScript-->
            <script src="/helper/vendor/jquery/jquery.min.js"></script>


            <!-- Page level plugins -->
            <script src="/helper/vendor/datatables/jquery.dataTables.min.js"></script>
            <script src="/helper/vendor/datatables/dataTables.bootstrap4.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="/helper/js/demo/datatables-demo.js"></script>

            <script src="/includes/js/jquery.lettering.js"></script>
            <script src="/includes/js/jquery.sticky.js"></script>

            <script src="/includes/js/ScrollMagic.min.js"></script>
            <script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
            <script src="/includes/js/main.js"></script>
            <script src="/includes/js/week.js"></script>

        <script>
            var buttons = document.getElementsByClassName("btn_detail");
            for (var i = 0; i < buttons.length; i++) {
                var button = buttons[i];

                if (button.innerText === "매칭 중") {
                    button.style.backgroundColor = "#FFC090";
                } else if (button.innerText === "매칭완료") {
                    button.style.backgroundColor = "lightgray";
                    button.disabled = true;
                }
            }
        </script>
        </body>
</html>