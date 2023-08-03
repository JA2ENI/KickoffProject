<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String number = (String)session.getAttribute("smsConfirmNum");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
	
	<link rel="stylesheet" href="/myPage/css/myInfo.css">
	<link rel="stylesheet" href="/myPage/css/main.css" />
	
	<title>Kick Off: 마이페이지</title>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<header id="header">
					<input type="button" onclick="location.href='main'" class="kickoff" value="Kick Off"/>
					<br>
					<a href="/myInfoCheck" class="logo"><strong>회원 정보 수정</strong></a>
				</header>
				<section class="checkout spad">
					<div class="container">
						<div class="checkout__form">
							<form role="frm" id="frm" name="frm" action="" method="POST">
								<div class="row-request-container">
									<div class="col-lg-8-1 col-md-6">
										<div class="checkout__input__request">
											<p>아이디<span>*</span></p>
											<input type="text" class="inputBox id" name="userId" value="${userInfo.userId}" readonly/>
										</div>
										<div class="row mail">
											<div class="col-lg-6">
												<div class="checkout__input__request mail">
													<p>이메일<span>*</span></p>
													<input type="text" id="userEmail" class="inputBox mail" name="mail" value="${userInfo.mail}"/>
												</div>
											</div>
											<p class="atSign">@</p>
											<div class="col-lg-6">
												<div class="checkout__input__request email">
													<select id="emailAddress" name="emailAddress" class="inputBox email" onChange="getEmailAddress(this)">
					                                	<option value="">이메일 선택</option>
					                                	<option value="naver.com" <c:if test="${userInfo.email eq 'naver.com'}">selected</c:if>>naver.com</option>
					                                	<option value="kakao.com" <c:if test="${userInfo.email eq 'kakao.com'}">selected</c:if>>kakao.com</option>
					                                	<option value="gmail.com" <c:if test="${userInfo.email eq 'gmail.com'}">selected</c:if>>gmail.com</option>
					                                	<option value="daum.net"  <c:if test="${userInfo.email eq 'daum.net'}" >selected</c:if>>daum.net </option>
					                                	<option value="nate.com"  <c:if test="${userInfo.email eq 'nate.com'}" >selected</c:if>>nate.com </option>
					                                	<option id="" value="direct">직접입력</option>
					                                </select>
												</div>
												<div class="checkout__input__request inputEmail">
				                                	<input type="text" id="selboxDirect" name="selboxDirect" class="inputBox email" onChange="getSelboxDirect()"/>
				                                </div>
				                                <input type="hidden" id="email" name="email" value="${userInfo.email}"/>
											</div>
										</div>
										<div class="checkout__input__request">
											<p>이름<span>*</span></p>
											<input type="text" class="inputBox name" name="userName" value="${userInfo.userName}" readonly/>
										</div>
										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input__request">
													<p>연도<span>*</span></p><!-- placeholder="년(4자)" -->
													<input type="number" id="year" class="inputBox" name="year" value="${userInfo.year}"/>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input__request">
													<p>월<span>*</span></p><!-- placeholder="12" -->
													<input type="number" id="month" class="inputBox" name="month" value="${userInfo.month}"/>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input__request">
													<p>일<span>*</span></p><!-- placeholder="25" -->
													<input type="number" id="day" class="inputBox" name="day" value="${userInfo.day}"/>
												</div>
											</div>
										</div>
										<div class="checkout__input__request">
											<p>휴대폰 번호<span>*</span></p>
											<div class="phone_content">
												<input type="text" id="phone" class="inputBox phone" value="${userInfo.userPhoneNumber}" maxlength="13"/>
												<input type="hidden" id="phoneNumber" name="userPhoneNumber" value="${userInfo.userPhoneNumber}"/>
												<input type="button" id="sendPhone" class="checkPhone phone" onclick="javascript:alert('test : ' + ${number});" value="번호 인증"/>
											</div>
										</div>
										<div class="checkout__input__request">
											<div id="checkPhoneBox" class="phone_content">
												<input type="text" id="checkPhone" class="inputBox phone" name="checkPhone"/>
												<input type="hidden" id="certificationNum" name="certificationNum" value="certificationNum"/>
												<input type="button" id="checkPhoneBtn" class="checkPhone phone" onclick="" value="확인"/>
											</div>
										</div>
										<div class="checkout__input__request address">
											<p>도로명 주소<span>*</span></p>
											<input type="text" id="userAddress" class="inputBox" name="userAddress" value="${userInfo.userAddress}" onclick="kakaopost()">
										</div>
										<div class="btn-container">
 											<input type="button" id="update" class="update" onclick="updateInfoCheck()" value="수정"/>
										</div>
										<div class="">
											<a href="javascript:void(0);" id="delete" class="delete" onclick="userDelete()">회원 탈퇴</a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
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
						<li><a href="/myMessage">메시지</a></li>
						<li><a href="/myGameRecordList">매칭</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	
	<!-- Kakao postcode -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- Scripts -->
	<script src="/myPage/js/jquery.min.js"></script>
	<script src="/myPage/js/skel.min.js"></script>
	<script src="/myPage/js/util.js"></script>
	<script src="/myPage/js/mypage.js"></script>
	<script src="/myPage/js/main.js"></script>

</body>
</html>