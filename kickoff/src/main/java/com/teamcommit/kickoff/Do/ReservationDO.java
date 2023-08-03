package com.teamcommit.kickoff.Do;

public class ReservationDO {

	private String reservationType;

	//예약 고유 번호
	private int reservationNo;
	//예약자 아이디
	private String userId;
	//예약 풋살장 아이디
	private int placeId;
	//예약 풋살장 이름
	private String reservationPlaceName;
	//예약 풋살장 위치
	private String reservationPlaceAddress;
	//예약 날짜
	private String reservationDate;
	//예약 인원
	private String reservationNumber;
	//예약 상태
	private String reservationStatus;
	//예약 등록 일자
	private String reservationRegDate;
	//예약 수정 일자
	private String reservationEditDate;
	//예약 시작 시간
	private String reservationStartTime;
	//예약 종료 시간
	private String reservationEndTime;
	//예약 기타 사항
	private String reservationComment;
	//예약 가격
	private Long reservationPrice;
	//코트 이름
	private String reservationCourtName;
	//코트 형태
	private String reservationCourtForm;
	//예약 취소 유무
	private String reservationCancel;

	private String empId;

	private String imgName;

	private String imgPath;

	//경기 형태
	private String reservationHeadcount;

	private String reservationPlaceSize;

	private String reservationPlaceGround;

	private String reservationPlaceParking;
	
	private String reservationPlaceLight;

	private String reservationUserName;

	private String reservationUserPhone;
	
	private int reservationOriginNo;

	private String dayOfWeek;
	
	private String userStatus;
	
	private int startIndex; 
	
	private int endIndex;
	
	public ReservationDO() {
		
	}
	
	public int getReservationOriginNo() {
		return reservationOriginNo;
	}

	public void setReservationOriginNo(int reservationOriginNo) {
		this.reservationOriginNo = reservationOriginNo;
	}


	public String getReservationUserName() {
		return reservationUserName;
	}

	public void setReservationUserName(String reservationUserName) {
		this.reservationUserName = reservationUserName;
	}

	public String getReservationUserPhone() {
		return reservationUserPhone;
	}

	public void setReservationUserPhone(String reservationUserPhone) {
		this.reservationUserPhone = reservationUserPhone;
	}

	public String getReservationType() {
		return reservationType;
	}

	public void setReservationType(String reservationType) {
		this.reservationType = reservationType;
	}

	public String getReservationPlaceSize() {
		return reservationPlaceSize;
	}

	public void setReservationPlaceSize(String reservationPlaceSize) {
		this.reservationPlaceSize = reservationPlaceSize;
	}

	public String getReservationPlaceGround() {
		return reservationPlaceGround;
	}

	public void setReservationPlaceGround(String reservationPlaceGround) {
		this.reservationPlaceGround = reservationPlaceGround;
	}

	public String getReservationPlaceParking() {
		return reservationPlaceParking;
	}

	public void setReservationPlaceParking(String reservationPlaceParking) {
		this.reservationPlaceParking = reservationPlaceParking;
	}
	
	public String getReservationPlaceLight() {
		return reservationPlaceLight;
	}

	public void setReservationPlaceLight(String reservationPlaceLight) {
		this.reservationPlaceLight = reservationPlaceLight;
	}

	public String getReservationHeadcount() {
		return reservationHeadcount;
	}

	public void setReservationHeadcount(String reservationHeadcount) {
		this.reservationHeadcount = reservationHeadcount;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
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

	public ReservationDO(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPlaceId() {
		return placeId;
	}

	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getReservationNumber() {
		return reservationNumber;
	}

	public void setReservationNumber(String reservationNumber) {
		this.reservationNumber = reservationNumber;
	}

	public String getReservationStatus() {
		return reservationStatus;
	}

	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}

	public String getReservationRegDate() {
		return reservationRegDate;
	}

	public void setReservationRegDate(String reservationRegDate) {
		this.reservationRegDate = reservationRegDate;
	}

	public String getReservationEditDate() {
		return reservationEditDate;
	}

	public void setReservationEditDate(String reservationEditDate) {
		this.reservationEditDate = reservationEditDate;
	}

	public String getReservationStartTime() {
		return reservationStartTime;
	}

	public void setReservationStartTime(String reservationStartTime) {
		this.reservationStartTime = reservationStartTime;
	}

	public String getReservationEndTime() {
		return reservationEndTime;
	}

	public void setReservationEndTime(String reservationEndTime) {
		this.reservationEndTime = reservationEndTime;
	}

	public String getReservationComment() {
		return reservationComment;
	}

	public void setReservationComment(String reservationComment) {
		this.reservationComment = reservationComment;
	}

	public Long getReservationPrice() {
		return reservationPrice;
	}

	public void setReservationPrice(Long reservationPrice) {
		this.reservationPrice = reservationPrice;
	}

	public String getReservationCourtName() {
		return reservationCourtName;
	}

	public void setReservationCourtName(String reservationCourtName) {
		this.reservationCourtName = reservationCourtName;
	}

	public String getReservationCourtForm() {
		return reservationCourtForm;
	}

	public void setReservationCourtForm(String reservationCourtForm) {
		this.reservationCourtForm = reservationCourtForm;
	}

	public String getReservationCancel() {
		return reservationCancel;
	}

	public void setReservationCancel(String reservationCancel) {
		this.reservationCancel = reservationCancel;
	}

	public String getReservationPlaceName() {
		return reservationPlaceName;
	}

	public void setReservationPlaceName(String reservationPlaceName) {
		this.reservationPlaceName = reservationPlaceName;
	}

	public String getReservationPlaceAddress() {
		return reservationPlaceAddress;
	}

	public void setReservationPlaceAddress(String reservationPlaceAddress) {
		this.reservationPlaceAddress = reservationPlaceAddress;
	}

	public String getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
}
