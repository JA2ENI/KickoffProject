package com.teamcommit.kickoff.Do;

import com.teamcommit.kickoff.Controller.BoardController;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import java.util.Date;

@Component
public class BoardDO {

	//게시글 번호
	private int boardSeqno;
	//작성자 아이디
	private String writeId;
	//글 제목
	private String writeTitle;
	//글 내용
	private String writeContent;
	//등록일자
	private String writeRegDate;
	//수정일자
	private String writeEditDate;
	//게시글 신고수
	private int reportCount;
	//게시글 조회수
	private int viewCount;
	//파일 이름
	private String fileName;
	//파일 저장 경로
	private String filePath;
	//작성자 아이디
	private String writeIdEmp;
	//게시글 댓글수
	private int replyCount;
	//파일 고유 ID
	private int fileId;
	//파일 원본 이름
	private String origFileName;
	
	public int getBoardSeqno() {
		return boardSeqno;
	}
	public void setBoardSeqno(int boardSeqno) {
		this.boardSeqno = boardSeqno;
	}
	public String getWriteId() {
		return writeId;
	}
	public void setWriteId(String writeId) {
		this.writeId = writeId;
	}
	public String getWriteTitle() {
		return writeTitle;
	}
	public void setWriteTitle(String writeTitle) {
		this.writeTitle = writeTitle;
	}
	public String getWriteContent() {
		return writeContent;
	}
	public void setWriteContent(String writeContent) {
		this.writeContent = writeContent;
	}
	public String getWriteRegDate() {
		return writeRegDate;
	}
	public void setWriteRegDate(String writeRegDate) {
		this.writeRegDate = writeRegDate;
	}
	public String getWriteEditDate() {
		return writeEditDate;
	}
	public void setWriteEditDate(String writeEditDate) {
		this.writeEditDate = writeEditDate;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getWriteIdEmp() {
		return writeIdEmp;
	}

	public void setWriteIdEmp(String writeIdEmp) {
		this.writeIdEmp = writeIdEmp;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
}
