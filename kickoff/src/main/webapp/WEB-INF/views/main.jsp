<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 짱! --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="" />

    <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:400,500i,700|Roboto:300,400,500,700&display=swap" rel="stylesheet">

    <link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">
    <link rel = "stylesheet" href = "/main/css/vendor/owl.carousel.min.css">
    <link rel = "stylesheet" href = "/main/css/vendor/aos.css">
    <link rel = "stylesheet" href = "/main/css/vendor/animate.min.css">
    <link rel = "stylesheet" href = "/main/css/vendor/bootstrap.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="/main/css/style.css">
    
    <script src="/main/js/vendor/jquery-3.3.1.min.js"></script>
    <script src="/main/js/vendor/popper.min.js"></script>
    <script src="/main/js/vendor/bootstrap.min.js"></script>

    <script src="/main/js/vendor/owl.carousel.min.js"></script>
    
    <script src="/main/js/vendor/jarallax.min.js"></script>
    <script src="/main/js/vendor/jarallax-element.min.js"></script>
    <script src="/main/js/vendor/ofi.min.js"></script>

    <script src="/main/js/vendor/aos.js"></script>

    <script src="/main/js/vendor/jquery.lettering.js"></script>
    <script src="/main/js/vendor/jquery.sticky.js"></script>
    
    <script src="/main/js/vendor/TweenMax.min.js"></script>
    <script src="/main/js/vendor/ScrollMagic.min.js"></script>
    <script src="/main/js/vendor/scrollmagic.animation.gsap.min.js"></script>
    <script src="/main/js/vendor/debug.addIndicators.min.js"></script>

    <script src="/main/js/main.js"></script>
    

    <title>kickoff</title>
  </head>
  <body>

    <div id="untree_co--overlayer"></div>
    <div class="loader">
      <div class="spinner-border text-primary" role="status">
        <span class="sr-only">Loading...</span>
      </div>
    </div>

    <nav class="untree_co--site-mobile-menu">
      <div class="close-wrap d-flex">
        <a href="#" class="d-flex ml-auto js-menu-toggle">
          <span class="close-label">Close</span>
          <div class="close-times">
            <span class="bar1"></span>
            <span class="bar2"></span>
          </div>
        </a>
      </div>
      <div class="site-mobile-inner"></div>
    </nav>


    <div class="untree_co--site-wrap">
		<!-- 상단바 -->
      <nav class="untree_co--site-nav js-sticky-nav">
        <div class="container d-flex align-items-center">
          <div class="logo-wrap">
            <a href="/main" class="untree_co--site-logo">Kick Off</a>
          </div>
          <div class="site-nav-ul-wrap text-center d-none d-lg-block">
            <ul class="site-nav-ul js-clone-nav">
              <li><a href="/reservation">예약</a></li>
              <li>
                <a href="/game">매칭</a>
              </li>
              <li><a href="/board">자유 게시판</a></li>
              <li><a href="/team">팀</a></li>
              <li class = "has-children"><a href="/helperList">용병</a>

                <ul class="dropdown">
                  <li>
                    <a href="/helperList">모집 목록</a>
                  </li>
                  <li>
                    <a href="/helperInsert">용병 모집 등록</a>
                  </li>
                </ul>
              </li>
              
            </ul>
          </div>
          <div class="icons-wrap text-md-right">


            <!-- 로그인 안 한 경우 -->
            <c:if test="${empty userId and empty empId}">
		     <ul class="icons-top d-none d-lg-block">
              <li>
                <a href="/loginAll"><span class="icon-unlock"></span></a>
              </li>
              <li>
                <a href="#" onclick="alert('로그인 후 이용하실 수 있습니다.'); return false;"><span class="icon-person"></span></a>
              </li>
            </ul>
            </c:if>

            <!-- 로그인 한 경우 - 개인 회원 -->
            <c:if test="${!empty userId and empty empId}">
              <ul class="icons-top d-none d-lg-block">
                <li>
                  <a href="/logout"><span class="icon-lock"></span></a>
                </li>
                <li>
                  <a href="/myReservation"><span class="icon-person"></span></a>
                </li>
              </ul>
            </c:if>

            <!-- 로그인 한 경우 - 업체 회원 -->
            <c:if test="${empty userId and !empty empId}">
              <ul class="icons-top d-none d-lg-block">
                <li>
                  <a href="/logout"><span class="icon-lock"></span></a>
                </li>
                <li>
                  <a href="/empReservation"><span class="icon-person"></span></a>
                </li>
              </ul>
            </c:if>

            <!-- Mobile Toggle -->
            <a href="#" class="d-block d-lg-none burger js-menu-toggle" data-toggle="collapse" data-target="#main-navbar">
              <span></span>
            </a>
          </div>
        </div>
      </nav>

      <div class="untree_co--site-main">
        

        <div class="owl-carousel owl-hero">

          <div class="untree_co--site-hero overlay" style="background-image: url('/main/images/main1.jpg')">
            <div class="container">
              <div class="row align-items-center justify-content-center">
                <div class="col-md-8">
                  <div class="site-hero-contents text-center" data-aos="fade-up">
                    <h1 class="hero-heading">Kick Off</h1>
                    <div class="sub-text">
                      <p class="text-white font-weight-bold">팀원을 찾고, 경기를 예약하고, 즐거움을 더하다</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="untree_co--site-hero overlay"  style="background-image: url('/main/images/main2.jpg')">
            <div class="container">
              <div class="row align-items-center justify-content-center">
                <div class="col-md-7">
                  <div class="site-hero-contents text-center" data-aos="fade-up">
                    <h1 class="hero-heading">Kick Off</h1>
                    <div class="sub-text">
                      <p class="text-white font-weight-bold">풋살을 즐기는 모든 이들을 위한 Kick Off</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="untree_co--site-hero overlay" style="background-image: url('/main/images/main3.jpg')">
            <div class="container">
              <div class="row align-items-center justify-content-center">
                <div class="col-md-10">
                  <div class="site-hero-contents text-center" data-aos="fade-up">
                    <h1 class="hero-heading">Kick Off</h1>
                    <div class="sub-text">
                      <p class="text-white font-weight-bold">나만의 팀을 만들어 보세요</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>

		<!-- 
        <div class="untree_co--site-section float-left pb-0 featured-rooms">

          <div class="container pt-0 pb-5">
            <div class="row justify-content-center text-center">  
              <div class="col-lg-6 section-heading" data-aos="fade-up">
                <h3 class="text-center">Featured Rooms</h3>
              </div>
            </div>
          </div>

          <div class="container-fluid pt-5">
            <div class="suite-wrap overlap-image-1">

              <div class="suite">
                <div class="image-stack">
                  <div class="image-stack-item image-stack-item-top" data-jarallax-element="-50">
                    <div class="overlay"></div>
                    <img src="/TeamCommit/res/images/room_1_a.jpg" alt="Image" class="img-fluid pic1">
                  </div>
                  <div class="image-stack-item image-stack-item-bottom">
                    <div class="overlay"></div>
                    <img src="/TeamCommit/res/images/room_1_b.jpg" alt="Image" class="img-fluid pic2">
                  </div>
                </div>
              </div> 

              <div class="suite-contents" data-jarallax-element="50">
                <h2 class="suite-title">King Bedroom</h2>
                <div class="suite-excerpt">
                  <p>A hotel is an establishment that provides paid lodging on a short-term basis. Facilities provided may range from a modest-quality mattress in a small room to large suites with bigger.</p>
                  <p><a href="#" class="readmore">Room Details</a></p>
                </div>
              </div>
            </div>

            <div class="suite-wrap overlap-image-2">

              <div class="suite">
                <div class="image-stack">
                  <div class="image-stack-item image-stack-item-top">
                    <div class="overlay"></div>
                    <img src="/TeamCommit/res/images/room_2_a.jpg" alt="Image" class="img-fluid pic1">
                  </div>
                  <div class="image-stack-item image-stack-item-bottom" data-jarallax-element="-50">
                    <div class="overlay"></div>
                    <img src="/TeamCommit/res/images/room_2_b.jpg" alt="Image" class="img-fluid pic2">
                  </div>
                </div>
              </div>

              <div class="suite-contents" data-jarallax-element="50">
                <h2 class="suite-title">Queen &amp; Double Bedroom</h2>
                <div class="suite-excerpt pr-5">
                  <p>A hotel is an establishment that provides paid lodging on a short-term basis. Facilities provided may range from a modest-quality mattress in a small room to large suites with bigger</p>
                  <p><a href="#" class="readmore">Room Details</a></p>
                </div>
              </div>

            </div>

          </div>
        </div>

        <div class="untree_co--site-section">
          <div class="container">
            <div class="container pt-0 pb-5">
            <div class="row justify-content-center text-center">  
              <div class="col-lg-6 section-heading" data-aos="fade-up">
                <h3 class="text-center">Hotel Amenities</h3>
              </div>
            </div>
          </div>
            <div class="row custom-row-02192 align-items-stretch">
              <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up" data-aos-delay="100">
                <div class="media-29191 text-center h-100">
                  <div class="media-29191-icon">
                    <img src="TeamCommit/res/images/svg/parking.svg" alt="Image" class="img-fluid">
                  </div>
                  <h3>Free Self-Parking</h3>
                  <p>A hotel is an establishment that provides paid lodging on a short-term basis. Facilities provided may range from a modest-quality.</p>
                  <p><p><a href="#" class="readmore reverse">Read More</a></p></p>
                </div>
              </div>
              
              <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up" data-aos-delay="200">
                <div class="media-29191 text-center h-100">
                  <div class="media-29191-icon">
                    <img src="/TeamCommit/res/images/svg/internet.svg" alt="Image" class="img-fluid">
                  </div>
                  <h3>High speed Internet access</h3>
                  <p>A hotel is an establishment that provides paid lodging on a short-term basis. Facilities provided may range from a modest-quality.</p>
                  <p><p><a href="#" class="readmore reverse">Read More</a></p></p>
                </div>
              </div>
              <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up" data-aos-delay="100">
                <div class="media-29191 text-center h-100">
                  <div class="media-29191-icon">
                    <img src="/TeamCommit/res/images/svg/wifi.svg" alt="Image" class="img-fluid">
                  </div>
                  <h3>Complimentary WiFi in public areas</h3>
                  <p>A hotel is an establishment that provides paid lodging on a short-term basis. Facilities provided may range from a modest-quality.</p>
                  <p><p><a href="#" class="readmore reverse">Read More</a></p></p>
                </div>
              </div>
              
              <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up" data-aos-delay="200">
                <div class="media-29191 text-center h-100">
                  <div class="media-29191-icon">
                    <img src="TeamCommit/res/images/svg/elevator.svg" alt="Image" class="img-fluid">
                  </div>
                  <h3>Elevators</h3>
                  <p>A hotel is an establishment that provides paid lodging on a short-term basis. Facilities provided may range from a modest-quality.</p>
                  <p><p><a href="#" class="readmore reverse">Read More</a></p></p>
                </div>
              </div>
              
              <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up" data-aos-delay="100">
                <div class="media-29191 text-center h-100">
                  <div class="media-29191-icon">
                    <img src="TeamCommit/res/images/svg/partners.svg" alt="Image" class="img-fluid">
                  </div>

                  <h3>Meeting rooms</h3>
                  <p>A hotel is an establishment that provides paid lodging on a short-term basis. Facilities provided may range from a modest-quality.</p>
                  <p><p><a href="#" class="readmore reverse">Read More</a></p></p>
                </div>
              </div>
              <div class="col-md-6 col-lg-4 mb-5" data-aos="fade-up" data-aos-delay="200">
                <div class="media-29191 text-center h-100">
                  <div class="media-29191-icon">
                    <img src="/TeamCommit/res/images/svg/washing-machine.svg" alt="Image" class="img-fluid">
                  </div>
                  <h3>Laundry and Valet service</h3>
                  <p>A hotel is an establishment that provides paid lodging on a short-term basis. Facilities provided may range from a modest-quality.</p>
                  <p><p><a href="#" class="readmore reverse">Read More</a></p></p>
                </div>
              </div>

            </div>
          </div>
        </div> -->


        <div class="TeamCommit--site-section">
          <div class="container">
            <div class="row">
              <div class="col-md-4">
                <div class="post-entry" data-aos="fade-up" data-aos-delay="100">
                  <a href="#" class="thumb"></a>
                  <div class="post-entry-contents">
                    <h3><a href="#">지금 예약 가능해요! ⚽</a></h3>
                    <table class="bluetop">
					  <tr> <th>업체명</th> <th>코트 이름</th> <th>추천 인원</th> <th>상태</th> </tr>
                      <c:forEach var="list" items="${resList}">
                        <tr>
                          <td><c:out value="${list.reservationPlaceName}" /></td>
                          <td><c:out value="${list.reservationCourtName}" /></td>
                          <td><c:out value="${list.reservationHeadcount}" /></td>
                          <td><c:out value="${list.reservationStatus}" /></td>
                        </tr>
                      </c:forEach>
					</table>
                    <p><a href="/reservation" class="readmore">Read more</a></p>
                  </div>
                </div>
              </div>
              
              <div class="col-md-4">
                <div class="post-entry" data-aos="fade-up" data-aos-delay="100">
                  <a href="#" class="thumb"></a>
                  <div class="post-entry-contents">
                    <h3><a href="#">최근 매치 등록 🏆</a></h3>
                    <table class="bluetop">
					  <tr> <th>경기 방식</th> <th>팀 성별</th> <th>경기 날짜</th> <th>시간</th> </tr>
                      <c:forEach var="gList" items="${gameList}">
                        <tr>
                          <td><c:out value="${gList.gameStyle}" /></td>
                          <td><c:out value="${gList.gameGender}" /></td>
                          <td><c:out value="${gList.gameDate}" /></td>
                          <td><c:out value="${gList.gameStartTime}" /></td>
                        </tr>
                      </c:forEach>
					</table>
                    <p><a href="/game" class="readmore">Read more</a></p>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="post-entry" data-aos="fade-up" data-aos-delay="200">
                  <a href="#" class="thumb"></a>
                  <div class="post-entry-contents">
                    <h3><a href="#">오늘 올라온 소식이에요! 🔥</a></h3>
                    <table class="bluetop">
					  <tr> <th>제목</th> <th Style="width:80px;">작성자</th> <th Style="width:80px;">조회수</th> <th>작성일</th> </tr>
                      <c:forEach var="bList" items="${boardList}">
                        <tr>
                          <td><c:out value="${bList.writeTitle}" /></td>
                          <td><c:out value="${bList.writeId}" /></td>
                          <td><c:out value="${bList.viewCount}" /></td>
                          <td><c:out value="${bList.writeRegDate}" /></td>
                        </tr>
                      </c:forEach>
					</table>
                    <p><a href="/board" class="readmore">Read more</a></p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <footer class="TeamCommit--site-footer">
        <%@include file="/includes/footer.jsp"%>
      </footer>
    </div>


  </body>
</html>