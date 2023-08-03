package com.teamcommit.kickoff.Service.apply;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamcommit.kickoff.Do.HelperApplyDO;
import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

@Mapper
public interface ApplyMapper {

	public PlaceDO placeInfo(String empId);
	
	public List<ReservationDO> reservationList(String empId);
	
	public void helperApplyInsert(HelperApplyDO helperApplyDO);
	
	public HelperApplyDO helperSelect(HelperApplyDO helperApplyDO);
	
	public List<HelperDO> helperUserSelect(String helperUserId);
	
	public int countAccept();
	
	public ArrayList<UserDO> helperApplyUser(int helperSeqno);
	
	public Map<String, String> recruiterUser(String userId);
	
	public String countHelper(String userId);
}
