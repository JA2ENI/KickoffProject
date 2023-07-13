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

<link href="/team/css/teamList.css" rel="stylesheet" />


<title>Kick off: 풋살팀 모집</title>
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
						<div class="title">TEAM</div>
						<div class="content-container">
							<div class="title-wrap">
								<div class="subject team">팀</div>
								<div class="subject area">지역</div>
							</div>
							<c:forEach var="list" items="${viewAll}" varStatus="num">
							   <button type="button" class="detail" onclick="btnTeam(${list.teamId}, ${num.index});">
							       <div class="content-wrap">
							           <div class="content team"><c:out value="${list.teamName}" /></div>
							           <div class="content area"><c:out value="${list.teamLocal}" /></div>
							       </div>
							   </button>
							   <input type="hidden" id="teamNum${num.index}" value="${list.teamName}"/>
							</c:forEach>
							<!-- paging -->
							<div style="display: block; margin-top:10px; text-align: center;">		
								<c:if test="${paging.startPage != 1 }">
									<a href="/team?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a href="/team?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a href="/team?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
							</div>
							<!-- paging end -->
						</div>
					</div>
				</article>
				<article id="boxDetail" class="article-container two">
					<div class="item-wrap">
						<div class="wrap">
						<c:choose>
						    <c:when test="${not empty userId and userId eq teamInfo.leaderId}">
						    	<div class="title board" style="width:80%">TEAM BOARD</div>
						        <a href="/teamInsert" class="btn-teamInsert">모집 등록</a>
						    </c:when>
						    <c:otherwise>
						        <div class="title board">TEAM BOARD</div>
						    </c:otherwise>
						</c:choose>
						</div>
						<div class="content-container">
							<div class="title-wrap">
								<div class="subject team2">팀</div>
								<div class="subject date">모집일자</div>
								<div class="subject total">모집인원</div>
								<div class="subject gender">모집성별</div>
								<div class="subject status">모집상태</div>
							</div>
							<!-- paging 추가하기 -->
							<c:forEach var="board" items="${teamBoard}">
							<button type="button" class="detail" onclick="location.href='/teamDetail?teamSeqNo=${board.teamSeqNo}';">
								<div class="content-wrap">
									<div class="content team2"><c:out value="${board.teamName}" /></div>
									<div class="content date">~<c:out value="${board.teamEndDate}" /></div>
									<div class="content total"><c:out value="${board.teamNumber}" /></div>
									<div class="content gender"><c:out value="${board.teamGender}" /></div>
									<div class="content status"><c:out value="${board.teamStatus}" /></div>
								</div>
							</button>
							</c:forEach>
						</div>
					</div>
				</article>
				<!-- Team 모집글 -->
				  <article id="boxDetail2" class="article-container two">
                    <div class="item-wrap">
                        <div class="btn-box">
                            <div class="title teamName"></div>
                            <div class="x-btn">
                                <i class="i">X</i>
                            </div>
                        </div>
                        <div class="content-container">
                            <div class="title-wrap">
                                <div class="subject team2">팀</div>
                                <div class="subject date">모집일자</div>
                                <div class="subject total">모집인원</div>
                                <div class="subject gender">모집성별</div>
                                <div class="subject status">모집상태</div>
                            </div>
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