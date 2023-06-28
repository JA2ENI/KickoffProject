package com.teamcommit.kickoff.Service.apply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Do.HelperApplyDO;
import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

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
}
