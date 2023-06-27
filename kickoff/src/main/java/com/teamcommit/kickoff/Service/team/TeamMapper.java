package com.teamcommit.kickoff.Service.team;

import com.teamcommit.kickoff.Do.TeamApplyDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;


@Mapper
public interface TeamMapper {

    public List<TeamInfoDO> teamInfoList(TeamInfoDO teamInfoDO);
    
    public List<TeamDO> teamBoardList(TeamDO teamDO);
    
    public List<TeamDO> teamRecruitList(TeamDO teamDO);

    public TeamDO getTeamContents(int teamSeqNo);

    public void insertTeam(TeamDO teamDO);
    
//    public List<UserDO> teamMemberList(UserDO userDO);

    public List<TeamDO> rankList(TeamDO teamDO);
    
    public void insertTeamApply(TeamApplyDO teamApplyDO);
}
