package com.teamcommit.kickoff.Do;

import org.springframework.stereotype.Component;

@Component
public class HelperApplyDO {
	private String userId;
	private int helperSeqno;
	private String helperApplyStatus;	
	private String helperUserId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getHelperSeqno() {
		return helperSeqno;
	}
	public void setHelperSeqno(int helperSeqno) {
		this.helperSeqno = helperSeqno;
	}
	public String getHelperApplyStatus() {
		return helperApplyStatus;
	}
	public void setHelperApplyStatus(String helperApplyStatus) {
		this.helperApplyStatus = helperApplyStatus;
	}
	public String getHelperUserId() {
		return helperUserId;
	}
	public void setHelperUserId(String helperUserId) {
		this.helperUserId = helperUserId;
	}
	
}