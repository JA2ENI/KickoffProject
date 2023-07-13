package com.teamcommit.kickoff.Temporary;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

public interface TempService {
	
	Map<String, String> selectUserInfo(String userId) throws Exception;
	
	List<ReservationDO> myApplyList(String userId) throws Exception;
	
	PlaceDO placeInfo(String empId) throws Exception;
	
	List<Map<String, String>> empReservationList(String empId) throws Exception; 
	
	List<Map<String, String>> userReservationList(String rNum) throws Exception; 
	
	Map<String, String> userInfo(Map<String, String> map) throws Exception;
	
	void updateApplyStatus(Map<String, String> map) throws Exception;
	
	List<Map<String, Object>> applyMarkList(String empId) throws Exception; 
	
}
