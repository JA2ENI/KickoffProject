package com.teamcommit.kickoff.Do;

import lombok.Data;

public @Data class ChatRoom {
	
	private int id;
	private String sendId;
	private String receiveId;
	private String content;
	
	public ChatRoom(int id, String sendId, String receiveId) {
		super();
		this.id = id;
		this.sendId = sendId;
		this.receiveId = receiveId;
	}
	
	public ChatRoom() {
		
	}
	
	public ChatRoom(String content) {
		this.content = content;
	}
}
