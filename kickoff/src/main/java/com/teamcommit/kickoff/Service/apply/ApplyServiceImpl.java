package com.teamcommit.kickoff.Service.apply;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Do.HelperApplyDO;
import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

@Service("applyService")
public class ApplyServiceImpl implements ApplyService {
	
	@Autowired
	private ApplyMapper applyMapper;
	
	@Override
	public PlaceDO placeInfo(String empId) throws Exception {
		return applyMapper.placeInfo(empId);
	}
	
	@Override
	public List<ReservationDO> reservationList(String empId) throws Exception {
		return applyMapper.reservationList(empId);
	}
	
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
