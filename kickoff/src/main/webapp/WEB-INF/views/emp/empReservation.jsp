<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Kick Off: 업체 예약 관리</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="/emp/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/emp/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="/emp/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="/emp/css/ie8.css" /><![endif]-->
		
	    <!-- Bootstrap CSS
	    <link href="/emp/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet"> -->
	
	    <!-- Vendor CSS-->
	    <link href="/emp/vendor/select2/select2.min.css" rel="stylesheet" media="all">
	    <link href="/emp/vendor/mdi-font/material-design-iconic-font.min.css" rel="stylesheet" media="all">

	    <!-- Main CSS-->
	    <link href="/emp/css/empReservation/theme.css" rel="stylesheet" media="all">
	</head>
	<body>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
                                    <input type="button" onclick="location.href='main'" class="kickoff-logo" value="Kick Off"/>
                                    <br>
									<strong>예약 관리</strong>
								</header>
								
								<section>
				                	<div class="container-fluid">
										<div class="table-data__tool">
		                                    <div class="table-data__tool-left">
		                                        <div class="rs-select2--light rs-select2--md">
		                                            <select class="js-select2" name="property">
		                                                <option selected="selected">예약 현황</option>
		                                                <option value="">등록된 것만</option>
		                                                <option value="">취소된 것만</option>
		                                            </select>
		                                            <div class="dropDownSelect2"></div>
		                                        </div>
		                                        <div class="rs-select2--light rs-select2--sm">
		                                            <select class="js-select2" name="time">
		                                                <option selected="selected">인원 순</option>
		                                                <option value="">최대 인원</option>
		                                                <option value="">최소 인원</option>
		                                            </select>
		                                            <div class="dropDownSelect2"></div>
		                                        </div>
		                                    </div>
		                                    <div class="table-data__tool-right">
		                                        <button class="au-btn au-btn-icon au-btn--green au-btn--small" onclick="location.href='reservationInsert'">예약 등록</button>
		                                        <div class="rs-select2--dark rs-select2--sm rs-select2--dark2">
		                                            <select class="js-select2" name="type">
		                                                <option selected="selected">정렬 방식</option>
		                                                <option value="">최신 순</option>
		                                                <option value="">기본 순</option>
		                                            </select>
		                                            <div class="dropDownSelect2"></div>
		                                        </div>
		                                    </div>
	                                	</div>
		                                <div class="table-responsive table-responsive-data2">
		                                    <table class="table table-data2">
		                                        <thead>
		                                            <tr>
		                                                <th>
		                                                    <label class="au-checkbox">
		                                                        <input type="checkbox">
		                                                        <span class="au-checkmark"></span>
		                                                    </label>
		                                                </th>
		                                                <th>풋살장</th>
		                                                <th>예약자 아이디</th>
		                                                <th>예약 등록일</th>
		                                                <th>예약 날짜</th>
		                                                <th>예약 상태</th>
		                                                <th></th>
		                                                <th></th>
		                                            </tr>
		                                        </thead>
		                                        <tbody>
		                                            <c:forEach var="list" items="${table}">
		                                            <tr class="tr-shadow">
		                                                <td>
		                                                    <label class="au-checkbox">
		                                                        <input type="checkbox">
		                                                        <span class="au-checkmark"></span>
		                                                    </label>
		                                                </td>
		                                                <td><c:out value="${list.reservationPlaceName}"/></td>
		                                                <td>
		                                                    <span class="block-email"><c:out value="${list.userId}"/></span>
		                                                </td>
		                                                <td class="desc"><c:out value="${list.reservationRegDate}"/></td>
		                                                <td><c:out value="${list.reservationDate}"/></td>
		                                                <td>
		                                                    <span class="status--process"><c:out value="${list.reservationStatus}"/></span>
		                                                </td>
		                                                <td><c:out value="${list.reservationNumber}"/></td>
		                                                <td>
		                                                    <div class="table-data-feature">
		                                                        <button type= "button" class= "au-btn au-btn-icon au-btn--green au-btn--small" onclick="eng()" id="au-btn au-btn-icon au-btn--green au-btn--small" title="Detail">상세보기</button>
		                                                    </div>
		                                                </td>		                                                
		                                            </tr>
		                                            </c:forEach>
		                                            <tr class="spacer"></tr>
		                                            <tr class="tr-shadow">	
		                                                       
		                                        </tbody>
		                                    </table>
		                                     <div class="black_bg"></div>
														<div class="modal_wrap">
															<button type = "reset" onclick="offClick()" class="reservationClose">x</button>
															
															<div>
																<table class = "tablehorizon">
																<c:forEach var="modal" items="${table}">
																	<tr class="horizontr">
																		<th class="horizonth">예약자 ID</th>	<td class="horizontd"><c:out value="${modal.userId}"/></td>
																	</tr>
																	<tr class="horizontr">														
																		<th class="horizonth">예약 풋살장</th> <td class="horizontd"><c:out value="${modal.reservationPlaceName}"/></td>
																	</tr>
																	<tr class="horizontr">																		
																		<th class="horizonth">예약 날짜</th> <td class="horizontd"><c:out value="${modal.reservationDate}"/></td>
																	</tr>
																	<tr class="horizontr">																		
																		<th class="horizonth">예약 인원</th> <td class="horizontd"><c:out value="${modal.reservationNumber}"/></td>
																	</tr>
																	<tr class="horizontr">																		
																		<th class="horizonth">예약 상태</th> <td class="horizontd"><c:out value="${modal.reservationStatus}"/></td>
																	</tr>
																	<tr class="horizontr">																		
																		<th class="horizonth">예약 등록일</th>	<td class="horizontd"><c:out value="${modal.reservationRegDate}"/></td>
																	</tr>
																	<tr class="horizontr">																			
																		<th class="horizonth">예약 시작 시간</th> <td class="horizontd"><c:out value="${modal.reservationStartTime}"/></td>
																	</tr>
																	<tr class="horizontr">																			
																		<th class="horizonth">예약 종료 시간</th> <td class="horizontd"><c:out value="${modal.reservationEndTime}"/></td>
																	</tr>
																	<tr class="horizontr">																			
																		<th class="horizonth">예약 가격</th> <td class="horizontd"><c:out value="${modal.reservationPrice}"/></td>
																	</tr>
																	<tr class="horizontr">																		
																		<th class="horizonth">기타 사항</th> <td class="horizontd"><c:out value="${modal.reservationComment}"/></td>
																	</tr>
																	</c:forEach>																																													
																</table>
																</div>
															</div>	                       		                                
		                                </div>
                                <!-- END DATA TABLE -->
                                </div>
					        </section>
					        </div>
                        </div>
				   

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="/empReservation">예약관리</a></li>
										<li><a href="/myBoard">내 게시글</a></li>
										<li><a href="/fixInfoCheck">회원 정보 수정</a></li>
										<li>
											<!-- opener 에 원래 active 열고 닫게 할 수 있어야 함 -->
											<span class="opener">풋살장 관리</span>
											<ul>
												<li><a href="/empFutsal">풋살장 등록</a></li>
												<li><a href="/empFutsalFix">풋살장 조회</a></li>
											</ul>
										</li>										
									</ul>
								</nav>

						</div>
					</div>
				</div>
		<!-- Scripts -->
            <script src="/emp/js/jquery.min.js"></script>
			<script src="/emp/js/skel.min.js"></script>
			<script src="/emp/js/util.js"></script>
			<script src = "/emp/js/modal.js"></script>
			<!--[if lte IE 8]><script src="/emp/js/ie/respond.min.js"></script><![endif]-->
            <script src="/emp/js/main.js"></script>
		    <!-- <script src="/emp/vendor/jquery-3.2.1.min.js"></script> -->
		    <!-- Bootstrap JS
		    <script src="/emp/vendor/bootstrap-4.1/popper.min.js"></script>
		    <script src="/emp/vendor/bootstrap-4.1/bootstrap.min.js"></script> -->
		    <!-- Vendor JS
		    <script src="/emp/vendor/select2/select2.min.js"></script>   -->

	</body>
</html>