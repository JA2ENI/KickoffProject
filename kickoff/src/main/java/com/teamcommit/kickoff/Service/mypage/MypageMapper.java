package com.teamcommit.kickoff.Service.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.ReservationDO;

@Mapper
public interface MypageMapper {

	 public List<ReservationDO> myReservationList(String userId);
	 
	 public List<ReservationDO> empReservationList(String userId);
	 
	 public void updateCancel(int reservationNo);
	 
	 public List<BoardDO> myBoardList(String userId);
}
