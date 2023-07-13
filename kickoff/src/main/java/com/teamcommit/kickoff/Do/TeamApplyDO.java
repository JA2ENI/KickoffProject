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
	//지원자 이름
	private String userName;
	//지원자 성별
	private String userGender;
	//지원자 휴대전화
	private String userPhoneNumber;
	//지원자 메인 포지션
	private String userMainPosition;
	//지원자 서브 포지션
	private String userSubPosition;
	//모집 게시글 번호
	private int boardSeqno;
	//지원자 지역
	private String userLocal;
	//지원자 용병 횟수
	private int userHelperCount;
	//지원자 나이
	private int userAge;
	//지원 상태
	private String applyStatus;
	//모집자 아이디
	private String leaderId;
	
	
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}
	public String getUserMainPosition() {
		return userMainPosition;
	}
	public void setUserMainPosition(String userMainPosition) {
		this.userMainPosition = userMainPosition;
	}
	public String getUserSubPosition() {
		return userSubPosition;
	}
	public void setUserSubPosition(String userSubPosition) {
		this.userSubPosition = userSubPosition;
	}
	public int getBoardSeqno() {
		return boardSeqno;
	}
	public void setBoardSeqno(int boardSeqno) {
		this.boardSeqno = boardSeqno;
	}
	public String getUserLocal() {
		return userLocal;
	}
	public void setUserLocal(String userLocal) {
		this.userLocal = userLocal;
	}
	public int getUserHelperCount() {
		return userHelperCount;
	}
	public void setUserHelperCount(int userHelperCount) {
		this.userHelperCount = userHelperCount;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public String getApplyStatus() {
		return applyStatus;
	}
	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}
	public String getLeaderId() {
		return leaderId;
	}
	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}
	
}
