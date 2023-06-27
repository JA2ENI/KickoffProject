package com.teamcommit.kickoff.Temporary;

import java.util.List;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

public interface TempService {
	
	PlaceDO placeInfo(String empId) throws Exception;
	
	List<ReservationDO> reservationList(String empId) throws Exception;

}
