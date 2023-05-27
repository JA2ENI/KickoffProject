<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "/findPw/css/loginFind2.css">
<title>Kick Off: 아이디, 비밀번호 찾기</title>
</head>
<body style="overflow-y: hidden">
<div class="container" id="container">
  <div class="form-container sign-in-container">
    <form method="POST" name="findId" action="/loginAll">
      <h1>아이디 찾기</h1>
      <br />
	      <h4>정보에 해당되는 아이디입니다.</h4><br /><br />

        <%-- 개인회원 아이디 표시 --%>
        <c:if test="${not empty userResult}">
            <h4>개인 회원 아이디:</h4>
            <p>${userDO.userId}</p>
            <br /><br /><br />
        </c:if>

        <%-- 업체 회원 아이디 표시 --%>
        <c:if test="${not empty empResult}">
            <h4>업체 회원 아이디:</h4>
            <p>${empDO.empId}</p>
            <br /><br /><br />
        </c:if>
	      <button onclick="location.href='/loginAll';">로그인</button><br /><br /><br />
    </form>
  </div>
</div>
</body>
</html>