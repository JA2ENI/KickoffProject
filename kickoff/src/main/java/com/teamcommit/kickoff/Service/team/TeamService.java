package com.teamcommit.kickoff.Service.team;

import com.teamcommit.kickoff.Do.TeamApplyDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

import java.util.List;
import java.util.Map;

public interface TeamService {

    List<TeamInfoDO> teamInfoList(TeamInfoDO teamInfoDO) throws Exception;
    
    List<TeamDO> teamBoardList(TeamDO teamDO) throws Exception;
    
    List<TeamDO> teamRecruitList(Integer teamId) throws Exception;

    void insertTeam(TeamDO teamDO) throws Exception;
    
    void updateTeam(TeamDO teamDO) throws Exception;
    
    void deleteTeam(int teamSeqNo) throws Exception;
    
    TeamInfoDO selectTeamInfo(String userId) throws Exception;
    
//    int teamNameCheck(TeamInfoDO teamInfoDO) throws Exception;
    
    void teamCreation(TeamInfoDO teamInfoDO) throws Exception;

    TeamDO teamRecruitDetail(int teamSeqNo) throws Exception;
    
    List<TeamInfoDO> teamInfoDetail(String userId) throws Exception;
    
    TeamInfoDO teamManageButton(String userId) throws Exception;
    
    TeamInfoDO teamInfo(String userId) throws Exception;
    
    List<Map<String, Object>> teamMemberList(int teamId) throws Exception;
    
    void teamMemberDelete(String userId) throws Exception;

    List<TeamDO> rankList(TeamDO teamDO) throws Exception;
    
    void insertTeamApply(TeamApplyDO teamApplyDO) throws Exception;

}
