<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link href="/myPage/css/myGameInsert.css" rel="stylesheet" media="all">
<link rel="stylesheet" href="/myPage/css/main.css" />
<link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">
<link href="/myPage/vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="/myPage/vendor/mdi-font/material-design-iconic-font.min.css" rel="stylesheet" media="all">
<link href="/myPage/css/theme.css" rel="stylesheet" media="all">

<title>Kick Off: 마이페이지</title>

<!-- 
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
	-->

</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<header id="header">
					<input type="button" onclick="location.href='main'" class="kickoff" value="Kick Off" /><br>
					<a href="/myGameInsert" class="logo"><strong>매칭기록</strong></a>
				</header>
				<section class="section">
					<form id="frm" name="frm" method="post" action = "/myGameRecordList">
						<div class="article-container">
							<div class="all-container">
								<div class="content-wrap">
									<div class="wrap">
										<div class="subject">경기 번호</div>
									</div>
									<div class="wrap">
										<div class="content">${gameRecord.gameSeqno}</div>
									</div>
									<div class="wrap">
										<div class="subject">경기 시간</div>
									</div>
									<div class="wrap">
										<div class="content">${gameRecord.gameStartTime} ~ ${gameRecord.gameEndTime}</div>
									</div>
								</div>
								<div class="content-wrap">
									<div class="wrap two">
										<div class="subject">경기 날짜</div>
									</div>
									<div class="wrap two">
										<div class="content">${gameRecord.gameDate}</div>
									</div>
									<div class="wrap two">
										<div class="subject">경기 형태</div>
									</div>
									<div class="wrap two">
										<div class="content">${gameRecord.gameStyle}</div>
									</div>
								</div>
								<div class="content-wrap">
									<div class="wrap">
										<div class="subject">경기 장소</div>
									</div>
									<div class="wrap">
										<div class="content">${gameRecord.placeName}</div>
									</div>
									<div class="wrap">
										<div class="subject">매칭 상태</div>
									</div>
									<div class="wrap">
										<div class="content">${gameRecord.gameStatus}</div>
									</div>
								</div>
								<div class="content-wrap second sec">
									<div class="wrap two">
										<div class="subject">팀 1 vs 팀 2</div>
									</div>
									<div class="wrap two">
										<div class="content nyam">${gameRecord.team1Name} v/s ${gameRecord.team2Name}</div>
									</div>
								</div>
								<div class="content-wrap second">
									<div class="wrap">
										<div class="subject ">경기 점수</div>
									</div>
									<div class="wrap three">
										<input type="number" class="inputbox num1" name = "gameScore1" required />
										<div class="colons">&#58;</div>
										<input type="number" class="inputbox num2" name = "gameScore2" required />
										<input type = "hidden" name = "gameSeqno" value = "${gameRecord.gameSeqno}" />
									</div>
								</div>
							<button type="submit" class="btn_submit" >기록하기</button>
							</div>
						</div>
					</form>
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
	<script src="/myPage/vendor/jquery-3.2.1.min.js"></script>
	<script src="/myPage/vendor/bootstrap-4.1/popper.min.js"></script>
	<script src="/myPage/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<script src="/myPage/vendor/select2/select2.min.js"></script>
	<script src="/myPage/js/reservationMain.js"></script>

</body>
</html>