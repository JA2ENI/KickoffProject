package com.teamcommit.kickoff.Service.mypage;

import java.util.List;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.ReservationDO;

public interface MypageService {

	List<ReservationDO> myReservationList(String userId) throws Exception;
	
	List<ReservationDO> empReservationList(String userId) throws Exception;
	
	void updateCancel(int reservationNo) throws Exception;
	
	List<BoardDO> myBoardList(String userId) throws Exception;

}
