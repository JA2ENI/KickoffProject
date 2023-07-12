package com.teamcommit.kickoff.Service.game;

import com.teamcommit.kickoff.Do.GameDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface GameMapper {
    public List<GameDO> gameDetail();

    public GameDO getGameScoreDetail(int gameSeqno);

    Map<String, Object> selectMemInfo(Map<String, Object> map);

    public void insertGame(GameDO gameDO);

	public TeamInfoDO selectTeamInfoName(String userId);

	public List<ReservationDO> selectPlaceInfo(String userId);
	
	public List<ReservationDO> selectDateInfo(String userId);

	public GameDO selectGameFixForm(int gameSeqno);

	public void fixGameForm(GameDO gameDO);

	public List<ReservationDO> updatePlaceInfo(int gameSeqno);

	public List<ReservationDO> updateDateInfo(int gameSeqno);

	public TeamInfoDO updateTeamInfoName(String userId);

	public void getGameApply(String team2Name);
	
	public void insertGameApply(String applyTeam);

}
