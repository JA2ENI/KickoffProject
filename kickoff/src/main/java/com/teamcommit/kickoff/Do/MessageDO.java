package com.teamcommit.kickoff.Do;

import java.util.Date;

public class MessageDO {

	//메시지 번호
	private int messageSeqno;
	//메시지 수신자 아이디
	private String messageSendId;
	//메시지 발신자 아이디
	private String messageReceiveId;
	//메시지 내용
	private String messageContent;
	//메시지 발송 일자
	private Date messageSendDate;
	//메시지 열람 일자
	private Date messageOpenDate;
	//용병 제안 수락/거절
	private String helperYN;
	//매칭 수락/거절
	private String gameYN;
	//메시지 열람 구분
	private String messageType;

	private int helperSeqno;

	private String messageTitle;

	public String getMessageTitle() {
		return messageTitle;
	}

	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

	public int getHelperSeqno() {
		return helperSeqno;
	}

	public void setHelperSeqno(int helperSeqno) {
		this.helperSeqno = helperSeqno;
	}

	public int getMessageSeqno() {
		return messageSeqno;
	}
	public void setMessageSeqno(int messageSeqno) {
		this.messageSeqno = messageSeqno;
	}
	public String getMessageSendId() {
		return messageSendId;
	}
	public void setMessageSendId(String messageSendId) {
		this.messageSendId = messageSendId;
	}
	public String getMessageReceiveId() {
		return messageReceiveId;
	}
	public void setMessageReceiveId(String messageReceiveId) {
		this.messageReceiveId = messageReceiveId;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Date getMessageSendDate() {
		return messageSendDate;
	}
	public void setMessageSendDate(Date messageSendDate) {
		this.messageSendDate = messageSendDate;
	}
	public Date getMessageOpenDate() {
		return messageOpenDate;
	}
	public void setMessageOpenDate(Date messageOpenDate) {
		this.messageOpenDate = messageOpenDate;
	}
	public String getHelperYN() {
		return helperYN;
	}
	public void setHelperYN(String helperYN) {
		this.helperYN = helperYN;
	}
	public String getGameYN() {
		return gameYN;
	}
	public void setGameYN(String gameYN) {
		this.gameYN = gameYN;
	}
	public String getMessageType() {
		return messageType;
	}
	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}
	
}
