package com.teamcommit.kickoff.Service.apply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
