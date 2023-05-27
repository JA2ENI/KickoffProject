<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>


<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="/management/img/apple-icon.png">
  <link rel="icon" type="image/png" href="/management/img/favicon.png">
  <link rel = "stylesheet" href = "/main/css/vendor/icomoon/style.css">

  <title>Kick Off: 풋살팀 랭킹</title>  


  
  
  <link rel="stylesheet" href="/includes/css/style.css">
  

  
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="/management/css/material-dashboard.css" rel="stylesheet" />
  
  
</head>

<body class="g-sidenav-show  bg-gray-200">
<%@include file="/includes/header.jsp"%>

    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                <!-- <img class="trophy" src="/TeamCommit/resource/team/img/free-icon-trophy-3176355.png"/> -->
                <h6 class="text-white text-capitalize ps-3">팀 랭킹</h6>
              </div>
            </div>
            <div class="card-body px-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">랭킹</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">풋살팀</th>
                     
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="list" items="${teamRankList}">
                    <tr>
                      <td>
                        <p class="font-weight-bold mb-0">
                          <c:choose>
                            <c:when test="${list.teamRank == 1}">
                              <img src="/team/img/free-icon-gold-medal-1910528.png" alt="Gold Medal"/>
                            </c:when>
                            <c:when test="${list.teamRank == 2}">
                              <img src="/team/img/free-icon-silver-medal-1910534.png" alt="Silver Medal"/>
                            </c:when>
                            <c:when test="${list.teamRank == 3}">
                              <img src="/team/img/free-icon-bronze-medal-1910542.png" alt="Bronze Medal"/>
                            </c:when>
                            <c:otherwise>
                             <span style="padding-right: 11px;">
                              <c:out value="${list.teamRank}" />
                            </span>
                            </c:otherwise>
                          </c:choose>
                        </p>
                      </td>
                      <td class="align-middle text-center text-sm"> <!-- width 값 조정 -->
                        <span class="badge badge-sm bg-gradient-success"><c:out value="${list.teamName}" /></span>
                      </td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <button type="reset" class="btn_reset" onclick="location.href='/team';">목록</button>
     
    </div>
  </main>



  <!--   Core JS Files   -->
   <script src="/includes/js/jquery-3.3.1.min.js"></script>
  <script src="/management/js/core/popper.min.js"></script>
  <script src="/management/js/core/bootstrap.min.js"></script>
  <script src="/management/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="/management/js/plugins/smooth-scrollbar.min.js"></script>


  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="/management/js/material-dashboard.min.js"></script>
 
    
   

    <script src="/includes/js/jquery.lettering.js"></script>
    <script src="/includes/js/jquery.sticky.js"></script>

    <script src="/includes/js/ScrollMagic.min.js"></script>
    <script src="/includes/js/scrollmagic.animation.gsap.min.js"></script>

    <script src="/includes/js/main.js"></script>
  
  
</body>

</html>