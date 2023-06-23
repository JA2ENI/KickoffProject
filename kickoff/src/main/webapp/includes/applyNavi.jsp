<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apply Navigation</title>
</head>
<body>
	<header>
		<div class="title-container">
			<div class="title-wrap">
				<div class="title">풋살 신청</div>
				<div class="ment">풋살의 모든 신청이 한눈에!</div>
			</div>
		</div>
		<nav class="nav-container">
			<div class="nav-wrap">
				<div class="icon-wrap">
					<button type="button" onclick="javascript:alert('예약 신청');">
						<img id="imgCourt" class="icons" src="/apply/images/court.png" />
					</button>
				</div>
				<strong class="icons-name">예약</strong>
			</div>
			<div class="nav-wrap">
				<div class="icon-wrap">
					<button type="button" onclick="javascript:alert('매칭 신청');">
						<img id="imgGame" class="icons" src="/apply/images/game.png" />
					</button>
				</div>
				<strong class="icons-name">매칭</strong>
			</div>
			<div class="nav-wrap">
				<div class="icon-wrap">
					<button type="button" onclick="location.href='/applyList?page=team';">
						<img id="imgTeam" class="icons" src="/apply/images/team.png" />
					</button>
				</div>
				<strong class="icons-name">팀</strong>
			</div>
			<div class="nav-wrap">
				<div class="icon-wrap">
					<button type="button" onclick="location.href='/applyList?page=helper';">
						<img id="imgHelper" class="icons" src="/apply/images/helper.png" />
					</button>
				</div>
				<strong class="icons-name">용병</strong>
			</div>
		</nav>
	</header>
</body>
</html>