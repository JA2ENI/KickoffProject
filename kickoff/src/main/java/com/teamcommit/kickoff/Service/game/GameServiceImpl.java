package com.teamcommit.kickoff.Service.game;

import com.teamcommit.kickoff.Do.GameDO;
import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Service("gameService")
public class GameServiceImpl implements GameService {

    @Autowired
    private GameMapper gameMapper;

    @Override
    public List<GameDO> gameDetail() throws Exception {
        return gameMapper.gameDetail();
    }

    @Override
    public GameDO getGameScoreDetail(int gameSeqno) throws Exception {
        return gameMapper.getGameScoreDetail(gameSeqno);
    }

    @Override
    public Map<String, Object> selectMemInfo(Map<String, Object> map) throws Exception {
        return gameMapper.selectMemInfo(map);
    }

    @Override
    public void insertGame(GameDO gameDO) throws Exception {
        gameMapper.insertGame(gameDO);
    }
    
    @Override
    public List<ReservationDO> selectPlaceInfo(String userId) throws Exception {
        return gameMapper.selectPlaceInfo(userId);
    }
    
    @Override
    public List<ReservationDO> selectDateInfo(String userId) throws Exception {
        return gameMapper.selectDateInfo(userId);
    }
    
    @Override
    public TeamInfoDO selectTeamInfoName(String userId) throws Exception {
        return gameMapper.selectTeamInfoName(userId);
    }
    
    @Override
    public GameDO selectGameFixForm(int gameSeqno) throws Exception {
        return gameMapper.selectGameFixForm(gameSeqno);
    }
    
    
    @Override
    public void fixGameForm(GameDO gameDO) throws Exception {
        gameMapper.fixGameForm(gameDO);
    }
    
    @Override
    public List<ReservationDO> updatePlaceInfo(int gameSeqno) throws Exception {
        return gameMapper.updatePlaceInfo(gameSeqno);
    }
    
    @Override
    public List<ReservationDO> updateDateInfo(int gameSeqno) throws Exception {
        return gameMapper.updateDateInfo(gameSeqno);
    }
    
    @Override
    public TeamInfoDO updateTeamInfoName(String userId) throws Exception {
        return gameMapper.updateTeamInfoName(userId);
    }
}
