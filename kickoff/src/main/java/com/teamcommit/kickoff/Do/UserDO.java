package com.teamcommit.kickoff.Do;

import java.util.Date;

public class UserDO {

	//사용자 아이디
	private String userId;
	//사용자 비밀번호
	private String userPw;
	//사용자 이름
	private String userName;
	//사용자 주소
	private String userAddress;
	//사용자 핸드폰번호
	private String userPhoneNumber;
	//사용자 이메일
	private String userEmail;
	//사용자 생년월일
	private String userBirthdate;
	//사용자 성별
	private String userGender;
	//사용자 포지션
	private String userPosition;
	//사용자 정지 횟수
	private int userStopCount;
	// 사용자 예약 취소 횟수
	private int userCancelCount;
	// 사용자 상태
	private String userStatus;
	// 사용자 구분
	private String userClassification;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserBirthdate() {
		return userBirthdate;
	}
	public void setUserBirthdate(String userBirthdate) {
		this.userBirthdate = userBirthdate;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserPosition() {
		return userPosition;
	}
	public void setUserPosition(String userPosition) {
		this.userPosition = userPosition;
	}
	public int getUserStopCount() {
		return userStopCount;
	}
	public void setUserStopCount(int userStopCount) {
		this.userStopCount = userStopCount;
	}
	public int getUserCancelCount() {
		return userCancelCount;
	}
	public void setUserCancelCount(int userCancelCount) {
		this.userCancelCount = userCancelCount;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public String getUserClassification() {
		return userClassification;
	}
	public void setUserClassification(String userClassification) {
		this.userClassification = userClassification;
	}
}
