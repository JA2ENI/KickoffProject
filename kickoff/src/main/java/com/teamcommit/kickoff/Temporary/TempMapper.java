package com.teamcommit.kickoff.Temporary;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

@Mapper
public interface TempMapper {

	public PlaceDO placeInfo(String empId);
	
	public List<Map<String, String>> reservationList(String empId); 
	
	public List<Map<String, String>> applyInfoList(String rNum); 
	
	public Map<String, String> userInfo(Map<String, String> map);
	
	public String reservationCount(Map<String, String> map);
	
	public void acceptApplyReservation(Map<String, String> map);
	
	public void refuseApplyReservation(Map<String, String> map);
	
	public Map<String, String> updateApplyStatus(Map<String, String> map);
	
	public List<ReservationDO> rNumList(String empId); 
	
	public List<ReservationDO> aNumList(int rNum); 
	
}
