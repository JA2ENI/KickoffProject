package com.teamcommit.kickoff.Service.reservation;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private ReservationMapper reservationMapper;

    @Override
    public List<Map<String, String>> selectReservationList(ReservationDO rDO) throws Exception {
        return reservationMapper.selectReservationList(rDO);
    }
    
    @Override
    public int reservationListCount() throws Exception {
    	return reservationMapper.reservationListCount();
    }
    
    @Override
    public void insertReservation(ReservationDO rDO) throws Exception {
        reservationMapper.insertReservation(rDO);
    }

    @Override
    public Map<String, String> selectReservationDetail(int rNum) throws Exception {
        return reservationMapper.selectReservationDetail(rNum);
    }

    @Override
    public void updateReservation(ReservationDO rDO) {
        reservationMapper.updateReservation(rDO);
    }

    @Override
    public PlaceDO selectPlaceInfo(String empId) throws Exception {
        return reservationMapper.selectPlaceInfo(empId);
    }

    @Override
    public Map<String, String> selectReservationRequest(Map<String, String> map) {
    	Map<String, String> reservationRequest = reservationMapper.selectReservationDetail(Integer.parseInt(map.get("rNum")));
    	Map<String, String> userInfo = reservationMapper.selectUserInfo(map.get("userId"));
    	
    	reservationRequest.put("USER_ID", userInfo.get("USER_ID"));
    	reservationRequest.put("USER_NAME", userInfo.get("USER_NAME"));
    	reservationRequest.put("USER_PHONE_NUMBER", userInfo.get("USER_PHONE_NUMBER"));
    	
        return reservationRequest;
    }

    @Override
    public void insertReservationRequest(ReservationDO rDO) throws Exception {
        reservationMapper.insertReservationRequest(rDO);
    }
    
    @Override
    public void reservationValidationDate() throws Exception {
       reservationMapper.reservationValidationDate();
    }

}




