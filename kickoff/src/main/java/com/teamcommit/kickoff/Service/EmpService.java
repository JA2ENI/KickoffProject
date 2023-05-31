package com.teamcommit.kickoff.Service;


import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.EmployerDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

import java.util.List;

public interface EmpService {

    EmployerDO info_fix(EmployerDO employerDO);

    List<BoardDO> getList(BoardDO boardDO) throws Exception;

    List<ReservationDO> selectReservation(ReservationDO reservationDO) throws Exception;

    PlaceDO empFutsalInsert(PlaceDO placeDO) throws Exception;

    void updateFutsal(PlaceDO placeDO) throws Exception;
    
    List<PlaceDO> placeList(PlaceDO placeDO) throws Exception;
}