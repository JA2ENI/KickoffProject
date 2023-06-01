package com.teamcommit.kickoff.Service.team;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.TeamApplyDO;
import com.teamcommit.kickoff.Do.TeamDO;

import java.util.List;

public interface TeamService {

    List<TeamDO> getList(TeamDO teamDO) throws Exception;

    void insertTeam(TeamDO teamDO) throws Exception;

    TeamDO getTeamContents(int teamSeqNo) throws Exception;

    List<TeamDO> rankList(TeamDO teamDO) throws Exception;

//    void updateTeam(TeamDO teamDO) throws Exception;
    
    void insertTeamApply(TeamApplyDO teamApplyDO) throws Exception;

}
