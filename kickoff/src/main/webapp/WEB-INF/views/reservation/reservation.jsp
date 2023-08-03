<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Kick off: 풋살장 예약 목록</title>
    <link href="https://fonts.google.com/noto/specimen/Noto+Sans+KR?subset=korean&noto.script=Kore" rel="stylesheet">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="/reservation/assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">
    <link href="/reservation/css/styles.css" rel="stylesheet" />
    <link href="/includes/css/style.css" rel="stylesheet" />
</head>
<body>
	<div class="header-container">
		<%@include file="/includes/header.jsp"%>
	</div>
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">풋살장 예약</h1>
                <p class="lead fw-normal text-white-50 mb-0">원하는 풋살장 쉽고 편리하게 예약하세요</p>
            </div>
        </div>
    </header>
	<section class="py-5">
    	<div class="container px-4 px-lg-5">
    		<div class="container wrap">
	    		<div class="count-text">
	    			총 예약모집글 수 <b class="count-text count">${listCnt}</b>
	    		</div>
				<c:if test="${empId != null}">
					<div class="card-footer pt-0 border-top-0 bg-transparent">
						<div class="text-center insert">
							<a class="court-insert" href="reservationInsertForm">풋살장 등록</a>
						</div>
					</div>
				</c:if>
			</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            	<c:choose>
            		<c:when test="${fn:length(reservationList) > 0}">
            			<c:forEach var="emp" items="${reservationList}">
							<div class="col mb-5">
								<div class="card h-100">
									<img class="card-img-top" src="${emp.IMG_PATH}${emp.IMG_NAME}"/>
									<div class="card-body p-4">
										<div class="text-center">
											<div class="placeName">${emp.RESERVATION_PLACE_NAME}</div>
											<div class="info">${emp.RESERVATION_DATE}</div>
											<div class="info">${emp.RESERVATION_PRICE}원</div>
										</div>
									</div>
									<c:if test="${emp.RESERVATION_STATUS  == '예약 완료'}">
										<div id="status" class="status completed">예약 완료</div>
									</c:if>
									<c:if test="${emp.RESERVATION_STATUS == '예약 취소'}">
										<div id="status" class="status canceled">예약 취소</div>
									</c:if>
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<c:choose>
											<c:when test="${userId != null || empId != null}">
												<div class="text-center">
													<a class="btn btn-outline-dark mt-auto" href="/reservationDetail?reservationNo=${emp.RESERVATION_NO}">상세보기</a>
												</div>
											</c:when>
											<c:otherwise>
												<div class="text-center">
													<a class="btn btn-outline-dark mt-auto" onclick="check()">상세보기</a>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="listNone">
							현재 예약 가능한 풋살장이 없습니다.
						</div>
					</c:otherwise>
				</c:choose>
            </div>
        </div>
	    <!-- Paging -->
		<div class="paging-wrap container">
			<div class="paging-container">
				<c:if test="${pagination.curPage ne 1}">
		    		<a href="/reservation?curPage=${pagination.prevPage}" class="pageText">&lt;Prev</a>
		    	</c:if> 
				<c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage}">
		        	<c:choose>
		           		<c:when test="${pageNum eq pagination.curPage}">
		               		<a href="/reservation?curPage=${pageNum}" class="pageText">${pageNum}</a> 
		           		</c:when>
		           		<c:otherwise>
		               		<a href="/reservation?curPage=${pageNum}" class="pageText">${pageNum}</a> 
		           		</c:otherwise>
		   			</c:choose>
		   		</c:forEach>
		   		<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
		   			<a href="/reservation?curPage=${pagination.nextPage}" class="pageText">Next&gt;</a>
		   		</c:if> 
		   	</div>
		</div>
		<!-- Paging END -->
 	</section>	
 	
    <!-- Footer-->
    <%@include file="/includes/footer.jsp"%>
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/includes/js/jquery-3.3.1.min.js"></script>
    <script src="/includes/js/jquery.lettering.js"></script>
    <script src="/includes/js/jquery.sticky.js"></script>
    <script src="/includes/js/ScrollMagic.min.js"></script>
    <script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>
    <script src="/reservation/js/reservationList.js"></script>
    <script src="/reservation/js/validation.js"></script>
    <script src="/includes/js/main.js"></script>
</body>
</html>
