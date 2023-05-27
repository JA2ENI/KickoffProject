<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Kick Off: 자유게시판 글 상세보기</title>
<!-- include할 문서에 스타일, js -->
<link rel="stylesheet" href="/includes/css/style.css">
<link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">
	<link rel = "stylesheet" href = "/includes/css/footer.css" />

<script src="/includes/js/jquery-3.3.1.min.js"></script>

<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>


<script src="/includes/js/ScrollMagic.min.js"></script>
<script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>

<script src="/includes/js/main.js"></script>
<!-- 여기까지 복붙하기 -->
	<script type="text/javascript">
		$(document).ready(function() {

			var msg = "${msg}";

			if(msg != ""){
				alert(msg);
			}

		});

		function deleteConfirm(){

			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}else{
				location.href="/delete?boardSeqno=${boardContents.boardSeqno}";
			}
		}

		function updateConfirm(){

			if(!confirm("수정 하시겠습니까?")){
				return false;
			}else{
				location.href="/boardUpdate?boardSeqno=${boardContents.boardSeqno}";
			}
		}

		function reportConfirm(){

			location.href="/boardReport?boardSeqno=${boardContents.boardSeqno}";
		}
	</script>

<link rel="stylesheet" href="/board/css/boardDetail.css" />
</head>
<body>
	<%@include file="/includes/header.jsp"%>
	<!-- Header -->
	<div class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">${boardContents.writeTitle}</h1>
				<p class="lead fw-normal text-white-50 mb-0">${boardContents.writeId}${boardContents.writeIdEmp}</p>
			</div>
		</div>
	</div>
	<form role="form" method="post">
		<div class="container">
			<div class="table-responsive">
				<table class="board_detail">
					<colgroup>
						<col width="20%" />
						<col width="35%" />
						<col width="15%" />
						<col width="35%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="active">글 번호</th>
							<td>${boardContents.boardSeqno}</td>
							<th scope="row" class="active">조회수</th>
							<td>${boardContents.viewCount}</td>
						</tr>
						<tr>
							<th scope="row" class="active">작성자</th>
							<td>${boardContents.writeId}${boardContents.writeIdEmp}</td>
							<th scope="row" class="active">작성일</th>
							<td>${boardContents.writeRegDate}</td>
						</tr>
						<tr>
							<th scope="row" class="active" >제목</th>
							<td colspan="3">${boardContents.writeTitle}</td>
						</tr>
						<tr>
							<td colspan="4" class="view_text" id="view_text">${boardContents.writeContent}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br />
			<hr>
			
			<!-- 댓글 -->
			<div class="reply">
				<table id="tblListComment" class="table table-bordered">

					<c:if test="${ replyList.size() == 0 }">
						<tr>
							<td colspan="2">댓글이 없습니다.</td>
						</tr>
					</c:if>

					<c:forEach items="${ replyList }" var="list">
						<tr>
							<td>${ replyList.replyContent } <span>${ replyList.replyId }${ replyList.replyIdEmp }</span>
							</td>
							<td><input type="button" value="삭제하기" class="btn btn-default" id="deleteRely" name="deleteRely"
								onclick="location.href='/boardDetil?boardSeqno=' + boardSeqno + 'replyNo=' + replyNo;" />
							</td>
						</tr>
					</c:forEach>
				</table>
				<%-- action="/insert_reply"  --%>
				<form  method="POST" id="frm" name="frm">
					<table id="tblAddComment" class="table table-bordered">
						<tr>
							<td>
								<label class="replyId" >${userId}</label>
								<label class="replyIdEmp">${empId}</label>
								<input type="hidden" id="replyId" name="replyId" value="${userId}">
								<input type="hidden" id="replyIdEmp" name="replyIdEmp" value="${empId}">
								<input type="text" name="replyContent" id="replyContent" class="form-control" />
							</td>
							<td>
								<input type="submit" id="btn btn-primary" class="btn btn-primary" value="댓글쓰기" onclick="document.getElementById('frm').submit();">
							</td>
						</tr>
					</table>
				</form>
			</div>

			<div class="btn_boarddetail">
				<button type="reset" class="btn_reset" onclick="location.href='/board';">목록</button>
				<c:if test="${(userId ne boardContents.writeId) || (empId ne boardContents.writeIdEmp)}">
					<button class="btn_report" onclick="reportConfirm(); return false;">신고</button>
				</c:if>

				<c:if test="${(userId eq boardContents.writeId) && (empId eq boardContents.writeIdEmp)}">
					<button class="btn_update" onclick="updateConfirm(); return false;">수정</button>
					<button class="btn_delete" onclick="deleteConfirm(); return false;">삭제</button>
				</c:if>
			</div>
		</div>
	</form>
	
<%--   <%@include file="/includes/footer.jsp"%>--%>
</body>
</html>

