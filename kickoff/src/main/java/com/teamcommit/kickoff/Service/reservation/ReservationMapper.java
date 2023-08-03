package com.teamcommit.kickoff.Service.reservation;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ReservationMapper {
	
    public List<Map<String, String>> selectReservationList(ReservationDO rDO);
    
    public int reservationListCount();

    public void insertReservation(ReservationDO rDO);

    public Map<String, String> selectReservationDetail(int rNum);

    public void updateReservation(ReservationDO rDO);

    public PlaceDO selectPlaceInfo(String empId);

    public Map<String, String> selectUserInfo(String userId);

    public void insertReservationRequest(ReservationDO rDO);
    
    public List<ReservationDO> reservationDateList(String empId);
    
    public void reservationValidationDate();
    

}
