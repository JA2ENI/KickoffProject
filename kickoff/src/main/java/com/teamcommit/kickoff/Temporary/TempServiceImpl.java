package com.teamcommit.kickoff.Temporary;

import java.util.List;

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
	public List<ReservationDO> reservationList(String empId) throws Exception {
		return tempMapper.reservationList(empId);
	}

}
