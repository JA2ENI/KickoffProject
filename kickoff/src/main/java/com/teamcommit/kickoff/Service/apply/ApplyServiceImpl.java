package com.teamcommit.kickoff.Service.apply;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Common.Pagination;
import com.teamcommit.kickoff.Do.HelperApplyDO;
import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;

@Service("applyService")
public class ApplyServiceImpl implements ApplyService {
	
	@Autowired
	private ApplyMapper applyMapper;
	
	/* 예약 신청자&모집자 페이지 : 안재은 */
	@Override
	public Map<String, String> selectUserInfo(String userId) throws Exception {
		Map<String, String> selectUserInfo = applyMapper.selectUserInfo(userId);
		selectUserInfo.put("rCount", applyMapper.rCompleteCountAll(userId));
		selectUserInfo.put("gameCount", applyMapper.gCompleteCountAll(userId));
		
		return selectUserInfo;
	}
	
	@Override
	public List<ReservationDO> myApplyList(ReservationDO rDO) throws Exception {
		return applyMapper.myApplyList(rDO);
	}
	
	@Override
	public int myApplyListCount(String userId) throws Exception {
		return applyMapper.myApplyListCount(userId);
	}
	
	@Override
	public PlaceDO placeInfo(String empId) throws Exception {
		return applyMapper.placeInfo(empId);
	}
	
	@Override
	public List<Map<String, String>> empReservationList(ReservationDO rDO) throws Exception {
		return applyMapper.empReservationList(rDO);
	}
	
	@Override
	public int empReservationListCount(String empId) throws Exception {
		return applyMapper.empReservationListCount(empId);
	}
	
	@Override
	public List<Map<String, String>> userReservationList(String rNum) throws Exception {
		return applyMapper.userReservationList(rNum);
	}

	@Override
	public Map<String, String> userInfo(Map<String, String> map) {
		Map<String, String> userInfo = applyMapper.userInfo(map);
		userInfo.put("rCount", applyMapper.rCompleteCount(map));
		
		return userInfo;
	}
	
	@Override
	public void updateApplyStatus(Map<String, String> map) {
		if(map.get("check").equals("cancel")) {
			applyMapper.updateRefuse(map);
		} 
		
		if(map.get("check").equals("accept")) {
			applyMapper.updateAccept(map);
		} else {
			applyMapper.updateRefuse(map);
			List<Map<String, Object>> list = applyMapper.userStatusList(String.valueOf(map.get("rNum")));
			int count = 0;
			for(Map<String, Object> map2 : list) {
				String status = String.valueOf(map2.get("RESERVATION_STATUS"));
				if(status.equals("예약 취소")) {
					count += 1;
				}
				if(count == list.size()) {
					applyMapper.updateEmpStatus(map.get("rNum"));
				}
			}
		}
	}
	
	@Override
	public List<Map<String, Object>> applyMarkList(Map<String, String> map) {
		int rListCnt = applyMapper.empReservationListCount(map.get("empId"));
		int curPage = Integer.parseInt(map.get("curPage"));
		int pageSize = 5;
		Pagination pagination = new Pagination(rListCnt, curPage, pageSize);
		map.put("startIndex", String.valueOf(pagination.getStartIndex()));
		map.put("endIndex", String.valueOf(pagination.getEndIndex()));
		
		List<Map<String, Object>> empStatusList = applyMapper.empStatusList(map);
		List<Map<String, Object>> applyMarkList = new ArrayList<>();
		for(Map<String, Object> map2 : empStatusList) {
			applyMarkList.add(map2);
		}
		
		for(Map<String, Object> map3 : empStatusList) {
			List<Map<String, Object>> list = applyMapper.userStatusList(String.valueOf(map3.get("RESERVATION_NO")));
			for(Map<String, Object> map4 : list) { 
				applyMarkList.add(map4);
			} 
		}
		
		return applyMarkList;
	}
	/* 예약 신청자&모집자 페이지 END */
	
	@Override
	public void helperApplyInsert(HelperApplyDO helperApplyDO) throws Exception {
		applyMapper.helperApplyInsert(helperApplyDO);
	}
	
	@Override
	public HelperApplyDO helperSelect(HelperApplyDO helperApplyDO) throws Exception {
		return applyMapper.helperSelect(helperApplyDO);
	}

	@Override
	public List<HelperDO> helperUserSelect(String helperUserId) throws Exception {
		return applyMapper.helperUserSelect(helperUserId);
	}
	
	@Override
	public int countAccept() throws Exception {
		return applyMapper.countAccept();
	}
	
	@Override
	public ArrayList<UserDO> helperApplyUser(int helperSeqno) throws Exception {
		return applyMapper.helperApplyUser(helperSeqno);
	}
	
	@Override
	public Map<String, String> recruiterMap(String userId) throws Exception {
		Map<String, String> userInfo = applyMapper.recruiterUser(userId);
		userInfo.put("helperInfo", applyMapper.countHelper(userId));
		return userInfo;
	}
	
	/*
	 * @Override public UserDO recruiterUser(String userId) throws Exception {
	 * return applyMapper.recruiterUser(userId); }
	 * 
	 * @Override public TeamInfoDO recruiterUserTeam(String userId) throws Exception
	 * { return applyMapper.recruiterUserTeam(userId); }
	 * 
	 * @Override public int countHelper(String userId) throws Exception { return
	 * applyMapper.countHelper(userId); }
	 */
}
