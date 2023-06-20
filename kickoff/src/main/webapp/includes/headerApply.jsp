<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<!-- 상단바 -->
	<nav class="untree_co--site-nav js-sticky-nav">
		<div class="logo-wrap">
			<a href="/main" class="untree_co--site-logo">Kick Off</a>
		</div>

		<div class="icons-wrap text-md-right">
			<!-- 로그인 안 한 경우 -->
			<c:if test="${empty userId and empty empId}">
				<ul class="icons-top d-none d-lg-block">
					<li><a href="/loginAll"><span class="icon-unlock"></span></a>
					</li>
					<li><a href="#" onclick="alert('로그인 후 이용하실 수 있습니다.'); return false;"><span class="icon-person"></span></a>
					</li>
				</ul>
			</c:if>

			<!-- 로그인 한 경우 - 개인 회원 -->
			<c:if test="${!empty userId and empty empId}">
				<ul class="icons-top d-none d-lg-block">
					<li><a href="/logout"><span class="icon-lock"></span></a></li>
					<li><a href="/myReservation"><span class="icon-person"></span></a>
					</li>
				</ul>
			</c:if>

			<!-- 로그인 한 경우 - 업체 회원 -->
			<c:if test="${empty userId and !empty empId}">
				<ul class="icons-top d-none d-lg-block">
					<li><a href="/logout"><span class="icon-lock"></span></a></li>
					<li><a href="/empReservation"><span class="icon-person"></span></a></li>
				</ul>
			</c:if>
		</div>
	</nav>
</div>

