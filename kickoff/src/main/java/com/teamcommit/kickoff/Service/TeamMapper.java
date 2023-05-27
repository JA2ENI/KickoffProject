package com.teamcommit.kickoff.Service;

import com.teamcommit.kickoff.Do.TeamDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface TeamMapper {

    public List<TeamDO> getList(TeamDO teamDO);

    public TeamDO getTeamContents(int teamSeqNo);

    public void insertTeam(TeamDO teamDO);

    public List<TeamDO> rankList(TeamDO teamDO);
}
