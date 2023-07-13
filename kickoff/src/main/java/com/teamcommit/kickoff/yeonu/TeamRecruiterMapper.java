package com.teamcommit.kickoff.yeonu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamcommit.kickoff.Do.TeamApplyDO;

@Mapper
public interface TeamRecruiterMapper {

	//지원자 리스트 & 상세보기
	public List<TeamApplyDO> teamApplyList(String userId);
}
