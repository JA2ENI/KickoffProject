<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Kick Off: 메시지 전송</title>
	<link rel="stylesheet" href="/message/css/common.css">
	<!-- 쪽지작성 페이지의 전용 스타일 -->
	<link rel="stylesheet" href="/message/css/message.css">
	<link rel = "stylesheet" href = "/includes/css/footer.css" />
	<link rel="stylesheet" href="/includes/css/style.css">
	<link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">

	<script src="/includes/js/jquery-3.3.1.min.js"></script>

	<script src="/includes/js/jquery.lettering.js"></script>
	<script src="/includes/js/jquery.sticky.js"></script>


	<script src="/includes/js/ScrollMagic.min.js"></script>
	<script
			src="/includes/js/scrollmagic.animation.gsap.min.js"></script>


	<script src="/includes/js/main.js"></script>
	<script>
		${msgScript}
	</script>
</head>
<body>
<header>
	<%@include file="/includes/header.jsp"%>
</header>
<section>
	<div id="main_content" style="padding: 50px;margin:20px;">
		<div id="message_box">
			<h3 id="write_title">메시지 보내기</h3>
			<!-- message_insert.php를 통해 DB의 message테이블에 저장 : 송신id는 get방식으로 -->
			<form method="post" name="message_form">
				<div id="write_msg">
					<ul>
						<li>
							<span class="col1">용병 게시글 번호 : </span>
							<span class="col2"><input type="number" name="helperSeqno" id = "helperSeqno" disabled value ="${helperSeqNo}" required /></span>
						</li>
						<li>
							<span class="col1">보내는 사람 : </span>
							<span class="col2"><input type="text" name="messageSendId" id ="messageSendId" disabled value = "${messageUserId}" required /></span>
						</li>
						<li>
							<span class="col1">수신 아이디 : </span>
							<span class="col2"><input type="text" name="messageReceiveId" id = "messageReceiveId" disabled value ="${message.userId}" required /></span>
						</li>
						<li>
							<span class="col1">제목 : </span>
							<span class="col2"><input type="text" name="messageTitle" id = "messageTitle"></span>
						</li>
						<li id="textarea">
							<span class="col1">내용 : </span>
							<span class="col2"><textarea name="messageContent" id = "messageContent"></textarea></span>
						</li>
					</ul>
					<!-- 서밋버튼 -->
					<input type="submit" value="보내기">
				</div>
			</form>
		</div>

	</div>

</section>

<footer>
	<%@include file="/includes/footer.jsp"%>
</footer>
</body>
</html>
