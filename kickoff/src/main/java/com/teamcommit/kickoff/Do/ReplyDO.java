package com.teamcommit.kickoff.Do;

import java.util.Date;

public class ReplyDO {

	//댓글 번호
	private int replyNo;
	//댓글 작성자 아이디
	private String replyId;
	//게시글 번호
	private int boardSeqno;
	//댓글 작성일
	private String replyRegDate;
	//댓글 수정일
	private String replyEditDate;
	//댓글 내용
	private String replyContent;
	//댓글 작성자 아이디
	private String replyIdEmp;
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyId() {
		return replyId;
	}
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}
	public int getBoardSeqno() {
		return boardSeqno;
	}
	public void setBoardSeqno(int boardSeqno) {
		this.boardSeqno = boardSeqno;
	}
	public String getReplyRegDate() {
		return replyRegDate;
	}
	public void setReplyRegDate(String replyRegDate) {
		this.replyRegDate = replyRegDate;
	}
	public String getReplyEditDate() {
		return replyEditDate;
	}
	public void setReplyEditDate(String replyEditDate) {
		this.replyEditDate = replyEditDate;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyIdEmp() {
		return replyIdEmp;
	}

	public void setReplyIdEmp(String replyIdEmp) {
		this.replyIdEmp = replyIdEmp;
	}
}
