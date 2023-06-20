<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "/login/css/loginAll.css">
<title>Kick Off: 로그인</title>
</head>
<body style="overflow-y: hidden">
<div class="container" id="container">
  <div class="form-container sign-up-container">
    <form method="POST" name="loginAll" action="/loginAll">
      <h1>업체 로그인</h1>
	  <br /> <br /> 
	  <input type="text" placeholder="아이디" name="empId" id="empId"/>
	  <input type="password" placeholder="비밀번호" name="empPw" id="empPw" />
	  <a href="/findEmp">아이디/비밀번호 찾기</a>
	  <a href="/loginAgreeEmp">회원가입</a>
	  <button type="submit" id="loginEmp">로그인</button>
    </form>
  </div>
  <div class="form-container sign-in-container">
    <form method="POST" name="loginAll" action="/loginAll">
      <h1>회원 로그인</h1>
	  <br /> <br /> 
      <input type="text" placeholder="아이디" name="userId" id="userId"/>
	  <input type="password" placeholder="비밀번호" name="userPw" id="userPw"/>
	  <a href="/findUser">아이디/비밀번호 찾기</a>
	  <a href="/loginAgree">회원가입</a>
	  <button type="submit" id="loginUser">로그인</button>
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>어서오세요!</h1>
        <p>회원 로그인은 여기서 하새요!</p>
        <button class="ghost" id="signIn">회원 로그인</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>환영합니다!</h1>
        <p>업체 회원이시라면 로그인은 여기서 하새요!</p>
        <button class="ghost" id="signUp">업체 로그인</button>
      </div>
    </div>
  </div>
</div>
	<script src = "/login/js/loginAll.js"></script>
</body>
</html>