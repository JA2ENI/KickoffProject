package com.teamcommit.kickoff.Service.apply;

import java.util.List;

import com.teamcommit.kickoff.Do.HelperApplyDO;
import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;

public interface ApplyService {
	
	PlaceDO placeInfo(String empId) throws Exception;
	
	List<ReservationDO> reservationList(String empId) throws Exception;
	
	void helperApplyInsert(HelperApplyDO helperApplyDO) throws Exception;
	
	HelperApplyDO helperSelect(HelperApplyDO helperApplyDO) throws Exception;

	List<HelperDO> helperUserSelect(String helperUserId) throws Exception;
	
	int countAccept() throws Exception;
	
	public List<UserDO> helperApplyUser(int helperSeqno) throws Exception;
}
