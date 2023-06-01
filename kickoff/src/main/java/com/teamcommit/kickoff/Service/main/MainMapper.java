package com.teamcommit.kickoff.Service.main;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.GameDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainMapper {
    List<ReservationDO> selectReservationMain();

    List<GameDO> selectGameMain();

    List<BoardDO> selectBoardMain();
}
