package com.teamcommit.kickoff.Service.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.GameDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;

@Mapper
public interface MypageMapper {

	 public List<Map<String, String>> myReservationList(ReservationDO rDO);
	 
	 public int reservationListCount(String userId);
	 
	 public List<ReservationDO> empReservationList(String userId);
	 
	 public void updateCancel(int reservationNo);
	 
	 public List<BoardDO> myBoardList(String String);
	 
	 public UserDO userInfo(String userId);
	 
	 public void updatePw(UserDO user);
	 
	 public void updateUserInfo(UserDO userDO);
	 
	 public void userDelete(String userId);
	 
	 public List<GameDO> myGameRecordList(String String);
	 
	 public GameDO getGameRecord(int gameSeqno);
	 
	 public void updateGameScore(GameDO gameDO);
}
