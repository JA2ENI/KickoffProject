package com.teamcommit.kickoff.Service;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.GameDO;
import com.teamcommit.kickoff.Do.ReservationDO;

import java.util.List;

public interface MainService {

    List<ReservationDO> selectReservationMain() throws Exception;

    List<GameDO> selectGameMain() throws Exception;

    List<BoardDO> selectBoardMain() throws Exception;

}
