package com.teamcommit.kickoff.Temporary;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

@Mapper
public interface TempMapper {

	public Map<String, String> selectUserInfo(String userId);
	
	public String rCompleteCountAll(String userId);
	
	public String gCompleteCountAll(String userId);
	
	public List<ReservationDO> myApplyList(String userId);
	
	public PlaceDO placeInfo(String empId);
	
	public List<Map<String, String>> empReservationList(String empId); 
	
	public List<Map<String, String>> userReservationList(String rNum); 
	
	public Map<String, String> userInfo(Map<String, String> map);
	
	public String rCompleteCount(Map<String, String> map);
	
	public void updateAccept(Map<String, String> map);
	
	public void updateRefuse(Map<String, String> map);

	public void updateEmpStatus(String rNum);
	
	public List<Map<String, Object>> empStatusList(String empId);
	
	public List<Map<String, Object>> userStatusList(String rNum); 
	
}
