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

    <title>Kick Off: 용병 목록</title>

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

    <script>
        ${returnScript}
    </script>

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
                                    <th>경기 형식</th>
                                    <th>포지션</th>
                                    <th>팀레벨</th>
                                    <th>성별</th>
                                    <th>풋살장</th>
                                    <th>경기 날짜</th>
                                    <th>작성자</th>
                                    <th>용병 상태</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="list" items="${table}">
                                    <tr>
                                    	${weekMsg}
                                        <td><c:out value="${list.helperMatch}" /></td>
                                        <td><c:out value="${list.helperPosition}" /></td>
                                        <td><c:out value="${list.helperTeamLevel}" /></td>
                                        <td><c:out value="${list.helperGender}" /></td>
                                        <td><c:out value="${list.helperPlaceName}" /></td>
                                        <td><c:out value="${list.helperTime}" /></td>
                                        <td><c:out value="${list.helperUserId}" /></td>
                                        <td><button type = "button" class = "btn_detail" onclick="location.href='/helperDetail?helperSeqno=${list.helperSeqno}';">${list.helperStatus}</button></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="btn_insert">
                                <button type="submit" class="btn_insert" onclick="location.href='/helperInsert';">등록</button>
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

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>



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
    // 상태 정보 담아두는 버튼의 클래스명 들고와서 변수에 저장하기
    var buttons = document.getElementsByClassName("btn_detail");
    // 클래스는 중복 선언이 가능하기 때문에 앞에 선언한 변수에 각 버튼의 클래스명이 여러개 저장이 됩니다.
    // 따라서 테이블에 나타나 버튼의 갯수만큼 buttons 변수에 저장이 되고, 길이가 정해지기 때문에 배열을 나누듯이 반복으로 하나씩 분류를 해야해요
    for (var i = 0; i < buttons.length; i++) {
        // i번째 클래스의 버튼을 저장하는 변수를 선언합니다.
        var button = buttons[i];
        // 해당 버튼 안의 텍스트에 맞게 조건을 넣어서 색상 또는 비활성화 상태를 지정해주시면 됩니다.
        // ex) 버튼의 텍스트가 진행 중인 경우 : 버튼 색상을 #FFC090로 변경, 버튼의 텍스트가 마감인 경우: 색상을 lightgray로 변경하고 비활성화 상태로 만들기.
        if (button.innerText === "모집 중") {
            button.style.backgroundColor = "#FFC090";
        } else if (button.innerText === "마감") {
            button.style.backgroundColor = "lightgray";
            button.disabled = true;
        }
    }
    // 최종적으로 해당 반복문을 실행하면 아직 모집이 진행 중인 버튼은 활성화 상태이고, 색상이 #FFC090됩니다.
    // 마감인 경우에는 비활성화 상태가 되어 상세보기 또는 신청 페이지로 접근이 불가능하고, 색상 또한 lightgray로 변경됩니다.
</script>

</body>

</html>