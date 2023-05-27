package com.teamcommit.kickoff.Do;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class GameDO {

	//경기번호
	private int gameSeqno;
	//풋살팀 1 아이디
	private int team1Id;
	//풋살팀 2 아이디
	private int team2Id;
	//풋살장 아이디
	private int placeId;
	//메시지 번호
	private int messageSeqno;
	//경기 날짜
	private String gameDate;
	//경기 시작 시간
	private String gameStartTime;
	//경기 종료 시간
	private String gameEndTime;
	//경기 형태
	private String gameStyle;
	//경기 점수
	private String gameScore;
	//성별
	private String gameGender;
	//매칭 상태
	private String gameStatus;
	//매칭 기타사항
	private String gameOther;

	private String placeName;

	private String team1Name;

	private String team2Name;


	public int getGameSeqno() {
		return gameSeqno;
	}

	public void setGameSeqno(int gameSeqno) {
		this.gameSeqno = gameSeqno;
	}

	public int getTeam1Id() {
		return team1Id;
	}

	public void setTeam1Id(int team1Id) {
		this.team1Id = team1Id;
	}

	public int getTeam2Id() {
		return team2Id;
	}

	public void setTeam2Id(int team2Id) {
		this.team2Id = team2Id;
	}

	public int getPlaceId() {
		return placeId;
	}

	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}

	public int getMessageSeqno() {
		return messageSeqno;
	}

	public void setMessageSeqno(int messageSeqno) {
		this.messageSeqno = messageSeqno;
	}

	public String getGameDate() {
		return gameDate;
	}

	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}

	public String getGameStartTime() {
		return gameStartTime;
	}

	public void setGameStartTime(String gameStartTime) {
		this.gameStartTime = gameStartTime;
	}

	public String getGameEndTime() {
		return gameEndTime;
	}

	public void setGameEndTime(String gameEndTime) {
		this.gameEndTime = gameEndTime;
	}

	public String getGameStyle() {
		return gameStyle;
	}

	public void setGameStyle(String gameStyle) {
		this.gameStyle = gameStyle;
	}

	public String getGameScore() {
		return gameScore;
	}

	public void setGameScore(String gameScore) {
		this.gameScore = gameScore;
	}

	public String getGameGender() {
		return gameGender;
	}

	public void setGameGender(String gameGender) {
		this.gameGender = gameGender;
	}

	public String getGameStatus() {
		return gameStatus;
	}

	public void setGameStatus(String gameStatus) {
		this.gameStatus = gameStatus;
	}

	public String getGameOther() {
		return gameOther;
	}

	public void setGameOther(String gameOther) {
		this.gameOther = gameOther;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getTeam1Name() {
		return team1Name;
	}

	public void setTeam1Name(String team1Name) {
		this.team1Name = team1Name;
	}

	public String getTeam2Name() {
		return team2Name;
	}

	public void setTeam2Name(String team2Name) {
		this.team2Name = team2Name;
	}
}
