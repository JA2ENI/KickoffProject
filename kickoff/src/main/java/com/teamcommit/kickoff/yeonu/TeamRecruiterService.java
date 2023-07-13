package com.teamcommit.kickoff.yeonu;

import java.util.List;

import com.teamcommit.kickoff.Do.TeamApplyDO;

public interface TeamRecruiterService {

	//지원자 리스트 & 상세보기
	List<TeamApplyDO> teamApplyList(String userId) throws Exception;
}