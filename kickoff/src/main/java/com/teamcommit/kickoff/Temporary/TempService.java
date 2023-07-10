package com.teamcommit.kickoff.Temporary;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

public interface TempService {
	
	PlaceDO placeInfo(String empId) throws Exception;
	
	List<Map<String, String>> reservationList(String empId) throws Exception; 
	
	List<Map<String, String>> applyInfoList(String rNum) throws Exception; 
	
	Map<String, String> userInfo(Map<String, String> map) throws Exception;
	
	Map<String, String> updateApplyStatus(Map<String, String> map) throws Exception;
	
	List<Map<String, Object>> applyMarkList(String empId) throws Exception; 
	
}
