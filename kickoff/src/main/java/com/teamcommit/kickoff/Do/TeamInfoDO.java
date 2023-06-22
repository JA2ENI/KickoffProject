package com.teamcommit.kickoff.Do;

import org.springframework.stereotype.Component;


@Component
public class TeamInfoDO {
	
	//팀 정보 시퀀스
	private int teamInfoSeq;
	//팀 아이디
	private int teamId;
	//팀 주장 아이디
	private String leaderId;
	//팀 멤버 아이디
	private String memberId;
	//팀 이름
	private String teamName;
	//팀 인원수
	private int teamNumber;
	//팀 성별
	private String teamGender;
	//팀 소속 지역
	private String teamLocal;
	//팀 랭킹
	private int teamRank;
	//팀 게임 점수
	private int teamGameScore;
	//팀 소개
	private String teamIntro;
	//팀 연령대
	private String teamAge;
	//팀 선수 배치
	private String teamFormation;
	//팀 레벨
	private String teamLevel;
	//팀 주 이용 날짜
	private String teamDay;
	//팀 주 이용 시간
	private String teamTime;
	//팀 고유 색상
	private String teamColor;
	
	
	public int getTeamInfoSeq() {
		return teamInfoSeq;
	}
	public void setTeamInfoSeq(int teamInfoSeq) {
		this.teamInfoSeq = teamInfoSeq;
	}
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	public String getLeaderId() {
		return leaderId;
	}
	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public int getTeamNumber() {
		return teamNumber;
	}
	public void setTeamNumber(int teamNumber) {
		this.teamNumber = teamNumber;
	}
	public String getTeamGender() {
		return teamGender;
	}
	public void setTeamGender(String teamGender) {
		this.teamGender = teamGender;
	}
	public String getTeamLocal() {
		return teamLocal;
	}
	public void setTeamLocal(String teamLocal) {
		this.teamLocal = teamLocal;
	}
	public int getTeamRank() {
		return teamRank;
	}
	public void setTeamRank(int teamRank) {
		this.teamRank = teamRank;
	}
	public int getTeamGameScore() {
		return teamGameScore;
	}
	public void setTeamGameScore(int teamGameScore) {
		this.teamGameScore = teamGameScore;
	}
	public String getTeamIntro() {
		return teamIntro;
	}
	public void setTeamIntro(String teamIntro) {
		this.teamIntro = teamIntro;
	}
	public String getTeamAge() {
		return teamAge;
	}
	public void setTeamAge(String teamAge) {
		this.teamAge = teamAge;
	}
	public String getTeamFormation() {
		return teamFormation;
	}
	public void setTeamFormation(String teamFormation) {
		this.teamFormation = teamFormation;
	}
	public String getTeamLevel() {
		return teamLevel;
	}
	public void setTeamLevel(String teamLevel) {
		this.teamLevel = teamLevel;
	}
	public String getTeamDay() {
		return teamDay;
	}
	public void setTeamDay(String teamDay) {
		this.teamDay = teamDay;
	}
	public String getTeamTime() {
		return teamTime;
	}
	public void setTeamTime(String teamTime) {
		this.teamTime = teamTime;
	}
	public String getTeamColor() {
		return teamColor;
	}
	public void setTeamColor(String teamColor) {
		this.teamColor = teamColor;
	}
	
	
}
