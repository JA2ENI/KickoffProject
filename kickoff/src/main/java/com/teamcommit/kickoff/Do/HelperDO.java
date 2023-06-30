package com.teamcommit.kickoff.Do;

import org.springframework.stereotype.Component;

@Component
public class HelperDO {

	//용병 게시글 번호
	private int helperSeqno;
	//사용자 아이디
	private String helperUserId;
	//경기 번호
	private int gameSeqno;
	//메시지 번호
	private int messageSeqno;
	//용병 포지션
	private String helperPosition;
	//용병 상태
	private String helperStatus;
	//참가비
	private int helperPrice;

	private String helperMatch;
	private String helperPlace;
	private String helperAddress;
	private String helperGender;
	private int helperWant;
	private String helperTime;
	private String helperTeamLevel;
	private String helperPlaceName;

	public int getHelperSeqno() {
		return helperSeqno;
	}

	public void setHelperSeqno(int helperSeqno) {
		this.helperSeqno = helperSeqno;
	}

	public String getHelperUserId() {
		return helperUserId;
	}

	public void setHelperUserId(String helperUserId) {
		this.helperUserId = helperUserId;
	}

	public int getGameSeqno() {
		return gameSeqno;
	}

	public void setGameSeqno(int gameSeqno) {
		this.gameSeqno = gameSeqno;
	}

	public int getMessageSeqno() {
		return messageSeqno;
	}

	public void setMessageSeqno(int messageSeqno) {
		this.messageSeqno = messageSeqno;
	}

	public String getHelperPosition() {
		return helperPosition;
	}

	public void setHelperPosition(String helperPosition) {
		this.helperPosition = helperPosition;
	}

	public String getHelperStatus() {
		return helperStatus;
	}

	public void setHelperStatus(String helperStatus) {
		this.helperStatus = helperStatus;
	}

	public int getHelperPrice() {
		return helperPrice;
	}

	public void setHelperPrice(int helperPrice) {
		this.helperPrice = helperPrice;
	}

	public String getHelperMatch() {
		return helperMatch;
	}

	public void setHelperMatch(String helperMatch) {
		this.helperMatch = helperMatch;
	}

	public String getHelperPlace() {
		return helperPlace;
	}

	public void setHelperPlace(String helperPlace) {
		this.helperPlace = helperPlace;
	}

	public String getHelperAddress() {
		return helperAddress;
	}

	public void setHelperAddress(String helperAddress) {
		this.helperAddress = helperAddress;
	}

	public String getHelperGender() {
		return helperGender;
	}

	public void setHelperGender(String helperGender) {
		this.helperGender = helperGender;
	}

	public int getHelperWant() {
		return helperWant;
	}

	public void setHelperWant(int helperWant) {
		this.helperWant = helperWant;
	}

	public String getHelperTime() {
		return helperTime;
	}

	public void setHelperTime(String helperTime) {
		this.helperTime = helperTime;
	}

	public String getHelperTeamLevel() {
		return helperTeamLevel;
	}

	public void setHelperTeamLevel(String helperTeamLevel) {
		this.helperTeamLevel = helperTeamLevel;
	}

	public String getHelperPlaceName() {
		return helperPlaceName;
	}

	public void setHelperPlaceName(String helperPlaceName) {
		this.helperPlaceName = helperPlaceName;
	}
}
