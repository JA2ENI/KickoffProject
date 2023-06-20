<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/myPage/css/main.css" />
	<link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">
	<link href="/myPage/vendor/select2/select2.min.css" rel="stylesheet" media="all">
	<link href="/myPage/vendor/mdi-font/material-design-iconic-font.min.css" rel="stylesheet" media="all">
	<link href="/myPage/css/theme.css" rel="stylesheet" media="all">
	
	<title>Kick Off: 마이페이지</title>
	
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

		
	    }
	</script>
	
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<header id="header">
					<input type="button" onclick="location.href='main'" class="kickoff" value="Kick Off"/>
					<br>
					<a href="/myTeam" class="logo"><strong>매칭 기록</strong></a>
				</header>
				<section class="section">
				<form id="frm" name="frm" action="reply_insert_action" method="post" onsubmit="return _onSubmit();">
					<div class="container-fluid">
						<div class="table-data__tool">
							<div class="table-data__tool-left">
								<table class="board_detail">
								<tbody>
									<tr>
										<th scope="row" class="active">경기 번호</th>
										<td>${gameRecord.gameSeqno}</td>
										<th scope="row" class="active">경기 시간</th>
										<td>${gameRecord.gameStartTime}~${gameRecord.gameEndTime}</td>
									</tr>
									<tr>
										<th scope="row" class="active">경기 날짜</th>
										<td>${gameRecord.gameDate}</td>
										<th scope="row" class="active">경기 형태</th>
										<td>${gameRecord.gameStyle}</td>
									</tr>
									<tr>
										<th scope="row" class="active" >팀 1 V/S 팀 2</th>
										<td colspan="3">${gameRecord.team1Name} V/S ${gameRecord.team2Name}</td>
									</tr>
									<tr>
										<td colspan="4" class="view_text" id="view_text">${gameRecord.gameScore}</td>
									</tr>
								</tbody>
							</table>
						</div>
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
						<li><a href="/myGameRecord">매칭</a></li>
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