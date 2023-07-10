package com.teamcommit.kickoff.Temporary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

@Service("tempService")
public class TempServiceImpl implements TempService {
	
	@Autowired
	private TempMapper tempMapper;
	
	@Override
	public PlaceDO placeInfo(String empId) throws Exception {
		return tempMapper.placeInfo(empId);
	}
	
	@Override
	public List<Map<String, String>> reservationList(String empId) throws Exception {
		return tempMapper.reservationList(empId);
	}
	
	@Override
	public List<Map<String, String>> applyInfoList(String rNum) throws Exception {
		return tempMapper.applyInfoList(rNum);
	}

	@Override
	public Map<String, String> userInfo(Map<String, String> map) throws Exception {
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap = tempMapper.userInfo(map);
		String rCount = tempMapper.reservationCount(map);
		resultMap.put("rCount", rCount);
		
		return resultMap;
	}
	
	@Override
	public Map<String, String> updateApplyStatus(Map<String, String> map) throws Exception {
		if(map.get("check").equals("accept")) {
			tempMapper.acceptApplyReservation(map);
		} else {
			tempMapper.refuseApplyReservation(map);
		}
		
		return tempMapper.updateApplyStatus(map);
	}
	
	@Override
	public List<Map<String, Object>> applyMarkList(String empId) throws Exception {
		List<ReservationDO> rList = tempMapper.rNumList(empId);
		List<Map<String, Object>> aList = new ArrayList<>();
		
		for(ReservationDO rDO : rList) {
			int rNum = rDO.getReservationNo();
			Map<String, Object> applyList = new HashMap<>();
			applyList.put("status", tempMapper.aNumList(rNum));
			aList.add(applyList);
		}
		
		for(int i=0; i<rList.size(); i++) {
			System.out.println("rList : " + rList.get(i));
		}
		
		for(int i=0; i<aList.size(); i++) {
			System.out.println("aList : " + aList.get(i));
		}
		
		
		return aList;
	}
	
}
