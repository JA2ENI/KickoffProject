package com.teamcommit.kickoff.Do;

import java.util.Date;

public class EmployerDO {

	//업체 아이디
	private String empId;
	//업체 비밀번호
	private String empPw;
	//업체 이름
	private String empName;
	//업체 주소
	private String empAddress;
	//업체 번호
	private String empPhoneNumber;
	//업체 이메일
	private String empEmail;
	//업체 등록일
	private String empDate;
	//풋살장 아이디
	private int placeId;
	// 사업자 번호
	private String empNo;
	// 업체 회원 정지 횟수
	private int empStopCount;
	// 업체 회원 예약 거절 횟수
	private int empCancelCount;
	// 업체 회원 상태
	private String empStatus;
	// 업체 회원 구분
	private String empClassification;
	//업체 회원 정지 날자
	private Date empStopDate;


	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpPw() {
		return empPw;
	}
	public void setEmpPw(String empPw) {
		this.empPw = empPw;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpAddress() {
		return empAddress;
	}
	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}
	public String getEmpPhoneNumber() {
		return empPhoneNumber;
	}
	public void setEmpPhoneNumber(String empPhoneNumber) {
		this.empPhoneNumber = empPhoneNumber;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getEmpDate() {
		return empDate;
	}
	public void setEmpDate(String empDate) {
		this.empDate = empDate;
	}
	public int getPlaceId() {
		return placeId;
	}
	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public int getEmpStopCount() {
		return empStopCount;
	}
	public void setEmpStopCount(int empStopCount) {
		this.empStopCount = empStopCount;
	}
	public int getEmpCancelCount() {
		return empCancelCount;
	}
	public void setEmpCancelCount(int empCancelCount) {
		this.empCancelCount = empCancelCount;
	}
	public String getEmpStatus() {
		return empStatus;
	}
	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}
	public String getEmpClassification() {
		return empClassification;
	}
	public void setEmpClassification(String empClassification) {
		this.empClassification = empClassification;
	}
	public Date getEmpStopDate() {
		return empStopDate;
	}
	public void setEmpStopDate(Date empStopDate) {
		this.empStopDate = empStopDate;
	}
	
}
