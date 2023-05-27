package com.teamcommit.kickoff.Do;

public class ReportDO {

	//신고 번호
	private int reportNo;
	//게시글 번호
	private int boardSeqno;
	//신고 사유
	private String reportComment;
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getBoardSeqno() {
		return boardSeqno;
	}
	public void setBoardSeqno(int boardSeqno) {
		this.boardSeqno = boardSeqno;
	}
	public String getReportComment() {
		return reportComment;
	}
	public void setReportComment(String reportComment) {
		this.reportComment = reportComment;
	}
	
}
