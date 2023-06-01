package com.teamcommit.kickoff.Service.main;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.GameDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("mainService")
public class MainServiceImpl implements MainService {

    @Autowired
    private MainMapper mainMapper;

    @Override
    public List<ReservationDO> selectReservationMain() throws Exception {
        return mainMapper.selectReservationMain();
    }

    @Override
    public List<GameDO> selectGameMain() throws Exception {
        return mainMapper.selectGameMain();
    }

    @Override
    public List<BoardDO> selectBoardMain() throws Exception {
        return mainMapper.selectBoardMain();
    }
}
