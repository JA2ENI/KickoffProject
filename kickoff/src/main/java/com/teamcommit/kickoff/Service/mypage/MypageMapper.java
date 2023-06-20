package com.teamcommit.kickoff.Service.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.GameDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.UserDO;

@Mapper
public interface MypageMapper {

	 public List<ReservationDO> myReservationList(String userId);
	 
	 public List<ReservationDO> empReservationList(String userId);
	 
	 public void updateCancel(int reservationNo);
	 
	 public List<BoardDO> myBoardList(String String);
	 
	 public UserDO userInfoCheck(UserDO user);
	 
	 public UserDO userInfo(String userId);
	 
	 public void updatePw(UserDO user);
	 
	 public void updateUserInfo(UserDO userDO);
	 
	 public List<TeamDO> myTeamList(String userId);
	 
	 public void userDelete(String userId);
	 
	 public List<GameDO> myGameRecordList(String String);
	 
	 public GameDO getGameRecord(int gameSeqno);
}
