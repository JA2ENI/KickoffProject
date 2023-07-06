<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>KickOff: 업체 회원정보 수정</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
		<!--[if lte IE 8]><script src="/emp/js/ie/html5shiv.js"></script><![endif]-->
		<link rel = "stylesheet" href = "/emp/css/fixInfo.css">
		<link rel="stylesheet" href="/emp/css/main.css" />
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script>
    $(document).ready(function() {
      $('#checkEmpNum').click(function() {
        var empNum = $('#empNumInput').val();
        if (empNum) {
          authenticateEmpNum(empNum);
        }
      });

      function authenticateEmpNum(empNum) {
        $.ajax({
          url: 'https://www.data.go.kr/data/15081808/openapi.do', // API 엔드포인트 URL
          type: 'POST',
          dataType: 'json',
          data: {
            'serviceKey': 'g5kss8B127iH%2BqCnOL%2B3SpgFPUssF8IPJLv%2BP4LY%2BTFMRcCL6P6l4y6su6WUJgrHxJI0PtU9dGeda5hHq70Kag%3D%3D', 
            'empNum': empNum
          },
          success: function(response) {
            if (response.resultCode == '00') {
              alert('사업자 번호가 인증되었습니다.');
            } else {
              alert('사업자 번호 인증에 실패했습니다. 다시 시도해주세요.');
            }
          },
          error: function() {
            alert('사업자 번호 인증 요청에 실패했습니다.');
          }
        });
      }
    });
  </script>
	</head>
	<body>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<input type="button" onclick="location.href='main'" class="kickoff" value="Kick Off"/>
									<br>
									<strong>회원정보 수정</strong>
								</header>
							
							<!-- Begin Page Content -->
			                <section>
			                	<div class="container-fluid">
			                	<div class="checkout spad">
									<div class="container">
									<div class="checkout__form">
									<form role="form" id="frm" name="frm" action="/fixInfoResult" method="POST">
										<div class="row-request-container">
											<div class="col-lg-8-1 col-md-6">
												<div class="checkout__input__request">
													<p>아이디<span>*</span></p>
													<input type="text" class="inputBox id" name="empId" value="${empInfo.empId}" readonly/>
												</div>
											<div class="row mail">
												<div class="col-lg-6">
												<div class="checkout__input__request mail">
													<p>이메일<span>*</span></p>
													<input type="text" id="empEmail" class="inputBox mail" name="mail" value="${map.empEmail}"/>
												</div>
												</div>
											<p class="atSign">@</p>
											<div class="col-lg-6">
												<div class="checkout__input__request email">
													<select id="emailAddress" class="inputBox email" name="email">
					                                	<option value="">이메일 선택</option>
					                                	<option value="naver.com" <c:if test="${map.email eq 'naver'}">selected</c:if>>naver.com</option>
					                                	<option value="kakao.com" <c:if test="${map.email eq 'kakao'}">selected</c:if>>kakao.com</option>
					                                	<option value="gmail.com" <c:if test="${map.email eq 'gmail'}">selected</c:if>>gmail.com</option>
					                                	<option value="daum.net"  <c:if test="${map.email eq 'daum'}" >selected</c:if>>daum.net </option>
					                                	<option value="nate.com"  <c:if test="${map.email eq 'nate'}" >selected</c:if>>nate.com </option>
					                                	<option value="direct">직접입력</option>
					                                </select>
												</div>
												<div class="checkout__input__request inputEmail">
				                                	<input type="text" id="selboxDirect" class="inputBox email" name="email" />
				                                </div>
											</div>
										</div>
										<div class="checkout__input__request">
											<p>업체 이름<span>*</span></p>
											<input type="text" class="inputBox name" name="empName" value="${empInfo.empName}" readonly/>
										</div>
										<div class="checkout__input__request">
											<p>사업자 번호 인증<span>*</span></p>
											<input type="text" id="empNumInput" class="number_content"/>
											<input type="button" id="checkEmpNum" class="checkEmpNum" value="사업자 번호 인증"/>
										</div>
										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input__request">
													<p>설립 연도<span>*</span></p><!-- placeholder="2022" -->
													<input type="text" id="year" class="inputBox" name="year" value="${map.year}" maxlength="4"/>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input__request">
													<p>월<span>*</span></p><!-- placeholder="12" -->
													<input type="text" id="month" class="inputBox" name="month" value="${map.month}" maxlength="2"/>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input__request">
													<p>일<span>*</span></p><!-- placeholder="25" -->
													<input type="text" id="day" class="inputBox" name="day" value="${map.day}" maxlength="2"/>
												</div>
											</div>
											<input type="hidden" id="" name="empBirthdate" value=""/>
										</div>
										<div class="checkout__input__request">
											<p>업체 번호<span>*</span></p>
											<div class="phone_content">
												<input type="text" id="phone" class="inputBox phone" name="userPhoneNumber" value="${userInfo.userPhoneNumber}" maxlength="13"/>
												<input type="button" id="sendPhone" class="checkPhone phone" onclick="javascript:alert('test : ' + ${number});" value="번호 인증"/>
											</div>
										</div>
										<div class="checkout__input__request">
											<div id="checkPhoneBox" class="phone_content">
												<input type="text" id="checkPhone" class="inputBox phone" name="checkPhone"/>
												<input type="button" id="checkPhoneBtn" class="checkPhone phone" onclick="" value="확인"/>
											</div>
										</div>
										<div class="checkout__input__request address">
											<p>도로명 주소<span>*</span></p>
											<input type="text" id="empAddress" class="inputBox" name="empAddress" value="${empInfo.empAddress}" onclick="kakaopost()">
										</div>
										<div class="btn-container">
 											<input type="submit" id="update" class="update" value="수정"/>
										</div>
										<div class="btn-container">
											<input type="button" id="empDelete" class="empDelete" onclick = "location.href='/empDelete';"value="회원 탈퇴"/>
										</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
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
		
		
		<script>
		$(function(){
			$("#selboxDirect").hide();
			
			$("#emailAddress").change(function() {

				if($("#emailAddress").val() == "direct") {
					$("#emailAddress").hide();
					$("#selboxDirect").show();
		
				}  else {
		
					$("#selboxDirect").hide();
		
				}

			}) 
		});
	</script>
	
	<script>
	$('#sendPhoneNumber').click(function(){
	    let phoneNumber = $('#inputPhoneNumber').val();
	    
            Swal.fire({
                text: '인증번호 발송 완료!',
            });
	
	    $.ajax({
	        type: "GET",
	        url: "/check/sendSMS",
	        data: {
	            "phoneNumber" : phoneNumber
	        },
	        success: function(res){
	            $('#confirmButton').click(function(){
	                if($.trim(res) == $('#inputCertifiedNumber').val()){
	                    Swal.fire(
	                        '인증성공!',
	                        '휴대폰 인증이 정상적으로 완료되었습니다.',
	                        'success'
	                    ).then(function() {
                        	
                        	// 아이디 입력과 휴대폰 인증이 완료되면 아이디 찾기 버튼 활성화
                        	$('#sign').prop('disabled', false);
                        });

	                } else {
	                    Swal.fire({
	                        icon: 'error',
	                        title: '인증오류',
	                        text: '인증번호가 올바르지 않습니다!',
	                    });
	                }
	            });
	        }
	    });
	});
	</script>
	
	<!-- Kakao postcode -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function kakaopost() {
			var width = 500;
			var height = 460;
			
		    new daum.Postcode({
		    	width: width,
		    	height: height,
		    	
		        oncomplete: function(data) {
		           document.querySelector("#empAddress").value =  data.address;
		        }
		    }).open({
		    	left: (window.screen.width / 2) - (width / 2),
		    	top: (window.screen.height / 2) - (height / 2)
		    });
		}
	</script>
	
		<!-- Scripts -->
			<script src = "/login/js/loginEmp.js"></script>
			<script src="/emp/js/jquery.min.js"></script>
			<script src="/emp/js/skel.min.js"></script>
			<script src="/emp/js/util.js"></script>
			<script src="/emp/js/fixInfo.js"></script>
			<!--[if lte IE 8]><script src="/emp/js/ie/respond.min.js"></script><![endif]-->
			<script src="/emp/js/main.js"></script>

	</body>
</html>