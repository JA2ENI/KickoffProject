<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<link rel="stylesheet" href="/includes/css/styleApply.css">
<link rel="stylesheet" href="/main/css/vendor/icomoon/style.css">

<link href="/team/css/teamManage.css" rel="stylesheet" />

<title>Kick off: 풋살팀 관리</title>
</head>
<body>
	<%@include file="/includes/header.jsp"%>
	<section>
		<div class="menu">
			<a href="/team" class="text-menu" >리스트</a>
			<a href="/teamManage" class="text-menu">나의 팀</a>
			<a href="/teamRank" class="text-menu">랭킹</a>
		</div>
		<div class="container">
			<div class="root-container">
				<article class="article-container one">
					<div class="item-wrap">
						<!-- <div class="wrap"> -->
							<div class="title">TEAM INFO</div>
							<!-- <a href="/teamUpdate" class="team-update">팀 정보 수정</a>
						</div>  -->
						
						<div class="content-container1">
						<c:forEach var="list" items="${teamDetail}">
							<div class="title-wrap">
								<div class="subject team"><c:out value="${list.teamName}" /></div>
							</div>
							<div class="detail">
								<div class="content-wrap1">
									<div class="content title"><img class="img-info" src="/team/img/icons8-rank-100.png"></div>
									<div class="content chart">
										<c:out value="${list.teamRank != 0 ? list.teamRank : 'unRank'}" /></div>
									<div class="content title"><img class="img-info" src="/team/img/icons8-level-96.png"></div>
									<div class="content chart"><c:out value="${list.teamLevel}" /></div>
								</div>
								<div class="content-wrap2">
									<div class="content title"><img class="img-info" src="/team/img/icons8-team-100.png"></div>
									<div class="content chart"><c:out value="${list.teamNumber}" /> 명</div>
									<div class="content title"><img class="img-info" src="/team/img/icons8-gender-100.png"></div>
									<div class="content chart"><c:out value="${list.teamGender}" /></div>
								</div>
								<div class="content-wrap3">
								<div class="content title"><img class="img-info" src="/team/img/icons8-location-100.png"></div>
									<div class="content chart"><c:out value="${list.teamLocal}" /></div>
									<div class="content title"><img class="img-info" src="/team/img/free-icon-age-5670755.png"></div>
									<div class="content chart"><c:out value="${list.teamAge}" /></div>
								</div>
								<div class="content-wrap4">
									<div class="content title"><img class="img-info" src="/team/img/icons8-blockchain-grid-100.png"></div>
									<div class="content chart"><c:out value="${list.teamFormation}" /></div>
									<div class="content title"><img class="img-info" src="/team/img/icons8-color-100.png"></div>
									<div class="content chart"><c:out value="${list.teamColor}" /></div>
								</div>
								<div class="content-wrap5">
									<div class="content title"><img class="img-info" src="/team/img/icons8-day-100.png"></div>
									<div class="content chart"><c:out value="${list.teamDay}" /></div>
									<div class="content title"><img class="img-info" src="/team/img/icons8-time-100.png"></div>
									<div class="content chart"><c:out value="${list.teamTime}" /></div>
								</div>
								<div class="content-wrap6">
									<div class="content memo1"><img class="img-info" src="/team/img/icons8-memo-100.png"></div>
									<div class="content memo2"><c:out value="${list.teamIntro}" /></div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</article>
				<article id="boxDetail" class="article-container two">
					<div class="item-wrap">
						<div class="title board">TEAM MEMBER</div>
						
						<div class="content-container">
							<div class="title-wrap">
								<div class="subject img"></div>
								<div class="subject type">구분</div>
								<div class="subject name">이름</div>
								<div class="subject position">포지션</div>
								<div class="subject gender">성별</div>
								<div class="subject manage">관리</div>
							</div>
							
							<c:if test="${not empty teamCreationMessage}">
							    <%@ include file="teamCreationMessage.jsp" %>
							</c:if>
							
							<c:forEach var="member" items="${memberList}">
							<div class="detail">
								<div class="content-wrap">
									<div class="content img"><img class="img-person" src="/team/img/icons8-person-100.png"></div>
									<div class="content type"><c:out value="${member.TEAM_TYPE}" /></div>
									<div class="content name"><c:out value="${member.USER_NAME}" /></div>
									<div class="content position"><c:out value="${member.USER_MAIN_POSITION}" /> /
											<c:out value="${member.USER_SUB_POSITION != null ? member.USER_SUB_POSITION : '-'}" /></div>
									<div class="content gender"><c:out value="${member.USER_GENDER}" /></div>
									<div class="content manage">
									<c:if test="${userId eq teamButton.leaderId}">
										 <button type="button" class="btn-memberDelete" onclick="deleteMember('${member.USER_ID}')">방출하기</button>
									</c:if>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</article>
			</div>
		</div>
	</section>
</body>


<!-- footer -->
<%@include file="/includes/footer.jsp"%>

<!-- script -->
<script src="/includes/js/jquery-3.3.1.min.js"></script>
<script src="/includes/js/jquery.lettering.js"></script>
<script src="/includes/js/jquery.sticky.js"></script>
<script src="/includes/js/ScrollMagic.min.js"></script>
<script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
<script src="/includes/js/main.js"></script>
<script src="/team/js/teamList.js"></script>

</html>