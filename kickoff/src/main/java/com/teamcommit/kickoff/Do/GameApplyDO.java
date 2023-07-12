package com.teamcommit.kickoff.Do;

import org.springframework.stereotype.Component;

@Component
public class GameApplyDO {
	private String userId;
	private int gameSeqno;
	private String gameApplyStatus;	
	private String applyTeam;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getGameSeqno() {
		return gameSeqno;
	}
	public void setGameSeqno(int gameSeqno) {
		this.gameSeqno = gameSeqno;
	}
	public String getGameApplyStatus() {
		return gameApplyStatus;
	}
	public void setGameApplyStatus(String gameApplyStatus) {
		this.gameApplyStatus = gameApplyStatus;
	}
	public String getApplyTeam() {
		return applyTeam;
	}
	public void setApplyTeam(String applyTeam) {
		this.applyTeam = applyTeam;
	}
	
}