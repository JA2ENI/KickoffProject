package com.teamcommit.kickoff.Do;

public class PlaceDO {

	//풋살장 아이디
	private int placeId;
	//풋살장 이름
	private String placeName;
	//풋살장 주소
	private String placeAddress;
	//풋살장 전화번호
	private String placePhoneNumber;
	//풋살장 홈페이지
	private String placeHomepage;
	//풋살장 바닥형태
	private String placeGround;
	//풋살장 규격
	private String placeSize;
	//풋살장 형태(실내/실외)
	private String placeForm;
	//조명 유무
	private String placeLight;
	//풋살장 개방일수
	private String placeOpen;
	//풋살장 대관료
	private String placePrice;
	//풋살장 대여시간
	private String placeTime;
	//기타사항
	private String placeOther;
	//이미지 파일 이름
	private String imgName;
	//이미지 파일 저장 경로
	private String imgPath;

	private String empId;

	private String placeParking;

	public PlaceDO() {

	}

	public String getPlaceParking() {
		return placeParking;
	}

	public void setPlaceParking(String placeParking) {
		this.placeParking = placeParking;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public int getPlaceId() {
		return placeId;
	}

	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getPlaceAddress() {
		return placeAddress;
	}

	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}

	public String getPlacePhoneNumber() {
		return placePhoneNumber;
	}

	public void setPlacePhoneNumber(String placePhoneNumber) {
		this.placePhoneNumber = placePhoneNumber;
	}

	public String getPlaceHomepage() {
		return placeHomepage;
	}

	public void setPlaceHomepage(String placeHomepage) {
		this.placeHomepage = placeHomepage;
	}

	public String getPlaceGround() {
		return placeGround;
	}

	public void setPlaceGround(String placeGround) {
		this.placeGround = placeGround;
	}

	public String getPlaceSize() {
		return placeSize;
	}

	public void setPlaceSize(String placeSize) {
		this.placeSize = placeSize;
	}

	public String getPlaceForm() {
		return placeForm;
	}

	public void setPlaceForm(String placeForm) {
		this.placeForm = placeForm;
	}

	public String getPlaceLight() {
		return placeLight;
	}

	public void setPlaceLight(String placeLight) {
		this.placeLight = placeLight;
	}

	public String getPlaceOpen() {
		return placeOpen;
	}

	public void setPlaceOpen(String placeOpen) {
		this.placeOpen = placeOpen;
	}

	public String getPlacePrice() {
		return placePrice;
	}

	public void setPlacePrice(String placePrice) {
		this.placePrice = placePrice;
	}

	public String getPlaceTime() {
		return placeTime;
	}

	public void setPlaceTime(String placeTime) {
		this.placeTime = placeTime;
	}

	public String getPlaceOther() {
		return placeOther;
	}

	public void setPlaceOther(String placeOther) {
		this.placeOther = placeOther;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
}
