package com.teamcommit.kickoff.Service.game;

import com.teamcommit.kickoff.Do.GameDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.List;

public interface GameService {

    List<GameDO> gameDetail() throws Exception;

    GameDO getGameScoreDetail(int gameSeqno) throws Exception;

    Map<String, Object> selectMemInfo(Map<String, Object> map) throws Exception;

    void insertGame(GameDO gameDO) throws Exception;

    List<ReservationDO>selectPlaceInfo(String userId) throws Exception;

	TeamInfoDO selectTeamInfoName(String userId) throws Exception;

	List<ReservationDO> selectDateInfo(String userId) throws Exception;

	GameDO selectGameFixForm(int gameSeqno) throws Exception;

	void fixGameForm(GameDO gameDO) throws Exception;

	List<ReservationDO> updatePlaceInfo(int gameSeqno) throws Exception;

	List<ReservationDO> updateDateInfo(int gameSeqno) throws Exception;

	TeamInfoDO updateTeamInfoName(String userId) throws Exception;

}