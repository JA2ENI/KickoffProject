<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Kick Off: 자유게시판 글 등록</title>
<!-- include할 문서에 스타일, js -->
 <link rel="stylesheet" href="/includes/css/style.css">
    
    <link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">
    
    <script src="/includes/js/jquery-3.3.1.min.js"></script>

    <script src="/includes/js/jquery.lettering.js"></script>
    <script src="/includes/js/jquery.sticky.js"></script>


    <script src="/includes/js/ScrollMagic.min.js"></script>
    <script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>

    <script src="/includes/js/main.js"></script>
<!-- 여기까지 복붙하기 -->    
<script type="text/javascript">
    function _onSubmit() {

        if ($("#writeTitle").val() == "") {
            alert("제목을 입력해주세요");
            $("#writeTitle").focus();
            return false;
        }

        if ($("#writeContent").val() == "") {
            alert("내용을 입력해주세요");
            $("#writeContent").focus();
            return false;
        }

        if (!confirm("등록하시겠습니까?")) {
            return false;
        }
    }
</script>

<link rel = "stylesheet" href = "/board/css/boardInsert.css" />
</head>
<body>
<%@include file="/includes/header.jsp"%>
<!-- Header -->
    <div class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">자유게시판 게시글 등록</h1>
                <p class="lead fw-normal text-white-50 mb-0">풋살 관련 이야기할 주제들을 자유롭게 게시해주세요.</p>
            </div>
        </div>
    </div>
<br>
<br>
<form id="frm" name="frm" action="insert_action" method="post" onsubmit="return _onSubmit();">
<h4>게시글 등록</h4>
<div class="table-responsive">
		
		<div class="board_title">
		<span class="formInline">
		<label for="writeTitle">제목</label>
		<input type="text" id="writeTitle" name="writeTitle" class="form-control">
		</span>
		</div>
		
		<div class="writer">
		<span class="formWriter">
		<label for="writeId" class="writeId" >작성자 : ${userId}</label>
            <label class="writeIdEmp">${empId}</label>
		</span>
            <input type="hidden" id="writeId" name="writeId" value="${userId}">
            <input type="hidden" id="writeIdEmp" name="writeIdEmp" value="${empId}">
		</div>
		
		<div class="filebox bs3-primary preview-image">
              <input id="fileName" name="fileName" class="fileName" value="파일선택" disabled="disabled" style="width: 200px;">

              <label for="filePath">업로드</label>
              <input type="file" id="filePath" name="filePath" class="filePath-hidden">
        </div>
		
		<div class="content">
		<label for="writeContent">내용</label><br>
			<textarea id="writeContent" name="writeContent" cols="100" rows="20" class="form-content"></textarea>
		</div>
		
		<div class="btn_board">
		<button type="reset" class="btn_reset" onclick="location.href='/board';">취소</button>
		<!-- <a href="boardDetail.jsp"><button type="submit" class="btn_submit">등록</button></a> -->
		<button type="submit" class="btn_submit" onclick="document.getElementById('frm').submit();">등록</button>
		</div>
</div>
</div>
</form>
<!-- Footer-->
<%--<%@include file="/includes/footer.jsp"%>--%>
</body>
</html>

