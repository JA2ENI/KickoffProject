package com.teamcommit.kickoff.Service.apply;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.teamcommit.kickoff.Do.HelperApplyDO;
import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;

public interface ApplyService {
	
	/* 예약 신청자&모집자 페이지 : 안재은 */
	Map<String, String> selectUserInfo(String userId) throws Exception;
	
	List<ReservationDO> myApplyList(ReservationDO rDO) throws Exception;
	
	int myApplyListCount(String userId) throws Exception;

	PlaceDO placeInfo(String empId) throws Exception;
	
	List<Map<String, String>> empReservationList(ReservationDO rDO) throws Exception; 

	int empReservationListCount(String empId) throws Exception;
	
	List<Map<String, String>> userReservationList(String rNum) throws Exception; 
	
	Map<String, String> userInfo(Map<String, String> map);
	
	void updateApplyStatus(Map<String, String> map);
	
	List<Map<String, Object>> applyMarkList(Map<String, String> map); 
	/* 예약 신청자&모집자 페이지 END */
	
	void helperApplyInsert(HelperApplyDO helperApplyDO) throws Exception;
	
	HelperApplyDO helperSelect(HelperApplyDO helperApplyDO) throws Exception;

	List<HelperDO> helperUserSelect(String helperUserId) throws Exception;
	
	int countAccept() throws Exception;
	
	public ArrayList<UserDO> helperApplyUser(int helperSeqno) throws Exception;
	
	public Map<String, String> recruiterMap(String userId) throws Exception;
	
	/*
	 * public UserDO recruiterUser(String userId) throws Exception;
	 * 
	 * public TeamInfoDO recruiterUserTeam(String userId) throws Exception;
	 * 
	 * public int countHelper(String userId) throws Exception;
	 */
}
