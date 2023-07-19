package com.teamcommit.kickoff.Temporary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

@Service("tempService")
public class TempServiceImpl implements TempService {
	
	@Autowired
	private TempMapper tempMapper;
	
	@Override
	public Map<String, String> selectUserInfo(String userId) throws Exception {
		Map<String, String> selectUserInfo = tempMapper.selectUserInfo(userId);
		selectUserInfo.put("rCount", tempMapper.rCompleteCountAll(userId));
		selectUserInfo.put("gameCount", tempMapper.gCompleteCountAll(userId));
		
		return selectUserInfo;
	}
	
	@Override
	public List<ReservationDO> myApplyList(String userId) throws Exception {
		return tempMapper.myApplyList(userId);
	}
	
	@Override
	public PlaceDO placeInfo(String empId) throws Exception {
		return tempMapper.placeInfo(empId);
	}
	
	@Override
	public List<Map<String, String>> empReservationList(String empId) throws Exception {
		return tempMapper.empReservationList(empId);
	}
	
	@Override
	public List<Map<String, String>> userReservationList(String rNum) throws Exception {
		return tempMapper.userReservationList(rNum);
	}

	@Override
	public Map<String, String> userInfo(Map<String, String> map) throws Exception {
		Map<String, String> userInfo = tempMapper.userInfo(map);
		userInfo.put("rCount", tempMapper.rCompleteCount(map));
		
		return userInfo;
	}
	
	@Override
	public void updateApplyStatus(Map<String, String> map) throws Exception {
		if(map.get("check").equals("cancel")) {
			tempMapper.updateRefuse(map);
		} 
		
		if(map.get("check").equals("accept")) {
			tempMapper.updateAccept(map);
		} else {
			tempMapper.updateRefuse(map);
			List<Map<String, Object>> list = tempMapper.userStatusList(String.valueOf(map.get("rNum")));
			int count = 0;
			for(Map<String, Object> map2 : list) {
				String status = String.valueOf(map2.get("RESERVATION_STATUS"));
				if(status.equals("예약 취소")) {
					count += 1;
				}
				if(count == list.size()) {
					tempMapper.updateEmpStatus(map.get("rNum"));
				}
			}
		}
	}
	
	@Override
	public List<Map<String, Object>> applyMarkList(String empId) throws Exception {
		List<Map<String, Object>> empStatusList = tempMapper.empStatusList(empId);
		List<Map<String, Object>> applyMarkList = new ArrayList<>();
		
		for(Map<String, Object> map : empStatusList) {
			applyMarkList.add(map);
		}
		
		for(Map<String, Object> map : empStatusList) {
			List<Map<String, Object>> list = tempMapper.userStatusList(String.valueOf(map.get("RESERVATION_NO")));
			for(Map<String, Object> map2 : list) { 
				applyMarkList.add(map2);
			} 
		}
		
		return applyMarkList;
	}
	
}
