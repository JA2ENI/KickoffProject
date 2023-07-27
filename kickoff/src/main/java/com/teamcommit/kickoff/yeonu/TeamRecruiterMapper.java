package com.teamcommit.kickoff.yeonu;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

@Mapper
public interface TeamRecruiterMapper {
	
	//팀 정보
	public TeamInfoDO teamInfo(String userId);

	//모집글 별 지원자 수
//	public TeamApplyDO applyCount(int applyCount);

	//모집글 리스트
	public List<Map<String, String>> recruitInfoList(String userId); 
	
	//모집글 별 지원자 리스트
	public List<Map<String, String>> teamApplyList(String rNum);
	
	//지원자 정보
	public List<UserDO> applyInfo(String userId);
}
