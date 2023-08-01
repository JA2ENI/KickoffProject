package com.teamcommit.kickoff.yeonu;

import java.util.List;
import java.util.Map;

import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

public interface TeamRecruiterService {

	//팀 정보
	TeamInfoDO teamInfo(String userId) throws Exception;

	//모집글 별 지원자 수
//	TeamApplyDO applyCount(int applyCount) throws Exception;
	
	//모집글 리스트
	List<Map<String, String>> recruitInfoList(String userId) throws Exception; 
	
	//모집글 별 지원자 리스트
	List<Map<String, String>> teamApplyList(String rNum) throws Exception; 
	
	//지원자 정보
	List<UserDO> applyInfo(String userId) throws Exception;
}