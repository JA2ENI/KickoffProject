package com.teamcommit.kickoff.Service.apply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

@Mapper
public interface ApplyMapper {

	public PlaceDO placeInfo(String empId);
	
	public List<ReservationDO> reservationList(String empId);
}
