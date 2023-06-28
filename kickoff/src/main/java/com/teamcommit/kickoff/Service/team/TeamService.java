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
    
    List<TeamDO> teamRecruitList(TeamDO teamDO) throws Exception;

    void insertTeam(TeamDO teamDO) throws Exception;

    TeamDO getTeamContents(int teamSeqNo) throws Exception;
    
    TeamInfoDO teamInfo(String userId) throws Exception;
    
    List<Map<String, String>> teamMemberList(int teamId) throws Exception;

    List<TeamDO> rankList(TeamDO teamDO) throws Exception;

//    void updateTeam(TeamDO teamDO) throws Exception;
    
    void insertTeamApply(TeamApplyDO teamApplyDO) throws Exception;

}
