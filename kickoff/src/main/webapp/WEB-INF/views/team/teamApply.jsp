<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Kick Off: 팀 지원</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/teamApply/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/teamApply/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/teamApply/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/teamApply/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/teamApply/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/teamApply/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/teamApply/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/teamApply/css/style.css" type="text/css">
    
    <link rel="stylesheet" href="/includes/css/style.css">
    
    <script src="/teamApply/js/common.js"></script>
    <script src="/teamApply/js/jquery.slicknav.js"></script>
    
    <script src="/includes/js/jquery-3.3.1.min.js"></script>

    <script src="/includes/js/jquery.lettering.js"></script>
    <script src="/includes/js/jquery.sticky.js"></script>

    <script src="/includes/js/ScrollMagic.min.js"></script>
    <script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>

    <script src="/includes/js/main.js"></script>
</head>

<body>
	
    <%@include file="/includes/header.jsp"%>
    
    <!-- Header -->
    <div class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">풋살팀 팀원 지원</h1>
                <p class="lead fw-normal text-white-50 mb-0">함께 열정적인 풋살을 즐길 수 있는 팀에 지원하세요.</p>
            </div>
        </div>
    </div>
    
    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>팀 지원</h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="checkout__input">
                                  <p>이름<span>*</span></p>
                                  <input type="text" placeholder="이름">
                            </div>
                            <div class="checkout__input">
                                 <p>성별<span>*</span></p>
                                 	<input type="text" placeholder="성별">
                            </div>
                            <div class="checkout__input">
                                <p>핸드폰 번호<span>*</span></p>
                                <input type="text" placeholder="핸드폰 번호">
                            </div>
                            <div class="checkout__input">
                                <p>포지션<span>*</span></p>
                                <select id="position" name="position" onChange="selectPosition(this)">
                                			<option placeholder="">포지션 선택</option>
      										<option placeholder="pivo">PIVO(피보): 공격수</option>
      										<option placeholder="ala">ALA(아라): 미드필더</option>
      										<option placeholder="fixo">FIXO(픽소): 수비수</option>
      										<option placeholder="goleiro">GOLEIRO(골레이로): 골키퍼</option>
      							</select>
                            </div>
                            <div class="checkout__input">
                                <p>하고 싶은 말<span>*</span></p>
                                <textarea id="teamApply_content" name="teamApply_content" cols="100" rows="100" class="form-content" placeholder="팀장에게 하고 싶은 말을 적어주세요."></textarea>
                            </div> 
                            
                        </div>
                        
                        <!-- Check List -->
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>Check List</h4>
								<div class="checkout__order__products">
									Title<span>Content</span>
								</div>
								<ul>
									<li>이름<span>이름 가져오기</span></li>
									<li>성별<span>성별 가져오기</span></li>
									<li>핸드폰 번호<span>번호 가져오기</span></li>
									<li>포지션<span id="position"></span></li>
								</ul>
									<a href="/team" id="insert" class="site-btn-insert">등록</a>
									<a href="/team" id="cancle" class="site-btn-cancle">취소</a>
							</div>
						</div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

</body>

</html>