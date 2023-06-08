package com.teamcommit.kickoff.Service.mypage;

import java.util.List;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;

public interface MypageService {

	List<ReservationDO> myReservationList(String userId) throws Exception;
	
	List<ReservationDO> empReservationList(String userId) throws Exception;
	
	void updateCancel(int reservationNo) throws Exception;
	
	List<BoardDO> myBoardList(String userId) throws Exception;

	UserDO userInfoCheck(UserDO user) throws Exception;

	UserDO userInfo(String userId) throws Exception;
	
	void updatePw(UserDO user) throws Exception;
	
	void updateUserInfo(UserDO userDO) throws Exception;
	
}
