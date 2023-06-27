package com.teamcommit.kickoff.Temporary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Service.apply.ApplyMapper;

@Service("applyService")
public class TempServiceImpl implements TampService {
	
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

}
