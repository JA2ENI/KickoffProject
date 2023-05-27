<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "/findPw/css/loginFind.css">
<title>Kick Off: 아이디, 비밀번호 찾기</title>
</head>
<body style="overflow-y: hidden">
<div class="container" id="container">
  <div class="form-container sign-up-container">
    <form form method="POST" name="findUser" action="/findUser">
      <h1>비밀번호 찾기</h1>
      <h4>개인 회원용</h4>
      <br />
	      <input type="text" placeholder="아이디" name="userId" />
	      <input type="text" placeholder="핸드폰 번호" name="userPhoneNumber" /><br/><br/>
<%--	      <button class="confirm" id="confirmNumber">휴대폰 인증</button><br /><br />--%>
	      <button onclick="location.href='/findPw';">비밀번호 찾기</button>
    </form>
  </div>
  <div class="form-container sign-in-container">
    <form form method="POST" name="findUser" action="/findId">
      <h1>아이디 찾기</h1>
      <h4>개인 회원용</h4>
      <br />
	      <input type="text" placeholder="이름" name="userName" />
	      <input type="text" placeholder="핸드폰 번호" name="userPhoneNumber" /><br/><br/>
<%--	      <button class="confirm" id="confirmNumber">휴대폰 인증</button><br /><br />--%>
	      <button type="submit" id="findId" onclick="location.href='/findId';">아이디 찾기</button>
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>환영합니다!</h1>
        <p>아이디를 찾으실 분들은 이곳을 클릭해주세요.</p>
        <button class="ghost" id="signIn">아이디 찾기</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>환영합니다!</h1>
        <p>비밀번호를 찾으실 분들은 이곳을 클릭해주세요.</p>
        <button class="ghost" id="signUp">비밀번호 찾기</button>
    </div>
  </div>
</div>
	<script src = "/findPw/js/loginFind.js"></script>
</div>
</body>
</html>