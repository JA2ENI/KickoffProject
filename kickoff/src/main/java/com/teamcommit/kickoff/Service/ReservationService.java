package com.teamcommit.kickoff.Service;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;

import java.util.List;

public interface ReservationService {

    List<ReservationDO> selectReservationList(ReservationDO reservationDO) throws Exception;
    
    void insertReservation(ReservationDO reservationDO) throws Exception;

    ReservationDO selectReservationDetail(int reservationNO) throws Exception;

    void updateReservation(ReservationDO reservationDO) throws Exception;

    PlaceDO selectPlaceInfo(String empId) throws Exception;

    UserDO insertUserInfo(String userId) throws Exception;

    void insertReservationRequest(ReservationDO reservationDO) throws Exception;

}
