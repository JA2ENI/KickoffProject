package com.teamcommit.kickoff.Service.apply;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamcommit.kickoff.Do.HelperApplyDO;
import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;

@Mapper
public interface ApplyMapper {
	
public Map<String, String> selectUserInfo(String userId);
	
	/* 예약 신청자&모집자 페이지 : 안재은 */
	public String rCompleteCountAll(String userId);
	
	public String gCompleteCountAll(String userId);
	
	public List<ReservationDO> myApplyList(ReservationDO rDO);
	
	public int myApplyListCount(String userId);

	public PlaceDO placeInfo(String empId);
	
	public List<Map<String, String>> empReservationList(ReservationDO rDO); 

	public int empReservationListCount(String empId);
	
	public List<Map<String, String>> userReservationList(String rNum); 
	
	public Map<String, String> userInfo(Map<String, String> map);
	
	public String rCompleteCount(Map<String, String> map);
	
	public void updateAccept(Map<String, String> map);
	
	public void updateRefuse(Map<String, String> map);

	public void updateEmpStatus(String rNum);
	
	public List<Map<String, Object>> empStatusList(Map<String, String> map);
	
	public List<Map<String, Object>> userStatusList(String rNum); 
	/* 예약 신청자&모집자 페이지 END */
	
	public void helperApplyInsert(HelperApplyDO helperApplyDO);
	
	public HelperApplyDO helperSelect(HelperApplyDO helperApplyDO);
	
	public List<HelperDO> helperUserSelect(String helperUserId);
	
	public int countAccept();
	
	public ArrayList<UserDO> helperApplyUser(int helperSeqno);
	
	public Map<String, String> recruiterUser(String userId);
	
	public String countHelper(String userId);
}
