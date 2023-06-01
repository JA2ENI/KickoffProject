package com.teamcommit.kickoff.Service.reservation;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private ReservationMapper reservationMapper;

    @Override
    public List<ReservationDO> selectReservationList(ReservationDO reservationDO) throws Exception {
        return reservationMapper.selectReservationList(reservationDO);
    }

    @Override
    public void insertReservation(ReservationDO reservationDO) throws Exception {
        reservationMapper.insertReservation(reservationDO);
    }

    @Override
    public ReservationDO selectReservationDetail(int reservationNo) throws Exception {
        return reservationMapper.selectReservationDetail(reservationNo);
    }

    @Override
    public void updateReservation(ReservationDO reservationDO) {
        reservationMapper.updateReservation(reservationDO);
    }

    @Override
    public PlaceDO selectPlaceInfo(String empId) throws Exception {
        return reservationMapper.selectPlaceInfo(empId);
    }

    @Override
    public UserDO insertUserInfo(String userId) {
        return reservationMapper.insertUserInfo(userId);
    }

    @Override
    public void insertReservationRequest(ReservationDO reservationDO) throws Exception {
        reservationMapper.insertReservationRequest(reservationDO);
    }

}




