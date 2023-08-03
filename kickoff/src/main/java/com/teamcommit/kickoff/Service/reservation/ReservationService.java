package com.teamcommit.kickoff.Service.reservation;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

import java.util.List;
import java.util.Map;

public interface ReservationService {

	List<Map<String, String>> selectReservationList(ReservationDO rDO) throws Exception;
	
	int reservationListCount() throws Exception;
    
    void insertReservation(ReservationDO rDO) throws Exception;

    Map<String, String> selectReservationDetail(int rNum) throws Exception;

    void updateReservation(ReservationDO rDO) throws Exception;

    PlaceDO selectPlaceInfo(String empId) throws Exception;

    Map<String, String> selectReservationRequest(Map<String, String> map) throws Exception;

    void insertReservationRequest(ReservationDO rDO) throws Exception;

    void reservationValidationDate() throws Exception;

}
