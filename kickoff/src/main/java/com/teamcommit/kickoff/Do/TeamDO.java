package com.teamcommit.kickoff.Do;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class TeamDO {

	//풋살팀 아이디
	private int teamSeqId;
	//팀 이름
	private String teamName;
	//팀 인원수
	private int teamNumber;
	//팀 성별
	private String teamGender;
	//팀 소속지역
	private String teamLocal;
	//팀원 모집 시작 기간
	private String teamStartDate;
	//팀원 모집 종료 기간
	private String teamEndDate;
	//랭킹 순위
	private int teamRank;
	//게임 점수
	private int teamGameScore;
	//팀 등급
	private String teamGrade;
	//기타 사항
	private String teamOther;
	//팀원 모집 상태
	private String teamStatus;
	// 팀 게시글 번호
	private int teamSeqNo;

	private String leaderId;
	
	public int getTeamSeqId() {
		return teamSeqId;
	}
	public void setTeamSeqId(int teamSeqId) {
		this.teamSeqId = teamSeqId;
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
	public String getTeamStartDate() {
		return teamStartDate;
	}
	public void setTeamStartDate(String teamStartDate) {
		this.teamStartDate = teamStartDate;
	}
	public String getTeamEndDate() {
		return teamEndDate;
	}
	public void setTeamEndDate(String teamEndDate) {
		this.teamEndDate = teamEndDate;
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
	public String getTeamGrade() {
		return teamGrade;
	}
	public void setTeamGrade(String teamGrade) {
		this.teamGrade = teamGrade;
	}
	public String getTeamOther() {
		return teamOther;
	}
	public void setTeamOther(String teamOther) {
		this.teamOther = teamOther;
	}
	public String getTeamStatus() {
		return teamStatus;
	}
	public void setTeamStatus(String teamStatus) {
		this.teamStatus = teamStatus;
	}
	public int getTeamSeqNo() {return teamSeqNo;}
	public void setTeamSeqNo(int teamSeqNo) {this.teamSeqNo = teamSeqNo;}
	public String getLeaderId() {
		return leaderId;
	}
	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}
}
