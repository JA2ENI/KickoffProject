package com.teamcommit.kickoff.Do;

public class TeamApplyDO {

	//풋살팀 지원 번호
	private int teamApplyNo;
	//풋살팀 아이디
	private int teamId;
	//사용자 아이디
	private String userId;
	//하고 싶은 말
	private String applyOther;
	//제안 수락/거절 유무
	private String teamYN;
	
	public int getTeamApplyNo() {
		return teamApplyNo;
	}
	public void setTeamApplyNo(int teamApplyNo) {
		this.teamApplyNo = teamApplyNo;
	}
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getApplyOther() {
		return applyOther;
	}
	public void setApplyOther(String applyOther) {
		this.applyOther = applyOther;
	}
	public String getTeamYN() {
		return teamYN;
	}
	public void setTeamYN(String teamYN) {
		this.teamYN = teamYN;
	}
	
}
