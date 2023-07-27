package com.teamcommit.kickoff.yeonu;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

@Service("TeamRecruiterService")
public class TeamRecruiterServiceImpl implements TeamRecruiterService {
	
	@Autowired
	private TeamRecruiterMapper teamRecruiterMapper;
	
	//팀 정보
	@Override
	public TeamInfoDO teamInfo(String userId) {
		return teamRecruiterMapper.teamInfo(userId);
	}

	//모집글 별 지원자 수
//	@Override
//	public TeamApplyDO applyCount(int applyCount) {
//		return teamRecruiterMapper.applyCount(applyCount);
//	}
	
	//모집글 리스트
	@Override
	public List<Map<String, String>> recruitInfoList(String userId) throws Exception {
		return teamRecruiterMapper.recruitInfoList(userId);
	}
	
	//모집글 별 지원자 리스트
	@Override
	public List<Map<String, String>> teamApplyList(String rNum) throws Exception {
		return teamRecruiterMapper.teamApplyList(rNum);
	}
	
	//지원자 정보
	@Override
	public List<UserDO> applyInfo(String userId) throws Exception {
		return teamRecruiterMapper.applyInfo(userId);
	}
}
