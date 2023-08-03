package com.teamcommit.kickoff.Service.apply;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.teamcommit.kickoff.Do.HelperApplyDO;
import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

public interface ApplyService {
	
	PlaceDO placeInfo(String empId) throws Exception;
	
	List<ReservationDO> reservationList(String empId) throws Exception;
	
	void helperApplyInsert(HelperApplyDO helperApplyDO) throws Exception;
	
	HelperApplyDO helperSelect(HelperApplyDO helperApplyDO) throws Exception;

	List<HelperDO> helperUserSelect(String helperUserId) throws Exception;
	
	int countAccept() throws Exception;
	
	public ArrayList<UserDO> helperApplyUser(int helperSeqno) throws Exception;
	
	public Map<String, String> recruiterMap(String userId) throws Exception;
	
	/*
	 * public UserDO recruiterUser(String userId) throws Exception;
	 * 
	 * public TeamInfoDO recruiterUserTeam(String userId) throws Exception;
	 * 
	 * public int countHelper(String userId) throws Exception;
	 */
}
