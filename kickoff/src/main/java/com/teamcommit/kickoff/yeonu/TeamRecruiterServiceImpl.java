package com.teamcommit.kickoff.yeonu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Do.TeamApplyDO;

@Service("TeamRecruiterService")
public class TeamRecruiterServiceImpl implements TeamRecruiterService {
	
	@Autowired
	private TeamRecruiterMapper teamRecruiterMapper;
	
	//지원자 리스트 & 상세보기
	@Override
	public List<TeamApplyDO> teamApplyList(String userId) {
		return teamRecruiterMapper.teamApplyList(userId);
	}
}
