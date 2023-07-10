package com.teamcommit.kickoff.Do;

public class ReportDO {

	//신고 번호
	private int reportNo;
	//게시글 번호
	private int boardSeqno;
	//신고 사유
	private String reportComment;
	//신고된 게시물 제목
	private String reportTitle;
	//신고된 게시물 작성자 ID
	private String reportId;
	//게시물 신고 날짜
	private String reportWriteReg;
	//신고된 게시물 신고 횟수
	private int reportCount;
	
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
	public String getReportTitle() {
		return reportTitle;
	}
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	public String getReportWriteReg() {
		return reportWriteReg;
	}
	public void setReportWriteReg(String reportWriteReg) {
		this.reportWriteReg = reportWriteReg;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	
}
