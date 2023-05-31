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
    <form method="POST" name="findEmpPw" action="/loginAll">
      <h1>비밀번호 찾기</h1>

        <c:choose>
	      	<%-- 업체회원 비밀번호 표시 --%>
	      	<c:when test="${!empty empDO}">
		      	<br /><br />
	            <p>업체 회원 비밀번호 : ${empDO.empPw}</p>
	            <br /><br />
	      	</c:when>
	      	<%-- 일치하는 회원 정보가 없을 때 --%>
	      	<c:otherwise>
	      		<br /><br />
	        	<p>정보에 해당하는 비밀번호가 없습니다.</p>
	        	<br /><br />
	      	</c:otherwise>
      	</c:choose>
        
	      <button onclick="location.href='/loginAll';">로그인</button><br /><br /><br />
	  </form>
	</div>
</div>
</body>
</html>