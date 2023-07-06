package com.teamcommit.kickoff.Service.team;

import com.teamcommit.kickoff.Do.TeamApplyDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;


@Mapper
public interface TeamMapper {

    public List<TeamInfoDO> teamInfoList(TeamInfoDO teamInfoDO);
    
    public List<TeamDO> teamBoardList(TeamDO teamDO);
    
    public List<TeamDO> teamRecruitList(Integer teamId);

    public TeamDO teamRecruitDetail(int teamSeqNo);

    public void insertTeam(TeamDO teamDO);
    
    public void updateTeam(TeamDO teamDO);
    
    public void deleteTeam(int teamSeqNo);
    
    public TeamInfoDO selectTeamInfo(String userId);
    
    public void teamCreation(TeamInfoDO teamInfoDO);
    
    public List<TeamInfoDO> teamInfoDetail(String userId);
    
    public TeamInfoDO teamManageButton(String userId);
    
    public TeamInfoDO teamInfo(String userId);
    
    public List<Map<String, Object>> teamMemberList(int teamId);

    public List<TeamDO> rankList(TeamDO teamDO);
    
    public void teamMemberDelete(String userId);
    
    public void insertTeamApply(TeamApplyDO teamApplyDO);
}
